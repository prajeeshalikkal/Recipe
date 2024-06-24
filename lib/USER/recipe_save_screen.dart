import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';
import 'package:recipeapp/USER/bottomnavigationbar_screen.dart';
import 'package:recipeapp/USER/mainrecipe_screen.dart';
import 'package:recipeapp/USER/profile_screen.dart';

class recipesave extends StatelessWidget {
  String userid;
  String name;
  String phone;
 
   recipesave({super.key,required this.userid,required this.name,required this.phone, });

  @override
  Widget build(BuildContext context) {
    print("hggvgv"+userid.toString());
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
              title: Text("Recipe",
                  style: TextStyle(
                      color: white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500)),
                      centerTitle: true,
      ),
      

      body: SingleChildScrollView(
        child: Column(
          children: [
              SizedBox( height: height/80),
                   Consumer<mainprovider>(
                     builder: (context, value, child) {
                     return 

                       value. useraddpro.length!=""? GridView.builder(
                           scrollDirection: Axis.vertical,
                           shrinkWrap: true,
                           physics: ScrollPhysics(),
                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 2,
                             crossAxisSpacing: 2,
                             mainAxisSpacing: 6,
                             mainAxisExtent: 262,
                           ),
                           itemCount: value.useraddpro.length,
                           itemBuilder: (context, index) {
                            print("fvfvfv");
                            print("chbdhc"+value.useraddpro.length.toString());
                                var item =value.useraddpro[index];
                             return Padding(
                               padding: const EdgeInsets.symmetric(horizontal:12),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   InkWell(   
                                     onTap: (){
                         
                                       print("ggggggggggooo"+userid.toString());
                                       Navigator.push(context, MaterialPageRoute(builder: (context)=>mainrecipie(
                                     id: item.id,name: item.name,photo: item.photo,category: item.category,direction: item.direction,time: item.time,
                                     incredient: item.incredient,incredient1: item.incredient1,categoryid: item.categoryid,addedby: item.addedby,userid: item.userid,
                                     UserId: userid,UserName: name,
                                    )));
                                     },                                   
                                     child: Container(
                                       height: height / 4.2,
                                       width: width / 2.62,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(12),
                                         color: myblack,
                                         image: DecorationImage(
                                             image: NetworkImage(
                                                 value.useraddpro[index].photo[0].toString()),
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
                                                 value.useraddpro[index].time.toString(),
                                                 style: TextStyle(
                                                     color: white, fontSize: 12),
                                               )),
                                             ),
                                           )),
                                           Padding(
                                             padding: const EdgeInsets.only(
                                                 left: 110, top: 4),
                                             child: CircleAvatar(
                                               backgroundColor: gray.withOpacity(0.85),
                                               radius: 16,
                                               child: Icon(Icons.favorite_outline,
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
                                   Text(value.useraddpro[index].name.toString(),
                                       style: TextStyle(
                                           color: white,
                                           fontSize: 14.5,
                                           fontWeight: FontWeight.w500)),
                                   Text(value.useraddpro[index].addedby,
                                       style:
                                           TextStyle(color: orange, fontSize: 12.5)),
                                 ],
                               ),
                             );
                           },
                         ):Container(
                          height: height / 2,
                          width: width / 1.5,
                          child: Image(
                              image: AssetImage(
                            "assets/WhatsApp Image 2024-01-11 at 12.09 1.png",
                          ))
                    );
                       
                   }),
        
                 
          ],
        ),
      ),
    );
  }
}