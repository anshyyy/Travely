import 'package:flutter/material.dart';
import 'package:travely/cubit/app-cubit-states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travely/cubit/app-cubits.dart';
import 'package:travely/pages/detail-page.dart';
import 'package:travely/pages/navpages/home-page.dart';
import 'package:travely/pages/navpages/main-page.dart';
import 'package:travely/pages/welcome-page.dart';
import 'package:travely/utils/colors.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
        if (state is WelcomeState) {
          return WelcomePage();
        }
        if (state is DetailState) {
          return DetailPage();
        }
        if (state is LoadedState) {
          return MainPage();
        }
        if (state is LoadingState) {
          return Center(
              child: CircularProgressIndicator(
            color: AppColors.mainColor,
          ));
        } else {
          return Container();
        }
      }),
    );
  }
}
