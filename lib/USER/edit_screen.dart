import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/ADMIN/login_admin_screen.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/CONSTANTS/mywidget.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';
import 'package:recipeapp/USER/profile_screen.dart';

class edit extends StatelessWidget {
  String userid;
  String name;
  String phone;
  String photo;

  
   edit({super.key,required this.userid,required this.name,required this.phone,required this.photo});

  @override
  Widget build(BuildContext context) {
   print("profile::"+userid.toString());
   print("proficccccle::"+photo.toString());
     var height = MediaQuery.of(context).size.height;
     var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: myblack,
       appBar: AppBar(
        backgroundColor: myblack,
          leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                       
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: white,
                    size: 22,
                  )),
              title: Text("Edit profile",
                  style: TextStyle(
                      color: white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500)),
                      centerTitle: true,
      ),


      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
                SizedBox( height: height/20), 
          
                   SizedBox(height: height/40),
                                   Consumer<mainprovider>(
                                     builder: (context,val,child) {
                                       return InkWell(
                                        onTap: (){
                                          showBottomSheet(context);
                                        },
                                         child:val.editprofile!=null? Container(
                                           child: CircleAvatar(
                                            radius: 48,                           
                                               backgroundImage:FileImage(val.editprofile!),
                                              child:Padding(
                                                padding: const EdgeInsets.only(left: 70,top: 60),
                                                child: CircleAvatar(
                                                  radius: 14,
                                                  backgroundColor: myblack,
                                                  child: Icon(Icons.mode_edit_outline,color: white,size: 16,),
                                                ),
                                              ),
                                                   ),           
                                          ): Container(
                                           child: CircleAvatar(
                                            radius: 48,                           
                                               backgroundImage:NetworkImage(photo),
                                              child:Padding(
                                                padding: const EdgeInsets.only(left: 70,top: 60),
                                                child: CircleAvatar(
                                                  radius: 14,
                                                  backgroundColor: myblack,
                                                  child: Icon(Icons.mode_edit_outline,color: white,size: 16,),
                                                ),
                                              ),
                                                   ),           
                                          )
                                       );
                                     }
                                   ),
          
                         SizedBox(height: height/60),
                          Text("Username",style: TextStyle(color: white,fontSize: 18,fontWeight: FontWeight.w600)),
                             SizedBox(height: height/60),
                             Consumer<mainprovider>(
                               builder: (context,val,child) {
                                 return txtformfield2("Write Username",val.nameregcontroller,);
                               }
                             ),
          
                              SizedBox(height: height/20),
                              Consumer<mainprovider>(
                                builder: (context,val,child) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      print("loloooooo"+phone.toString());
                                      val.EditProfile(userid,phone,);
                                    },
                                    child: textbutton("Save", context, ));
                                }
                              ),
                  SizedBox(height: height/2.4),
                  
                  GestureDetector(
                   onTap: () {
                  showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor:myblack,
                    elevation: 20,
                    content:  Text(
                        "Do you want to Logout ?",style: TextStyle(
                        fontSize:17,
          
                        fontFamily:'ink nut',
                        fontWeight: FontWeight.w700,
                        color: white)),
                    actions: <Widget>[
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              FirebaseAuth auth = FirebaseAuth.instance;
                              auth.signOut();
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginadmin(),));
                            },
                            child: Container(
                              height: 45,
                              width: 90,
                              decoration: BoxDecoration(
                                  color:white ,
                                  borderRadius: BorderRadius.circular(8),
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     // color: Color(0x26000000),
                                  //     blurRadius: 2.0, // soften the shadow
                                  //     spreadRadius: 1.0, //extend the shadow
                                  //   ),
                                  // ]
                                ),
                              child: Center(child:  Text("yes",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),
                            ),
                          ),
                          TextButton(
                              onPressed: (){
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
                                child: Center(child: Text("No",style: TextStyle( color: Colors.black,fontSize: 17,fontWeight: FontWeight.w700))),
                              ))
                        ],
                      )
          
                    ],
            ),);
                                },
                                child: Text("Logout",style: TextStyle(color: orange,fontSize: 16,fontWeight: FontWeight.w600))),
            ],
          ),
        ),
      ),
    ); 
  }
 // showbottomsheet...
 
    void showBottomSheet(BuildContext context) {
    mainprovider Mainprovider =Provider.of<mainprovider>(context,listen: false);
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )),
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  leading:  Icon(
                    Icons.camera_enhance_sharp,
                    color:  Colors.black,
                  ),
                  title: const Text('Camera',),
                  onTap: () => {
                   
                        Mainprovider.getEditProfileImgcamera(), Navigator.pop(context) 
                   
                    }),
              ListTile(
                  leading:  Icon(Icons.photo, color: Colors.black),
                  title: const Text('Gallery',),
                  onTap: () => {
                          Mainprovider.getEditProfileImggallery(), Navigator.pop(context) 
                    }),
            ],
          );
        });
    // ImageSource
  }
}