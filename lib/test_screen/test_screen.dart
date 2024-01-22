import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  String text="";

  void enterOperation(String operation){
    setState(() {
     this.operation=operation;
    });
  }
  void enterNumber(String number){


    setState(() {
      if(number=="+" || number=="-" ){
        operation=number;
      }else{
        if(text!=""){
          num2=int.parse(number);
        }else{
          num1=int.parse(number);
        }
      }

      text+=number;

    });
  }
  int num1=0;
  int num2=0;
  String operation="";

  int total=0;
  void calculateTotal(){
    switch(operation){
      case "+":
        setState(() {
          total=num1+num2;
        });
        break;
      case "-":
        setState(() {
          total=num1-num2;
        });
        break;
      default:
        print("Invalid");
    }
  }

  void emptyAllData() {
    setState(() {
      text="";
      num1=0;
      num2=0;
      operation="";
      total=0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(text,style: TextStyle(
            fontSize: 25
          ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              InkWell(
                onTap: (){
                  enterNumber("+");
                  // print("123");
                },
                child: Container(
                  width: 50,
                  height: 50,

                  decoration: BoxDecoration(
                  shape: BoxShape.circle,
                    color: Colors.red
                ),
                child: Center(
                  child: Text("+",style: TextStyle(
                    fontSize: 20,
                  )),
                ),),
              ),
              SizedBox(width: 8,),
              InkWell(
                onTap: (){
                  enterNumber("-");
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                      color: Colors.red
                  ),
                  child: Center(
                    child: Text("-",style: TextStyle(
                      fontSize: 20,
                    ),),
                  ),),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  enterNumber("1");
                },
                child: Container(
                  width: 50,
                  height: 50,

                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red
                  ),
                  child: Center(
                    child: Text("1",style: TextStyle(
                      fontSize: 20,
                    )),
                  ),),
              ),
              InkWell(
                onTap: (){
                  enterNumber("2");
                },
                child: Container(
                  width: 50,
                  height: 50,

                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red
                  ),
                  child: Center(
                    child: Text("2",style: TextStyle(
                      fontSize: 20,
                    )),
                  ),),
              ),
              InkWell(
                onTap: (){
                  enterNumber("3");
                },
                child: Container(
                  width: 50,
                  height: 50,

                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red
                  ),
                  child: Center(
                    child: Text("3",style: TextStyle(
                      fontSize: 20,
                    )),
                  ),),
              ),
              InkWell(
                onTap: (){
                  enterNumber("4");
                },
                child: Container(
                  width: 50,
                  height: 50,

                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red
                  ),
                  child: Center(
                    child: Text("4",style: TextStyle(
                      fontSize: 20,
                    )),
                  ),),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  calculateTotal();
                },
                child: Container(
                  width: 50,
                  height: 50,

                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red
                  ),
                  child: Center(
                    child: Text("=",style: TextStyle(
                      fontSize: 20,
                    )),
                  ),),
              ),
              SizedBox(width: 4,),
              InkWell(
                onTap: (){
                  emptyAllData();
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red
                  ),
                  child: Center(
                    child: Text("C",style: TextStyle(
                      fontSize: 20,
                    ),),
                  ),),
              ),
            ],
          ),
          Text(total.toString(),style: TextStyle(
            fontSize: 25
          ),),



        ],
      ),
    );
  }
}
