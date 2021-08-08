part of 'todo_actor_cubit.dart';

@freezed
class TodoActorState with _$TodoActorState {
  const factory TodoActorState({required bool isActionLoading, required Either<Failure, Unit>? actionFailureOrSuccess}) =
      _TodoActorState;

  factory TodoActorState.initial() => TodoActorState(isActionLoading: false, actionFailureOrSuccess: null);
}
