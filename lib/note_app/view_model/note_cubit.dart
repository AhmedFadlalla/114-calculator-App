import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../model/note_model.dart';
import 'note_state.dart';


class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  static NoteCubit get(context)=>BlocProvider.of(context);

  var titleController=TextEditingController();
  var descriptionController=TextEditingController();
  var dateController=TextEditingController();

  List<NoteModel> notes=[];

  void addNote(){
    notes.add(NoteModel(title: titleController.text,
        description: descriptionController.text, date: dateController.text));
    emit(AddNoteSuccessState());
  }

}
