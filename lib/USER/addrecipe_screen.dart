import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/ADMIN/addnew_list_add_screen.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/CONSTANTS/mywidget.dart';
import 'package:recipeapp/MODEL/modelclass.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';
import 'package:recipeapp/USER/Recipe_save_screen.dart';
import 'package:recipeapp/USER/profile_screen.dart';
import 'package:recipeapp/USER/searchcategory_screen.dart';

class addrecipe1 extends StatelessWidget {
  String userid;
  String name;
  String phone;
  String photo;
   addrecipe1({super.key,required this.userid,required this.name,required this.phone,required this.photo});



  @override
  Widget build(BuildContext context) {
    print("na-me"+name.toString());
    print("use-rid"+userid.toString());
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: myblack,
        appBar: AppBar(
        backgroundColor: myblack,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(
                  context, MaterialPageRoute(builder: (context) => profile(userid: userid,name: name,phone: phone,photo: photo,)));
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: white,
              size: 22,
            )),
        title: Text("Your new recipe",
            style: TextStyle(
                color: white, fontSize: 22, fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height/30),
            // Add photo..
            Consumer<mainprovider>(
                      builder: (context,value,child) {
                        return value.userrecipe_addlist.isNotEmpty?
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                                    children: List.generate(value.userrecipe_addlist.length,(Index){
                                      return Container(
                                        margin: EdgeInsets.only(right: 3),
                                        height: height/6,
                                        width: width/1.2,
                                        decoration: BoxDecoration(
                                          color:gray,
                                          borderRadius: BorderRadius.circular(12),
                                          // border: Border.all(strokeAlign: BorderSide.strokeAlignOutside,color: Colors.grey),
                                          image:DecorationImage(image: FileImage(value.userrecipe_addlist[Index]),fit: BoxFit.cover) ,
                                        ),
                                
                                      );
                                    },
                                    )
                                
                              
                            ),
                            value.userrecipe_addlist.length<2?GestureDetector(
                              onTap: () {

                                showBottomSheet(context,);
                              },
                              child: Container(
                                height: height/6,
                                width: width/1.2,
                                decoration: BoxDecoration(
                                  color: gray,
                                  borderRadius: BorderRadius.circular(12),
                                  // border: Border.all(strokeAlign: BorderSide.strokeAlignOutside,color: Colors.grey),
                                ),
                                child: Center(child: Icon(Icons.add,color: Colors.white,size: 35,)),),
                            )
                                :const SizedBox()
                          ],
                        )
                            :GestureDetector(
                          onTap: () {
                            showBottomSheet(context,);
                          },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  height: height/6,
                                  width: width/1.2,
                                  decoration: BoxDecoration(
                                color: gray,
                                borderRadius: BorderRadius.circular(12),
                                // border: Border.all(strokeAlign: BorderSide.strokeAlignOutside,color: Colors.grey),
                                  ),
                                  child: Center(child: Icon(Icons.add,color: Colors.white,size: 35,)),),
                              ),
                            );
                      }
                      ),
              
              
        // add recipe name................................
            SizedBox(height: height/40),  
              Consumer<mainprovider>(
                builder: (context,value,child) {
                  return addrecipename(context, "curry name", "chicken curry",value.userrecipenamecontroller );
                }
              ),
        
        
               SizedBox(height: height/40),
         /// categories .......................................
         /// 
               Consumer<mainprovider>(
                 builder: (context,value,child) {
                   return Autocomplete<categorymodel>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      return value.categorylist
                          .where((categorymodel item) => item.name
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase()))
                          .toList();
                    },
                    displayStringForOption: (categorymodel option) =>
                        option.name,
                    fieldViewBuilder: (BuildContext context,
                        TextEditingController fieldTextEditingController,
                        FocusNode fieldFocusNode,
                        VoidCallback onFieldSubmitted) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        fieldTextEditingController.text = value.userrecipecategorycontroller.text;
                      });
                   
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: TextFormField(
                              cursorColor: Colors.brown,
                              maxLines: 1,
                              style: const TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.w200),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "Category",
                                hintStyle: const TextStyle(
                                    color: Colors.white,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onChanged: (txt) {},
                              controller: fieldTextEditingController,
                              focusNode: fieldFocusNode,
                            ),
                          ),
                        ),
                      );
                    },
                    onSelected: (categorymodel selection) {
                      value.userrecipecategorycontroller.text = selection.name;
                      value.productSelectedcategoryid = selection.id;
                    },
                    optionsViewBuilder: (BuildContext context,
                        AutocompleteOnSelected<categorymodel> onSelected,
                        Iterable<categorymodel> options) {
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(15)),
                            width: 200,
                            height: 200,
                            child: ListView.builder(
                              padding: const EdgeInsets.all(10.0),
                              itemCount: options.length,
                              itemBuilder: (BuildContext context, int index) {
                                final categorymodel option = options.elementAt(index);
                   
                                return GestureDetector(
                                  onTap: () {
                                    onSelected(option);
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            // border: Border(left: BorderSide(color: Colors.white,width: .6,
                                            // ))
                                            ),
                                        height: 30,
                                        width: 200,
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: Text(option.name,
                                                    style: const TextStyle(
                                                      fontFamily: 'cantata',
                                                      color: Colors.black,
                                                    )),
                                              ),
                                            ]),
                                      ),
                                      Divider(
                                        thickness: 1,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                                 );
                 }
               ),
        
           
        
        
         // recipe incredient...........................
              SizedBox(height: height/40),
              Consumer<mainprovider>(
                builder: (context,value,child) {
                  return addrecipename(context, "Ingredients Weight ", "Write ingredients  weight step by step",value.userrecipeincredient);
                }
              ),
        
        
              
        //.....2
               SizedBox(height: height/40),
              Consumer<mainprovider>(
                builder: (context,value,child) {
                  return addrecipename(context, "Ingredients ", "Write ingredients step by step",value.userrecipeincredient1);
                }
              ),
        
        
        
                SizedBox(height: height/40),
              Consumer<mainprovider>(
                builder: (context,value,child) {
                  return addrecipename(context, "Directions", "Write the cooking step by step",value.userrecipedirection);
                }
              ),
        
               SizedBox(height: height/40),
              Consumer<mainprovider>(
                builder: (context,value,child) {
                  return addrecipename(context, "Cooking time", "Write time",value.userrecipetime);
                }
              ),
        
               SizedBox(height: height/40),
              // Consumer<mainprovider>(
              //   builder: (context,value,child) {
              //     return addrecipename(context, "Added", "added by",value.addedbycon);
              //   }
              // ),
            //,.............................................
              SizedBox(height: height/30),

        //...............................................................
           
              Consumer<mainprovider>(
                builder: (context,value,child) {
                  return GestureDetector(
                    onTap: () {
                      /// loader....

                      value.useraddyourrecipe(userid,name,phone);

                     Navigator.push(context,MaterialPageRoute(builder: (context) => profile(userid: userid,name: name,phone: phone,photo: photo,)));
                          
                        
                      },
                    
                    //loader...... 
                    child:value.recipeaddloader?CircularProgressIndicator(color: orange,): textbutton("Done", context, ));
                }
              ),
        
              SizedBox(height: height/12),
              
          ],
        ),
      ),
    );
  }


  /// bottomsheet>>>>>>>>>>
  /// 
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
                   
                        Mainprovider.getuseraddImgcamera(), Navigator.pop(context) 
                   
                    }),
              ListTile(
                  leading:  Icon(Icons.photo, color: Colors.black),
                  title: const Text('Gallery',),
                  onTap: () => {
                          Mainprovider.getuseraddImggallery(), Navigator.pop(context) 
                    }),
            ],
          );
        });
    // ImageSource
  }
  
}
