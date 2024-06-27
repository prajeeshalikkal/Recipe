import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/CONSTANTS/mywidget.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';
import 'package:recipeapp/USER/searchcategory_screen.dart';

class search extends StatelessWidget {
  String userid;
  String name;
  String phone;
  String photo;
  search(
      {super.key,
      required this.userid,
      required this.name,
      required this.phone,
      required this.photo});

  @override
  Widget build(BuildContext context) {
    mainprovider provider = Provider.of<mainprovider>(context, listen: false);
    provider.getcategory();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: myblack,
      appBar: AppBar(
        leadingWidth: width / 1,
        backgroundColor: myblack,
        toolbarHeight:height/6.5,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Search",
                  style: TextStyle(
                      color: white, fontSize: 22, fontWeight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: txtformfield3("What do you want to cook?"),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<mainprovider>(builder: (context, value, child) {
              return GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisExtent: 170,
                  mainAxisSpacing: 34,
                ),
                itemCount: value.categorylist.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () {
                        value.getrecipeadd2(
                          value.categorylist[index].id,
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => searchcategory(
                                      categoryid: value.categorylist[index].id,
                                      name: name,
                                      phone: phone,
                                      photo: photo,
                                      userid: userid,
                                    )));
                      },
                      child: Container(
                        height: height / 5,
                        width: width / 2.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: darkgray,
                          image: DecorationImage(
                              image: NetworkImage(
                                value.categorylist[index].photo.toString(),
                              ),
                              scale: 3.6,
                              fit: BoxFit.scaleDown),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                value.categorylist[index].name.toString(),
                                style: TextStyle(
                                    color: white,
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
            SizedBox(height: height / 40),
          ], //chill
        ),
      ),
    );
  }
}
