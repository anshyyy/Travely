import 'package:bloc/bloc.dart';
import 'package:travely/cubit/app-cubit-states.dart';
import 'package:travely/model/dataModel.dart';
import 'package:travely/services/data-services.dart';

class AppCubits extends Cubit<CubitStates> {
  final DataServices data;
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  void DetailPage(DataModel data) async {
    try {
      emit(DetailState(data));
    } catch (e) {}
  }

  void goHome() {
    emit(LoadedState(places));
  }
}
