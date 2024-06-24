import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/CONSTANTS/mywidget.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';
import 'package:recipeapp/USER/comment_screen.dart';
import 'package:recipeapp/USER/profile_screen.dart';
import 'package:recipeapp/USER/recprofile.dart';
import 'package:recipeapp/USER/subprofile.dart';
import 'package:share_plus/share_plus.dart';

class mainrecipie extends StatelessWidget {
  String id;
  String name;
  String userid;
  List   photo;
  String category;
  String direction;
  String time;
  String incredient;
  String categoryid;
  String addedby;
  String incredient1;
  String UserId;
    String UserName;

  mainrecipie({super.key,required this.id,required this.name,required this.photo,required this.category,
   required this.direction,required this.time,required this.incredient,required this.incredient1,required this.categoryid,
   required this.addedby,required this.userid,required this.UserId,required this.UserName,});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: myblack,
      body: CustomScrollView(
       slivers: [
             SliverAppBar(
                  pinned: true,   // app bar fixed
                  toolbarHeight: 60,
                  expandedHeight:460,
                  backgroundColor: Colors.black,
                  flexibleSpace:FlexibleSpaceBar(
                  background: Image.network(
                      photo[0],
                      width: double.maxFinite,
                      fit: BoxFit.cover,

                      ),) ,
                ),

                SliverToBoxAdapter(
                 child:   Column(
                  children: [
                      SizedBox(height:height/60),
                        Text(name,
                          style:TextStyle(
                           color: white,
                           fontSize: 20,
                            fontWeight: FontWeight.w600)),
      
                          SizedBox(height:height/80),
                          Center(
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star,color:orange,size: 18,),
                                Icon(Icons.star,color:orange,size: 18),
                                Icon(Icons.star,color:orange,size: 18),
                                Icon(Icons.star,color:orange,size: 18),
                                Icon(Icons.star_border_outlined,color:white,size: 18),
                              ],
                            ),
                          ), 
      
                             SizedBox(height:height/60),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: [
                                 Row(
                                   children: [
                                     Icon(Icons.access_time,color: white,),
                                      SizedBox(width: width/70),
                                      Text(time,style: TextStyle(color: lightgray,fontSize: 15),),
                                   ],
                                 ),
                                
                                 Center(
                                   child: Row(
                                     children: [
                                       Icon(Icons.favorite_border_outlined,color: white,),
                                        SizedBox(width: width/70),
                                        Text("500",style: TextStyle(color: lightgray,fontSize: 15),),
                                     ],
                                   ),
                                 ),
                                
                                GestureDetector (
                                   onTap: () {
                                          final result = Share.shareWithResult("https://recipedetails.page.link/praji");
                                        },
                                   child: Row(
                                     children: [
                                      Icon(Icons.share,color: white,),
                                          SizedBox(width: width/70),
                                          Text("Share",style: TextStyle(color: lightgray,fontSize: 15),),
                                     ],
                                   ),
                                 ),                          
                               ],
                              ),
                            
                            SizedBox(height: height/30),
                             Divider(
                              height: 1,
                               color: lightgray,                          
                             ),
      
      
                            SizedBox(height: height/40),
                             GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>recprofile(name: addedby,userid: userid,phone: "",photo:photo.toString(),)));
                              },
                               child: Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 20),
                                 child: Row(
                                   children: [
                                     Consumer<mainprovider>(
                                       builder: (context,val,child) {
                                         return Container(
                                           child: CircleAvatar(
                                            radius: 26,   
                                            backgroundColor: darkgray,    
                                            child: Text(addedby[0].toUpperCase(),style: TextStyle(color: orange,fontSize: 22,fontWeight: FontWeight.w700),)                  
                                            // backgroundImage:AssetImage("assets/foodimage6.avif"),
                               
                                           ),
                                         );
                                       }
                                     ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(addedby,style: TextStyle(color: white,fontSize: 16,fontWeight: FontWeight.w600),),
                                              Text("Food editor at kitchen",style: TextStyle(color: orange,fontSize: 14,fontWeight: FontWeight.w500),),
                                          ],
                                        ),
                                      )
                                   ],                            
                                 ),
                               ),
                             ),

                              // add user bio...........


                           //  SizedBox(height: height/60),
                            //  Padding(
                            //    padding: const EdgeInsets.symmetric(horizontal: 20),
                            //    child: Text("m Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",style: TextStyle(color: white,fontSize: 16,fontWeight: FontWeight.w400),),
                            //  ),
      
                            //   SizedBox(height: height/30),
                            //  Divider(
                            //   height: 1,
                            //    color: lightgray,                          
                            //  ),
      
                              SizedBox(height: height/30),
                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 20),
                                 child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text("Reviews",style: TextStyle(color: white,fontSize: 16.5,fontWeight: FontWeight.w800),),
                                     /// Comment box
                                     /// 
                                      Consumer<mainprovider>(
                                        builder: (context,val,child) {
                                          return GestureDetector(
                                            onTap: () {
                                              print("nnnnnnnnmm"+UserName);
                                             val.getReviews(id);
                                              Navigator.push(context, MaterialPageRoute(builder:(context) => comment(userid: userid,addedby: addedby,recipeid:id,UserId: UserId,UserName: UserName,)));
                                            },
                                            child: Text("Read",style: TextStyle(color: orange,fontSize: 14.5,fontWeight: FontWeight.w400),));
                                        }
                                      ),
                                   ],
                                 ),
                               ),
                                  SizedBox(height: height/30),
                             Divider(
                              height: 1,
                               color: lightgray,                          
                             ),
                             
                             SizedBox(height: height/40),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Ingredients",style: TextStyle(color: white,fontSize: 17,fontWeight: FontWeight.w800),),
                                         SizedBox(height: height/40),
                                          Text("2 Servings ",style: TextStyle(color: white,fontSize: 15.5,fontWeight: FontWeight.w600),),                                      
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                               SizedBox(height: height/40),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20),
                                              child: Row( 
                                                crossAxisAlignment: CrossAxisAlignment.start,       
                                                children: [
                                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(incredient,style: TextStyle(color: white,fontSize: 14,fontWeight: FontWeight.w500),),
                                                   
                                                    ],
                                                  ),
                                            
                                                   SizedBox(width: width/10),
                                            
                                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                      Text(incredient1,style: TextStyle(color: white,fontSize: 14,fontWeight: FontWeight.w500),),
                                                
                                                      ],
                                                    ),
                                                     
                                                ],
                                              ),
                                            ),

                           SizedBox(height: height/30),
                             Divider(
                              height: 1,
                               color: lightgray,                          
                             ),
                             

                          SizedBox(height: height / 60),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("making",style: TextStyle(color: white, fontSize: 17, fontWeight: FontWeight.w800),),
                                      ],
                                    ),
                                  ),

       SizedBox(height: height / 60),
      //image...............
      Container(
          height: 332,
          width: 342,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(12),
            color: myblack,
            image:DecorationImage(image: NetworkImage(photo[1]),fit:BoxFit.cover ),
          )),

                              SizedBox(height: height / 40),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30,),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                         Image.asset(
                                             "assets/Vector (20).png",
                                                scale: 4,
                                               ),
                                                 SizedBox(width: width / 60),
                                        SizedBox(width: 280,child: Text(direction,style: TextStyle(color: white, fontSize: 13, fontWeight: FontWeight.w400),)),
                                      ],
                                    ),
                                  ),
                            //steps..............................
                            SizedBox(height: height/10),
                  ],
                  ),
                )
       ],
            //  Container(
            //   height: height/2,
            //   width: width/1,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     image: DecorationImage(
            //       image: NetworkImage( photo[0]),fit: BoxFit.cover)
            //   ),
            // //  child: Align(
            // //   alignment: Alignment.topLeft,
            // //    child: CircleAvatar(
            // //      radius:20,
            // //      backgroundColor: myblack,
            // //      child: Padding(
            // //        padding: const EdgeInsets.only(left: 5),
            // //        child: Icon(Icons.arrow_back_ios,color: white,size:16,),
            // //      ),
            // //    ),
            // //  ),
           
            //  ),
      
           
                              
                               
      
      
               
        
      ), 

      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton.small(shape:CircleBorder(),
        onPressed: () {
         Navigator.pop(context);
      }, 

      backgroundColor: myblack,
       child: Icon(Icons.arrow_back_ios,color: white,size:16,),
      ),
    );
  }
}