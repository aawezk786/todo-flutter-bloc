import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todos/data/models/todo.dart';
import 'package:todos/data/repository.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {

  final Repository repository;

  TodosCubit({this.repository}) : super(TodosInitial());

  void fetchTodos() {
    repository.fetchTodos().then((todos) => {
      emit(TodosLoaded(todos: todos))
    });
  }
}

