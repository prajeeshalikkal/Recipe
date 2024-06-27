import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/ADMIN/user_req_accpt.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';

class User_Request extends StatelessWidget {
  const User_Request({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: myblack,
      appBar: AppBar(
          elevation: 0.00,
          backgroundColor: orange.withOpacity(0.5),
          title: const Text("USER RECIPE ADD"),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 60.2,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          )),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 30,
            ),
            Consumer<mainprovider>(builder: (context, value, child) {
              return value.useraddrecipe.isNotEmpty?
              ListView.builder(
                itemCount: value.useraddrecipe.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),

                itemBuilder: (context, index) {
                  var item = value.useraddrecipe[index];
                  return value.useraddrecipe.isNotEmpty?
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height / 4.2,
                      width: width / 2.62,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: myblack,
                        image: DecorationImage(
                            image: NetworkImage(
                                value.useraddrecipe[index].photo[0]),
                            fit: BoxFit.cover),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 4, top: 171),
                            child: Container(
                              height: height / 36,
                              width: width / 8,
                              decoration: BoxDecoration(
                                color: gray.withOpacity(0.85),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                  child: Text(
                                //time....
                                value.useraddrecipe[index].time.toString(),
                                style: TextStyle(color: white, fontSize: 12),
                              )),
                            ),
                          )),
                          Center(
                            child: InkWell(
                              onTap: () {
                                print(item.userid + "ioioioioiioioios");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UserReqAdd_(
                                        id: item.userid,
                                        name: item.name,
                                        photo: item.photo,
                                        category: item.category,
                                        direction: item.direction,
                                        time: item.time,
                                        incredient: item.incredient,
                                        incredient1: item.incredient1,
                                        categoryid: item.categoryid,
                                        addedby: item.addedby,
                                        recipeid: item.id,
                                        recipename: item.name,
                                      ),
                                    ));
                              },
                              child: Container(
                                height: height / 30,
                                width: width / 4,
                                decoration: BoxDecoration(
                                  color: gray,
                                ),
                                child: Text(
                                  "View more",
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ):
                  Container(
                height: height/4.2,
                width: width/2.62,
                color: Colors.amber,
              );
                  
                },
              ):
              Container(
                height: height/4,
                width: width,
                color: Colors.amber,
              );
            }),
            SizedBox(height: height / 5),
          ],
        ),
      ),
    );
  }
}
