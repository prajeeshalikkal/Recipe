import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';
import 'package:recipeapp/USER/mainrecipe_screen.dart';
import 'package:recipeapp/USER/profile_screen.dart';

class favsave extends StatelessWidget {
  String userid;
  String name;
   String phone;
   String photo;
   favsave({super.key,required this.userid,required this.name,required this.phone,required this.photo,});

  @override
  Widget build(BuildContext context) {
    
     print("favv"+name.toString());
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
                    size: 16,
                  )),
              title: Text("Favourites",
                  style: TextStyle(
                      color: white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500)),
                      centerTitle: true,
      ),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            //  SizedBox( height: height/20), 
            //  Center(child: Text("Favourites",style: TextStyle(color: white,fontSize: 22,fontWeight: FontWeight.w600))),
      
              SizedBox( height: height/80),
                   Column(
                    children: [
                      Consumer<mainprovider>(
                        builder: (context, value, child) {
                        return Row(
                          children: [
                            SizedBox(width: 12),
                            Expanded(
                              child:value.FavGetList.isNotEmpty?
                              GridView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 2,
                                  mainAxisSpacing: 6,
                                  mainAxisExtent: 262,
                                ),
                                itemCount: value.FavGetList.length,
                                itemBuilder: (context, index) {
                                  print("chbdhc"+value.FavGetList.length.toString());
                                  var item = value.FavGetList[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:12),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                           onTap: () {
                                      print("mmmmmmmm  $name");
                                       Navigator.push(context, MaterialPageRoute(builder: (context) => mainrecipie(
                                  id: item.id,name: item.name,photo: item.photo,category: item.category,direction: item.direction,time: item.time,
                                  incredient: item.incredient,incredient1: item.incredient1,categoryid: item.categoryid,addedby: item.addedby,userid: item.userId,
                                  UserId: userid,UserName: name,
                                 ),));
                                    },
                                          child: Container(
                                            height: height / 4.2,
                                            width: width / 2.62,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              color: myblack,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      value.FavGetList[index].photo[0]),
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
                                                      borderRadius: BorderRadius.circular(12),
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                      value.FavGetList[index].time.toString(),
                                                      style: TextStyle(
                                                          color: white, fontSize: 12),
                                                    )),
                                                  ),
                                                )),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 110, top: 4),
                                                  child: InkWell(
                                                    onTap: (){
                                                      value.AddFavorites(userid, item.id,);
                                                    },
                                                    child: CircleAvatar(
                                                      backgroundColor: gray.withOpacity(0.85),
                                                      radius: 16,
                                                      child:  Icon(Icons.favorite,
                                                  color: value.checkFavList.any((item1) => item1 == item.id)?Colors.red:
                                                lightgray),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height / 60,
                                        ),
                                        Text(value.FavGetList[index].name,
                                            style: TextStyle(
                                                color: white,
                                                fontSize: 14.5,
                                                fontWeight: FontWeight.w500)),
                                        Text(value.FavGetList[index].addedby,
                                            style:
                                                TextStyle(color: orange, fontSize: 12.5)),
                                      ],
                                    ),
                                  );
                                },
                              ):
                              Container(
                          child: SizedBox(
                              height: height / 2.5,
                              width: width / 1.5,
                              child: Image(
                                  image: AssetImage(
                                "assets/WhatsApp Image 2024-01-11 at 12.09 1.png",
                              ))),
                        ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
        
                  SizedBox(height: height/20),
          ],
        ),
      ),
    );
  }
}