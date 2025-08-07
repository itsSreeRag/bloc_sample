part of 'splash_bloc.dart';

class SplashState {}

class SplashInitial extends SplashState{}

class SplashLoading extends SplashState{}

class SplashLoaded extends SplashState{
  final bool isLoggedIn;

  SplashLoaded({required this.isLoggedIn});

}
