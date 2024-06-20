import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/ADMIN/carousel.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';
import 'package:recipeapp/USER/categories_screen_.dart';
import 'package:recipeapp/USER/mainrecipe_screen.dart';
import 'package:recipeapp/USER/profile_screen.dart';
import 'package:recipeapp/USER/search_screen.dart';
import 'package:recipeapp/USER/searchcategory_screen.dart';
import 'package:recipeapp/USER/trending_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class home extends StatelessWidget {
  String userid;
  String name;
  String phone;
  String photo;

   home({super.key,required this.userid,required this.name,required this.phone,required this.photo});

  @override
  Widget build(BuildContext context) {
    print("print_user name"+name.toString());
    print("print_Userid***"+userid.toString());
  
    /// get .............
//     mainprovider provider = Provider.of<mainprovider>(context,listen: false);

//    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//      provider.getrecipeadd();
//      provider.getcarouseladd();
// }); 
   
    
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:myblack, 
        body:
         SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:height/20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Consumer<mainprovider>(
                      builder: (context,value,child) {
                       
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Consumer<mainprovider>(
                                 builder: (context,val,child) {
                                   return Text(name,
                                   style:TextStyle(
                                     color: white,
                                        fontSize: 20,
                                          fontWeight: FontWeight.w400));
                                 }
                               ),
                                        Text("Recipe of the week",style:TextStyle(
                                          color: white,
                                            fontSize: 18,
                                              fontWeight: FontWeight.w500)),
        
           SizedBox(height: height/50),
            Consumer<mainprovider>(
              builder: (context,value,child) {
                //  print("kkkkk"+userid.toString());
                return  value.carouseladdlist.isNotEmpty?
                CarouselSlider.builder(
                  itemCount:value.carouseladdlist.length,
                    itemBuilder: (context, index, realIndex) {
                     
        
                     return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: MediaQuery.of(context).size.width,
                       child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            value.carouseladdlist[index].photo.toString(),
                              fit: BoxFit.cover,
                                    ),
                                    ), 
                                  );
                                },
                                options: CarouselOptions(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    height: height/4,
                                    viewportFraction: 1,
                                    autoPlay: true,
                                    pageSnapping: true,
                                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                                    enlargeCenterPage: true,
                                    autoPlayInterval: const Duration(seconds: 4),
                                    onPageChanged: (index, reason) {
                                    value.Activeindex(index);
        
                                    }),
                              ):SizedBox();
                           }
                         ),
                          buildIndiCator(
                              value.carouseladdlist.length, context, value.currentindex),
                    ],
                  );
                }
              ),
            ),
        
        
           SizedBox(height: height/50),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Trending recipe",style:TextStyle(
                        color: white,
                           fontSize: 18,
                              fontWeight: FontWeight.w500)),
                                GestureDetector(
                                  onTap: () {
                                    print("vvvvvvv"+userid.toString());
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => trending(userid:userid,name: name,phone: phone,photo: photo,)));
                                  },
                                  child: Text("See all",
                                    style: TextStyle(
                                      color:orange,
                                        fontSize: 16,
                                          fontWeight:FontWeight.w400,                                    
                                      ),
                                        ),
                                ),
                    ],
                  ),
                ),
        
                SizedBox(height: height/60),
                 Consumer<mainprovider>(
                   builder: (context,value,child) {
                     return value.recipeaddlist.isNotEmpty?
                     SizedBox(height:height/3,
                       child: Expanded(
                         child: Row(
                           children: [
                             SizedBox(width:12,),
                               Expanded(
                                child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:value.recipeaddlist.length>4?4:value.recipeaddlist.length,
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                   var item =value.recipeaddlist[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:8),
                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           GestureDetector(
                                            onTap: () {
                                              print("mmmmmmmm  $name");
                                               Navigator.push(context, MaterialPageRoute(builder: (context) => mainrecipie(
                                          id: item.id,name: item.name,photo: item.photo,category: item.category,direction: item.direction,time: item.time,
                                          incredient: item.incredient,incredient1: item.incredient1,categoryid: item.categoryid,addedby: item.addedby,userid: item.userId,
                                         ),));
                                            },
                                             child: Container(
                                               height:height/4.2,
                                               width:width/2.62,
                                              decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              color:myblack,
                                              image: DecorationImage(
                                              image: NetworkImage(value.recipeaddlist[index].photo[0].toString(),),
                                              fit: BoxFit.fill),
                                                  
                                                                                   ),
                                              child:Stack(
                                               children: [
                                              Positioned(child: Padding(
                                                padding: const EdgeInsets.only(left: 4,top: 171),
                                                child: Container(
                                                height:height/36,
                                                width:width/8,
                                                decoration: BoxDecoration(color:gray.withOpacity(0.85),
                                                borderRadius: BorderRadius.circular(12),
                                                ),
                                                child: Center(child: 
                                                Text(value.recipeaddlist[index].time.toString(),
                                                style: TextStyle(color: white,fontSize: 12),)),
                                                ),
                                              )),
                                                 Padding(
                                                 padding: const EdgeInsets.only(left: 110,top: 4),
                                                 child: CircleAvatar(
                                                 backgroundColor: gray.withOpacity(0.85),
                                                 radius: 16,
                                                 child: Icon(Icons.favorite_outline,color:white),
                                                   ),
                                             ),
                                                                                     ],
                                                                                   ),
                                                                                  ),
                                           ),
                                       SizedBox(height: height/60,),
                                       Text(value.recipeaddlist[index].name.toString(),style: TextStyle(color: white,fontSize: 14.5,fontWeight: FontWeight.w500)),
                                       Text(value.recipeaddlist[index].addedby.toString(),style: TextStyle(color: orange,fontSize: 12.5)),
                                     ],
                                    ),
                                  );
                                },                          
                               ),
                             ),
                           ],
                         ),
                       ),
                     ):SizedBox();
                   }
                 ),
                 
                 // today recipe ...............................................
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20),
                       child: Text("Today's Recipe",style:TextStyle(
                          color: white,
                             fontSize: 18,
                                fontWeight: FontWeight.w500)),
                                   ),
                                SizedBox(height: height/60),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Consumer<mainprovider>(
                                          builder: (context,val,child) {
                                            return ListView.builder(
                                              itemCount:val.recipeaddlist.length>1?1:val.recipeaddlist.length,
                                              shrinkWrap: true,
                                              physics: NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                var item =val.recipeaddlist[index];
                                                return InkWell(
                                                  onTap: (){
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>mainrecipie(
                                          id: item.id,name: item.name,photo: item.photo,category: item.category,direction: item.direction,time: item.time,
                                          incredient: item.incredient,incredient1: item.incredient1,categoryid: item.categoryid,addedby: item.addedby,userid: item.userId,
                                         )));
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                             height:height/3.4,
                                                              width:width/1.10,
                                                            decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(12),
                                                            color:myblack,
                                                            image: DecorationImage(
                                                            image: NetworkImage(val.recipeaddlist[index].photo[0].toString(),),
                                                            fit: BoxFit.cover),
                                                                
                                                        ),
                                                        child:Stack(
                                                          children: [
                                                            Positioned(child: Padding(
                                                              padding: const EdgeInsets.only(left: 5,top:217),
                                                              child: Container(
                                                              height:height/36,
                                                              width:width/8,
                                                              decoration: BoxDecoration(color:gray.withOpacity(0.85),
                                                              borderRadius: BorderRadius.circular(12),
                                                              ),
                                                              child: Center(
                                                              child: Text(val.recipeaddlist[index].time.toString(),
                                                              style: TextStyle(
                                                              color: white,fontSize: 12),)),
                                                              ),
                                                            )),
                                                               Padding(
                                                               padding: const EdgeInsets.only(left:306,top:4),
                                                               child: CircleAvatar(
                                                               backgroundColor: gray.withOpacity(0.85),
                                                               radius: 16,
                                                               child: Icon(Icons.favorite_outline,color:white),
                                                                 ),
                                                           ),
                                                          ],
                                                        ),
                                                       ),
                                                       SizedBox(height: height/60,),
                                                      Text(val.recipeaddlist[index].name.toString(),style: TextStyle(color: white,fontSize: 14.5,fontWeight: FontWeight.w500)),
                                                      Text(val.recipeaddlist[index].addedby.toString(),style: TextStyle(color: orange,fontSize: 12.5)),
                                                    ],
                                                  ),
                                                );
                                              },);
                                          }
                                        ),
                                      ],                                     
                                    ),
                                  ),


          //  SizedBox(height: height/60),
          //       Padding(
          //            padding: const EdgeInsets.symmetric(horizontal: 20),
          //              child: Text("Our most popular recipe",style:TextStyle(
          //                 color: white,
          //                    fontSize: 18,
          //                       fontWeight: FontWeight.w500)),
          //                          ),
                                   SizedBox(height: height/60),
                              
                 SizedBox(height: height/40,)       
                 ],
              ),
        ),
    );
  }
}


/// build indicator.................................................

   buildIndiCator(int count, BuildContext context, int activeindex) {
  //    print(activeIndex.toString()+"dpddoopf");
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 8),
      child: AnimatedSmoothIndicator(
            activeIndex: activeindex,
            count: count,
            effect: const ExpandingDotsEffect(
            dotWidth: 7,
            dotHeight: 7,
            strokeWidth: 1,
            paintStyle: PaintingStyle.fill,
            activeDotColor: Color(0xffFD4505),
            dotColor:Color(0xffFD4505)),

      ),
),
);
}

 
