import 'package:equatable/equatable.dart';

import '../model/dataModel.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WelcomeState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoadedState extends CubitStates {
  final List<DataModel> places;
  LoadedState(this.places);
  @override
  // TODO: implement props
  List<Object?> get props => [places];
}

class DetailState extends CubitStates {
  final DataModel places;
  DetailState(this.places);
  @override
  // TODO: implement props
  List<Object?> get props => [places];
}
