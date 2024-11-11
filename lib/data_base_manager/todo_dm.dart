import 'package:cloud_firestore/cloud_firestore.dart';
class TodoDM {
  static const String collectionName = 'todo';
  String id;
  String title;
  String description;
  Timestamp date;
  bool isDone;
  TodoDM(
      {required this.id,
        required this.title,
        required this.description,
        required this.date,
        required this.isDone});
  Map<String, dynamic> toFireStore() => {
    'id': id,
    'title': title,
    'description': description,
    'dateTime': date,
    'isDone': isDone,
  };
  TodoDM.fromFireStore(Map<String, dynamic> data)
      : this(
    id: data['id'],
    title: data['title'],
    description: data['description'],
    date: data['dateTime'].toDate(),
    // timeStamp
    isDone: data['isDone'],
  );
}