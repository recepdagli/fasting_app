import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'dart:math';

class Timer3 extends StatefulWidget {
  Timer3(this.hour, this.level, this.color, this.dateTime);
  final String hour;
  final String level;
  final Color color;
  final DateTime dateTime;

  @override
  Timer3State createState() => Timer3State(hour,level,color,dateTime);
}

class Timer3State extends State<Timer3> {

  Timer3State(this.hour, this.level, this.color, this._dateTime);

  final String hour;
  final String level;
  final Color color;
  final DateTime _dateTime;
  DateTime startDate;
  DateTime endDate;

  WhiteCircle(double angel){

    double sin_ = sin(angel);
    double cos_ = cos(angel);

    sin_ = sin_ * ((MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width/3))/2);
    cos_ = cos_ * ((MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width/3))/2);

    print("$sin_ : $cos_ -> ${(MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width/3))}");

    return Container(
        width: MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width/3),
        height: MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width/3),
        padding: EdgeInsets.only(left: cos_, top: sin_),
        child: Text("0")
    );
  }

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
  void initState() {
    startDate = _dateTime.toLocal();
    endDate = _dateTime.add(Duration(hours: int.parse(hour))).toLocal();
    startHour = startDate.hour.toString();
    endHour = endDate.hour.toString();
    calcTime();
    timer = Timer.periodic(Duration(minutes: 1), (Timer t) => calcTime());

  }

  String startHour= "";
  String endHour = "";
  String elapsedTime_hour= "";
  String timeLeft_hour = "";
  String elapsedTime_min= "";
  String timeLeft_min = "";

  Timer timer;

  int makePositive(int val){
    if(val >= 0){
      return val;
    }
    else{
      return val * -1;
    }

  }

  void calcTime(){
    setState(() {
      elapsedTime_hour = makePositive(((startDate.difference(DateTime.now().toLocal()).inMinutes)~/60)).toString();
      timeLeft_hour = makePositive(((endDate.difference(DateTime.now().toLocal()).inMinutes)~/60)).toString();
      elapsedTime_min = makePositive((makePositive((startDate.difference(DateTime.now().toLocal()).inMinutes))-(int.parse(elapsedTime_hour)*60))).toString();
      timeLeft_min = makePositive(((makePositive((endDate.difference(DateTime.now().toLocal()).inMinutes))-(int.parse(timeLeft_hour)*60)))+1).toString();
      print(startDate.difference(DateTime.now().toLocal()).inMinutes.toString());
      print(startDate.hour);
      print(DateTime.now().toLocal().hour);
    });
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
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: Stack(
                        children: [
                          CircularPercentIndicator(
                            radius: MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width/3),
                            lineWidth: 20.0,
                            animation: true,
                            percent: makePositive((startDate.difference(DateTime.now().toLocal()).inMinutes))/(int.parse(hour)*60),
                            center: Center(
                              child: Column(
                                children: [
                                  Spacer(),
                                  Text("Elapsed Time",style: TextStyle(color: Colors.grey,fontSize: 15)),
                                  SizedBox(height: 5,),
                                  Text("${elapsedTime_hour}h${elapsedTime_min}m",style: TextStyle(color: Colors.black,fontSize: 25),),
                                  SizedBox(height: 5,),
                                  Text("Time Left",style: TextStyle(color: Colors.grey,fontSize: 15)),
                                  SizedBox(height: 5,),
                                  Text("${timeLeft_hour}h${timeLeft_min}m",style: TextStyle(color: Colors.black,fontSize: 25)),
                                  Spacer(),
                                ],
                              ),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.lightGreen[700],
                          ),
                        ],
                      )
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width/3),
                    height: MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width/3),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Spacer(),
                        Text("Start",style: TextStyle(color: Colors.black,fontSize: 15)),
                        Row(
                          children: [
                            Spacer(),
                            Text("$startHour:00",style: TextStyle(color: Colors.black,fontSize: 25)),
                            Icon(Icons.edit,size: 20,),
                            Spacer(),
                          ],
                        ),
                        Spacer(),
                        boxWidget("2","16",Colors.deepOrangeAccent,(){

                        }),
                        Spacer(),
                        Text("End",style: TextStyle(color: Colors.black,fontSize: 15)),
                        Row(
                          children: [
                            Spacer(),
                            Text("$endHour:00",style: TextStyle(color: Colors.black,fontSize: 25)),
                            Spacer(),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Spacer(),
                  Container(
                    width: 50,
                    height: 90,
                    child: Placeholder(),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    width: MediaQuery.of(context).size.width-120,
                    alignment: Alignment.center,
                    child: Text("Your body starts producing more ketone bodies and your glucose starts to drop",textAlign: TextAlign.center,)
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Spacer(),
                  InkWell(
                    onTap: null,
                    child: Container(
                      decoration: new BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(15.0),
                            topRight: const Radius.circular(15.0),
                            bottomLeft: const Radius.circular(15.0),
                            bottomRight: const Radius.circular(15.0),
                          )
                      ),
                      width: (MediaQuery.of(context).size.width-100)/2,
                      height: (MediaQuery.of(context).size.width-100)/2,
                      child: Center(
                        child: Column(
                          children: [
                            Spacer(),
                            Container(
                              width: 50,
                              height: 50,
                              child: Placeholder(),
                            ),
                            Spacer(),
                            Text("Weight",style: TextStyle(color: Colors.white, fontSize: 20),),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: null,
                    child: Container(
                      decoration: new BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(15.0),
                            topRight: const Radius.circular(15.0),
                            bottomLeft: const Radius.circular(15.0),
                            bottomRight: const Radius.circular(15.0),
                          )
                      ),
                      width: (MediaQuery.of(context).size.width-100)/2,
                      height: (MediaQuery.of(context).size.width-100)/2,
                      child: Stack(
                        children: [
                          Center(
                            child: Column(
                              children: [
                                Spacer(),
                                Container(
                                  width: 50,
                                  height: 50,
                                  child: Placeholder(),
                                ),
                                Spacer(),
                                Container(padding: EdgeInsets.only(left: 10,right: 10),child: Text("Glucose and Ketogenic Bodies",style: TextStyle(color: Colors.white, fontSize: 18),textAlign: TextAlign.center,)),
                                Spacer(),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Spacer(),
                              Container(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(Icons.info,color: Colors.white,)
                              )
                            ],
                          )
                        ],
                      )
                    ),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width/2,
                padding: EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
                decoration: new BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(25.0),
                      topRight: const Radius.circular(25.0),
                      bottomLeft: const Radius.circular(25.0),
                      bottomRight: const Radius.circular(25.0),
                    )
                ),
                alignment: Alignment.center,
                child: Text("Finish",style: TextStyle(color: Colors.white),),
              ),
              SizedBox(height: 30),
            ],
          ),
        )
    );
  }
}
