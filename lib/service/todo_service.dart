import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_todo_app/model/todo_model.dart';

class TodoService {
  final todoCollection = FirebaseFirestore.instance.collection('todoApp');

  //Create
  void addNewTask(TodoModel model) {
    todoCollection.add(model.toMap());
  }
}
