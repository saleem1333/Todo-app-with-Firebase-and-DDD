import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_project/domain/auth/i_auth_facade.dart';
import 'package:my_project/domain/core/value_objects.dart';
import 'package:my_project/domain/failures/failures.dart';

part 'sign_up_form_state.dart';
part 'sign_up_form_cubit.freezed.dart';

class SignUpFormCubit extends Cubit<SignUpFormState> {
  SignUpFormCubit(this._authFacade) : super(SignUpFormState.initial());

  final IAuthFacade _authFacade;

    void emailChanged(String emailStr) {
    emit(state.copyWith(emailAddress: EmailAddress(emailStr)));
  }

  void passwordChanged(String passwordStr) {
    Password _password = Password(passwordStr);
    emit(state.copyWith(password: _password, passwordConfirmation: PasswordConfirmation(state.passwordConfirmation.value, password:_password)));
  }

  void passwordConfirmationChanged(String passwordConfirmationStr){
        emit(state.copyWith(passwordConfirmation: PasswordConfirmation(passwordConfirmationStr, password: state.password)));

  }

  void registerPressed() async {
    if (state.emailAddress.isValid() && state.password.isValid() && state.passwordConfirmation.isValid()) {
      emit(state.copyWith(isLoading: true));
      Either<Failure, Unit> failureOrSuccess = await _authFacade.createUserWithEmailAndPassword(email: state.emailAddress, password: state.password);
      emit(state.copyWith(isLoading: false, authFailureOrSuccess: failureOrSuccess));
    } else {
      showErrors();
    }
  }

  void showErrors() {
    if (!state.showErrors) emit(state.copyWith(showErrors: true));
  }
}
