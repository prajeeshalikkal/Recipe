import 'dart:collection';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/MODEL/modelclass.dart';
import 'package:share_plus/share_plus.dart';

class mainprovider extends ChangeNotifier{

  Reference ref = FirebaseStorage.instance.ref("IMAGE URL");
  final FirebaseFirestore db = FirebaseFirestore.instance;
  
  
  
  // home page trending images
  List<String>trendingimgaelist=[
    "assets/foodimage6.avif",
    "assets/foodimage5.avif",
    "assets/foodimg3.webp"
];

//caroucilimages
  List<String> carouselimages=[
    "assets/foodimage6.avif",
    "assets/foodimage5.avif",
    "assets/foodimg3.webp"
    
  ];
  //categoriiesimages
    List<String>Categoriesimagelist=[
    "assets/foodimage6.avif",
    "assets/foodimage5.avif",
    "assets/foodimg3.webp",
];
 //mainsearchimages
  List<String>searchimagelist=[
    "assets/foodimage6.avif",
    "assets/foodimage5.avif",
    "assets/foodimg3.webp",
    "assets/foodimage6.avif",
    "assets/foodimage6.avif",
];

//searchlist
List<String>searchlist=[  
  "assets/food_img-removebg-preview 1.png",
  "assets/download__1_-removebg-preview 1.png",
  "assets/dinner-removebg-preview 1.png",
  "assets/salads-removebg-preview 1.png",
  "assets/download_desserts-removebg-preview 1.png",  
  "assets/images-removebg-preview 1.png",
  
  
];

  List<String > textimage =[
    "chicken",
    "chicken salad",
    "chicken curry",
    "chicken curry",
    "chicken curry"
  ];

    List<String > textimage1 =[
    "by amir",
    "by rahul",
    "by thasss",
    "praji",
    "bisni"
  ];


   List<String > categoriestext =[
    "Breakfast",
    "Lunch",
    "Salad",
  ];

 //search
  List<String > searshlisttext =[
    "Breakfast",
    "Lunch",
    "Dinner",
    "salads",
    "Desserts",
    "Drinks",
  ];


/// build indicator in carousel ................

    int currentindex=0;
    void Activeindex( int index){
    currentindex=index;
    notifyListeners();

  } 

// void actindex(int index){
// currentindex=index;
// notifyListeners();
//  }



// -------------------- Edit profile.................
  File? editprofile =null;
  String editimage="";

  String nullimage="";

 TextEditingController editprofilenamecontroller =TextEditingController();
   Future<void>EditProfile(String id,String phone) async {

// print("edit straartedddddd    $id, $phone   ${nameregcontroller.text} ");


    HashMap<String, dynamic>editmap = HashMap();
    editmap["USER_ID"]=id;
    editmap["USER_NAME"]=nameregcontroller.text;
    editmap["USER_PHONE"]=phone;
    
// print("rrrrrrrr2222222222222222 ");

    if (editprofile!= null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(editprofile!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          editmap["PHOTO"] = value;
          editimage = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } 

// print("4444444444444444444  ${nameregcontroller.text}");
      db.collection("REGISTRATION").doc(id).set({"REGISTER_NAME":nameregcontroller.text},SetOptions(merge: true));  
// print("555555555555555 ");
      db.collection("RECIPE").where("USER_ID",isEqualTo: id).get().then((valuee) => {

 
if(valuee.docs.isNotEmpty){
  for(var elements in valuee.docs){

// print("elements id  :  ${elements.id}"),
    
     db.collection("RECIPE").doc(elements.id).set({"ADDEDBY":nameregcontroller.text},SetOptions(merge: true))
  }
}


      });

// print("ttttttttt iddddd   ${recipeaddlist.where((element) => element.userId==id).first.addedby}");

recipeaddlist.where((element) => element.userId == id).forEach((element) {
  element.addedby = nameregcontroller.text;
});

// print("afterrrrrrrrrrrr iddddd   ${recipeaddlist.where((element) => element.userId==id).first.addedby}");
// print("nnnnnnnnnnnnnnnnnn");

notifyListeners();
      db.collection("USERS").doc(id).set(editmap,SetOptions(merge: true));
  }


    Future getEditProfileImggallery() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropImageEditProfile(pickedImage.path,"");
    }
   else {
      print('No image selected.');
    }
      
  }

 
   Future getEditProfileImgcamera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
     
        cropImageEditProfile(pickedImage.path, "");

   } else {
      print('No image selected.');
    
    }
  } 

  Future<void> cropImageEditProfile(String path,String filefrom) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      editprofile = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }


// edit profile..............................................>>>>>>>>>>>>>>>>>>>>>>>>

void Editpro(String id,){
     db.collection("USERS").doc(id).get().then((value){
       if (value.exists){
        Map<dynamic,dynamic>Editpromap=value.data() as Map;
        nameregcontroller.text=Editpromap["USER_NAME"].toString();
        
      
       }
     });
     notifyListeners();
}




// edit pro GET.........................
 List<registermodel>editprolist=[];
 void geteditpro(String userid){
  print("kkkkkkkkk"+editprolist.toString());
  db.collection("USERS").doc(userid).get().then((value){
   if(value.exists){
      editprolist.clear();
        Map<dynamic,dynamic>editMap =value.data() as Map;
        editprolist.add(registermodel(
        userid,
        editMap["USER_NAME"].toString(),
        editMap["USER_PHONE"].toString(),
        editMap["PHOTO"]??"",
        editMap["USER_TYPE"].toString(),
          ));
 print("gggggllllrrrrrrrrrr"+editMap["PHOTO"].toString());
 print("tttttttttttttttt"+editMap["USER_NAME"].toString());
      notifyListeners();
   
   }
  });
 }



  // category .............................................................................................

 // file.......... .........................................................................................
    File? categoriefile=null ;
    String image='';

     TextEditingController namecontroller = TextEditingController();
     //loaded 1
     bool categoryloader=false;

   Future<void>addcategories(String from,String oldid) async {
    categoryloader=true;
    notifyListeners();
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    HashMap<String, dynamic>map = HashMap();
    
    map["CATEGORY_NAME"]=namecontroller.text;
    if(from=="NEW"){
      map["CATEGORY_ID"]=id; 

    }
    
    if (categoriefile!= null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(categoriefile!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map["PHOTO"] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
       map['PHOTO'] = Image;
      }
      if(from=="EDIT"){
        db.collection("CATEGORY").doc(oldid).update(map);
      }else{
        db.collection("CATEGORY").doc(id).set(map);
      }
      categoryloader=false;
      notifyListeners();
     
      getcategory();
    notifyListeners();

  }


  void setImage(File image) {
    categoriefile = image;
    notifyListeners();
  }
  Future getImggallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

 
   Future getImgcamera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  } 

  Future<void> cropImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      categoriefile = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }

    
  // clear.................

  void categoryclear() {
    namecontroller.clear();
    categoriefile = null;
    image="";
    }



//get ......................
 
//loader..
bool getcategoryloader=false;
List<categorymodel>categorylist=[];
void getcategory(){
  getcategoryloader=true;
  notifyListeners();
  db.collection("CATEGORY").get().then((value){
    if(value.docs.isNotEmpty){
      getcategoryloader=false;
      notifyListeners();
      categorylist.clear();
      for(var element in value.docs){
      categorylist.add(categorymodel(
        element.id,
         element.get("CATEGORY_NAME").toString(),
          element.get("PHOTO")));
      notifyListeners();
    }
    }
    notifyListeners();  
    
  });
}

//............................................................................................................
  


//................................ ADMIN   RECIPE  ............................................................................

   File? recipefileimg;
  List<File> recipefileimge_Addmin = [];

  TextEditingController recipenamecontroller = TextEditingController();
  TextEditingController recipecategorycontroller = TextEditingController();
  TextEditingController recipeincredient = TextEditingController();
  TextEditingController recipeincredient1 = TextEditingController();
  TextEditingController recipedirection = TextEditingController();
  TextEditingController recipetime = TextEditingController();
  //  TextEditingController addedbycon = TextEditingController();
  

  String productSelectedcategoryid ="";
   bool recipeaddloader=false; 


  Future<void> addYourRecipe(String from, String oldId,String addedby,String userid ) async {
  recipeaddloader = true;
  notifyListeners();
  String id = DateTime.now().microsecondsSinceEpoch.toString();
  HashMap<String, dynamic> addRecipe = HashMap();
  List<String> dum = []; // Initialize dum list here <photo>

  addRecipe["RECIPE_NAME"] = recipenamecontroller.text;
  addRecipe["CATEGORY"] = recipecategorycontroller.text;
  addRecipe["INCREDIENT"] = recipeincredient.text;
  addRecipe["INCREDIENT1"] = recipeincredient1.text;
  addRecipe["DIRECTION"] = recipedirection.text;
  addRecipe["TIME"] = recipetime.text;
  addRecipe["CATEGORY_id"] = productSelectedcategoryid;
  addRecipe["ADDEDBY"] = addedby; 
  addRecipe["USER_ID"] = userid; 
  addRecipe["STATUS"] = "APPROVED"; 
  if (from == "NEW") {
    addRecipe["RECIPE_ID"] = id;
  }

  if (recipefileimge_Addmin.isNotEmpty) {
    // print(recipefileimge_Addmin.length.toString() + 'okasjdioajsdoi');
    int k = 0;
    for (File i in recipefileimge_Addmin) {
      k++;
      String imgKey = "Image$k";
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      print(photoId + 'dddd');
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(i).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          dum.add(value); // Add each URL to dum list
          notifyListeners();
        });
        notifyListeners();
      });
    }
    notifyListeners();
  } else {}

  addRecipe['PHOTO'] = dum; // Assign dum list to 'PHOTO' key

  if (from == "EDIT") {
    db.collection("RECIPE").doc(oldId).update(addRecipe);
  } else {
    db.collection("RECIPE").doc(id).set(addRecipe, SetOptions(merge: true));
  }
  recipeaddloader = false;
  notifyListeners();

  getrecipeadd();
  notifyListeners();
}
       



    Future getrecipeImggallery() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropImagerecipe(pickedImage.path,"");
    }
   else {
      print('No image selected.');
    }
      
  }

 
   Future getrecipeImgcamera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
     
        cropImagerecipe(pickedImage.path, "");

   } else {
      print('No image selected.');
    
    }
  } 

  Future<void> cropImagerecipe(String path,String filefrom) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      recipefileimg = File(croppedFile.path);
       recipefileimge_Addmin.add(recipefileimg!);
     
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }


// clear .......recipeadd

  void recipeaddclear() {
    recipenamecontroller.clear();
    recipecategorycontroller.clear();
    recipeincredient.clear();
    recipeincredient1.clear();
    recipedirection.clear();
    recipetime.clear();
    // addedbycon.clear();
    recipefileimg = null;
    recipefileimge_Addmin.clear();
    
   
    
    
    }


///          ADDMIN GET >>>>>>>
 
bool getrecipeaddloader=false;
List<recipeaddmodel>recipeaddlist=[];
void getrecipeadd(){
  getrecipeaddloader=true;
  db.collection("RECIPE").where("STATUS",isEqualTo: "APPROVED").get().then((value){
    recipeaddlist.clear();
    if(value.docs.isNotEmpty){
      print('valueind'+recipeaddlist.toString());
      getrecipeaddloader=false;
      notifyListeners();
      
      for(var element in value.docs){
        try{
        recipeaddlist.add(recipeaddmodel(
        element.id, 
        element.get("RECIPE_NAME").toString(),
        element.get("PHOTO"),
        element.get("CATEGORY").toString(),
        element.get("DIRECTION").toString(),
        element.get("TIME").toString(),
        element.get("INCREDIENT").toString(),
        element.get("INCREDIENT1").toString(),
        element.get("CATEGORY_id").toString(),
        element.get("ADDEDBY").toString(),
        element.get("USER_ID").toString(),

        ));
         print('user idddssssssssfffff     '+ element.get("USER_ID").toString());
                  print('user idddssssssssfffff     '+ element.get("ADDEDBY").toString());
        }catch(e){
          print("something");
        }
    
      notifyListeners();
    }
    print(recipeaddlist.map((e) => e.photo.toString()+'iowjodosmdal'));
    }
    notifyListeners();  
    
  });
}



// this get function use to  category id fetch cheyyth  kittann  matte fn id pass cheyyumbo arg error varrannu athukond vere oru get fn undaakki

List<recipeaddmodel>catnewfatch=[];
void getrecipeadd2(String cateId){
  getrecipeaddloader=true;
  db.collection("RECIPE").where("STATUS",isEqualTo: "APPROVED").where("CATEGORY_id",isEqualTo: cateId).get().then((value){
    catnewfatch.clear();
    if(value.docs.isNotEmpty){
      print('valueind'+catnewfatch.toString());
      getrecipeaddloader=false;
      notifyListeners();
      
      for(var element in value.docs){
        try{
        catnewfatch.add(recipeaddmodel(
        element.id, 
        element.get("RECIPE_NAME").toString(),
        element.get("PHOTO"),
        element.get("CATEGORY").toString(),
        element.get("DIRECTION").toString(),
        element.get("TIME").toString(),
        element.get("INCREDIENT").toString(),
        element.get("INCREDIENT1").toString(),
        element.get("CATEGORY_id").toString(),
        element.get("ADDEDBY").toString(),
        element.get("USER_ID").toString(),

        ));
         print('user idddssssssssfffff     '+ element.get("USER_ID").toString());
                  print('user idddssssssssfffff     '+ element.get("ADDEDBY").toString());
        }catch(e){
          print("something");
        }
    
      notifyListeners();
    }
    print(catnewfatch.map((e) => e.photo.toString()+'iowjodosmdal'));
    }
    notifyListeners();  
    
  });
}






/// .............................USER RECIPE ADD.......................................

  
   File? userrecipefileimg1;
   List<File>userrecipe_addlist =[];

    TextEditingController userrecipenamecontroller = TextEditingController();
    TextEditingController userrecipecategorycontroller = TextEditingController();
    TextEditingController userrecipeincredient = TextEditingController();
    TextEditingController userrecipeincredient1 = TextEditingController();
    TextEditingController userrecipedirection = TextEditingController();
    TextEditingController userrecipetime = TextEditingController();
 
   Future<void>useraddyourrecipe(String userId,String userName,String phone) async {
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    HashMap<String, dynamic>useraddrecipe = HashMap();
    List<String> userdum =[];

    useraddrecipe["STATUS"]="REQUEST";
    useraddrecipe["USER_ID"]=userId;
    useraddrecipe["RECIPE_NAME"]=userrecipenamecontroller.text;
    useraddrecipe["CATEGORY"]=userrecipecategorycontroller.text;
    useraddrecipe["INCREDIENT"]=userrecipeincredient.text;
    useraddrecipe["INCREDIENT1"]=userrecipeincredient1.text; 
    useraddrecipe["DIRECTION"]=userrecipedirection.text;
    useraddrecipe["TIME"]=userrecipetime.text;
    useraddrecipe["CATEGORY_id"]=productSelectedcategoryid; 
    useraddrecipe["ADDEDBY"]=userName; 
    useraddrecipe["RECIPE_ID"]=id;
    

      // .................................

   if (userrecipe_addlist.isNotEmpty) {
    // print(recipefileimge_Addmin.length.toString() + 'okasjdioajsdoi');
    int k = 0;
    for (File i in userrecipe_addlist) {
      k++;
      String imgKey = "Image$k";
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      print(photoId + 'dddd');
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(i).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          userdum.add(value); // Add each URL to dum list
          notifyListeners();
        });
        notifyListeners();
      });
    }
    notifyListeners();
  } else {}

     useraddrecipe['PHOTO'] = userdum;  
     db.collection("RECIPE").doc(id).set(useraddrecipe);
     
     getuserrecipeadd();
     notifyListeners();
       }


    Future getuseraddImggallery() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropImageuseradd(pickedImage.path, "");
      }else {
      print('No image selected.');
    }

  }

 
   Future getuseraddImgcamera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
       cropImageuseradd(pickedImage.path, "");
      }else {
      print('No image selected.');
    }
    }
   

    Future<void> cropImageuseradd(String path, String filefrom) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
 

    if (croppedFile != null) {
      
         userrecipefileimg1 = File(croppedFile.path);
         userrecipe_addlist.add(userrecipefileimg1!);
         notifyListeners();
        }

  }

    void userrecipeaddclear() {
    userrecipenamecontroller.clear();
    userrecipecategorycontroller.clear();
    userrecipeincredient.clear();
    userrecipeincredient1.clear();
    userrecipedirection.clear();
    userrecipetime.clear();
    // useraddedbycon.clear();
    userrecipefileimg1=null;
    userrecipe_addlist.clear();
    
 
    }

    
///  ......... USER GET >>>>>>  -------- request ----------

  List<useraddrecipemodel>useraddrecipe=[];
  void getuserrecipeadd(){
    
  db.collection("RECIPE").where("STATUS",isEqualTo:"REQUEST" ).get().then((value){
    useraddrecipe.clear();
    if(value.docs.isNotEmpty){
      print("valll++"+useraddrecipe.toString());
      for(var element in value.docs){
        try{
        useraddrecipe.add(useraddrecipemodel(
        element.id, 
        element.get("USER_ID").toString(),
        element.get("RECIPE_NAME").toString(),
        element.get("PHOTO"),
        element.get("CATEGORY").toString(),
        element.get("DIRECTION").toString(),
        element.get("TIME").toString(),
        element.get("INCREDIENT").toString(),
        element.get("INCREDIENT1").toString(),
        element.get("CATEGORY_id").toString(),
        element.get("ADDEDBY").toString(),
        

       

        ));
        }catch(e){
            print("some"+e.toString());
        }

      notifyListeners();
    }
   print(useraddrecipe.map((e) => e.photo.toString()+'ooooooooooo'));
    }
    notifyListeners();  
    
  });
}

//   ---------------  APPROVED  -------------------- get

/// 2 user recipe add profile screen Approved aayyyath mathram fetcheeth iddkkan ............. /24/05/2024 .......................

  List<useraddrecipemodel>useraddpro=[];
  void getuseraddpro(String userid){
    print("nnnnnnnoo"+userid);
    db.collection("RECIPE").where("USER_ID",isEqualTo:userid).where("STATUS",isEqualTo:"APPROVED").get().then((value){
    useraddpro.clear();
    if(value.docs.isNotEmpty){
    print("valllmm"+userid.toString());
    for(var element in value.docs){
        try{
        useraddpro.add(useraddrecipemodel(
        element.id, 
        element.get("USER_ID").toString(),
        element.get("RECIPE_NAME").toString(),
        element.get("PHOTO"),
        element.get("CATEGORY").toString(),
        element.get("DIRECTION").toString(),
        element.get("TIME").toString(),
        element.get("INCREDIENT").toString(),
        element.get("INCREDIENT1").toString(),
        element.get("CATEGORY_id").toString(),
        element.get("ADDEDBY").toString(),
        

       

        ));
        }catch(e){
            print("some"+e.toString());
        }

      notifyListeners();
    }
    print("nnnnnnnoo1111111"+userid);
   print(useraddpro.map((e) => e.photo.toString()+'ooooooooooo'));
    }
    notifyListeners();  
    
  });
}




///................... APPROVED  AND REJECT ...... USER RECIPE >> ..............................................
///
///

void UserRecipeStatusAccept(String id,from, context){
  db.collection("RECIPE").doc(id).set({"STATUS":from},SetOptions(merge: true));
  if(from=="APPROVED"){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Approved successfuly"),backgroundColor: Colors.green,));
  }else{
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your recipe rejected"),backgroundColor:orange,));
  }
  
  // getregistration();
  notifyListeners();

}








///.........<<<<<....  REGISTRATION  ...>>>>>.........................................


TextEditingController nameregcontroller =TextEditingController();
TextEditingController phoneregcontroller =TextEditingController();
void addregistration(){
String id =DateTime.now().microsecondsSinceEpoch.toString();
HashMap<String,dynamic> registermap =HashMap();
registermap["STATUS"]="REQUEST";
registermap["REGISTER_ID"]=id;
registermap["REGISTER_NAME"]=nameregcontroller.text;
registermap["REGISTER_PHONE"]=phoneregcontroller.text;
db.collection("REGISTRATION").doc(id).set(registermap);

// notifyListeners();

 
}          

// get REG>>>
List<registermodel>registerlist=[];
void getregistration(){
  db.collection("REGISTRATION").where("STATUS",isEqualTo:"REQUEST" ).get().then((value){
    if (value.docs.isNotEmpty){
      registerlist.clear();
      for(var element in value.docs){
         Map<dynamic,dynamic> registerMap = element.data();
          registerlist.add(registermodel(
          element.id,
          registerMap["REGISTER_NAME"].toString(),
          registerMap["REGISTER_PHONE"].toString(),
          registerMap["PHOTO"]??"",
          registerMap["STATUS"].toString(),
          ));
        notifyListeners(); 
      }
    }
  });
  notifyListeners();
}

//clear................................................./

void signupclear(){
  nameregcontroller.clear();
  phoneregcontroller.clear();
}


// status approved 

void statusapproved(String id,String name,String phone,BuildContext context){
  HashMap<String,dynamic>cusdata = HashMap();
  HashMap<String,dynamic>usermap = HashMap();

  cusdata["STATUS"]="APPROVED";
  db.collection("REGISTRATION").doc(id).set(cusdata,SetOptions(merge: true));
  usermap["USER_ID"] =id;
  usermap["USER_NAME"] =name;
  usermap["USER_PHONE"] ="+91$phone";
  usermap["USER_TYPE"] ="USER";
  db.collection("USERS").doc(id).set(usermap);
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Approved successfuly"),backgroundColor: Colors.green,));

  getregistration();
  notifyListeners();

}


void statusrecject(String id, BuildContext context){
  HashMap<String,dynamic>rejectmap = HashMap();
  rejectmap["STATUS"]="REJECTED";
  db.collection("REGISTRATION").doc(id).set(rejectmap,SetOptions(merge: true));
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your request rejected"),backgroundColor:Colors.red ,));

   getregistration();
   notifyListeners();

}

void getcustomer(){
  db.collection("REGISTRATION").where("STATUS",isEqualTo:"APPROVED" ).get().then((value){
    if (value.docs.isNotEmpty){
      registerlist.clear();
      for(var element in value.docs){
        registerlist.add(registermodel(
          element.id,
          element.get("REGISTER_NAME").toString(),
          element.get("REGISTER_PHONE").toString(),
          element.get("PHOTO").toString(),
          element.get("STATUS").toString()
          ));
        notifyListeners();
      }
    }
  });
  notifyListeners();
}

// carousel.........................................



    File? carouseladdmin=null ;
    String caroimg='';

     TextEditingController carouselnamecontroller = TextEditingController();
     TextEditingController carouseladdbycontroller = TextEditingController();

  //loader ...
   bool carouselloader=false;
   Future<void>addcarousel(String from,String oldid) async {
    carouselloader=true;
    notifyListeners();
    // print("c");
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    HashMap<String, dynamic>caromap = HashMap();
    caromap["CAROUSEL_NAME"]=carouselnamecontroller.text;
    caromap["CATROUSEL_ADD_BY"]=carouseladdbycontroller.text;
    if(from=="NEW"){
      caromap["CAROUSEL_ID"]=id;
    }
    
    
        if (carouseladdmin!= null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(carouseladdmin!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          caromap["PHOTO"] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
       caromap['PHOTO'] = caroimg;
      }
   
       if(from=="EDIT"){
         db.collection("CAROUSEL").doc(oldid).update(caromap);
      }else{
        db.collection("CAROUSEL").doc(id).set(caromap);
      }
      //loader
      carouselloader=false;
      notifyListeners();
     getcarouseladd();
     notifyListeners();
       }

    Future getcarouselImggallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropImagecarousel(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

 
   Future getcarouselImgcamera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropImagecarousel(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  } 

  Future<void> cropImagecarousel(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      carouseladdmin = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }

// clear.........................
void carousel(){
  carouselnamecontroller.clear();
  carouseladdbycontroller.clear();
  carouseladdmin=null;
  


}



//.............. get carousel...................
//loader..
bool getcarouselloader=false;

List<carouseladdmodel>carouseladdlist=[];
void getcarouseladd(){
  //loader
getcarouselloader=true;
notifyListeners();
  db.collection("CAROUSEL").get().then((value){
    if(value.docs.isNotEmpty){
      getcarouselloader=false;
      notifyListeners();
      carouseladdlist.clear();
      for(var element in value.docs){
      carouseladdlist.add(carouseladdmodel(
        element.id, 
        element.get("CAROUSEL_NAME").toString(),
        element.get("PHOTO"),
        element.get("CATROUSEL_ADD_BY").toString(),
        


        ));
         notifyListeners();
     
    }
    }
    notifyListeners();  
    
  });
}




//////////////////////////


//  edit..............
void Editcategoey(String id){
  db.collection("CATEGORY").doc(id).get().then((value){
    if(value.exists){
      Map<dynamic,dynamic>map=value.data() as Map;
      namecontroller.text=map["CATEGORY_NAME"].toString();
      image=map["PHOTO"];
      getcategory();
      notifyListeners();
    }
  });
  notifyListeners();
 
}

//delete..........................

void deletecategory(id,BuildContext context){
  db.collection("CATEGORY").doc(id).delete();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Delete successfully"),
  backgroundColor: orange,
  ));
  notifyListeners();
  getcategory();

}
//....................................................................



//  rescipe edit..............
void Editrecipe(String id){
  db.collection("RECIPE").doc(id).get().then((value){
    if(value.exists){
      Map<dynamic,dynamic>resmap=value.data() as Map;
      recipenamecontroller.text=resmap["RECIPE_NAME"].toString();
      recipecategorycontroller.text=resmap["CATEGORY"].toString();
      recipeincredient.text=resmap["INCREDIENT"].toString();
      recipedirection.text=resmap["DIRECTION"].toString();
      recipetime.text=resmap["TIME"].toString();
      productSelectedcategoryid=resmap["CATEGORY_id"].toString();
      // addedby.text=resmap["ADDEDBY"].toString();
      // recimg=resmap["PHOTO"];
      getrecipeadd();
      notifyListeners();
    }
  });
  notifyListeners();
 
}
  
// res delete..........................

void deleterecipe(id,BuildContext context){
  db.collection("RECIPE").doc(id).delete();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Delete successfully"),
  backgroundColor: orange,
  ));
  notifyListeners();
getrecipeadd(); 
}


//....................................................................



// carousel...................

void Editcarousel(String id,){
     db.collection("CAROUSEL").doc(id).get().then((value){
       if (value.exists){
        Map<dynamic,dynamic>caromap=value.data() as Map;
        carouselnamecontroller.text=caromap["CAROUSEL_NAME"].toString();
        carouseladdbycontroller.text=caromap["CATROUSEL_ADD_BY"].toString();
        caroimg=caromap["PHOTO"];
      getcarouseladd();
      notifyListeners();
       }
     });
     notifyListeners();
}

// delete........................

void deletecaro(id,BuildContext context){
  db.collection("CAROUSEL").doc(id).delete();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Delete successfully"),
  backgroundColor: orange,
  ));
  notifyListeners();
getcarouseladd(); 
}

//............................



/// COMMENTS .....................

TextEditingController reviewController = TextEditingController();
  void clearReviews(){
   reviewController.clear();

  }

///           ADD REVIEW................
Future <void> addReviews(String userid,String name,recId) async{
    print("hello"+name);
    String id= DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> reviewMap = HashMap();
    reviewMap["REVIEW"] = reviewController.text.toString();
    reviewMap["USER_ID"] = userid;
    reviewMap["USER_NAME"] = name;
    reviewMap["TIME"] = DateTime.now();
    reviewMap["REVIEW_ID"] = id;
    reviewMap["RECIPE_ID"] = recId;
    
    db.collection("REVIEWS").doc(id).set(reviewMap);
    notifyListeners();
    getReviews(recId);
// print("bbbbb ${reviewMap["REVIEW"] = reviewController.text.toString()}");
}



///          GET REVIEW ..................
List<ReviewModel> reviewList = [];
void getReviews(String recId){
  db.collection("REVIEWS").where("RECIPE_ID",isEqualTo: recId).get().then((value) {
  reviewList.clear();
  print("mmmmmmmmnn"+reviewList.toString());
    if(value.docs.isNotEmpty){
      print("nnnnnnjjj"+reviewList.toString());
      for(var value in value.docs){ 
         print("nnnnnnjjj"+recId.toString());
        Map<dynamic,dynamic> revMap=  value.data();
        reviewList.add(ReviewModel(
           revMap["USER_ID"].toString(),
           value.id, 
           revMap["USER_NAME"].toString(),
           DateFormat.yMMMMEEEEd().format(revMap['TIME'].toDate()).toString(),
           revMap["REVIEW"].toString(),
           revMap["REVIEW_ID"].toString(),
           revMap["RECIPE_ID"].toString(),
             ));

             print("bbdhbcdsbccb"+value.get("REVIEW").toString(),);
        notifyListeners();
      }
      notifyListeners();


    }
    notifyListeners();

});
}







 
}











