import '../../models/todo.dart';
import '../dto/todo_dto.dart';
import 'repository_exception.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class TodoRepository {
  static final global = TodoRepository();   // unique instance

  Future<List<Todo>> getTodos() async {

    //  TODO
    //  Adapt the code to handle firebase data fetch
    //
  final Uri url = Uri.parse("https://scammiee-c136b-default-rtdb.asia-southeast1.firebasedatabase.app/W9/todo.json");
  http.Response response = await http.get(url);


      //  TODO
      // Ensure the message is displayed on the UI if error occured
      //throw RepositoryException("No wifi !");
if (response.statusCode != 200) {
      throw RepositoryException(
        "No wifi!",
      );
    }

    Map<String, dynamic> json = jsonDecode(response.body);

    List<dynamic> toDoList = [];

    for (final key in json.keys) {
      Todo todo = TodoDto.fromJson(key, json[key]);
      toDoList.add(todo);
    }

    return [...toDoList];
  }

  Future<void> updateCompleted(String todoId, bool completed) async {
    
    //  TODO
    //  Adapt the code to handle firebase data fetch
    //
     Uri url = Uri.parse(
      "https://scammiee-c136b-default-rtdb.asia-southeast1.firebasedatabase.app/W9/todo/$todoId.json",
    );

    http.Response response = await http.patch(
      url,
      body: jsonEncode({"completed": completed}),
    );

    if (response.statusCode != 200) {
      throw RepositoryException(
        "No wifi!",
      );
    }
  }
}
