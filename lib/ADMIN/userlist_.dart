import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/ADMIN/home_admin.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/CONSTANTS/mywidget.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';

class userlistadmin extends StatelessWidget {
  final String adminId;
  final String adminName;
   userlistadmin({super.key ,required this.adminId,required this.adminName});

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
              title: Text("Userlist",
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
            // Center(
            //   child: Text(
            //     "Userlist..",
            //     style: TextStyle(
            //       fontSize: 24,
            //       fontWeight: FontWeight.w600,
            //       color: white,
            //     ),
            //   ),
            // ),
            Consumer<mainprovider>(
              builder: (context,value,child) {
                return ListView.builder(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  itemCount: value.registerlist.length,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Container(
                        height: height / 6,
                        width: width / 1.1,
                        decoration: BoxDecoration(
                          color: gray,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("NAME   :  ", style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: orange,
                                    ),),
        
                                  Text(
                                    value.registerlist[index].name.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: white,
                                    ),
                                  ),
                                ],
                              ),
        
        
                              Row(
                                children: [
                                      Text("PHONE :  ", style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: orange,
                                    ),),
        
                                  Text(
                                    value.registerlist[index].phone.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: white,
                                    ),
                                  ),
                                ],
                              ),
        
        
                              SizedBox(height: height/40,),
                              Row(
                            children: [
                              Consumer<mainprovider>(
                                builder: (context,value,child) {
                                  return GestureDetector(
                                    onTap: () {
                                      value.statusapproved( value.registerlist[index].id,value.registerlist[index].name,value.registerlist[index].phone, context);
                                    },
                                    child: recipebutton(context, acceptbtn,"Accept",));
                                }
                              ),
        
        
                              SizedBox(width: width/50),
                               Consumer<mainprovider>(
                                 builder: (context,value,child) {
                                   return GestureDetector(
                                    onTap: () {
                                    value.statusrecject(value.registerlist[index].id,context);
                                    },
                                    child: recipebutton(context, orange,"Reject",));
                                 }
                               ),
                            ],
                          )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
