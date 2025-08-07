part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LogInButtonPressed extends LoginEvent{
  final String userName;
  final String password;

  LogInButtonPressed({required this.userName, required this.password});

  
}
