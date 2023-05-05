import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class resultPage extends StatefulWidget {
var bmi;
var healthy;
var msg;
resultPage({Key?mykey,this.bmi,this.healthy,this.msg,}):super(key: mykey);

  @override
  State<resultPage> createState() => _resultPageState();
}

class _resultPageState extends State<resultPage> {
  Color _statusColor=Colors.black54;

  @override
  Widget build(BuildContext context) {
    checkStatus();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Center(
          child: Text(
            "BMI CALCULATOR", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.pink[800],
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 25,),
            Text("Your Result",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
            SizedBox(height: 20),
            Container(
              width:350 , height: 380,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10),
              ),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Text("${widget.healthy}",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 25,color: _statusColor),),
                SizedBox(height: 20,),
                Text("${widget.bmi}",style: TextStyle(fontSize: 70,fontWeight: FontWeight.bold,color: Colors.white),),
                SizedBox(height: 10,),
                Text("Normal BMI range:",style: TextStyle(fontSize: 18,color: Colors.grey),),
                SizedBox(height: 10,),
                Text("18.5 - 25 kg/m2",style: TextStyle(fontSize: 25,color: Colors.white),),
                SizedBox(height: 30,),
                Text("${widget.msg}",style: TextStyle(fontSize: 25,color: _statusColor),),
                SizedBox(height: 20,),
                Text("Keep Going!",style: TextStyle(fontSize: 25,color: Colors.white),),
              ],
            ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 200,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(10)
              ),
              child: MaterialButton(
                  onPressed:(){
                    Navigator.pop(context);
                  },
                child: Text("Retry",style: TextStyle(fontSize: 35,color: Colors.green),),
              ),
            )
          ],
        ),
      ),
    );


  }
 void checkStatus() {
   if (widget.healthy=="Normal")
     _statusColor = Colors.green;
   else
     _statusColor = Colors.red;
 }
}
