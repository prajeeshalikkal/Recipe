import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/ADMIN/home_admin.dart';
import 'package:recipeapp/ADMIN/otpadmin_screen.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/USER/bottomnavigationbar_screen.dart';


import 'MainProvider.dart';

class LoginProvider extends ChangeNotifier {


  TextEditingController Loginphnnumber=TextEditingController();
  TextEditingController otpverifycontroller = TextEditingController();

  String VerificationId = "";

  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

   void sendotp(BuildContext context) async {
    print("ghvgv");
     
         await auth.verifyPhoneNumber(
        
           phoneNumber: "+91${Loginphnnumber.text}",
           verificationCompleted: (PhoneAuthCredential credential) async {
              print("context");
             await auth.signInWithCredential(credential);
               ScaffoldMessenger.of(context)
                 .showSnackBar( SnackBar(
               backgroundColor: myblack,
                 content: Text(
                   "Verification Completed",style: TextStyle(color: white,fontSize: 20,fontWeight: FontWeight.w800,)),
               duration:
               Duration(milliseconds: 3000),
             ));
             if (kDebugMode) {}
           },
           verificationFailed: (FirebaseAuthException e) {
             if (e.code == "invalid-phone-number") {
               ScaffoldMessenger.of(context)
                   .showSnackBar(const SnackBar(
                 content:
                   Text("Sorry, Verification Failed"),
                 duration: Duration(milliseconds: 3000),
               ));
               if (kDebugMode) {

               }

             }
           },

           codeSent: (String verificationId, int? resendToken) {
             VerificationId = verificationId;
           
           
             Navigator.pushReplacement(
                 context,
                 MaterialPageRoute(
                   builder: (context) => otpscreen(),
                 ));
                  ScaffoldMessenger.of(context)
                 .showSnackBar( SnackBar(
                   backgroundColor: myblack,
                     content: Text(
                   "OTP sent to phone successfully",style: TextStyle(color: white,fontSize: 18,fontWeight: FontWeight.w600,)),
                   duration:
               Duration(milliseconds: 3000),
             ));
             Loginphnnumber.clear();
             log("Verification Id : $verificationId");

           },
           codeAutoRetrievalTimeout: (String verificationId) {},
           timeout: const Duration(seconds: 60),
         );
   }


    void verify(BuildContext context) async {
    print("hjk");
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: VerificationId, smsCode: otpverifycontroller.text);
        await auth.signInWithCredential(credential).then((value) {
        final user = value.user;
        if (user != null) {
        print("6238629410"+user.phoneNumber.toString());
        userAuthorized(user.phoneNumber, context);
      } else {
        
        if (kDebugMode) {
        }
      }
    });
  }

mainprovider mainProgg = mainprovider();

Future<void> userAuthorized(String? phoneNumber, BuildContext context6) async {
  print("user Authorized reached");
  //  mainprovider mainPro = Provider.of<mainprovider>(context6, listen: false);
 print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
     String loginUsername='';
     String loginUsertype='';
     String loginUserid='';
     String userId='';
     String loginphno="";
     String loginPhoto="";
  try {
    var phone = phoneNumber!;
      print(phone.toString()+"    bnnnnnbbbbbb");
       db.collection("USERS").where("USER_PHONE",isEqualTo:phone).get().then((value) {
         if(value.docs.isNotEmpty){
          print("fiifuifuuuuuuuuuuuuuu");
         
            // if (kDebugMode) {
            //   print("....nb.");
            // }s

             Map<dynamic,dynamic> userMap = value.docs.first.data();
             loginUsername = userMap['USER_NAME'].toString();
             loginUsertype = userMap['USER_TYPE'].toString();
             loginphno =userMap["USER_PHONE"].toString();
             loginPhoto =userMap["PHOTO"]??"";
             loginUserid = value.docs.first.id;
             userId = userMap["USER_ID"].toString();
             String uid = userId;
             if (loginUsertype == "ADMIN") {
               if (kDebugMode) {
                 print(" cbcbcbcb"+userMap.toString());
               }

              Navigator.push(context6, MaterialPageRoute(builder: (context) => adminhome( adminId: userId, adminName: loginUsername,),));
             }
             else {
                print("bbbbb");

                  // mainPro.getcarouseladd();
                  print("fhgvud"+loginUsername);
                  mainProgg.getCheckFav(uid.toString());   // ----------------- 6/7/2024
                  Navigator.push(context6, MaterialPageRoute(builder: (context) => Bottombar( userid: uid,name:loginUsername,phone: phone,photo: loginPhoto,),));
                
             }
           

         }
         else {
           const snackBar = SnackBar(
               backgroundColor: Colors.white,
               duration: Duration(milliseconds: 3000),
               content: Text("Sorry , You don't have any access",
                 textAlign: TextAlign.center,
                 softWrap: true,
                 style: TextStyle(
                     fontSize: 18,
                     color: Colors.black,
                     fontWeight: FontWeight.bold),
               ));

           ScaffoldMessenger.of(context6).showSnackBar(snackBar);
         }

       });
    // Your existing code to fetch user data from Firestore
  } catch (e, stackTrace) {
    if (e is StateError) {
      // Context is no longer valid, handle the error gracefully
      print("Context error: $e");
      return;
    }
    // Handle other exceptions
    print("Exception: $e");
    print(stackTrace);
    const snackBar = SnackBar(
      backgroundColor: Colors.white,
      duration: Duration(milliseconds: 3000),
      content: Text(
        "Sorry, some error occurred",
        textAlign: TextAlign.center,
        softWrap: true,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    ScaffoldMessenger.of(context6).showSnackBar(snackBar);
  }
}




  Future<void> userAuthorized2(String? phoneNumber, BuildContext context6) async {
    print("user Authorised reached");
    mainprovider mainPro = Provider.of<mainprovider>(context6, listen: false);

      // mainprovider mainProvider = Provider.of<mainprovider>(context, listen: false);
     print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
     String loginUsername='';
     String loginUsertype='';
     String loginUserid='';
     String userId='';
     String loginphno="";
     String loginPhoto="";
    

   try {
    var phone = phoneNumber!;
      print(phone.toString()+"    bnnnnnbbbbbb");
       db.collection("USERS").where("USER_PHONE",isEqualTo:phone).get().then((value) {
         if(value.docs.isNotEmpty){
          print("fiifuifuuuuuuuuuuuuuu");
         
            // if (kDebugMode) {
            //   print("....nb.");
            // }s

             Map<dynamic,dynamic> userMap = value.docs.first.data();
             loginUsername = userMap['USER_NAME'].toString();
             loginUsertype = userMap['USER_TYPE'].toString();
             loginphno =userMap["USER_PHONE"].toString();
             loginUserid = value.docs.first.id;
             loginPhoto =userMap["PHOTO"]??"";
             userId = userMap["USER_ID"].toString();
             String uid = userId;
             if (loginUsertype == "ADMIN") {
               if (kDebugMode) {
                 print(" cbcbcbcb"+userId.toString());
               }

              Navigator.push(context6, MaterialPageRoute(builder: (context) => adminhome(adminId: userId, adminName: loginUsername,),));
             }
             else {
                  print("bbbbb"+uid.toString());

                  mainPro.getcarouseladd();
                  mainPro.getrecipeadd();
                  Navigator.push(context6, MaterialPageRoute(builder: (context) => Bottombar( userid: uid,name: loginUsername,phone: phone,photo: loginPhoto,),));
                
             }
           

         }
         else {
           const snackBar = SnackBar(
               backgroundColor: Colors.white,
               duration: Duration(milliseconds: 3000),
               content: Text("Sorry , You don't have any access",
                 textAlign: TextAlign.center,
                 softWrap: true,
                 style: TextStyle(
                     fontSize: 18,
                     color: Colors.black,
                     fontWeight: FontWeight.bold),
               ));

           ScaffoldMessenger.of(context6).showSnackBar(snackBar);
         }

       });


     } catch (e) {

print("catch printeddddddddd  :  $e");


       const snackBar = SnackBar(
           backgroundColor: Colors.white,
           duration: Duration(milliseconds: 3000),
           content: Text("Sorry , Some Error Occurred",
             textAlign: TextAlign.center,
             softWrap: true,
             style: TextStyle(
                 fontSize: 18,
                 color: Colors.black,
                 fontWeight: FontWeight.bold),
           ));
       ScaffoldMessenger.of(context6).showSnackBar(snackBar);
     }
   } 

}