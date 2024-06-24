import 'package:flutter/material.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';

class notification extends StatelessWidget {
  const notification({super.key});

  @override
  Widget build(BuildContext context) {
     var height = MediaQuery.of(context).size.height;
     var width = MediaQuery.of(context).size.width;
    return  Scaffold(
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
              title: Text("Notification",
                  style: TextStyle(
                      color: white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500)),
                      centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: height/20,),
            Text("Notification",
                  style: TextStyle(
                      color: white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}