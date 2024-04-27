// ignore_for_file: deprecated_member_use

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ibm_task/firebase_options.dart';

import 'app/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}
