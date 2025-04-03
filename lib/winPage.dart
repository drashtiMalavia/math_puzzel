import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Data.dart';
import 'levelPage.dart';
import 'main.dart';
import 'mainPage.dart';

class winpage extends StatefulWidget {
  int levelNo;

  winpage(this.levelNo);

  @override
  State<winpage> createState() => _winpageState();
}

class _winpageState extends State<winpage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) {
            print("TRUE");
          } else {
            print("FALSE");
            Future.delayed(Duration.zero,() {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return mainPage();
              },));
            },);
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Image.asset(
                  'images/background.jpg',
                  fit: BoxFit.fill,
                  height: double.infinity,
                  width: double.infinity,
                ),
                Positioned(
                  left: 120,
                  top: 40,
                  child: Container(
                    child: Text(
                      "PUZZLE ${widget.levelNo + 1} COMPLETED",
                      style: TextStyle(
                          fontSize: 21,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                Positioned(
                  left: 100,
                  top: 100,
                  child: Container(
                    child: Image.asset('images/trophy.png'),
                  ),
                ),
                Positioned(
                  left: 130,
                  top: 420,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          if (widget.levelNo == Preference.getlastLevel()) {
                            Preference.setlastLevel(widget.levelNo);
                            return levelpage(widget.levelNo);
                          } else {
                            return levelpage(widget.levelNo + 2);
                          }
                        },
                      ));
                    },
                    child: Container(
                      child: Text(
                        "CONTINUE",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                      alignment: Alignment.center,
                      height: 50,
                      width: 180,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.blueGrey,
                            Colors.white54,
                            Colors.blueGrey
                          ]),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white)),
                    ),
                  ),
                ),
                Positioned(
                  left: 130,
                  top: 480,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return mainPage();
                        },
                      ));
                    },
                    child: Container(
                      child: Text(
                        "MAIN MENU",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                      alignment: Alignment.center,
                      height: 50,
                      width: 180,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.blueGrey,
                            Colors.white54,
                            Colors.blueGrey
                          ]),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white)),
                    ),
                  ),
                ),
                Positioned(
                  left: 130,
                  top: 540,
                  child: Container(
                    child: Text(
                      "BUY PRO",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                    alignment: Alignment.center,
                    height: 50,
                    width: 180,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.blueGrey,
                          Colors.white54,
                          Colors.blueGrey
                        ]),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white)),
                  ),
                ),
                Positioned(
                  left: 110,
                  top: 610,
                  child: Container(
                    child: Text(
                      "SHARE THIS PUZZLE",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Positioned(
                  left: 201,
                  top: 650,
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Image.asset(
                      'images/share.png',
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.blueGrey,
                          Colors.white54,
                          Colors.blueGrey
                        ]),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
