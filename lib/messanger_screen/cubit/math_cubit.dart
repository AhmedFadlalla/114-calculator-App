import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import 'math_state.dart';


class MathCubit extends Cubit<MathState> {
  MathCubit() : super(MathInitial());

  var number1Controller=TextEditingController();
  var number2Controller=TextEditingController();

  num total=0;

  void sum({required TextEditingController number1,
  required TextEditingController number2}){
    total=num.parse(number1Controller.text)+num.parse(number2Controller.text);
    emit(SumSuccessState());
  }
}
