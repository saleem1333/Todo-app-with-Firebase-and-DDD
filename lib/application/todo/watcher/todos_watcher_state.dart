part of 'todos_watcher_cubit.dart';


@freezed
class TodosWatcherState with _$TodosWatcherState {
  const factory TodosWatcherState.loading() = _Loading;
  const factory TodosWatcherState.loadedSuccess({required List<Todo> todos, required Todo? todoEditTarget, required bool isCreatingNewTodo}) = _LoadedSuccess;
  const factory TodosWatcherState.loadedFailure(Failure failure) = _LoadedFailure;
}
