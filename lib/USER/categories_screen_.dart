import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';
import 'package:recipeapp/USER/home_screen.dart';

class categories extends StatelessWidget {
  String userid;
  String name;
  String phone;
  String photo;
   categories({super.key,required this.userid,required this.name,required this.phone,required this.photo});

  @override
  Widget build(BuildContext context) {
    print("nnnnn"+name.toString());
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: myblack,
      
      //appbar....................................
      appBar: AppBar(
        backgroundColor: myblack,
          leading: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => home(userid:userid,name: name,phone: phone,photo: photo,)));
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: white,
                    size: 16,
                  )),
              title: Text("Dessert",
                  style: TextStyle(
                      color: white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600)),
                      centerTitle: true,
      ),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height / 60),

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
                          itemCount: value.searchimagelist.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: height / 4.2,
                                    width: width / 2.62,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: myblack,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              value.searchimagelist[index]),
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
                                              "50 min",
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
                                            child: Icon(Icons.favorite_outline,
                                                color: white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height / 60,
                                  ),
                                  Text(value.textimage[index],
                                      style: TextStyle(
                                          color: white,
                                          fontSize: 14.5,
                                          fontWeight: FontWeight.w500)),
                                  Text(value.textimage1[index],
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
