import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Data.dart';
import 'levelPage.dart';
import 'main.dart';

class lockpage extends StatefulWidget {
  const lockpage({super.key});

  @override
  State<lockpage> createState() => _lockpageState();
}

class _lockpageState extends State<lockpage> {
  int nexttap=0,backtap=0,i=0,level=0;
  List li=[29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56];
  List li2=[57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75];
  int CurrentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset('images/background.jpg',
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
            Positioned(
              left: 125,
              child: Container(
                child: Text("Select Puzzle",style: TextStyle(fontSize: 35,color: Colors.blue,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
              ),
            ),
            GridView.builder(
              primary: false,
              reverse: false,//touch krie tyare scroll no thay etale
              itemCount: (nexttap==0 || nexttap==1)?28:19,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,//upr leva mate
                vertical: 53,//niche leva mate
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing:10,
              ), itemBuilder: (context, index) {
              CurrentIndex=nexttap==0?index+1:nexttap==1?li[index]:nexttap==2?li2[index]:0;
              return (Data.levelStatus[CurrentIndex]=='Win')?
              InkWell(
                onTap: () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      Data.win=1;
                      return levelpage(CurrentIndex);
                    },));
                  });
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("${CurrentIndex}",style: TextStyle(fontSize: 30),),
                      alignment: Alignment.center,
                    ),
                    Container(
                      child: Image.asset('images/tick.png',fit: BoxFit.cover,),
                      height: 200,
                      width: 200,
                    )
                  ],
                ),
              ):
              (Data.levelStatus[CurrentIndex]=='skip') || ((CurrentIndex)==Preference.getlastLevel()!+1)?
              InkWell(
                onTap: () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return levelpage(CurrentIndex);
                    },));
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Text("${nexttap==0?index+1:nexttap==1?li[index]:nexttap==2?li2[index]:0}",style: TextStyle(fontSize: 30),),
                  alignment: Alignment.center,
                ),
              ):
              Container(
                child: Image.asset('images/lock.png'),
                height: 100,
                width: 100,
              );
            },),
            (nexttap==0 || nexttap==1)?
            Positioned(
              left: 350,
              top: 800,
              child: InkWell(
                onTap: () {
                  nexttap++;
                  backtap++;
                  setState(() {
                  });
                },
                child: Container(
                  child: Image.asset('images/next.png',
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
            ):Container(),
            (nexttap==1 || nexttap==2)?
            Positioned(
              left: 10,
              top: 800,
              child: InkWell(
                onTap: () {
                  backtap++;
                  nexttap--;
                  setState(() {
                  });
                },
                child: Container(
                  child: Image.asset('images/back.png',
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
            ):Container(),
          ],
        ),
      ),
    );
  }
}
