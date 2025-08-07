import 'package:bloc_sample/controller/navbar_bloc/nav_bar_bloc.dart';
import 'package:bloc_sample/views/cart_page/cart_screen.dart';
import 'package:bloc_sample/views/home_screen/home_screen.dart';
import 'package:bloc_sample/views/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyNavigationbar extends StatelessWidget {
  const MyNavigationbar({super.key});

  @override
  Widget build(BuildContext context) {
    List screens = [
      const HomeScreen(),
      const FavoriteScreen(),
      const MenuScreen(),
    ];
    return BlocBuilder<NavBarBloc, NavBarState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: screens[state.selectedeIndex],
          bottomNavigationBar: BottomNavigationBar(backgroundColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined), label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded), label: 'Profile'),
            ],
            selectedItemColor: Colors.orange.shade200,
            unselectedItemColor: Colors.black54,
            selectedIconTheme: IconThemeData(size: 20),
            currentIndex: state.selectedeIndex,
            onTap: (value) {
              context.read<NavBarBloc>().add(OnPress(index: value));
            },
          ),
        );
      },
    );
  }
}
