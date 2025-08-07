part of 'nav_bar_bloc.dart';

@immutable
sealed class NavBarEvent {}

class OnPress extends NavBarEvent{
  final int index;
  
  OnPress({required this.index});
}