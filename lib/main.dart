import 'package:flutter/material.dart';
import 'package:travely/cubit/app-cubit-logics.dart';
import 'package:travely/cubit/app-cubits.dart';
import 'package:travely/pages/detail-page.dart';
import 'package:travely/pages/welcome-page.dart';
import 'package:travely/pages/navpages/main-page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travely',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(
          create: (context) => AppCubits(), child: AppCubitLogics()),
    );
  }
}
