import 'package:flutter/material.dart';
import '../custWidget/selectablebox.dart';
import 'tiket.dart';
import 'movies.dart';

class SelectKursi extends StatefulWidget {
  final Tiket ticket;

  SelectKursi(this.ticket);

  @override
  _SelectKursiState createState() => _SelectKursiState();
}

class _SelectKursiState extends State<SelectKursi> {
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
                                  widget.ticket.movieDetail.title,
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.end,
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
                            ],
                          ),
                        )
                      ],
                    ),
                    // Cinema Screen
                    Container(
                      width: 277,
                      height: 84,
                      margin: EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/screen.png"))),
                    ),
                    // Seats
                    generateSeats(),
                    SizedBox(
                      height: 30,
                    ),
                    // next button
                    Align(
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
                            onPressed: selectedSeats.length > 0
                                ? () {
                                    // context.bloc<PageBloc>().add(
                                    //     GoToCheckoutPage(widget.ticket
                                    //         .copyWith(seats: selectedSeats)));
                                  }
                                : null
                                )
                                ),
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
}
