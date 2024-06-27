import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/ADMIN/addnewrecipeadd_screen.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/CONSTANTS/mywidget.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';
import 'package:recipeapp/USER/edit_screen.dart';
import 'package:recipeapp/USER/favoriets_save_screen.dart';
import 'package:recipeapp/USER/addrecipe_screen.dart';
import 'package:recipeapp/USER/notification_screen.dart';
import 'package:recipeapp/USER/recipe_save_screen.dart';

class profile extends StatefulWidget {
   String userid;
   String name;
   String phone;
   String photo;
   profile({super.key,required this.userid,required this.name,required this.phone,required this.photo});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> with SingleTickerProviderStateMixin {
  late TabController tabcontroller;
  PageController pageveiw = PageController(initialPage: 0);
  int currentIndex = 0;
  


  void _itemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    tabcontroller = TabController(length: 2, vsync: this);
    //print(tabcontroller.index);
    super.initState();
  }

  Widget build(BuildContext context) {
    print("profile:"+widget.userid.toString());
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    // var pages = [
    //   appbarfav(),
    //   appbarrecipe(),
    // ];

    return Scaffold(
      backgroundColor: myblack,
      appBar: AppBar(
        leadingWidth: width / 1.02,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Profile",
                        style: TextStyle(
                            color: white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => notification(),
                            ));
                      },
                      child: Icon(
                        Icons.notification_add_outlined,
                        color: white,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: height / 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<mainprovider>(
                      builder: (context,val,child) {
                        return 
                         val.editimage!=""? Container(     // image.....
                          child: CircleAvatar(
                            radius: 38,
                            backgroundColor: myblack,
                            backgroundImage: NetworkImage(val.editimage),
                          ),
                        )
                        
                        : widget.photo!="" ? Container(
                          child: CircleAvatar(
                            radius: 38,
                            backgroundImage: NetworkImage(widget.photo),
                          ),
                        )
                        :Container(
                          child: CircleAvatar(
                            radius: 38,
                            backgroundColor: gray,
                             child: Text(widget.name[0].toUpperCase(),style: TextStyle(color: orange,fontSize: 22,fontWeight: FontWeight.w700),) 
                          ),
                        );
                      }
                    ),
                    SizedBox(
                      width: 20,
                    ),

                    Consumer<mainprovider>(
                      builder: (context,val,child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.name,     // Name ..........
                                style: TextStyle(
                                    color: white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                print("jhbdsdbcmmmmmmdbc"+widget.name.toString());
                                val.geteditpro(widget.userid);
                                  val.Editpro(widget.userid);
                                   Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => edit(userid:widget.userid,name: widget.name,phone: widget.phone,photo: widget.photo,)));
                              },
                              child: Container(
                                height: height / 26,
                                width: width / 3.5,
                                decoration: BoxDecoration(
                                    color: myblack,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: blue1,
                                      strokeAlign: BorderSide.strokeAlignOutside,
                                    )),
                                child: Center(
                                    child: Text(
                                  "Edit profile",
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                )),
                              ),
                            ),
                          ],
                        );
                      }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        automaticallyImplyLeading: false,
        toolbarHeight: 155,
        backgroundColor: Colors.transparent,
        bottom: TabBar(
            dividerColor: gray,
            onTap: _itemTapped,
            labelColor: orange,
            unselectedLabelColor: white,
            controller: tabcontroller,

            // isScrollable: true,

            tabs: [
              Container(
                  width: width / 2,
                  child: Tab(
                    text: "favorites",
                  )),
              Container(width: width / 2, 
              child: Tab(
              text: "recipe")),
            ]),
      ),


      body: SizedBox(
        child: TabBarView(
          controller: tabcontroller,
          children: [

            SingleChildScrollView(
              child: Consumer<mainprovider>(
                builder: (context,value,child) {
                  return InkWell(
                    onTap: () {
                      // value.getuseraddpro(widget.userid);
                      Navigator.push(context, MaterialPageRoute(builder:(context) => favsave(userid:widget.userid,name:widget.name,phone:widget.phone,photo:widget.photo ,) ));
                    },
                    child: Container(
                      child: SizedBox(
                          height: height / 2,
                          width: width / 1.5,
                          child: Image(
                              image: AssetImage(
                            "assets/WhatsApp Image 2024-01-11 at 12.09 1.png",
                          ))),
                    ),
                  );
                }
              ),
            ),
            

            SingleChildScrollView(                  //     recipe save page.........
              child: Column(
                children: [
                  Consumer<mainprovider>(
                    builder: (context,val,child) {
                      return InkWell(
                        onTap:() {
                          print("kkkkkkkkooo"+widget.userid);
                          // val.getuseraddpro(widget.userid);
                          // Navigator.push(context, MaterialPageRoute(builder:(context) => recipesave(userid:widget.userid,name:widget.name,phone:widget.phone,) ));
                        },
                        child: Container(
                          height: height / 3,
                          width: width / 1.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/WhatsApp Image 2024-01-11 at 12.11 1.png"))),
                        ),
                      );
                    }
                  ),

                 

                  SizedBox(height: height/40,),            // save button.......
                  Consumer<mainprovider>(
                    builder: (context,value,child) {
                     return InkWell(
                            onTap: () {
                            value.getcategory();
                            value.userrecipeaddclear();
                            Navigator.push(context,MaterialPageRoute(builder: (context) =>addrecipe1(userid:widget.userid,name:widget.name,phone:widget.phone,photo:widget.photo,)));
                          },
                          child: textbutton("Share your recipe", context));
                    }
                  ),
                   SizedBox(height: height/40,),            // save button.......
                  Consumer<mainprovider>(
                    builder: (context,value,child) {
                     return InkWell(
                            onTap: () {
                          
                          value.getuseraddpro(widget.userid);
                          Navigator.push(context, MaterialPageRoute(builder:(context) => recipesave(userid:widget.userid,name:widget.name,phone:widget.phone,) ));
                          },
                          child: textbutton("Your recipe", context));

                  


                
                    }
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
