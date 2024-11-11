import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'my_application/my_application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: 'AIzaSyDFSXCBVLQXZN2tpN0lK8hQ6TEzysUTiSU',
        appId: 'com.example.todo_app_1',
        messagingSenderId: '',
        projectId: 'todo-app-1-a3648'),
  );
  await FirebaseFirestore.instance.disableNetwork();

  runApp(MyApp());
}