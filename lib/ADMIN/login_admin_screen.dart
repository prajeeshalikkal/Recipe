import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/ADMIN/otpadmin_screen.dart';
import 'package:recipeapp/ADMIN/signupadmin_screen.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/CONSTANTS/mywidget.dart';
import 'package:recipeapp/PROVIDER/loginprovider.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';

class loginadmin extends StatelessWidget {
  loginadmin({super.key});

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: myblack,
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(height: height / 15),
              Center(
                  child: Text("Log in",
                      style: TextStyle(
                          color: white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600))),
              SizedBox(height: height / 10),
              Consumer<LoginProvider>(builder: (context, value, child) {
                return txtformfield("Phone", value.Loginphnnumber);
              }),
              SizedBox(height: height / 20),
              Consumer<LoginProvider>(builder: (context, valu, child) {
                return InkWell(
                    onTap: () {
                      final FormState? form = formkey.currentState;
                      if (form!.validate()) {
                        valu.sendotp(context);
                        _showSignUpBottomSheet(context);
                      }
                    },
                    child: textbutton("Sign in", context));
              }),
              SizedBox(height: height / 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",
                      style: TextStyle(color: white)),
                  Consumer<mainprovider>(builder: (context, value, child) {
                    return GestureDetector(
                        onTap: () {
                          value.signupclear();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => signupadmin(),
                              ));
                        },
                        child:
                            Text(" Sign up", style: TextStyle(color: orange)));
                  })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSignUpBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: blue1,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [myblack,bottamcolor,gray,const Color.fromARGB(255, 59, 58, 58),bottamcolor], // Gradient from blue1 to white
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Center(
              child: Text(
            "wait a second",
            style: TextStyle(
                color: myblack, fontSize: 16, fontWeight: FontWeight.w600),
          )),
        );
      },
    );
  }
}
