import 'package:flutter/material.dart';
import '../model/user.dart';
import '../model/preferensi.dart';
import '../model/mmovies.dart';
import 'select_kursi.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Nextpage extends StatefulWidget{
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return detailMovie();
  }
}
class detailMovie extends State<Nextpage>{

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
                "http://192.168.0.2/img/"+Preferensi().getMoviePath,
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
              Preferensi().getMovieName,
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
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
                      Preferensi().getMovieProduksi,
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
                      Preferensi().getMovieSutradara,
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
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Text(
                // film.plot,
                Preferensi().getMovieSinopsis,
                style: TextStyle(
                  // fontFamily: Constant.fontRegular,
                    color: Colors.grey[800]),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                FloatingActionButton(
                  child: Icon(Icons.book_online),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectKursi()));
                  },
                ),
                // Icon(
                //   FontAwesomeIcons.shareAlt,
                //   size: 25.0,
                // ),
              ],
            ),
            SizedBox(height: 5.0),

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
  );
}
}