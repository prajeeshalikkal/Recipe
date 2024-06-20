import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/ADMIN/addnewrecipeadd_screen.dart';
import 'package:recipeapp/ADMIN/catagories_admin_screen.dart';
import 'package:recipeapp/ADMIN/home_admin.dart';
import 'package:recipeapp/ADMIN/mainrecipe_screen.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';

class categorieslist extends StatelessWidget {
 
  final String adminId;
  final String adminName;
  const categorieslist({super.key,required this.adminId,required this.adminName});
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
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: white,
              size: 16,
            )),
        title: Text("Breakfast",
            style: TextStyle(
                color: white, fontSize: 24, fontWeight: FontWeight.w500)),
                centerTitle: true,
      ),
       // appbarclose...................

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
                        child: value.getrecipeaddloader?Center(child: CircularProgressIndicator(color: orange)): GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 6,
                            mainAxisExtent: 280,
                          ),
                          itemCount: value.recipeaddlist.length,
                          itemBuilder: (context, index) {
                            var item =value.recipeaddlist[index];
                            return InkWell(
                              //copy .........
                              onDoubleTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content:  Text(
                              "Do you want to  EDIT or DELETE ?",style: TextStyle(
                              fontSize:17,
                              fontWeight: FontWeight.w600,
                              color: myblack)),
                          actions: <Widget>[
                            Center(
                              child: Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      value.deleterecipe(
                                          value.recipeaddlist[index].id,context);
                                      Navigator.of(context).pop();

                                    },
                                    child: Container(
                                      height: 45,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          color:Colors.red ,
                                          borderRadius: BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x26000000),
                                              blurRadius: 2.0, // soften the shadow
                                              spreadRadius: 1.0, //extend the shadow
                                            ),
                                          ] ),
                                      child: Center(child:  Text("Delete",style: TextStyle( color:white,fontSize: 17,fontWeight: FontWeight.w700))),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      value.Editrecipe(
                                          value.recipeaddlist[index].id);
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                addrecipe(
                                                    from: "EDIT",
                                                    oldid: value.recipeaddlist[index].id,
                                                    adminId: adminId,
                                                    adminName: adminName,

                                                    
                                                ),
                                          ));
                                    },
                                    child:Container(
                                      height: 45,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          color:gray ,
                                          borderRadius: BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x26000000),
                                              blurRadius: 2.0, // soften the shadow
                                              spreadRadius: 1.0, //extend the shadow
                                            ),
                                          ] ),
                                      child: Center(child:  Text("Edit",style: TextStyle( color:white,fontSize: 17,fontWeight: FontWeight.w700))),
                                    ),)
                                ],
                              ),
                            ),

                          ],
                        ),
                      );
                    },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(  
                                       onTap:   () {  
                                         Navigator.push(context, MaterialPageRoute(builder: (context) => adminmainrecipe(
                                          id: item.id,name: item.name,photo: item.photo,category: item.category,direction: item.direction,time: item.time,
                                          incredient: item.incredient,incredient1: item.incredient1,categoryid: item.categoryid,addedby: item.addedby,
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
                                                 value.recipeaddlist[index].photo[0]
                                                 ),
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
                                                      //time....
                                                  value.recipeaddlist[index].time.toString(),
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
                                    ),
                                    SizedBox(
                                      height: height / 60,
                                    ),
                                    Text(value.recipeaddlist[index].name.toString(),
                                        style: TextStyle(
                                            color: white,
                                            fontSize: 14.5,
                                            fontWeight: FontWeight.w500)),
                                    Text(value.recipeaddlist[index].addedby.toString(),
                                        style: TextStyle(
                                            color: orange, fontSize: 12.5)),
                                  ],
                                ),
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

      ////////////////////////  floating...............

      floatingActionButton: Consumer<mainprovider>(
        builder: (context,value,child) {
          return FloatingActionButton(
            onPressed: () {
               value.getcategory();
                value.recipeaddclear();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => addrecipe(from:"NEW",oldid: "",adminId: adminId,adminName: adminName,)));
            },
            backgroundColor: gray,
            child: Icon(Icons.add,size: 30,color: myblack,),
          );
        }
      ),
    );
  }
}
