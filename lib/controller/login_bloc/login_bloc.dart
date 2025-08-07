import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_sample/services/login_repository.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(LoginInitial()) {
    on<LogInButtonPressed>(_onLogInButtonPressed);
  }

  Future<void> _onLogInButtonPressed(
    LogInButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    try {
     await loginRepository.authenticate(
        username: event.userName,
        password: event.password,
      );
      

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedInkey', true);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }
}
