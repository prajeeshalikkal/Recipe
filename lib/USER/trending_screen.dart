import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';
import 'package:recipeapp/USER/bottomnavigationbar_screen.dart';
import 'package:recipeapp/USER/home_screen.dart';
import 'package:recipeapp/USER/mainrecipe_screen.dart';

class trending extends StatelessWidget {
  String userid;
  String name;
  String phone;
  String photo;
  trending({super.key, required this.userid, required this.name, required this.phone,required this.photo});

  @override
  Widget build(BuildContext context) {
    print("catename" + userid.toString());
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: myblack,
      appBar: AppBar(
        backgroundColor: myblack,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Bottombar(
                            userid: userid,
                            name: name,
                            phone: phone,
                            photo: photo,
                           
                          )));
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: white,
              size: 16,
            )),
        title: Text("Trending",
            style: TextStyle(
                color: white, fontSize: 22, fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //  SizedBox( height: height/20),
            //  Center(child: Text("Favourites",style: TextStyle(color: white,fontSize: 22,fontWeight: FontWeight.w600))),

            SizedBox(height: height / 80),
            Column(
              children: [
                Consumer<mainprovider>(builder: (context, value, child) {
                  return Row(
                    children: [
                      SizedBox(width: 12),
                      Expanded(
                        child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 6,
                            mainAxisExtent: 262,
                          ),
                          itemCount: value.recipeaddlist.length,
                          itemBuilder: (context, index) {
                            var item = value.recipeaddlist[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => mainrecipie(
                                              id: item.id, name: item.name, photo: item.photo,category: item.category,direction: item.direction,time: item.time,
                                              incredient: item.incredient, incredient1: item.incredient1,categoryid: item.categoryid,addedby: item.addedby, userid: item.userId,
                                              
                                            ),
                                          ));
                                    },
                                    child: Container(
                                      height: height / 4.2,
                                      width: width / 2.62,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: myblack,
                                        image: DecorationImage(
                                            image: NetworkImage(value
                                                .recipeaddlist[index].photo[0]
                                                .toString()),
                                            fit: BoxFit.cover),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                              child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4, top: 171),
                                            child: Container(
                                              height: height / 36,
                                              width: width / 8,
                                              decoration: BoxDecoration(
                                                color: gray.withOpacity(0.85),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                value.recipeaddlist[index].time
                                                    .toString(),
                                                style: TextStyle(
                                                    color: white, fontSize: 12),
                                              )),
                                            ),
                                          )),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 110, top: 4),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  gray.withOpacity(0.85),
                                              radius: 16,
                                              child: Icon(
                                                  Icons.favorite_outline,
                                                  color: white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height / 60,
                                  ),
                                  Text(
                                      value.recipeaddlist[index].name
                                          .toString(),
                                      style: TextStyle(
                                          color: white,
                                          fontSize: 14.5,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                      value.recipeaddlist[index].addedby
                                          .toString(),
                                      style: TextStyle(
                                          color: orange, fontSize: 12.5)),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),

            SizedBox(height: height / 20),
          ],
        ),
      ),
    );
  }
}
