import 'package:bloc/bloc.dart';
import 'package:travely/cubit/app-cubit-states.dart';

class AppCubits extends Cubit {
  AppCubits() : super(InitialState()) {
    emit(WelcomeState());
  }
}
