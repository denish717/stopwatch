import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: stop(),
    debugShowCheckedModeBanner: false,
  ));
}

class stop extends StatefulWidget {
  const stop({Key? key}) : super(key: key);

  @override
  State<stop> createState() => _stopState();
}

class _stopState extends State<stop> {
  int h = 0;
  int m = 0;
  int s = 0;
  int l = 0;
  bool t = false;

  @override
  void initState() {
    super.initState();
    get().listen((event) {

    });
  }

  Stream<String> get() async* {
    while (true) {
      String time = "${h} : ${m} : ${s}";
      await Future.delayed(Duration(milliseconds: 5));
      if (t) {
        l++;
        if (l <= 100) {
        } else if (l > 100) {
          s++;
          l = 0;
        }
        if (s <= 60) {
        } else if (s > 60) {
          m++;
          s = 0;
        }
        if (m <= 60) {
        } else if (m > 60) {
          h++;
          m = 0;
        }
      }
      yield time;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Time",
            style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.pink),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: Column(children: [
          StreamBuilder(
            stream: get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 200),
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  ],
                );
              } else {
                return Column(children: [
                  Container(
                      alignment: Alignment.center,
                      height: 210,
                      width: 210,
                      margin: EdgeInsets.only(top: 150),
                      decoration: BoxDecoration(
                          border:
                          Border.all(width: 5, color: Colors.cyanAccent),
                          color: Colors.black,
                          shape: BoxShape.circle),
                      child: Text(
                        "${snapshot.data}",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyanAccent,
                            fontStyle: FontStyle.italic),
                      ))
                ]);
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      t = true;
                    });
                  },
                  icon: Icon(Icons.not_started_outlined),
                  label: Text('Start'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      elevation: 35,
                      textStyle: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      t = false;
                    });
                  },
                  icon: Icon(Icons.stop),
                  label: Text("Stop"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      elevation: 35,
                      shadowColor: Colors.deepPurple,
                      textStyle: TextStyle(color: Colors.indigoAccent)),
                ),
              ),
             InkWell(onTap: () {
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                 return stop();
               },));
             },child: Container(margin: EdgeInsets.all(20),
                child: Row(children: [
                  Icon(Icons.refresh,size: 30,color: Colors.white,),
                  Text("Refresh",style: TextStyle(color: Colors.white),)
                ],)

              ))
            ],
          ),
        ]));
  }
}