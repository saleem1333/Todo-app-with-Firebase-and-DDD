import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_project/domain/auth/i_auth_facade.dart';
import 'package:my_project/domain/failures/failures.dart';
import 'package:my_project/domain/core/value_objects.dart';

part 'sign_in_form_state.dart';
part 'sign_in_form_cubit.freezed.dart';

class SignInFormCubit extends Cubit<SignInFormState> {
  SignInFormCubit(this._authFacade) : super(SignInFormState.initial());

  final IAuthFacade _authFacade;

  void emailChanged(String emailStr) {
    emit(state.copyWith(emailAddress: EmailAddress(emailStr)));
  }

  void passwordChanged(String passwordStr) {
    emit(state.copyWith(password: Password(passwordStr)));
  }

  void showErrors() {
    if (!state.showErrors) emit(state.copyWith(showErrors: true));
  }

  void signInPressed() async {
    if (state.emailAddress.isValid() && state.password.isValid()) {
      emit(state.copyWith(isLoading: true));
      Either<Failure, Unit> failureOrSuccess = await _authFacade.signInWithEmailAndPassword(email: state.emailAddress, password: state.password);
      emit(state.copyWith(isLoading: false, authFailureOrSuccess: failureOrSuccess));
    }else{
      showErrors();
    }
  }

}
