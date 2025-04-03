import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:math_puzzel/winPage.dart';

import 'Data.dart';
import 'main.dart';
import 'mainPage.dart';

class levelpage extends StatefulWidget {
  int levelNo=0;
  levelpage(this.levelNo);

  @override
  State<levelpage> createState() => _levelpageState();
}

class _levelpageState extends State<levelpage> {
  int levelNo=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.levelNo==Preference.getlastLevel()){
      levelNo=Preference.getlastLevel()!;
    }
    levelNo=widget.levelNo-1;
    print("LastLevel=$levelNo");
    print("Preference=${Preference.getlastLevel()}");
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: fun, child: Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset('images/gameplaybackground.jpg',
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      title: Text("Skip"),
                      backgroundColor: Colors.white,
                      actions: [
                        Container(
                          child: Text("Are you sure you want to skip this level?You can play skipped leves later by clicking on PUZZLES menu from main screen.",style: TextStyle(fontSize: 15),),
                        ),
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
                                child: Text("Cancel",style: TextStyle(color: Colors.red,fontSize: 20),),
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(180,0,20,0),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if(levelNo==Preference.getlastLevel()){
                                    Preference.setlastLevel(levelNo+1);
                                    Preference.setSkipLevel(levelNo+1);
                                  }
                                  levelNo++;
                                  Navigator.pop(context);
                                });
                              },
                              child: Container(
                                height: 50,
                                child: Text("Ok",style: TextStyle(color: Colors.red,fontSize: 20),),
                                alignment: Alignment.center,
                              ),
                            ),
                          ],
                        ),
                      ],
                      shape: LinearBorder(side: BorderSide(width: 10)),
                    );
                  },);
                });
              },
              child: Container(
                child: Image.asset('images/skip.png',
                  height: 40,
                  width: 40,
                ),
                margin: EdgeInsets.only(top: 20),
              ),
            ),
            Positioned(
              left: 100,
              top: 20,
              child: Container(
                child: Image.asset('images/level_board.png',
                  fit: BoxFit.fitWidth,
                ),
                height: 40,
                width: 200,
              ),
            ),
            Positioned(
              left: 140,
              top: 20,
              child: Container(
                child: Text("Puzzle ${levelNo+1}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              ),
            ),
            Positioned(
              left: 370,
              top: 20,
              child: Container(
                child: Image.asset('images/hint.png',
                  height: 40,
                  width: 40,
                ),
              ),
            ),
            Positioned(
              left: 12,
              top: 70,
              right: 12,
              child: Container(
                child: Image.asset('images/${Data.image[levelNo]}'),
              ),
            ),
            Positioned(
              top: 780,
              child: Container(
                color: Colors.black,
                height: 120,
                width: 500,
              ),
            ),
            Positioned(
              left: 10,
              top: 800,
              child: Container(
                height: 30,
                width: 270,
                child: Text("${Data.ans}",style: TextStyle(fontSize: 20),),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.blueAccent)
                ),
              ),
            ),
            Positioned(
              left: 290,
              top: 785,
              child: InkWell(
                onTap: () {
                  Data.ans=Data.ans.substring(0,Data.ans.length-1);
                  setState(() {

                  });
                },
                child: Container(
                  child: Image.asset('images/delete.png',
                    height: 60,
                    width: 50,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 360,
              top: 805,
              child: InkWell(
                onTap: () {
                  if(Data.ans==('${(levelNo+1)*10}')){
                    if(levelNo==Preference.getlastLevel()){
                      Preference.setlastLevel(levelNo+1);
                    }
                    if(Data.win==0){
                      Preference.setWinLevel(levelNo+1);
                    }
                    else{
                      Data.win=0;
                    }
                    Navigator.push(context,MaterialPageRoute(builder: (context) {
                      return winpage(levelNo);
                    },));
                  }
                  else{
                    setState(() {
                      Fluttertoast.showToast(
                        msg: "Wrong",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black54,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    });
                  }
                  setState(() {
                    Data.ans='';
                  });
                },
                child: Container(
                  child: Text("Submit",style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 845,
              right: 0,
              bottom: 0,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 10,
                    width: 37,
                    margin: EdgeInsets.fromLTRB(3,0,2,0),
                    child: InkWell(
                      onTap: () {
                        String num=(index==9?index-9:index+1).toString();
                        Data.ans='${Data.ans}'+'$num';
                        print(Data.ans);
                        setState(() {
                        });
                      },
                      child: ListTile(
                        trailing: Text("${index==9?index-9:index+1}",style: TextStyle(color: Colors.white,fontSize: 25)),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.white)
                    ),
                  );
                },),
            )
          ],
        ),
      ),
    ));
  }

  Future<bool> fun() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return mainPage();
    },));
    return Future.value();
  }
}
