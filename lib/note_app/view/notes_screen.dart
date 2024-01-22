import 'package:first_session/note_app/view_model/note_cubit.dart';
import 'package:first_session/note_app/view_model/note_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocConsumer<NoteCubit, NoteState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit=NoteCubit.get(context);
          return GridView.count(crossAxisCount: 3,
            childAspectRatio: 16 / 8,
            crossAxisSpacing: 4,
            mainAxisSpacing: 5,
            children:List.generate(cubit.notes.length,
                  (index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.yellow),

              ),
              child: Column(
                children: [
                  Text(cubit.notes[index].title, style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  )),
                  Text(cubit.notes[index].description, style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey
                  ),),
                  Text(cubit.notes[index].date, style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey
                  )),
                ],
              ),
            ),),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) =>
                  BlocConsumer<NoteCubit, NoteState>(
                    listener: (context, state) {
                      var cubit = NoteCubit.get(context);

                      if(state is AddNoteSuccessState){
                        cubit.titleController.clear();
                        cubit.descriptionController.clear();
                        cubit.dateController.clear();
                        Navigator.pop(context);
                      }
                    },
                    builder: (context, state) {
                      var cubit = NoteCubit.get(context);
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              controller: cubit.titleController,
                              decoration: InputDecoration(labelText: "Title"),
                            ),
                            TextFormField(
                              controller: cubit.descriptionController,
                              maxLines: 5,
                              decoration:
                              InputDecoration(labelText: "Description"),
                            ),
                            TextFormField(
                              controller: cubit.dateController,
                              keyboardType: TextInputType.none,
                              onTap: () {
                                showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2025))
                                    .then((value) {
                                  cubit.dateController.text =
                                  "${value!.year}-${value.month}-${value.day}";
                                });
                              },
                              decoration: InputDecoration(labelText: "Date"),
                            ),
                          ],
                        ),
                        actions: [
                          SizedBox(
                            width: double.infinity,
                            child: MaterialButton(
                                color: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                onPressed: () {
                                  cubit.addNote();
                                },
                                child: Text(
                                  "Add",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                )),
                          ),
                        ],
                      );
                    },
                  ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
