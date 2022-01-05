import 'package:flutter/material.dart';
import '../model/user.dart';
import '../model/preferensi.dart';
import 'topup.dart';
import 'movies.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transparent_image/transparent_image.dart';

class Nextpage extends StatelessWidget{

  // Widget build(BuildContext context){
  //   return Scaffold(
  //     body: Column(
  //       children: [
  //         Container(
  //           padding: EdgeInsets.all(100),
  //         ),
  //         Text(Preferensi().getMoviesID.toString()),
  //         Text(Preferensi().getMoviesStatus.toString()),
  //       ],
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size.width;
    // final String _titlePath = this.movieData['backdrop_path'];
    // final String movieName = this.movieData['title'];
    // final String movieOverview = this.movieData['overview'];
    // final int movieId = this.movieData['id'];
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
          child: AppBar(
            // flexibleSpace: FadeInImage.memoryNetwork(
            //   placeholder: kTransparentImage,
            //   image: "http://192.168.1.20/img/1641055269-3.png",
            //   fit: BoxFit.cover,
            // ),
          ),
        ),
        preferredSize: Size.fromHeight(size.height / 15),
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: 225.0,
                color: Colors.grey[200],
                child: Image.network(
                  "http://192.168.1.20/img/1641056782-apocrybege.jpg",
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                  // height: 75,
                ),
                // WidgetCarousel(
                //   pages: film.images
                //       .map((url) => FadeInImage(
                //     fit: BoxFit.fill,
                //     width: MediaQuery.of(context).size.width,
                //     image: NetworkImage(
                //       url,
                //     ),
                //     placeholder:
                //     AssetImage('assets/images/placeholder.png'),
                //   ))
                //       .toList(),
                //   dotSize: 4.0,
                //   dotSpacing: 15.0,
                //   dotColor: Theme.of(context).primaryColor,
                //   indicatorBgPadding: 5.0,
                //   dotBgColor: Colors.grey.withOpacity(0.0),
                //   autoplayDuration: Duration(seconds: 2),
                // ),
              ),
              Text(
                // Preferensi().getMoviesID.toString(),
                "FGO",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              // Container(
              //   padding: EdgeInsets.only(left: 4.0, right: 4.0),
              //   height: 50.0,
              //   child: ListView(
              //     scrollDirection: Axis.horizontal,
              //     children: film.actors
              //         .split(',')
              //         .map<Widget>(
              //           (f) => Padding(
              //         padding: EdgeInsets.symmetric(horizontal: 8.0),
              //         child: Chip(
              //           labelPadding:
              //           EdgeInsets.symmetric(horizontal: 8.0),
              //           label: Text(f,
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 fontFamily: Constant.fontMedium,
              //               )),
              //           backgroundColor:
              //           Theme.of(context).primaryColor,
              //         ),
              //       ),
              //     )
              //         .toList(),
              //   ),
              // ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Status -',
                      style: TextStyle(
                        // fontFamily: Constant.fontRegular,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        // film.director,
                        Preferensi().getMoviesStatus.toString(),
                        style: TextStyle(
                          // fontFamily: Constant.fontRegular,
                            color: Colors.redAccent),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Produksi -',
                      style: TextStyle(
                          // fontFamily: Constant.fontRegular,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        // film.director,
                        "Funimation, Lantis, Kyoto Animation",
                        style: TextStyle(
                            // fontFamily: Constant.fontRegular,
                            color: Colors.grey[500]),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: FractionalOffset.centerLeft,
                child: Wrap(
                  children: <Widget>[
                    Text(
                      'Sutradara -',
                      style: TextStyle(
                          // fontFamily: Constant.fontRegular,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        // film.writer,
                        "Hajime Isyama, Oda Sensei",
                        style: TextStyle(
                            // fontFamily: Constant.fontRegular,
                            color: Colors.grey[500]),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: FractionalOffset.centerLeft,
                child: Wrap(
                  children: <Widget>[
                    Text(
                      'Sinopsis -',
                      style: TextStyle(
                        // fontFamily: Constant.fontRegular,
                          fontWeight: FontWeight.bold),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 10.0),
                    //   child: Text(
                    //     // film.writer,
                    //     "writer",
                    //     style: TextStyle(
                    //       // fontFamily: Constant.fontRegular,
                    //         color: Colors.grey[500]),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Text(
                  // film.plot,
                  "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                  style: TextStyle(
                    // fontFamily: Constant.fontRegular,
                      color: Colors.grey[800]),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.book_online,
                    color: Colors.lightBlueAccent,
                    size: 50.0,
                  ),
                  // Icon(
                  //   FontAwesomeIcons.shareAlt,
                  //   size: 25.0,
                  // ),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                      'Book Now',
                  style: TextStyle(
                  // fontFamily: Constant.fontRegular,
                    fontWeight: FontWeight.bold),
                  ),
                  // Text('Wishlist'),
                ],
              ),
              // Container(
              //   padding: EdgeInsets.all(8.0),
              //   child: Row(
              //     children: <Widget>[
              //       Text(
              //         'Language -',
              //         style: TextStyle(
              //             fontFamily: Constant.fontRegular,
              //             fontWeight: FontWeight.bold),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(left: 10.0),
              //         child: Text(
              //           film.language,
              //           style: TextStyle(
              //               fontFamily: Constant.fontRegular,
              //               color: Colors.grey[500]),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   padding: EdgeInsets.all(8.0),
              //   alignment: FractionalOffset.centerLeft,
              //   child: Wrap(
              //     children: <Widget>[
              //       Text(
              //         'Awards -',
              //         style: TextStyle(
              //             fontFamily: Constant.fontRegular,
              //             fontWeight: FontWeight.bold),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(left: 10.0),
              //         child: Wrap(
              //           alignment: WrapAlignment.start,
              //           children: <Widget>[
              //             Text(
              //               film.awards,
              //               style: TextStyle(
              //                   fontFamily: Constant.fontRegular,
              //                   color: Colors.grey[500]),
              //             )
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              // Container(
              //   padding: EdgeInsets.all(8.0),
              //   child: film.imdbRating != 'N/A'
              //       ? StarRating(
              //     color: Theme.of(context).primaryColor,
              //     rating: double.parse(film.imdbRating),
              //     starCount: 10,
              //   )
              //       : Container(),
              // )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.account_balance_wallet_outlined),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Topup()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                minWidth: 60,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Movies()));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.airplay,
                      color: Colors.grey,
                    ),
                    Text(
                        'New Movies',
                        style: TextStyle(color: Colors.grey)
                    )
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 60,
                onPressed: (){

                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.airplane_ticket,
                      color: Colors.blue,
                    ),
                    Text(
                        'My Tickets',
                        style: TextStyle(color: Colors.blue)
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}