import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Timer3.dart';

class Timer2 extends StatefulWidget {
  Timer2(this.hour, this.level, this.color);
  final String hour;
  final String level;
  final Color color;

  @override
  Timer2State createState() => Timer2State(hour,level,color);
}

class Timer2State extends State<Timer2> {

  Timer2State(this.hour, this.level, this.color);

  final String hour;
  final String level;
  final Color color;
  DateTime _dateTime;

  @override
  initState(){
    _dateTime = DateTime.now();
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
                  "Choose the date and time to start the fast",
                  style: TextStyle(fontSize: 15,color: Colors.grey[700],),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30),
              boxWidget(level, hour, color,(){

              }),
              SizedBox(height: 30),
              Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width:  MediaQuery.of(context).size.width-(MediaQuery.of(context).copyWith().size.width/10),
                  child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (DateTime newdate) {
                      _dateTime = newdate;
                    },
                    use24hFormat: MediaQuery.of(context).alwaysUse24HourFormat,
                    maximumDate: new DateTime(2021, 12, 30),
                    minimumYear: 2019,
                    maximumYear: 2050,
                    minuteInterval: 1,
                    mode: CupertinoDatePickerMode.dateAndTime,
                  )
              ),
              SizedBox(height: 30,),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Timer3(hour,level,color,_dateTime.toLocal())),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width/2,
                  padding: EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 20),
                  decoration: new BoxDecoration(
                      color: Colors.green,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(25.0),
                        topRight: const Radius.circular(25.0),
                        bottomLeft: const Radius.circular(25.0),
                        bottomRight: const Radius.circular(25.0),
                      )
                  ),
                  alignment: Alignment.center,
                  child: Text("Schedule Fasting",style: TextStyle(color: Colors.white),),
                ),
              )

            ],
          ),
        )
    );
  }
}
