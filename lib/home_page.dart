import 'package:calculator_app/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var userQuestion="";
  var userAnsware="";

  final List buttonTextList = [
    "C","DEL","%","/",
    "9","8","7","*",
    "6","5","4","-",
    "3","2","1","+",
    "0",".","ANS","=",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffC7DEEE),

      body: Column(
        children: [

          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 20, top: 80),
                    alignment: Alignment.bottomRight,
                    child: Text(userQuestion, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Color(0xff00004d)),),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.bottomRight,
                    child: Text(userAnsware, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Color(0xff000066))),
                  )
                ],
              ),

            ),
          ),
          Expanded(
            flex: 2,

            child: Container(
              padding: EdgeInsets.all(5),



              child: Center(
                child: GridView.builder(
                  itemCount: buttonTextList.length,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                    itemBuilder: (BuildContext contex, int index){
                      if(index==0){
                        return MyButton(
                          buttonTabbed: (){
                            setState(() {
                              userQuestion='';
                              userAnsware='';
                            });
                          },
                            buttonColor: Color(0xffF3686B),
                            textColor:Colors.white,
                            buttonText: buttonTextList[index]);
                      }
                      else if(index==1){
                        return MyButton(
                          buttonTabbed: (){
                            setState(() {
                               userQuestion = userQuestion.substring(0, userQuestion.length-1);
                            });
                          },
                            buttonColor: Color(0xffF3686B),
                            textColor:Colors.white,
                            buttonText: buttonTextList[index]);
                      }
                      else if(index==18){
                        return MyButton(
                          buttonTabbed: (){
                            setState(() {
                              userQuestion += buttonTextList[index];
                            });
                          },
                            buttonColor: Color(0xff27CF55),
                            textColor: Colors.white,
                            buttonText: buttonTextList[index]);
                      }
                      else if(index== buttonTextList.length-1){
                        return MyButton(
                            buttonTabbed: (){
                              setState(() {
                                 equalTab();
                              });
                            },
                            buttonColor: Color(0xff27CF55),
                            textColor: Colors.white,
                            buttonText: buttonTextList[index]);
                      }

                      else{
                        return MyButton(
                          buttonTabbed: (){
                            setState(() {
                              userQuestion += buttonTextList[index];
                            });
                          },
                            buttonColor: isOperator(buttonTextList[index])?Color(0xffF1A535):Color(0xff48A3F2),
                            textColor: isOperator(buttonTextList[index])?Colors.white:Colors.white,
                            buttonText: buttonTextList[index]);
                      }
                    })
              ),
                decoration: BoxDecoration(
                    color: Color(0xffc1ddf0),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30)))
            ),
              



              
            ),


        ],
      ),
    );
  }

  bool isOperator(String x){
    if(x=='/' || x=='*' || x=='-' || x=='+' || x=='%'){
      return true;
    }
    return false;
  }


  void equalTab(){
    String finalQuestion = userQuestion;
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);

    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnsware = eval.toString();
  }
}
