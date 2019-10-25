import 'package:hello_world/pages/todo_sqflite/data/database_creator.dart';

class Todo {
  int id;
  String name;
  String info;
  bool isDeleted;

  Todo(this.id, this.name, this.info, this.isDeleted);

  Todo.fromJson(Map<String, dynamic> json) {
    this.id = json[DataBaseCreator.id];
    this.name = json[DataBaseCreator.name];
    this.info = json[DataBaseCreator.info];
    this.isDeleted = json[DataBaseCreator.isDeleted] == 1;
  }
}
