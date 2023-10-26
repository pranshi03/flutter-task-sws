import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'common_libs.dart';
import 'firebase_options.dart';
import 'presentation/auth/cubit/auth_cubit.dart';
import 'presentation/auth/login.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
        create: (context) => AuthCubit(),
      child:MaterialApp(
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
    ));
  }
}
