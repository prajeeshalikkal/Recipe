import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/CONSTANTS/mywidget.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';
import 'package:recipeapp/USER/mainrecipe_screen.dart';
import 'package:recipeapp/USER/search_screen.dart';

class searchcategory extends StatelessWidget {
  String categoryid;
   searchcategory({super.key, required this.categoryid });

  @override
  Widget build(BuildContext context) {
    // mainprovider provider =Provider.of<mainprovider>(context,listen: false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: myblack,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height / 60),
              ListTile(
                leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: white,
                      size: 18,
                    )),
                title: txtformfield3("write recipie"),
              ),
              SizedBox(height: height / 40),
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
                            itemCount: value.catnewfatch.length,
                            itemBuilder: (context, index) {
                              var item = value.catnewfatch[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        value.getrecipeadd2(categoryid);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => mainrecipie(
                                                id: item.id,
                                                name: item.name,
                                                photo: item.photo,
                                                category: item.category,
                                                direction: item.direction,
                                                time: item.time,
                                                incredient: item.incredient,
                                                incredient1: item.incredient1,
                                                categoryid: item.categoryid,
                                                addedby: item.addedby,
                                                userid: item.userId,
                                              ),
                                            ));
                                      },
                                      child: Container(
                                        height: height / 4.2,
                                        width: width / 2.62,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: myblack,
                                          image: DecorationImage(
                                              image: NetworkImage(value
                                                  .catnewfatch[index].photo[0]
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
                                                  value
                                                      .catnewfatch[index].time
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: white,
                                                      fontSize: 12),
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
                                        value.catnewfatch[index].name
                                            .toString(),
                                        style: TextStyle(
                                            color: white,
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.w500)),
                                    Text(
                                        value.catnewfatch[index].addedby
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
              SizedBox(
                height: height / 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
