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
    // final String _titlePath = this.movieData['backdrop_path'];
    // final String movieName = this.movieData['title'];
    // final String movieOverview = this.movieData['overview'];
    // final int movieId = this.movieData['id'];
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
          child: AppBar(
            flexibleSpace: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: "http://192.168.1.20/img/1641055269-3.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        preferredSize: Size.fromHeight(size.height / 7),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            Text(
              // Preferensi().getMoviesID.toString(),
              "Jumanji",
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              "Sutradara | Produksi",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 5.0),
            Image.network(
              "http://192.168.1.20/img/1641056782-apocrybege.jpg",
              height: 75,
            ),
            SizedBox(height: 10.0),
            Text(
              'Sinopsis',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            // Actors(movieId),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Status',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            // SimilarMovies(movieId),
            Text(
              Preferensi().getMoviesStatus.toString(),
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.add_shopping_cart,
                  color: Colors.greenAccent,
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
                Text('Pesan Tiket'),
                // Text('Wishlist'),
              ],
            ),
          ],
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