import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/ADMIN/login_admin_screen.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/PROVIDER/loginprovider.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  late BuildContext _context;

  @override
  void initState() {
    super.initState();
    print("codeeee");
    Timer(const Duration(seconds: 3), () {
      final FirebaseAuth auth = FirebaseAuth.instance;
      mainprovider mainPro = Provider.of<mainprovider>(_context, listen: false);
                  mainPro.getcarouseladd();
                  mainPro.getrecipeadd();
                  var loginUser = auth.currentUser;
                  if (loginUser == null) { 
        print("ghmmmmmj" + loginUser.toString());
        Navigator.push(
          _context,
          MaterialPageRoute(builder: (context) => loginadmin()),
        );
      } else {
        print("user existtttttt" + loginUser.toString());
        LoginProvider loginProvider = Provider.of<LoginProvider>(_context, listen: false);
        loginProvider.userAuthorized(loginUser.phoneNumber, _context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _context = context; // Assign context to a member variable
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: myblack,
      body: Column(
        children: [
          Container(
            height: height / 2,
            width: width / 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Cooking a Delicious", style: TextStyle(fontSize: 24, color: white),),
                Text("Food Easily", style: TextStyle(fontSize: 24, color: white),),
              ],
            ),
          ),
          Container(
            height: height / 2,
            width: width / 1,
            child: Image(image: AssetImage("assets/image 19.png")),
          ),
        ],
      ),
    );
  }
}








