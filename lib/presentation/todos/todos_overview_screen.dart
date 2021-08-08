import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/application/auth/auth_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:my_project/application/todo/actor/todo_actor_cubit.dart';
import 'package:my_project/application/todo/watcher/todos_watcher_cubit.dart';
import 'package:my_project/domain/todo/todo.dart';
import 'package:my_project/presentation/todos/body.dart';
import 'package:my_project/routes/routes.gr.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../injections.dart';

class TodosOverviewScreen extends StatelessWidget {
  const TodosOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => getIt<TodosWatcherCubit>()..watchAllTodos()), BlocProvider(create: (_) => getIt<TodoActorCubit>())],
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.logout).rotate180(),
            onPressed: () async {
              await context.read<AuthCubit>().signOut();
              context.router.replaceAll([SignInFormScreenRoute()]);
            },
          ),
        ),
        body: Body(),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(child: Icon(Icons.add), onPressed: () {
            context.read<TodosWatcherCubit>().editingStateWith(Todo.empty());
          }).objectBottomCenter();
        }),
      ),
    );
  }
}
