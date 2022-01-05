import 'package:flutter/material.dart';
import 'package:project_uts/model/pemesanan.dart';
import 'package:project_uts/model/preferensi.dart';
import '../custWidget/selectablebox.dart';
import 'tiket.dart';
import '../model/pemesanan.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class SelectKursi extends StatefulWidget {
  /*final Tiket ticket;

  SelectKursi(this.ticket);
*/
  @override
  _SelectKursiState createState() => _SelectKursiState();
}

class _SelectKursiState extends State<SelectKursi> {
  Future<Pemesanan> storePemesanan(String id_movie, String kursi, String email) async {
    var url = 'http://192.168.0.2/api/pemesanan-tiket';
    final response = await http.post(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
        },
        body: {
          'id_movie': id_movie,
          'kursi': kursi,
          'email': email
        }
    );
    if(response.statusCode == 200) {
      Pemesanan tiketPesan = Pemesanan(id_movie, kursi, email);
      return tiketPesan;
    }
    else{
      throw Exception('Pemesanan Error');
    }
  }
  bool _submit = false;
  //final tiketPemesanan = Pemesanan(0, '', '');
  Future<Pemesanan>? tiket;
  List<String> selectedSeats = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(color: Color(0xFF2C1F63)),
            SafeArea(
                child: Container(
              color: Colors.white,
            )),
            ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    // Header
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 24),
                          padding: EdgeInsets.all(1),
                          child: GestureDetector(
                            onTap: () {
                              
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 20, right: 24),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 16),
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  //widget.ticket.movieDetail.title,
                                  Preferensi().getMovieName + Preferensi().getEmail,
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    // image: DecorationImage(
                                    //     image: NetworkImage(imageBaseURL +
                                    //         'w154' +
                                    //         widget
                                    //             .ticket.movieDetail.posterPath),
                                    //     fit: BoxFit.cover)),
                                )
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    // Cinema Screen
                    Container(
                      height: 200,
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage("http://192.168.0.2/img/"+Preferensi().getMoviePath),

                          ),
                          borderRadius: BorderRadius.circular(8),

                      ),
                    ),
                    // Seats
                    generateSeats(),
                    SizedBox(
                      height: 30,
                    ),
                    // next button
                    (_submit == false) ? button() : buildFuture(),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ],
            )
          ],
        )
    );
  }
    Column generateSeats() {
    List<int> numberOfSeats = [3, 5, 5, 5, 5];
    List<Widget> widgets = [];

    for (int i = 0; i < numberOfSeats.length; i++) {
      widgets.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          numberOfSeats[i],
          (index) => Padding(
            padding: EdgeInsets.only(
                right: index < numberOfSeats[1] - 1 ? 16 : 0, bottom: 16),
            child: Selectablebox(
              "${String.fromCharCode(i + 65)}${index + 1}",
              width: 40,
              height: 40,
               
              isSelected: selectedSeats
                  .contains("${String.fromCharCode(i + 65)}${index + 1}"),
              onTap: () {
                String seatNumber =
                    "${String.fromCharCode(i + 65)}${index + 1}";
                setState(() {
                  if (selectedSeats.contains(seatNumber)) {
                    selectedSeats.remove(seatNumber);
                  } else {
                    selectedSeats.add(seatNumber);
                  }
                });
              },
              // isEnabled: index != 0,
            ),
          ),
        ),
      ));
    }
    return Column(children: widgets);
  }
  Widget button(){
    return Align(
        alignment: Alignment.topCenter,
        child: FloatingActionButton(
            elevation: 0,
            backgroundColor: selectedSeats.length > 0
                ? Color(0xFF503E9D)
                : Color(0xFFE4E4E4),
            child: Icon(
              Icons.arrow_forward,
              color: selectedSeats.length > 0
                  ? Colors.white
                  : Color(0xFFBEBEBE),
            ),
            onPressed:() {
              if(selectedSeats.length > 0){
              if(selectedSeats.length == 1){
                setState((){
                  _submit = true;
                });
                tiket = storePemesanan(Preferensi().getMoviesID.toString(),selectedSeats[0],Preferensi().getEmail);
              }
              }
            }
        )
    );
  }
  FutureBuilder<Pemesanan> buildFuture(){
    return FutureBuilder<Pemesanan>(
        future: tiket,
        builder: (context, snapshot){
          if(snapshot.hasData){
            Preferensi().setEmail = snapshot.data!.email;
            // Preferensi().setEmail = snapshot.data!.email;
            WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Tiket()));
            });
            return Text('Pemesanan berhasil Berhasil');
          }
          else if(snapshot.hasError){
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        }
    );
  }
}
