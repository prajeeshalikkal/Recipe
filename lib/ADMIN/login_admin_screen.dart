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
  const loginadmin({super.key});

  @override
  Widget build(BuildContext context) {
       var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor:myblack,
       body:SingleChildScrollView(
         child: Column( 
          children: [
            SizedBox(height: height/15,),
             Center(child: Text("Log in",style:TextStyle(color: white,fontSize: 24,fontWeight: FontWeight.w600))),
              SizedBox(height: height/10,),

                Consumer<LoginProvider>(
                  builder: (context,value,child) {
                    return 
                    txtformfield("Phone",value.Loginphnnumber);
                  }
                ),
                
                SizedBox(height: height/20),
                Consumer<LoginProvider>(
                  builder: (context,valu,child) {

                    return InkWell(onTap: () {
                      valu.sendotp(context);
                    },
                      child: textbutton("Sign in",context,));
                  }
                ),
                       SizedBox(height: height/20),
                        Row( 
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?",style: TextStyle(color:white),),
                            Consumer<mainprovider>(
                              builder: (context,value,child) {
                                return GestureDetector(
                                  onTap: () {
                                    value.signupclear();
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => signupadmin(),));

                                  },
                                  child: Text(" Sign up",style: TextStyle(color:orange)));
                              }
                            )
                          ],
                        ),
       
                        
                        
              
          ],
         ),
       ),
    );;
  }
}