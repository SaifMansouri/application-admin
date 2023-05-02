import 'package:applicationahiit_admin/controllers/addcontroller.dart';
import 'package:applicationahiit_admin/controllers/authcont.dart';
import 'package:applicationahiit_admin/views/screens/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/signcontroller.dart';
import 'firebase_options.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);


  runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => SigninController()),
      ChangeNotifierProvider(create: (context) => AddController()),
            ChangeNotifierProvider(create: (context) => AuthController()),


    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    
      title: 'Admin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
