import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_project/domain/auth/i_auth_facade.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authFacade) : super(AuthState.initial());

  final IAuthFacade _authFacade;

  void checkAuthenticaion() {
    if (_authFacade.currentUser == null)
      emit(AuthState.unAuthenticated());
    else
      emit(AuthState.authenticated());
  }

  Future<void> signOut() async {
    await _authFacade.signOut();
  }
}
