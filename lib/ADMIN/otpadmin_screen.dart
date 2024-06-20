import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/PROVIDER/loginprovider.dart';

class otpscreen extends StatelessWidget {
  const otpscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: myblack,
      body: Column(
        children: [
           SizedBox(height: height/15,),
             Center(child: Text("Enter OTP",style:TextStyle(color: white,fontSize: 24,fontWeight: FontWeight.w600))),
             Consumer<LoginProvider>(
                    builder: (context,vale,child) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child:Pinput(
                          controller:vale.otpverifycontroller,
                          length: 6,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          defaultPinTheme: PinTheme(
                              textStyle:
                               TextStyle(fontWeight: FontWeight.bold),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration( boxShadow: [
                                BoxShadow(
                                  color: white,
                                  blurRadius: 2.0, // soften the shadow
                                  spreadRadius: 1.0, //extend the shadow
                                ),
                              ], borderRadius: BorderRadius.circular(15),
                                  border: Border.all(width: 1,
                                      color:gray    .withOpacity(0.9)))),

                                  onCompleted: (pin){
                              vale.verify(context);

                              },

                        ),
                      );
                    }
                  ),
               SizedBox(height: height/20,),
              Center(child: Text("Reset otp",style:TextStyle(color: white,fontSize: 16,fontWeight: FontWeight.w500))),
             
        ],
      ),
    );
  }
}