import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:recipeapp/ADMIN/categorie_add.dart';
import 'package:recipeapp/ADMIN/home_admin.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';

class categoriesadmin extends StatelessWidget {
  final String adminId;
  final String adminName;
  const categoriesadmin({super.key ,required this.adminId,required this.adminName});

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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => adminhome(adminId: adminId, adminName: adminName,)));
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: white,
                    size: 22,
                  )),
              title: Text("categories",
                  style: TextStyle(
                      color: white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                      ),
                      centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             SizedBox(height: height / 20),
            // Center(
            //   child: Text(
            //     "categories",
            //     style: TextStyle(
            //       fontSize: 24,
            //       fontWeight: FontWeight.w600,
            //       color: white,
            //     ),
            //   ),
            // ),
            SizedBox(height: height / 100),
                  Consumer<mainprovider>(
                  builder: (context,value,child) {
                     return value.getcategoryloader?Center(child: CircularProgressIndicator(color: orange,)): GridView.builder(
                        scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:2,
                        crossAxisSpacing:1,
                        mainAxisExtent:166,
                        mainAxisSpacing:24,
                        
                        ),
                        itemCount:value.categorylist.length,
                        itemBuilder: (context, index) {
                          return InkWell(
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
                                      value.deletecategory(
                                          value.categorylist[index].id,context);
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
                                      value.Editcategoey(
                                          value.categorylist[index].id);
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                categoriaddrecipe(
                                                    from: "EDIT",
                                                    oldid: value.categorylist[index].id,
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
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Container( 
                                            height:height/5,
                                            width:width/2.8,
                                             decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(12),
                                                          color:darkgray,
                                                          image: DecorationImage(
                                                          image: NetworkImage(value.categorylist[index].photo.toString()),scale:3.6,
                                                          fit: BoxFit.none),
                                                          
                                                  ), 
                                                  
                                            child: Padding(
                                              padding: const EdgeInsets.only(bottom: 10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text(value.categorylist[index].name.toString(),
                                                  style: TextStyle(color: white,fontSize: 16.5,fontWeight:FontWeight.w600),),
                                                ],
                                              ),
                                            ),
                                          ),
                            ),
                          );
                        },
                        
                     
                    );
                  }
                ),
        
                   SizedBox( height: height/8),
        
                 
        
          ],
        ),
      ),
      
            floatingActionButton: Consumer<mainprovider>(
              builder: (context,value,child) {
                return FloatingActionButton(
                        onPressed: () {
                         // value.getcategory();
                          value.categoryclear();
                          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => categoriaddrecipe(from:"NEW",oldid: "",adminId: adminId,adminName: adminName,)));
                        },
                        backgroundColor: gray,
                        child: Icon(Icons.add,size: 30,color: myblack,),
                      );
              }
            ),
    );
  }
}