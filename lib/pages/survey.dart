import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pertama.dart';

class Survey extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    double mywidth =
        (MediaQuery.of(context).size.width - 60 ) / 2;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.arrow_back,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 160,
                  child: Text(
                    'Select Your Four Favourite Genres',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  Container(
                    width: mywidth,
                    height: 70,
                    child: Center(
                      child: Text('Horror'),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.black
                        )

                    ),
                  ),
                  Container(
                    width: mywidth,
                    height: 70,
                    child: Center(
                      child: Text('Music'),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.black
                        )

                    ),
                  ),
                  Container(
                    width: mywidth,
                    height: 70,
                    child: Center(
                      child: Text('Action'),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.black
                        )

                    ),
                  ),
                  Container(
                    width: mywidth,
                    height: 70,
                    child: Center(
                      child: Text('Drama'),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.black
                        )

                    ),
                  ),
                  Container(
                    width: mywidth,
                    height: 70,
                    child: Center(
                      child: Text('War'),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.black
                        )

                    ),
                  ),
                  Container(
                    width: mywidth,
                    height: 70,
                    child: Center(
                      child: Text('Crime'),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.black
                        )

                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 160,
                  child: Text(
                    'Movie Language You Prefer?',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  Container(
                    width: mywidth,
                    height: 70,
                    child: Center(
                      child: Text('English'),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.black
                        )

                    ),
                  ),
                  Container(
                    width: mywidth,
                    height: 70,
                    child: Center(
                      child: Text('Indonesia'),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.black
                        )

                    ),
                  ),
                  Container(
                    width: mywidth,
                    height: 70,
                    child: Center(
                      child: Text('Japan'),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.black
                        )

                    ),
                  ),
                  Container(
                    width: mywidth,
                    height: 70,
                    child: Center(
                      child: Text('Korean'),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.black
                        )

                    ),
                  ),

                ],
              ),
            ),
            FloatingActionButton(
              child: Icon(Icons.arrow_forward),
              backgroundColor: Colors.purple,
              elevation: 0,
              onPressed: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>Survey()));
              },
            )

            // Flexible(
            //     child: GridView.count(
            //         crossAxisCount: 2,
            //       crossAxisSpacing: 10,
            //       mainAxisSpacing: 10,
            //       padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            //       childAspectRatio: ,
            //       children: [
            //         Container(
            //           height: 100,
            //           child: Center(
            //             child: Text('Horror'),
            //           ),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             border: Border.all(
            //               color: Colors.black
            //             )
            //
            //           ),
            //         ),
            //         Container(
            //           height: 100,
            //           child: Center(
            //             child: Text('Horror'),
            //           ),
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(10),
            //               border: Border.all(
            //                   color: Colors.black
            //               )
            //
            //           ),
            //         ),
            //       ],
            //     )
            // )

          ],
        ),
      )

    );
  }
}