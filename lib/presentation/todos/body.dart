import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_project/application/todo/actor/todo_actor_cubit.dart';
import 'package:my_project/application/todo/form/todo_form_cubit.dart';
import 'package:my_project/application/todo/watcher/todos_watcher_cubit.dart';
import 'package:my_project/domain/todo/todo.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/infrastructure/core/firebase_firestore_mapper.dart';

import '../../injections.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      "My Todos".text.color(Color(0xff140404).withOpacity(0.7)).headline3(context).make().p24(),
      context
          .watch<TodosWatcherCubit>()
          .state
          .when(
            loading: () => const CircularProgressIndicator().centered(),
            loadedSuccess: (todos, editingTodo) {
              bool exists = todos.any((todo) => todo.id == editingTodo?.id);
              if (!exists && editingTodo != null) todos = [...todos, editingTodo];

              return ReorderableListView.builder(
                  itemCount: todos.length,
                  onReorder:(oldIndex, newIndex){
                     
                  },
                  itemBuilder: (context, index) => BlocProvider<TodoFormCubit>(
                      create: (_) {
                        return TodoFormCubit(todo: todos[index], actor: context.read<TodoActorCubit>());
                      },
                      child: TodoListTile(
                        key: ValueKey<String>(todos[index].id),
                        isEditing: todos[index].id == editingTodo?.id,
                      ))).p12();
            },
            loadedFailure: (f) => f.message.text.makeCentered(),
          )
          .expand()
    ].column(crossAlignment: CrossAxisAlignment.start);
  }
}

class TodoListTile extends StatelessWidget {
  const TodoListTile({Key? key, required this.isEditing}) : super(key: key);

  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: isEditing
          ? TextFormField(
              autovalidateMode: AutovalidateMode.always,
              autofocus: true,
              initialValue: context.read<TodoFormCubit>().state.todo.name.value,
              onChanged: (value) => context.read<TodoFormCubit>().todoNameChanged(value),
              onFieldSubmitted: (_) async {
                await context.read<TodoFormCubit>().save();
              
              },
              validator: (_) => context.read<TodoFormCubit>().state.todo.name.validation.fold((f) => f.message, (_) => null),
            )
          : context.watch<TodoFormCubit>().state.todo.name.getOrCrash().text.make(),
      onTap: () {
        context.read<TodosWatcherCubit>().editingStateWith(context.read<TodoFormCubit>().state.todo);
      },
      tileColor: Colors.white,
      trailing: (context.watch<TodoFormCubit>().state.todo.done
              ? Icon(Icons.check_circle, size: 35, color: Color(0xff2FAC02))
              : Icon(
                  Icons.circle,
                  size: 35,
                ))
          .onTap(() {
            context.read<TodoFormCubit>().toggleDone();
            context.read<TodoFormCubit>().save();
          }),
      contentPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 12),
    ).card.shape(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))).elevation(5).make().pOnly(top: 8);
  }
}
