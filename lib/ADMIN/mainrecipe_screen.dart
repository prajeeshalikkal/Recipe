import 'package:flutter/material.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/CONSTANTS/mywidget.dart';
import 'package:recipeapp/USER/comment_screen.dart';

class adminmainrecipe extends StatelessWidget {
  String id;
  String name;
  List  photo;
  String category;
  String direction;
  String time;
  String incredient;
  String categoryid;
  String addedby;
  String incredient1;
   adminmainrecipe({super.key,required this.id,required this.name,required this.photo,required this.category,
   required this.direction,required this.time,required this.incredient,required this.incredient1,required this.categoryid,
   required this.addedby,});

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
          child: CircleAvatar(
                        radius: 12,
                        backgroundColor: myblack,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Icon(Icons.arrow_back_ios,color: white,size:16,),
                        ),
                      ),
        )
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [
             
               Container(
                height: height/2,
                width: width/1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(image: NetworkImage(photo[0]) ,fit: BoxFit.cover)
                ),
             
             
               ),


        
              SizedBox(height:height/60),
              
                          Container(
                            child: Text(name,
                              style:TextStyle(
                               color: white,
                               fontSize: 20,
                                fontWeight: FontWeight.w600)),
                                
                          ),
        
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
                                  
                                   Row(
                                     children: [
                                       Icon(Icons.favorite_border_outlined,color: white,),
                                        SizedBox(width: width/70),
                                        Text("500",style: TextStyle(color: lightgray,fontSize: 15),),
                                     ],
                                   ),
                                  
                                   Row(
                                     children: [
                                       Icon(Icons.share,color: white,),
                                        SizedBox(width: width/70),
                                          Text("Share",style: TextStyle(color: lightgray,fontSize: 15),)
                                     ],
                                   ),                          
                                 ],
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
                                   children: [
                                     CircleAvatar(
                                      radius: 26,                           
                                      backgroundImage:AssetImage("assets/foodimage6.avif",),
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
                               SizedBox(height: height/60),
                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 20),
                                 child: Text("m Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",style: TextStyle(color: white,fontSize: 16,fontWeight: FontWeight.w400),),
                               ),
        
                                SizedBox(height: height/30),
                               Divider(
                                height: 1,
                                 color: lightgray,                          
                               ),
        
                                SizedBox(height: height/30),
                                 Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 20),
                                   child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text("Reviews",style: TextStyle(color: white,fontSize: 16.5,fontWeight: FontWeight.w800),),
                                        GestureDetector(
                                          // onTap: () {
                                          //   print(name+"lolololo".toString());
                                          //   Navigator.push(context, MaterialPageRoute(builder:(context) => comment(userid: id,addedby:addedby,review:,)));
                                          // },
                                          child: Text("Read",style: TextStyle(color: orange,fontSize: 14.5,fontWeight: FontWeight.w400),)),
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
                              SizedBox(height: height/30),
                                
          ],
        ),
      ),
    );
  }
}