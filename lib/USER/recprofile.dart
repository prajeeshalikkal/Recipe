import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/CONSTANTS/mywidget.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';
import 'package:recipeapp/USER/recipe_save_screen.dart';

class recprofile extends StatelessWidget {
  String userid;
  String name;
  String phone;
  String photo;
   recprofile(
      {super.key,
      required this.userid,
      required this.name,
      required this.phone,
      required this.photo});

  @override
  Widget build(BuildContext context) {
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
        title: Text(name,
            style: TextStyle(
                color: white, fontSize: 22, fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      // ---------------
      body: Column(
        children: [
            SizedBox(height: height / 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consumer<mainprovider>(builder: (context, val, child) {
                      return val.editimage != ""
                          ? Container(
                              // image.....
                              child: CircleAvatar(
                                radius: 38,
                                backgroundColor: myblack,
                                backgroundImage: NetworkImage(val.editimage),
                              ),
                            )
                          :

                          // :widget.photo!="" ? Container(
                          //   child: CircleAvatar(
                          //     radius: 38,
                          //     backgroundImage: NetworkImage(widget.photo),
                          //   ),
                          // )
                          // :
                          Container(
                              child: CircleAvatar(
                                radius: 38,
                                backgroundColor: gray,
                                child: Text(
                                  name[0].toUpperCase(),
                                  style: TextStyle(
                                      color: orange,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            );
                    }),
                    SizedBox(
                      width: 20,
                    ),
                    
                    Consumer<mainprovider>(builder: (context, val, child) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name, // Name ..........
                              style: TextStyle(
                                  color: white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),

                                    Text("user any links yous", // Name ..........
                              style: TextStyle(
                                  color: blue1,
                                  fontSize:12,
                                  fontWeight: FontWeight.w600)),


                      
                        ],
                      );
                    }),
                  ],
                ),
              ),
               

                //------------
                    SizedBox(
                            height: 10,
                          ),

                        Container(
                        height: height / 3,
                        width: width / 1.5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/WhatsApp Image 2024-01-11 at 12.11 1.png"))),
                                              ),


                           SizedBox(
                    height: height / 40,
                  ), // save button.......
                  Consumer<mainprovider>(builder: (context, value, child) {
                    return InkWell(
                        onTap: () {
                          value.getuseraddpro(userid);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => recipesave(
                                        userid: userid,
                                        name:name,
                                        phone: phone,
                                      )));
                        },
                        child: textbutton("Your recipe", context));
                  }),

            ],
          ),
        );
       
  }
}