import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Data.dart';
import 'levelPage.dart';
import 'lockpage.dart';
import 'main.dart';

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  int ignorepuzzel=0;

  int ignorecontinue=0;
  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if(!didPop){
            Future.delayed(Duration.zero,() {
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: Text("Are you sure you want to exit?",style: TextStyle(fontSize: 20),),
                  backgroundColor: Colors.white,
                  shape: Border.all(style: BorderStyle.solid),
                  actions: [
                    Row(
                      children: [
                        InkWell(
                          onTap:(){
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          child: Container(
                            height: 50,
                            child: Text("No",style: TextStyle(color: Colors.red,fontSize: 20),),
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(180,0,20,0),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.pop(exit(0));
                            });
                          },
                          child: Container(
                            height: 50,
                            child: Text("Yes",style: TextStyle(color: Colors.red,fontSize: 20),),
                            alignment: Alignment.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },);
            },);
          }
        },
        child: Scaffold(
          body:
          Stack(
            children: [
              IgnorePointer(
                ignoring: true,
                child: Image.asset(
                  'images/background.jpg',
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
              IgnorePointer(
                ignoring: true,
                child: Container(
                  color: Colors.blue,
                  height: 43,
                ),
              ),
              IgnorePointer(
                ignoring: true,
                child: Container(
                  child: Text("Math Puzzles",style: TextStyle(color: Colors.blue,fontSize: 40),),
                  alignment: Alignment.bottomCenter,
                  height: 150,
                ),
              ),
              Positioned(
                left: 15,
                top: 150,
                right: 15,
                child: IgnorePointer(
                  ignoring: true,
                  child: Container(
                    child: Image.asset(
                      'images/blackboard.png',
                      fit: BoxFit.fill,
                      height: 650,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 130,
                top: 400,
                right: 110,
                child: IgnorePointer(
                  ignoring: false,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        int? lastlevel=Preference.getlastLevel();
                        return levelpage(lastlevel!+1);
                      },));
                      setState(() {
                      });
                    },
                    child: Container(
                      child: Text("CONTINUE",style: TextStyle(color: Colors.white,fontSize: 40),),
                      height: 50,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 130,
                top: 475,
                right: 15,
                child: IgnorePointer(
                  ignoring: false,
                  child: InkWell(
                    onTap: () {
                      ignorepuzzel=1;
                      setState(() {
                        Data.levelStatus.clear();
                        for(int i=0;i<=75;i++){
                          Data.levelStatus.add(Preference.getlevelStatus(i)??"");
                        }
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return lockpage();
                      },));
                    },
                    child: Container(
                      child: Text("PUZZLES",style: TextStyle(color: Colors.white,fontSize: 40),),
                      height: 50,
                      width: 160,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 130,
                top: 550,
                right: 15,
                child: IgnorePointer(
                  ignoring: true,
                  child: Container(
                    child: Text("BUY PRO",style: TextStyle(color: Colors.white,fontSize: 40),),
                    height: 50,
                    width: 150,
                  ),
                ),
              ),
              Positioned(
                left: 40,
                top: 810,
                right: 15,
                child: IgnorePointer(
                  ignoring: true,
                  child: Container(
                    child: Text("AD",style: TextStyle(color: Colors.blue,fontSize: 20),),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 840,
                bottom: 10,
                child: IgnorePointer(
                  ignoring: true,
                  child: Container(
                    child: Image.asset(
                      'images/ad.png',
                      fit:BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                // left: 290,
                // top: 830,
                // right: 20,
                // bottom: 10,
                child: IgnorePointer(
                  ignoring: true,
                  child: Container(
                    child: Image.asset(
                      'images/share.png',
                      height: 40,
                      width: 40,
                    ),
                    margin: EdgeInsets.fromLTRB(290, 830,20, 10),
                    //height: 50,
                    //width: 50,
                    decoration: BoxDecoration(
                      //border: Border.all(width: 2,color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [Colors.white,Colors.grey])
                    ),

                  ),
                ),
              ),
              Positioned(
                // left: 350,
                // top: 830,
                // right: 20,
                // bottom: 10,
                child: IgnorePointer(
                  ignoring: true,
                  child: Container(
                    child: Image.asset('images/email.png'),
                    margin: EdgeInsets.fromLTRB(350, 830,20, 10),
                    //height: 50,
                    //width: 50,
                    decoration: BoxDecoration(
                      //border: Border.all(width: 2,color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [Colors.white,Colors.grey])
                    ),
                  ),
                ),
              ),
              IgnorePointer(
                ignoring: true,
                child: Container(
                  margin: EdgeInsets.fromLTRB(290, 890, 20, 10),
                  child: Text("Privacy Policy",style: TextStyle(fontSize: 16),),
                  decoration: BoxDecoration(border: Border.all(color: Colors.black,)),
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
        ));
  }
}