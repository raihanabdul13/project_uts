import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:project_uts/model/pesantiket.dart';
import '../model/preferensi.dart';
import '../model/Tiket.dart';
import 'topup.dart';
import 'movies.dart';


class Tiket extends StatefulWidget{
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _tiket();
  }
}



class _tiket extends State<Tiket>{


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
  final String url = 'http://192.168.0.2/api/history-tiket/';
  List<TiketList> tikets = [];
  int lenghtData=0;
  Future getTiketData(String email) async {
    final response = await http
        .get(Uri.parse(url+email));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        lenghtData = data.length;
        print(lenghtData);
        for (int i = 0; i < data.length; i++) {
          if (data[i] != null) {
            Map<String, dynamic> map = data[i];
            tikets.add(TiketList.fromJson(map));
          }
        }
      });
      return tikets;
    }else{
      throw Exception('failed to load');
    }
  }
  @override  Widget build(BuildContext context) {
    return Scaffold(
        body: new Column(
          children: <Widget>[
          FutureBuilder(
            future: getTiketData(Preferensi().getEmail),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.hasData) {
                return new Expanded(
                  child: new ListView.builder(
                    itemCount: lenghtData,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          '${snapshot.data[index].nama}',
                        ),
                        subtitle: Text('${snapshot.data[index].email}'),
                        leading: new CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text('${snapshot.data[index].nama
                                .substring(
                                0, 1)}')),
                        onTap: () =>
                            _onTapItem(context, snapshot.data[index]),
                      );
                    },
                  ),
                );
              }
              else {
                return Column(
                  children: <Widget>[
                    Center(
                        child: CircularProgressIndicator()
                    ),
                    Container(
                      child:Text('Maaf Anda Belum Memesan Tiket')
                    )
                  ],
                );

              }
            }
          )
          ],
        )
    );
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
  final String url = 'http://192.168.0.2/api/history-tiket/';
  List<TiketList> tikets = [];
  int lenghtData=0;
  Future getTiketData(String email) async {
    final response = await http
        .get(Uri.parse(url+email));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        lenghtData = data.length;
        print(lenghtData);
        for (int i = 0; i < data.length; i++) {
          if (data[i] != null) {
            Map<String, dynamic> map = data[i];
            tikets.add(TiketList.fromJson(map));
          }
        }
      });
      return tikets;
    }else{
      throw Exception('failed to load');
    }
  }
  @override  Widget build(BuildContext context) {
    return Scaffold(
        body: new Column(
          children: <Widget>[
            FutureBuilder(
                future: getTiketData(Preferensi().getEmail),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if(snapshot.hasData) {
                    if(lenghtData != 0){
                      return new Expanded(
                        child: new ListView.builder(
                          itemCount: lenghtData,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                '${snapshot.data[index].nama}',
                              ),
                              subtitle: Text('${snapshot.data[index].email}'),
                              leading: new CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  child: Text('${snapshot.data[index].nama
                                      .substring(
                                      0, 1)}')),
                              onTap: () =>
                                  _onTapItem(context, snapshot.data[index]),
                            );
                          },
                        ),
                      );
                    }else{
                      return new Expanded(
                        child: new ListView.builder(
                          itemCount: lenghtData,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                'Maaf Anda belum Ada Tiket',
                              ),
                              subtitle: Text(''),
                              leading: new CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  child: Text('${snapshot.data[index].nama
                                      .substring(
                                      0, 1)}')),
                              onTap: () =>
                                  _onTapItem(context, snapshot.data[index]),
                            );
                          },
                        ),
                      );
                    }
                  }
                  else {
                    return Column(
                      children: <Widget>[
                        Center(
                            child: CircularProgressIndicator()
                        ),
                      ],
                    );

                  }
                }
            )
          ],
        )
    );
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

