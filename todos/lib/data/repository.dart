import 'package:todos/data/models/todo.dart';
import 'package:todos/data/network_service.dart';

class Repository {
  final NetworkService networkService;

  Repository({this.networkService});

  Future<List<Todo>> fetchTodos() async {
    final todosRaw = await networkService.fetchTodos();
    return todosRaw.map((e) => Todo.fromJson(e)).toList();
  }
  
}