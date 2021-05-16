import 'package:flutter/material.dart';

import 'Timer2.dart';

class Timer1 extends StatefulWidget {
  Timer1({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Timer1State createState() => Timer1State();
}

class Timer1State extends State<Timer1> {

  boxWidget(String level,String hour,Color boxColor,Function onTap){
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: new BoxDecoration(
            color: boxColor,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(15.0),
              topRight: const Radius.circular(15.0),
              bottomLeft: const Radius.circular(15.0),
              bottomRight: const Radius.circular(15.0),
            )
        ),
        width: (MediaQuery.of(context).size.width-60)/3,
        height: (MediaQuery.of(context).size.width-60)/3,
        child: Center(
          child: Column(
            children: [
              Spacer(flex: 10,),
              Text("Level $level", style: TextStyle(fontSize: 12, color: Colors.white),),
              Spacer(flex: 10,),
              Text("$hour", style: TextStyle(fontSize: 25, color: Colors.white)),
              Text("hours", style: TextStyle(fontSize: 12, color: Colors.white)),
              Spacer(flex: 10,),
              Icon(Icons.info, color: Colors.white,),
              Spacer(flex: 10,)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                "Nesteia",
                style: TextStyle(fontSize: 25,),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 50),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                "Choose fasting protocol",
                style: TextStyle(fontSize: 20,color: Colors.grey[700],),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Spacer(),
                boxWidget("1", "14", Colors.blue,(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Timer2("14","1",Colors.blue)),
                  );
                }),
                Spacer(),
                boxWidget("2", "16", Colors.amber[900],(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Timer2("16","2",Colors.amber[900])),
                  );
                }),
                Spacer(),
                boxWidget("3", "20", Colors.brown,(){

                }),
                Spacer(),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Spacer(),
                boxWidget("4", "24", Colors.orangeAccent,(){

                }),
                Spacer(),
                boxWidget("5", "36", Colors.green,(){

                }),
                Spacer(),
                boxWidget("6", "48", Colors.deepPurple,(){

                }),
                Spacer(),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Spacer(),
                boxWidget("7", "72", Colors.blue[900],(){

                }),
                Spacer(),
                boxWidget("8", "96", Colors.pink,(){

                }),
                Spacer(),
                boxWidget("9", "12 - 999", Colors.grey[800],(){

                }),
                Spacer(),
              ],
            ),
            SizedBox(height: 25,),
            Container(
              margin: EdgeInsets.all(50),
              height: 5,
              child: Placeholder(),
            ),
            SizedBox(height: 25,),
            Row(
              children: [
                Spacer(),
                Container(
                  width: (MediaQuery.of(context).size.width-60)/3,
                  height: (MediaQuery.of(context).size.width-60)/3,
                  child: Placeholder(),
                ),
                SizedBox(width: 20,),
                boxWidget("2", "16", Colors.amber[900],(){

                }),
                Spacer(),
              ],
            ),
            SizedBox(height: 20,),
          ],
        ),
    ));
  }
}
