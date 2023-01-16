import 'package:flutter/material.dart';
import 'package:travely/cubit/app-cubit-states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travely/cubit/app-cubits.dart';
import 'package:travely/pages/welcome-page.dart';

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
        } else {
          return Container();
        }
      }),
    );
  }
}
