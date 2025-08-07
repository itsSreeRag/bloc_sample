import 'package:bloc_sample/constants/constants.dart';
import 'package:bloc_sample/controller/cart_bloc/cart_bloc.dart';
import 'package:bloc_sample/controller/ecom_bloc/ecom_bloc.dart';
import 'package:bloc_sample/controller/login_bloc/login_bloc.dart';
import 'package:bloc_sample/controller/navbar_bloc/nav_bar_bloc.dart';
import 'package:bloc_sample/controller/splash_bloc/splash_bloc.dart';
import 'package:bloc_sample/services/api_repository.dart';
import 'package:bloc_sample/services/login_repository.dart';
import 'package:bloc_sample/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashBloc>(
          create: (context) => SplashBloc()..add(StartLoadingSplash()),
        ),
        BlocProvider<NavBarBloc>(create: (context) => NavBarBloc()),
        BlocProvider<EcomBloc>(
          create: (context) {
            final bloc = EcomBloc(ApiRepository());
            bloc.add(LoadProduct());
            return bloc;
          },
        ),
        BlocProvider<CartBloc>(create: (context) => CartBloc()),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(loginRepository: LoginRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.cream,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.cream,
            elevation: 0,
            surfaceTintColor: Colors.transparent,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: AppColors.darkBrown),
            bodyMedium: TextStyle(color: AppColors.darkBrown),
            titleLarge: TextStyle(color: AppColors.darkBrown),
            titleMedium: TextStyle(color: AppColors.darkBrown),
            titleSmall: TextStyle(color: AppColors.darkBrown),
            labelLarge: TextStyle(color: AppColors.darkBrown),
            labelMedium: TextStyle(color: AppColors.darkBrown),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
