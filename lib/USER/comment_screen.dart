import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';
import 'package:recipeapp/USER/mainrecipe_screen.dart';

class comment extends StatelessWidget {
  String userid;
  String addedby;
  String recipeid;

  comment({
    super.key,
    required this.userid,
    required this.addedby,
    required this.recipeid,
  });

  @override
  Widget build(BuildContext context) {
    print("ndn" + addedby);
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
        title: Text("comments",
            style: TextStyle(
                color: white, fontSize: 22, fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton:
          Consumer<mainprovider>(builder: (context, value, child) {
        return Row(
          children: [
            Consumer<mainprovider>(builder: (context, value, child) {
              return Row(
                children: [
                  Container(
                    width: width / 1.5,
                    height: height / 18,
                    child: FloatingActionButton(
                        backgroundColor: myblack,
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextFormField(
                            controller: value.reviewController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: TextStyle(color: white),
                            decoration: InputDecoration(
                                hintText: "Add a comment...",
                                hintStyle: TextStyle(color: gray),
                                border: InputBorder.none),
                          ),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("object" + recipeid);
                      value.addReviews(userid, addedby, recipeid);
                      value.clearReviews();
                      value.getReviews(recipeid);
                      //  value.getReviews(recipeid);
                    },
                    child: Text(
                      "Send",
                      style: TextStyle(
                          color: orange,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              );
            }),
            SizedBox(width: width / 9),
          ],
        );
      }),
      
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height / 20),
            Consumer<mainprovider>(builder: (context, val, child) {
              return ListView.builder(
                itemCount: val.reviewList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: gray,
                      child: Text(
                        addedby[0].toUpperCase(),
                        style: TextStyle(
                            color: orange,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),

                    title: Row(
                      children: [
                        // addedby.......
                        Text(val.reviewList[index].name,
                            style: TextStyle(
                                color: white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                        // time .......
                        Padding(
                          padding: EdgeInsets.only(left: width / 38),
                          child: Text(val.reviewList[index].time,
                              style: TextStyle(
                                  color: gray,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                    // comment text .....
                    subtitle: Text(val.reviewList[index].review,
                        style: TextStyle(
                            color: white,
                            fontSize: 14.5,
                            fontWeight: FontWeight.w400)),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
