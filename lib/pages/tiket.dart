import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_uts/model/pesantiket.dart';
import '../model/preferensi.dart';
import 'topup.dart';
import 'movies.dart';


class Tiket extends StatefulWidget{
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _tiket();
  }
}

//  final String url = 'http://192.168.43.190/api/moviestiket';
//
//  Future getTiket() async {
//    var response = await http.get(Uri.parse(url));
//    print(json.decode(response.body));
//    return(json.decode(response.body));
//
//  }

class _tiket extends State<Tiket>{
//  List<pesanTiket> nowTiket = [];
////  String base_url = 'http://192.168.43.190/img/';
//  bool loading = true;
//
//  Future<void> fetchNowPlaying() async {
//    setState((){
//      loading = true;
//    });
//
//    final response = await http
//        .get(Uri.parse('http://192.168.43.190/api/pesantiket'));
//
//    if (response.statusCode == 200) {
//      final data = jsonDecode(response.body);
//      setState((){
//        for(int i=0;i<data.length;i++){
//          if(data[i]!=null){
//            Map<String,dynamic> map=data[i];
//            nowTiket.add(Mmovies.fromJson(map));
//          }
//        }
//        // print(imgList);
//        imageSliders = nowTiket
//            .map((item) => GestureDetector(
//          onTap: (){
//            Preferensi().setMoviesID = item.id;
//            Preferensi().setMoviesStatus = item.status;
//            Navigator.push(context, MaterialPageRoute(builder: (context)=>Nextpage()));
//          },
//          child: Container(
//            margin: EdgeInsets.all(5.0),
//            child: ClipRRect(
//                borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                child: Stack(
//                  children: <Widget>[
//                    Image.network(base_url+item.file_name, fit: BoxFit.cover, width: 1000.0),
//                    Positioned(
//                      bottom: 0.0,
//                      left: 0.0,
//                      right: 0.0,
//                      child: Container(
//                        decoration: BoxDecoration(
//                          gradient: LinearGradient(
//                            colors: [
//                              Color.fromARGB(200, 0, 0, 0),
//                              Color.fromARGB(0, 0, 0, 0)
//                            ],
//                            begin: Alignment.bottomCenter,
//                            end: Alignment.topCenter,
//                          ),
//                        ),
//                        padding: EdgeInsets.symmetric(
//                            vertical: 10.0, horizontal: 20.0),
//                        child: Text(
//                          item.nama,
//                          style: TextStyle(
//                            color: Colors.white,
//                            fontSize: 20.0,
//                            fontWeight: FontWeight.bold,
//                          ),
//                        ),
//                      ),
//                    ),
//                  ],
//                )
//            ),
//          ),
//        )
//        )
//            .toList();
//      });
//      loading = false;
//
//    } else {
//      throw Exception('Failed to load album');
//    }
//  }

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context){
//    getTiket();
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Tiket'),
            bottom: const TabBar(
                tabs:[
                  Tab(text: 'Newest'),
                  Tab(text: 'Oldest'),
                ]
              ),
            ),
          body: TabBarView(
            children:[
              MissedCallsPage(),
              ReceivedCallsPage(),
            ],
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
        )
    );
  }
}

List<Contact> missedCallContacts = [
  Contact(fullName: 'Pratap Kumar', email: 'pratap@example.com'),
  Contact(fullName: 'Jagadeesh', email: 'Jagadeesh@example.com'),
  Contact(fullName: 'Srinivas', email: 'Srinivas@example.com'),
  Contact(fullName: 'Narendra', email: 'Narendra@example.com'),
  Contact(fullName: 'Sravan ', email: 'Sravan@example.com'),
  Contact(fullName: 'Ranganadh', email: 'Ranganadh@example.com'),
  Contact(fullName: 'Karthik', email: 'Karthik@example.com'),
  Contact(fullName: 'Saranya', email: 'Saranya@example.com'),
  Contact(fullName: 'Mahesh', email: 'Mahesh@example.com'),
];

class MissedCallsPage extends StatefulWidget {
  @override  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MissedCallsPage();
  }
}

class _MissedCallsPage extends State<MissedCallsPage> {
  @override  Widget build(BuildContext context) {
    return Scaffold(
        body: new Column(
          children: <Widget>[
            new Expanded(
              child: new ListView.builder(
                itemCount: missedCallContacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      '${missedCallContacts[index].fullName}',
                    ),
                    subtitle: Text('${missedCallContacts[index].email}'),
                    leading: new CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text('${missedCallContacts[index].fullName.substring(
                            0, 1)}')),
                    onTap: () => _onTapItem(context, missedCallContacts[index]),
                  );
                },
              ),
            ),
          ],
        ));
  }

  void _onTapItem(BuildContext context, Contact post) {
    Scaffold.of(context).showSnackBar(
        new SnackBar(content: new Text("Tap on " + ' - ' + post.fullName)));
  }
}

List<Contact> receivedCallContacts = [
  Contact(fullName: 'Pratap Kumar', email: 'pratap@example.com'),
  Contact(fullName: 'Jagadeesh', email: 'Jagadeesh@example.com'),
  Contact(fullName: 'Srinivas', email: 'Srinivas@example.com'),
];

class ReceivedCallsPage extends StatefulWidget {
  @override  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ReceivedCallsPage();
  }
}

class _ReceivedCallsPage extends State<ReceivedCallsPage> {
  @override  Widget build(BuildContext context) {
    return Scaffold(
        body: new Column(
          children: <Widget>[
            new Expanded(
              child: new ListView.builder(
                itemCount: receivedCallContacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      '${receivedCallContacts[index].fullName}',
                    ),
                    subtitle: Text('${receivedCallContacts[index].email}'),
                    leading: new CircleAvatar(
                        backgroundColor: Colors.blue,
                        child:
                        Text('${receivedCallContacts[index].fullName.substring(
                            0, 1)}')),
                    onTap: () => _onTapItem(context, receivedCallContacts[index]),
                  );
                },
              ),
            ),
          ],
        ));
  }

  void _onTapItem(BuildContext context, Contact post) {
    Scaffold.of(context).showSnackBar(
        new SnackBar(content: new Text("Tap on " + ' - ' + post.fullName)));
  }
}

class Contact {
  final String fullName;
  final String email;

  const Contact({required this.fullName, required this.email});
}