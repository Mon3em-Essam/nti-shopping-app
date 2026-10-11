abstract class AppSectionState {}

class AppSectionInitialState extends AppSectionState {}

class ChangeBottomNavIndexState extends AppSectionState {
  final int index;

  ChangeBottomNavIndexState(this.index);
}
