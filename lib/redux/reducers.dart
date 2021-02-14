import 'package:study/model/CardClass.dart';
import 'package:study/redux/actions.dart';



List<CardClass> appReducers(List<CardClass> items, dynamic action) {
  if (action is Add) {
    return addItem(items, action);
  } else if (action is Edit) {
    return editState(items, action);
  }
  return items;
}


List<CardClass> addItem(List<CardClass> items, Add action) {
  return List.from(items)..add(action.item);
}

List<CardClass> editState(List<CardClass> items, Edit action) {
  return items.map((item) =>
         item.title == action.item.title ? action.item : item).toList();
}