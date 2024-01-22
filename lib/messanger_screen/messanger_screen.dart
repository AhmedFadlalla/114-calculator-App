import 'package:first_session/messanger_screen/cubit/math_cubit.dart';
import 'package:first_session/messanger_screen/cubit/math_state.dart';
import 'package:flutter/material.dart';

import '../test_screen/test_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MessangerScreeen extends StatelessWidget {
  const MessangerScreeen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Naviagted"),
      ),

      body:BlocProvider(
        create: (context)=>MathCubit(),
        child: BlocConsumer<MathCubit,MathState>(
            builder: (context,state){
              var cubit= BlocProvider.of<MathCubit>(context);
              return Column(
                children: [
                  TextFormField(
                    controller:cubit.number1Controller,
                  ),
                  TextFormField(
                    controller:cubit.number2Controller ,
                  ),
                  ElevatedButton(onPressed: (){
                    cubit.sum(
                        number1:cubit.number1Controller,
                        number2: cubit.number2Controller);
                  }, child: Text("Sum")),
                  Text("Result: ${cubit.total} ")
                ],
              );
            }, listener: (context,state){
              if(state is SumSuccessState){
                print("Sum Successfully");
              }
        }),
      ),

    );
  }
}
