import 'package:bloc/bloc.dart';
import 'package:project1/cubit/States.dart';
import 'package:project1/pages/Welcome.dart';

class Cubits extends Cubit<States> {
  Cubits() : super(InitialState()) {
    emit(WelcomeState());
  }

  void nextPage() {
    try {
      emit(LoadedState());
    } catch (e) {}
  }

  // LoadedState() {
  //   emit(LoadedState());
  // }
  void detailsPage() {
    try {
      emit(DetailState());
    } catch (e) {}
  }

  welcome() {
    emit(WelcomeState());
  }

  gohome() {
    emit(LoadedState());
  }
}
