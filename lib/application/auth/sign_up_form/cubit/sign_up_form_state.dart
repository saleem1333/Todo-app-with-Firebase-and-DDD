part of 'sign_up_form_cubit.dart';

@freezed
abstract class SignUpFormState with _$SignUpFormState {
  const factory SignUpFormState({
    required EmailAddress emailAddress,
    required Password password,
    required PasswordConfirmation passwordConfirmation,
    required bool showErrors,
    required bool isLoading,
    required Either<Failure, Unit>? authFailureOrSuccess,
  }) = _SignUpFormState;

  factory SignUpFormState.initial() => SignUpFormState(
      emailAddress: EmailAddress(''),
      password: Password(''),
      passwordConfirmation: PasswordConfirmation('', password: Password('')),
      showErrors: false,
      isLoading: false,
       authFailureOrSuccess: null);
}
