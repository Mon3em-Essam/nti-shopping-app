import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_section_state.dart';

class AppSectionCubit extends Cubit<AppSectionState> {
  AppSectionCubit() : super(AppSectionInitialState());

  static AppSectionCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavIndexState(index));
  }
}
