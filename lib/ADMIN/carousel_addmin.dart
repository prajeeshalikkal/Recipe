import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/ADMIN/carousel.dart';
import 'package:recipeapp/ADMIN/catagories_admin_screen.dart';
import 'package:recipeapp/ADMIN/home_admin.dart';
import 'package:recipeapp/ADMIN/mainrecipe_screen.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/CONSTANTS/mywidget.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';

class carouseladdmin extends StatelessWidget {
  String from;
  String oldid;
  final String adminId;
  final String adminName;
   carouseladdmin({super.key,required this.from,required this.oldid,required this.adminId,required this.adminName});
 final formkey=GlobalKey<FormState>();
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
                        MaterialPageRoute(builder: (context) => carousellist( adminId: adminId, adminName: adminName,)));
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: white,
                    size: 22,
                  )),
              title: Text("carousel add",
                  style: TextStyle(
                      color: white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                      ),
                      centerTitle: true,
      ),

      body: SingleChildScrollView(
        //validator.............
        child: Form(   
           key: formkey,
          child: Column(
            children: [
              //  SizedBox(height: height/20),
              // Center(child: Text("Your new recipe",style: TextStyle(color: white,fontSize: 22,fontWeight: FontWeight.w600))),
              SizedBox(height: height/30),
               Consumer<mainprovider>(
                 builder: (context,value,child) {
                   return GestureDetector(
                    onTap: () {
                      
                      showBottomSheet(context);
                    },
                    child:value.carouseladdmin!=null? Container(
                      height: height/2.4,
                      width: width/1.1,
                      decoration: BoxDecoration(
                        color: myblack,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(strokeAlign: BorderSide.strokeAlignOutside,color: lightgray), 
                      ),
                      child: Image.file(value.carouseladdmin!)
                    ):Container(
                      height: height/2.4,
                      width: width/1.1,
                      decoration: BoxDecoration(
                        color: myblack,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(strokeAlign: BorderSide.strokeAlignOutside,color: lightgray), 
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:80),
                            child: ListTile(
                              leading: Icon(Icons.camera_alt_outlined,color: white,),
                              title: Text("Add Photo",style: TextStyle(color: white),),
                            ),
                          ),
                        ],
                      ),
                    ),
                               );
                 }
               ),
                
                
          // add recipe name
                
              
                 SizedBox(height: height/40),
                Consumer<mainprovider>(
                  builder: (context,value,child) {
                    return  Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Container(
                            child: TextFormField(
                              controller: value.carouselnamecontroller,
                              style: TextStyle(color: white),
                              decoration: InputDecoration(
                                fillColor: myblack,
                                filled: true,
                                hintText: "name",
                                // prefixIcon:Icon(Icons.search_outlined,color: white,),
                                hintStyle: TextStyle(color: gray, fontSize: 15),
                      
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 0.4,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 0.4,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: lightgray,
                                    width: 0.4,
                                  ),
                                  // borderSide: const BorderSide(
                                  //   color: Colors.black26,
                                  //   width:1,
                                  // ),
                                ),
                              ),
          
                              validator: (value){
                                if(value!.isEmpty){
                                  return "This field is required";
                                }else{}
                              },
                            ),
                          ),
                    );
                  }
                ),
          
          
                    
                 SizedBox(height: height/40),
                Consumer<mainprovider>(
                  builder: (context,value,child) {
                    return  Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Container(
                            child: TextFormField(
                               controller: value.carouseladdbycontroller,
                              style: TextStyle(color: white),
                              decoration: InputDecoration(
                                fillColor: myblack,
                                filled: true,
                                hintText: "added by",
                                // prefixIcon:Icon(Icons.search_outlined,color: white,),
                                hintStyle: TextStyle(color: gray, fontSize: 15),
                      
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 0.4,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 0.4,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: lightgray,
                                    width: 0.4,
                                  ),
                                  // borderSide: const BorderSide(
                                  //   color: Colors.black26,
                                  //   width:1,
                                  // ),
                                ),
                                
                              ),
                                validator: (value1){
                                  if(value1!.isEmpty){
                                    return "this field is required";
                                  }else{}
                                }
                              
                            ),
                          ),
                    );
                  }
                ),
                SizedBox(height: height/40),
               
          
                Consumer<mainprovider>(
                  builder: (context,value,child) {
                    return GestureDetector(
                       onTap: () {
                       final FormState?form=formkey.currentState;
                       if(form!.validate()){
                        if(value.carouseladdmin!=null || value.caroimg!=""){
                       
                        if(from=="NEW"){
                           value.addcarousel(from,"");
                        }else{
                           value.addcarousel(from,oldid);
                        }
                        
                        // value.getcarouseladd();
          
                       Navigator.push(context,MaterialPageRoute(builder: (context) => carousellist( adminId: adminId, adminName: adminName,),));
                        }
                        else{
                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Image Provided",style: TextStyle(color: Colors.red,fontSize: 20),),
                            duration:  Duration(milliseconds: 3000),
                            ));
                        }
                      }
                      },
                      child: value.carouselloader?Center(child: CircularProgressIndicator(color: orange,)): textbutton(from=="EDIT"?"Edit": "Done",  context));
                  }  
                ),
                SizedBox(height: height/20),
                 
            ],
          ),
        ),
      ),
    );
  }


  void showBottomSheet(BuildContext context) {
    mainprovider Mainprovider =Provider.of<mainprovider>(context,listen: false);
    
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )),
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  leading:  Icon(
                    Icons.camera_enhance_sharp,
                    color:  Colors.black,
                  ),
                  title: const Text('Camera',),
                  onTap: () => {
                    Mainprovider.getcarouselImgcamera(), Navigator.pop(context)
                    }),
              ListTile(
                  leading:  Icon(Icons.photo, color: Colors.black),
                  title: const Text('Gallery',),
                  onTap: () => {
                    Mainprovider.getcarouselImggallery(),Navigator.pop(context)
                    }),
            ],
          );
        });
    // ImageSource
  }

}

