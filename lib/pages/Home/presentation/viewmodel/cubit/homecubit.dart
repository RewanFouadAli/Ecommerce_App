import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flowers_app/model/item.dart';
import 'package:flowers_app/pages/Home/presentation/viewmodel/cubit/homestate.dart';

class HomeCubit extends Cubit<HomeState> {
  int num = 0;
  double totalPrice = 0.0;
  List<Itmes> selectedItems = [];

  HomeCubit() : super(InitialState());

  void add(Itmes item) {
    num++;
    totalPrice += item.price;
    selectedItems.add(item);
    emit(AddState(num));
  }

  void clearSelection() {
    num = 0;
    totalPrice = 0.0;
    selectedItems.clear();
    emit(InitialState());
  }

  void removeItem(Itmes item) {
    if (selectedItems.contains(item)) {
      num--;
      totalPrice -= item.price;
      selectedItems.remove(item);
      emit(RemoveState());
    }
    emit(RemoveState());
  }
}
