import 'package:bmi/secondPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  double _currentSliderValue = 20;
  int _weightVar=60;
  int _ageVar=10;
  Color _maleColor=Colors.black54;
  Color _iconMale=Colors.blue;
  Color _maleText=Colors.green;
  Color _femaleColor=Colors.black54;
  Color _iconfeMale=Colors.pink;
  Color _femaleText=Colors.green;
  int _genderType=2;
  var _healthy;
  var _bmi;
  String _msg="";
  String rounded="";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Center(
          child: Text(
              "BMI CALCULATOR", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),
          ),
        ),

      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.pink[800],
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        _maleColor=Colors.blue;
                        _iconMale=Colors.black54;
                        _maleText=Colors.black;
                        _genderType=1;
                        // reset the other
                        _femaleColor=Colors.black54;
                         _iconfeMale=Colors.pink;
                         _femaleText=Colors.green;
                      });
                    },
                    child: Container(  // main container for male
                        margin: EdgeInsets.symmetric(vertical: 20,horizontal: 30),

                         height: 190, width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _maleColor,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container( // Icon container
                              padding: EdgeInsets.only(top: 20),
                                child: Icon(Icons.male_rounded,size:130,color: _iconMale,)
                            ),
                            Container( // Text container
                                child: Center(
                                    child: Text("Male",style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold,color:_maleText),)
                                ) ,
                            ),

                          ],
                        ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        _femaleColor=Colors.pink;
                         _iconfeMale=Colors.black54;
                         _femaleText=Colors.black;
                         _genderType=0;
                         // reset the other
                        _maleColor=Colors.black54;
                         _iconMale=Colors.blue;
                         _maleText=Colors.green;
                      });
                    },
                    child: Container(  // main container for female
                      margin: EdgeInsets.symmetric(vertical:20),

                      height: 190, width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _femaleColor,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container( // Icon container
                              padding: EdgeInsets.only(top: 20),
                              child: Icon(Icons.female_rounded,size:130,color:_iconfeMale,)
                          ),
                          Container( // Text container
                            child: Center(
                                child: Text("Female",style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold,color:_femaleText),)
                            ) ,
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container( // main container for height
                width: 380,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      Text("HEIGHT",style: TextStyle(fontSize: 20,color: Colors.grey)),
                      SizedBox(height: 5),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${_currentSliderValue.toInt()}",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.black54)),
                            SizedBox(width: 5,),
                            Text("cm",style: TextStyle(fontSize: 22,color: Colors.grey),),
                          ],
                      ),
                      Container(
                        width: 300,
                        child: Slider(
                          value: _currentSliderValue,
                          max: 200,
                          divisions: 100,
                          activeColor: Colors.green,
                          label: _currentSliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue = value;
                            });
                          },
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Container(  // main container for add / minimize
                    margin: EdgeInsets.symmetric(vertical: 20,horizontal: 17),

                    height: 160, width: 185,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black54,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 10,),
                        Text("Weight",style: TextStyle(fontSize:20,color: Colors.blue),),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${_weightVar}",style: TextStyle(
                                fontWeight: FontWeight.bold,
                              fontSize: 50,),
                            ),
                            SizedBox(width: 3,),
                            Text("Kg" , style: TextStyle(fontSize: 20,color: Colors.grey),)
                          ],
                        ),
                        Container(
                          child: Row(
                            children: [
                              IconButton(onPressed:(){
                                setState(() {
                                  if(_weightVar-10>0)
                                    _weightVar-=10;

                                });
                              }, icon:Icon(Icons.arrow_downward_rounded,size: 25,color: Colors.blue,)),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        if(_weightVar>1)
                                          _weightVar--;
                                      });

                                    },
                                    icon: Icon(Icons.minimize,),
                                ),
                                width: 40, height: 40,
                                //margin: EdgeInsets.only(left: 25),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: IconButton(
                                        onPressed: (){
                                          setState(() {
                                            _weightVar++;
                                          });
                                        },
                                        icon: Icon(Icons.add,),
                                      ),
                                      width: 40, height: 40,
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(onPressed:(){
                                setState(() {
                                  _weightVar+=10;
                                });
                              }, icon:Icon(Icons.arrow_upward_rounded,size: 25,color: Colors.pink,))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(  // main container for add / minimize
                    margin: EdgeInsets.symmetric(vertical: 20),

                    height: 160, width: 185,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black54,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 10,),
                        Text("Age",style: TextStyle(fontSize:20,color: Colors.pink),),
                        SizedBox(height: 5,),
                            Text("$_ageVar",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,),
                            ),

                        Container(
                          child: Row(
                            children: [
                              IconButton(onPressed:(){
                                setState(() {
                                  if(_ageVar-10>0)
                                    _ageVar-=10;
                                });
                              }, icon:Icon(Icons.arrow_downward_rounded,size: 25,color: Colors.pink,)),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      if(_ageVar>1)
                                      _ageVar--;
                                    });

                                  },
                                  icon: Icon(Icons.minimize,),
                                ),
                                width: 40, height: 40,
                                //margin: EdgeInsets.only(left: 25),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: IconButton(
                                        onPressed: (){
                                          setState(() {
                                            _ageVar++;
                                          });
                                        },
                                        icon: Icon(Icons.add,),
                                      ),
                                      width: 40, height: 40,
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(onPressed:(){
                                setState(() {
                                  _ageVar+=10;
                                });
                              }, icon:Icon(Icons.arrow_upward_rounded,size: 25,color: Colors.blue,))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
             Container(
               decoration: BoxDecoration(
                   color: Colors.black45,
                 borderRadius: BorderRadius.circular(10),
               ),
               width: 180,

               child: MaterialButton(
                   onPressed:(){
                     if(_genderType==2)
                     {
                       warnMsg();
                     }
                     else {
                       Navigator.push(context,
                           MaterialPageRoute(builder: (context) =>
                               resultPage(
                                 bmi: rounded, healthy: _healthy, msg: _msg,)
                           ));

                       _calcFuntion(_currentSliderValue, _weightVar);
                       checkHealthy(_ageVar, _bmi);
                     }
                   },
                 child: Text("Calculate",style: TextStyle(fontSize: 30,color: Colors.green),),
               ),
             ),
            ],
          ),
        ),
      ),
    );
  }
  void _calcFuntion(double height,int weight)
  {
    height=height / 100;
    _bmi=weight/ (height*height);
    rounded=_bmi.toStringAsFixed(1);

  }
  void checkHealthy(int age,double bmi)
  {
    bool _check=true;
    if(age>=2&&age<=17)
      {
        if(bmi<16.3)
          _check= false;
        else if(bmi>25)
          _check =false;
      }
    if(_check)
      {
        _healthy="Normal";
        _msg="You Have a normal body";
      }
    else
      {
        _healthy="Abnormal";
        _msg="You may have health risks";
      }
  }
  void warnMsg()
  {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Warning!"),
          content: Text("please select your gender",style: TextStyle(fontWeight: FontWeight.bold),),
          actions: <Widget>[
            MaterialButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}




