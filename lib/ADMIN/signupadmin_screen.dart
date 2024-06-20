import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/ADMIN/home_admin.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/CONSTANTS/mywidget.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';

class signupadmin extends StatelessWidget {
  const signupadmin({super.key});

  @override
  Widget build(BuildContext context) {
          var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: myblack,
        body: Column(
          children: [
            SizedBox(
              height: height/15,
            ),
            Center(child: Text("Sign up",style:TextStyle(color: white,fontSize: 24,fontWeight: FontWeight.w600))),
               SizedBox(
                height: height/10,
                  ),
                 
                 Consumer<mainprovider>(
                   builder: (context,value,child) {
                     return Column(
                       children: [
                         txtformfield2("Name",value.nameregcontroller),
                           SizedBox(height: height/30),
                             txtformfield("Phone",value.phoneregcontroller),
                       ],
                     );
                   }
                 ),
               
                 SizedBox(height: height/30),
                Consumer<mainprovider>(
                  builder: (context,value,child) {
                    return GestureDetector(
                      onTap: () {
                        value.addregistration();
                      },
                      child: textbutton("Sign up", context, ));
                  }
                ),
                 SizedBox(height: height/20),
                 Row( 
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?",style: TextStyle(color:white),),
                            Text(" Log in",style: TextStyle(color:orange))
                          ],
                        ),
          ],
        ),
    ); ;
  }
}