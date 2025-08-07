part of 'nav_bar_bloc.dart';

class NavBarState {
final int  selectedeIndex;

  NavBarState({required this.selectedeIndex});

}

 class NavBarInitial extends NavBarState {
  NavBarInitial():super(selectedeIndex: 0);
 }
