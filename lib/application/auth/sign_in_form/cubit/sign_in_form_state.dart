part of 'sign_in_form_cubit.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState(
      {required EmailAddress emailAddress,
      required Password password,
      required bool showErrors,
      required bool isLoading,
      required Either<Failure, Unit>? authFailureOrSuccess}) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(emailAddress: EmailAddress(''), password: Password(''), showErrors: false, isLoading: false, authFailureOrSuccess: null);
}
