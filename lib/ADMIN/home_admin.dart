import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/ADMIN/carousel.dart';
import 'package:recipeapp/ADMIN/carousel_addmin.dart';
import 'package:recipeapp/ADMIN/catagories_admin_screen.dart';

import 'package:recipeapp/ADMIN/addnew_list_add_screen.dart';
import 'package:recipeapp/ADMIN/customer.dart';
import 'package:recipeapp/ADMIN/login_admin_screen.dart';
import 'package:recipeapp/ADMIN/user_recipe_screen.dart';
import 'package:recipeapp/ADMIN/user_request.dart';
import 'package:recipeapp/ADMIN/userlist_.dart';

import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/CONSTANTS/mywidget.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';
import 'package:recipeapp/USER/home_screen.dart';

class adminhome extends StatelessWidget {
  final String adminId;
  final String adminName;
  adminhome({super.key, required this.adminId, required this.adminName});

  @override
  Widget build(BuildContext context) {
    print("name" + adminName.toString());
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: myblack,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 10,
            ),
            Consumer<mainprovider>(builder: (context, value, child) {
              return GestureDetector(
                  onTap: () {
                    value.getregistration();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => userlistadmin(
                                  adminId: adminId,
                                  adminName: adminName,
                                )));
                  },
                  child: homelistbutton(
                    context,
                    "userlist",
                  ));
            }),

            SizedBox(
              height: height / 30,
            ),
            Consumer<mainprovider>(builder: (context, value, child) {
              return GestureDetector(
                  onTap: () {
                    value.getcustomer();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => customer(
                                  adminId: adminId,
                                  adminName: adminName,
                                )));
                  },
                  child: homelistbutton(
                    context,
                    "customer",
                  ));
            }),
            SizedBox(
              height: height / 30,
            ),

            Consumer<mainprovider>(builder: (context, value, child) {
              return GestureDetector(
                  onTap: () {
                    value.getcategory();
                    //  value.categoryclear();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => categoriesadmin(
                                  adminId: adminId,
                                  adminName: adminName,
                                )));
                  },
                  child: homelistbutton(
                    context,
                    "categories",
                  ));
            }),
            SizedBox(
              height: height / 30,
            ),

            // GestureDetector(
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => userrecipeadmin(
            //                     adminId: adminId,
            //                     adminName: adminName,
            //                   )));
            //     },
            //     child: homelistbutton(
            //       context,
            //       "user respie request",
            //     )),

            // SizedBox(
            //   height: height / 30,
            // ),

            Consumer<mainprovider>(builder: (context, value, child) {
              return GestureDetector(
                  onTap: () {
                    value.getcarouseladd();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => carousellist(
                                  adminId: adminId,
                                  adminName: adminName,
                                )));
                  },
                  child: homelistbutton(
                    context,
                    "carousel",
                  ));
            }),

            SizedBox(   
              height: height / 30,
            ),

            Consumer<mainprovider>(builder: (context, value, child) {
              return GestureDetector(
                  onTap: () {
                    value.getrecipeadd();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => categorieslist(
                                  adminId: adminId,
                                  adminName: adminName,
                                )));
                  },
                  child: homelistbutton(
                    context,
                    "Main Recipe",
                  ));
            }),
            SizedBox(height: height / 30),

            Consumer<mainprovider>(
              builder: (context,value,child) {
                return TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered))
                            return Colors.blue.withOpacity(0.04);
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed))
                            return Colors.blue.withOpacity(0.12);
                          return null; // Defer to the widget's default.
                        },
                      ),
                    ),
                    onPressed: () {
                     
                      value.getuserrecipeadd();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => User_Request()));
                          
                     
                    },
                    child: Text('user recipe add'));
              }
            ),

            SizedBox(
              height: height / 10,
            ),
            InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: gray,
                      elevation: 20,
                      content: Text("Do you want to Logout ?",
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'ink nut',
                              fontWeight: FontWeight.w700,
                              color: white)),
                      actions: <Widget>[
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                FirebaseAuth auth = FirebaseAuth.instance;
                                auth.signOut();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => loginadmin(),
                                    ));
                              },
                              child: Container(
                                height: 45,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(8),
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     // color: Color(0x26000000),
                                  //     blurRadius: 2.0, // soften the shadow
                                  //     spreadRadius: 1.0, //extend the shadow
                                  //   ),
                                  // ]
                                ),
                                child: Center(
                                    child: Text("yes",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700))),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 45,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: white,
                                    boxShadow: [
                                      BoxShadow(
                                        // color: Color(0x26000000),
                                        blurRadius: 2.0, // soften the shadow
                                        spreadRadius: 1.0, //extend the shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                      child: Text("No",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700))),
                                ))
                          ],
                        )
                      ],
                    ),
                  );
                },
                child: Text("Logout",
                    style: TextStyle(
                        color: orange,
                        fontSize: 16,
                        fontWeight: FontWeight.w600))),

            // log out....................................
          ],
        ),
      ),
    );
  }
}
