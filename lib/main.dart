import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/ADMIN/home_admin.dart';
import 'package:recipeapp/ADMIN/login_admin_screen.dart';
import 'package:recipeapp/ADMIN/otpadmin_screen.dart';
import 'package:recipeapp/ADMIN/userlist_.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/PROVIDER/loginprovider.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';
import 'package:recipeapp/USER/bottomnavigationbar_screen.dart';
import 'package:recipeapp/USER/categories_screen_.dart';
import 'package:recipeapp/USER/home_screen.dart';
import 'package:recipeapp/USER/splash_screen.dart';

Future<void> main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ 
        // ChangeNotifierProvider(create:(context) => mainprovider()),
        // ChangeNotifierProvider(create:(context) => LoginProvider()),
        ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
        ChangeNotifierProvider<mainprovider>(create: (_) => mainprovider()),




        
      
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          
          colorScheme: ColorScheme.fromSeed(seedColor: orange),
          useMaterial3: true,
        ),
        home:splashscreen(),
      ),
    );
  }
}
 