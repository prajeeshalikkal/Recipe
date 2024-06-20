import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/ADMIN/home_admin.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/CONSTANTS/mywidget.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';

class customer extends StatelessWidget {
      final String adminId;
  final String adminName;
   customer({super.key,required this.adminId,required this.adminName});

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
              title: Text("customer",
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
                        height: height / 8,
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
