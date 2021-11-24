import 'package:cloud_firestore/cloud_firestore.dart';

import 'Todo.dart';
//btrag3 aldate as yom w shahr w sana mn 8ar d2e2a w hour w second
extension MyDateExtension on DateTime {
  DateTime getDateOnly() {
    return DateTime(this.year, this.month, this.day);
  }
}
//method trag3 alcollection
CollectionReference<Todo> getTodosCollectionWithConverter() {
  return FirebaseFirestore.instance
      .collection(Todo.collectionname)
      .withConverter(
          fromFirestore: (snapshot, _) => Todo.fromJson(snapshot.data()!),
          toFirestore: (todo, _) => todo.toJson());
}

Future<void> addTodoToFirestore(String title, String decreption, DateTime dateTime) { //3amlt almethod futue 3shan 3o2bal maidaf fe fire base
  CollectionReference<Todo> collectionReference =
      getTodosCollectionWithConverter();
  DocumentReference<Todo> documentReference =
      collectionReference.doc(); //bi3ml object w ygenerate al id 3shan asta5dmo
 Todo item= Todo(
      id: documentReference.id,
      title: title,
      description: decreption,
      dateTime: dateTime.getDateOnly());
return documentReference.set(item);//3shan yktb alobject fe database

}
Future<void> deleteTodo(Todo todo){
  CollectionReference<Todo> collectionReference =getTodosCollectionWithConverter();
  DocumentReference<Todo> documentReference =  collectionReference.doc(todo.id);//.d0c()bs bt3ml object gded anma ana badelha alid 3shan a2olha men alobject
  return documentReference.delete();

}
