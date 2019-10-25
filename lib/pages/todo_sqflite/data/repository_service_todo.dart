import 'database_creator.dart';
import 'package:hello_world/pages/todo_sqflite/models/todo.dart';

class RepositoryServiceTodo {
  static Future<List<Todo>> getAllTodos() async {
    final sql = '''SELECT * FROM ${DataBaseCreator.todoTable}
    WHERE ${DataBaseCreator.isDeleted} = 0''';
    final data = await db.rawQuery(sql);
    List<Todo> todos = List();

    for (final node in data) {
      final todo = Todo.fromJson(node);
      todos.add(todo);
    }
    return todos;
  }

  static Future<Todo> getTodo(int id) async {
    //final sql = '''SELECT * FROM ${DataBaseCreator.todoTable}
    //WHERE ${DataBaseCreator.id} = $id''';
    //final data = await db.rawQuery(sql);

    final sql = '''SELECT * FROM ${DataBaseCreator.todoTable}
    WHERE ${DataBaseCreator.id} = ?''';

    List<dynamic> params = [id];
    final data = await db.rawQuery(sql, params);

    final todo = Todo.fromJson(data.first);
    return todo;
  }

  static Future<void> addTodo(Todo todo) async {
    final sql = '''INSERT INTO ${DataBaseCreator.todoTable}
    (
      ${DataBaseCreator.id},
      ${DataBaseCreator.name},
      ${DataBaseCreator.info},
      ${DataBaseCreator.isDeleted}
    )
    VALUES (?,?,?,?)''';
    List<dynamic> params = [
      todo.id,
      todo.name,
      todo.info,
      todo.isDeleted ? 1 : 0
    ];
    final result = await db.rawInsert(sql, params);
    DataBaseCreator.databaseLog('Add todo', sql, null, result, params);
  }

  static Future<void> deleteTodo(Todo todo) async {
    /*final sql = '''UPDATE ${DataBaseCreator.todoTable}
    SET ${DataBaseCreator.isDeleted} = 1
    WHERE ${DataBaseCreator.id} = ${todo.id}
    ''';*/

    final sql = '''UPDATE ${DataBaseCreator.todoTable}
    SET ${DataBaseCreator.isDeleted} = 1
    WHERE ${DataBaseCreator.id} = ?
    ''';

    List<dynamic> params = [todo.id];
    final result = await db.rawUpdate(sql, params);

    DataBaseCreator.databaseLog('Delete todo', sql, null, result, params);
  }

  static Future<void> updateTodo(Todo todo) async {
    /*final sql = '''UPDATE ${DataBaseCreator.todoTable}
    SET ${DataBaseCreator.name} = "${todo.name}"
    WHERE ${DataBaseCreator.id} = ${todo.id}
    ''';*/

    final sql = '''UPDATE ${DataBaseCreator.todoTable}
    SET ${DataBaseCreator.name} = ?
    WHERE ${DataBaseCreator.id} = ?
    ''';

    List<dynamic> params = [todo.name, todo.id];
    final result = await db.rawUpdate(sql, params);

    DataBaseCreator.databaseLog('Update todo', sql, null, result, params);
  }

  static Future<int> todosCount() async {
    final data = await db
        .rawQuery('''SELECT COUNT(*) FROM ${DataBaseCreator.todoTable}''');

    int count = data[0].values.elementAt(0);
    int idForNewItem = count++;
    return idForNewItem;
  }
}
