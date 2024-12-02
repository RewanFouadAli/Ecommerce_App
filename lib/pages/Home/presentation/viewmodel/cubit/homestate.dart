abstract class HomeState {}

class InitialState extends HomeState {}

class RemoveState extends HomeState {}

class AddState extends HomeState {
  final int num;
  AddState(this.num);
}
