import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/ADMIN/home_admin.dart';
import 'package:recipeapp/ADMIN/mainrecipe_screen.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/CONSTANTS/mywidget.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';

class userrecipeadmin extends StatelessWidget {
    final String adminId;
  final String adminName;
  const userrecipeadmin({super.key, required this.adminId,required this.adminName});

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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => adminhome(adminId: adminId, adminName: adminName,)));
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: white,
                    size: 22,
                  )),
              title: Text("User recipe",
                  style: TextStyle(
                      color: white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                      ),
                      centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height / 20),
            Center(
              // child: Text(
              //   "User recipe",
              //   style: TextStyle(
              //     fontSize: 24,
              //     fontWeight: FontWeight.w600,
              //     color: white,
              //   ),
              // ),
            ),
            SizedBox(
              height: height/1.1,
              child: Consumer<mainprovider>(
                builder: (context,value,child) {
                  return ListView.builder(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    itemCount: value.registerlist.length,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      var item =value.recipeaddlist[index];
                      return Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Container(
                          height: height / 7,
                          width: width / 1.1,
                          decoration: BoxDecoration(
                            color: gray,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Name : Prajeeshalikkal",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: white,
                                          ),
                                        ),
                                        Text(
                                          "Phone : 0000000000",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: white,
                                          ),
                                        ),
                                        SizedBox(height: height/100),
                                        
                                    
                                      ],
                                    ),
                                    InkWell(
                                      // onTap: () {
                                      //   Navigator.push(context, MaterialPageRoute(builder: (context) => adminmainrecipe(
                                      //     id: item.id,name: item.name,photo: item.photo,category: item.category,direction: item.direction,time: item.time,
                                      //     incredient: item.incredient,incredient1: item.incredient1,categoryid: item.categoryid,addedby: item.addedby,
                                      //    ),));
                                      // },
                                      child: Text("View More",style: TextStyle(color: orange,fontSize: 18,fontWeight: FontWeight.w600),)),
                                  ],
                                ),
                                SizedBox(height: height/60),
                                //  Row(
                                //       children: [
                                //         recipebutton(context, acceptbtn,"Accept",),
                                //         SizedBox(width: width/50),
                                //          recipebutton(context, orange,"Reject",),
                                //       ],
                                //     )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
