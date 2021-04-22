import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos/constants/strings.dart';
import 'package:todos/cubit/todos_cubit.dart';
import 'package:todos/data/network_service.dart';
import 'package:todos/data/repository.dart';
import 'package:todos/presentation/screens/add_todo_screen.dart';
import 'package:todos/presentation/screens/edit_todo_screen.dart';
import 'package:todos/presentation/screens/todos_screen.dart';

class AppRouter {
  Repository repository;
  AppRouter(){
    repository = Repository(networkService: NetworkService());
  }
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => TodosCubit(repository: repository),
            child: TodoScreen(),
          ),
        );
      case EDIT_TODO_ROUTE:
        return MaterialPageRoute(builder: (_) => EditTodoScreen());
      case ADD_TODO_ROUTE:
        return MaterialPageRoute(builder: (_) => AddTodoScrren());
      default:
        return null;
    }
  }
}
