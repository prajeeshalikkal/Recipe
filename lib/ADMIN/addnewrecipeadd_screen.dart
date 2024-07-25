import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/ADMIN/addnew_list_add_screen.dart';

import 'package:recipeapp/ADMIN/mainrecipe_screen.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/CONSTANTS/mywidget.dart';
import 'package:recipeapp/MODEL/modelclass.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';
import 'package:recipeapp/USER/Recipe_save_screen.dart';

class addrecipe extends StatelessWidget {
  String from;
  String oldid;
  final String adminId;
  final String adminName;
  addrecipe({super.key,required this.from,required this.oldid,required this.adminId,required this.adminName});
 
  final formkey= GlobalKey<FormState>();
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
                    size: 22,
                  )),
              title: Text(from=="EDIT"?"Your edit recipe":"Your new.......... recipe",
                  style: TextStyle(
                      color: white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                      ),
                      centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              //  SizedBox(height: height/20),
              // Center(child: Text("Your new recipe",style: TextStyle(color: white,fontSize: 22,fontWeight: FontWeight.w600))),
              SizedBox(height: height/20),
              Consumer<mainprovider>(
                builder: (context,value,child) {
                   return InkWell(
                    onTap: () {
                      showBottomSheet(context);
                    },
                     child: value.recipefileimge_Addmin.isNotEmpty?
                     Column(
                        children: List.generate(value.recipefileimge_Addmin.length,(Index){
                    return Container(
                      height: height/4,
                        width: width/1.1,
                          decoration: BoxDecoration(
                      color: myblack,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(strokeAlign: BorderSide.strokeAlignOutside,color: lightgray), 
                    ),
                    child: Image.file(value.recipefileimge_Addmin[Index]),
                  );
                       
                        },
                      )
                      
                        ):Container(
                   height: height/3.5,
                    width: width/1.1,
                    decoration: BoxDecoration(
                      color: myblack,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(strokeAlign: BorderSide.strokeAlignOutside,color: lightgray), 
                    ),),
                   );
                   
                }
              ),
                
                
          // add recipe name................................
              SizedBox(height: height/40),  
                Consumer<mainprovider>(
                  builder: (context,value,child) {
                    return addrecipename(context, "curry name", "chicken curry",value.recipenamecontroller );
                  }
                ),
          
          
                 SizedBox(height: height/40),
           
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
                          fieldTextEditingController.text = value.recipecategorycontroller.text;
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
                        value.recipecategorycontroller.text = selection.name;
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
          
                // addrecipenamedrop(context, "Dessert", "category",),
          
          // // self.........................................

          //     SizedBox(height: height/40),
          //       Consumer<mainprovider>(
          //         builder: (context,value,child) {
          //           return addrecipename(context, "About your self", "Write ",value.recipeincredient);
          //         }
          //       ),


           // recipe incredient...........................
                SizedBox(height: height/40),
                Consumer<mainprovider>(
                  builder: (context,value,child) {
                    return addrecipename(context, "Ingredients Weight ", "Write ingredients  weight step by step",value.recipeincredient);
                  }
                ),


                
          //.....2
                 SizedBox(height: height/40),
                Consumer<mainprovider>(
                  builder: (context,value,child) {
                    return addrecipename(context, "Ingredients ", "Write ingredients step by step",value.recipeincredient1);
                  }
                ),
          
          
          
                  SizedBox(height: height/40),

                Consumer<mainprovider>(
                  builder: (context,value,child) {
                    return addrecipename(context, "Directions", "Write the cooking step by step",value.recipedirection);
                  }
                ),
          
                 SizedBox(height: height/40),
                Consumer<mainprovider>(
                  builder: (context,value,child) {
                    return addrecipename(context, "Cooking time", "Write time",value.recipetime);
                  }
                ),

              //    SizedBox(height: height/40),
              //   Consumer<mainprovider>(
              //     builder: (context,value,child) {
              //       return addrecipename(context, "Added", "added by",addedby );
              //     }
              //   ),
              // //,.............................................
                SizedBox(height: height/20),
              

              //    Consumer<mainprovider>(
              //   builder: (context,value,child) {
              //      return GestureDetector(
              //       onTap: () {
                      
              //         showBottomSheet(context,"recipe2");
              //       },
              //       child:value.recipefileimg2!=null? Container(
              //         height: height/2.4,
              //         width: width/1.1,
              //         decoration: BoxDecoration(
              //           color: myblack,
              //           borderRadius: BorderRadius.circular(12),
              //           border: Border.all(strokeAlign: BorderSide.strokeAlignOutside,color: lightgray), 
              //         ),
              //         child: Image.file(value.recipefileimg2!)
              //       ):
                  
              //     );
              // );

              
//...............................................................
                     SizedBox(height: height/20),
                Consumer<mainprovider>(
                  builder: (context,value,child) {
                    return GestureDetector(
                      onTap: () {
                        /// validator....
                        final FormState? form=formkey.currentState;
                        if(form!.validate()){
                            if(value.recipefileimg!=null){

                            
                        
                        if(from=="NEW"){
                           value.addYourRecipe(from,"",adminName,adminId);
                        }else{
                          value.addYourRecipe(from,oldid,adminName,adminId); 
                        }
                      
                        //value.getrecipeadd();
          
                       Navigator.push(context,MaterialPageRoute(builder: (context) => categorieslist(adminId: adminId, adminName: adminName),));
                            }
                             else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Image Provided",style: TextStyle(color: Colors.red,fontSize: 20),),
                          duration:  Duration(milliseconds: 3000),
                          ));
                        }
                        }
                      },
                      //loader...... 
                      child:value.recipeaddloader?Center(child: CircularProgressIndicator(color: orange,)): textbutton(from=="EDIT"?"EDit":"Done", context, ));
                  }
                ),
          
                SizedBox(height: height/20),
                
            ],
          ),
        ),
      ),
    );
  }

  void showBottomSheet(BuildContext context,) {
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
                    
                      Mainprovider.getrecipeImgcamera(), Navigator.pop(context) 

                  

                   
                    }),

              ListTile(
                  leading:  Icon(Icons.photo, color: Colors.black),
                  title: const Text('Gallery',),
                  onTap: () => {
                      Mainprovider.getrecipeImggallery(), Navigator.pop(context) 
                    }),
            ],
          );
        });
    // ImageSource
  }
}