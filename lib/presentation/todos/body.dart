import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:my_project/application/todo/actor/todo_actor_cubit.dart';
import 'package:my_project/application/todo/form/todo_form_cubit.dart';
import 'package:my_project/application/todo/watcher/todos_watcher_cubit.dart';
import 'package:my_project/domain/todo/todo.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            loadedSuccess: (todos, editingTodo, isCreatingNewTodo) {
              bool exists = todos.any((todo) => todo.id == editingTodo?.id);
              if (!exists && editingTodo != null) todos = [...todos, editingTodo];

              return ImplicitlyAnimatedReorderableList<Todo>(
                  items: todos,
                  areItemsTheSame: (e1, e2) => e1.id == e2.id,
                  onReorderFinished: (item, from, to, newTodos) {
                    context.read<TodosWatcherCubit>().updateTodos(newTodos);
                  },
                  itemBuilder: (context, _, todo, index) => Reorderable(
                        key: ValueKey<String>(todo.id),
                        child: BlocProvider<TodoFormCubit>(
                            create: (_) {
                              return TodoFormCubit(todo: todo, actor: context.read<TodoActorCubit>());
                            },
                            child: TodoListTile(
                              isEditing: todo.id == editingTodo?.id,
                              isCreatingNewTodo: isCreatingNewTodo,
                            )),
                      )).p12();
            },
            loadedFailure: (f) => f.message.text.makeCentered(),
          )
          .expand()
    ].column(crossAlignment: CrossAxisAlignment.start).py16();
  }
}

class TodoListTile extends StatelessWidget {
  const TodoListTile({Key? key, required this.isEditing, required this.isCreatingNewTodo}) : super(key: key);

  final bool isEditing;
  final bool isCreatingNewTodo;

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
                isCreatingNewTodo ? await context.read<TodoFormCubit>().create() : await context.read<TodoFormCubit>().update();
                context.read<TodosWatcherCubit>().editingStateWith(null, false);
              },
              validator: (_) => context.read<TodoFormCubit>().state.todo.name.validation.fold((f) => f.message, (_) => null),
            )
          : context.watch<TodoFormCubit>().state.todo.name.getOrCrash().text.make(),
      onTap: () {
        context.read<TodosWatcherCubit>().editingStateWith(context.read<TodoFormCubit>().state.todo, false);
      },
      tileColor: Colors.white,
      trailing: Handle(
        child: (context.watch<TodoFormCubit>().state.todo.done
                ? Icon(Icons.check_circle, size: 35, color: Color(0xff2FAC02))
                : Icon(
                    Icons.circle,
                    size: 35,
                  ))
            .onTap(() async {
          context.read<TodoFormCubit>().toggleDone();
          await context.read<TodoFormCubit>().update();
        }),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 12),
    ).card.shape(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))).elevation(5).make().pOnly(top: 8);
  }
}
