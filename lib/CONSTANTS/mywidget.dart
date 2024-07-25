import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';


// textformfield.........................
Widget txtformfield(String text,TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      child: TextFormField(
        inputFormatters: [ LengthLimitingTextInputFormatter(10)],
        controller:controller,
        keyboardType: TextInputType.number,
        style: TextStyle(color: white),
        decoration: InputDecoration(
          fillColor: myblack,
          filled: true,
          hintText: text,
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
        //vali
         validator: (value){
                if(value!.isEmpty){
                  return "This field is required";
                }else{}
              },
      ),
    ),
  );
}

// textformfield 2......................................
Widget txtformfield2(String text ,TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: white),
        decoration: InputDecoration(
          fillColor: myblack,
          filled: true,
          hintText: text,
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

// textformfield 3.......................................
Widget txtformfield3(String text,) {
  return Container(
    height:54,
    child: TextFormField(
      // onChanged: (value) {
      //   change(value);
      // },
      style: TextStyle(color: white),
      decoration: InputDecoration(
        fillColor: myblack,
        filled: true,
        hintText: text,
        prefixIcon: Icon(
          Icons.search_outlined,
          color: white,
        ),
        hintStyle: TextStyle(color: white, fontSize: 15),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
            width: 0.5,
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
            width: 0.5,
          ),
          // borderSide: const BorderSide(
          //   color: Colors.black26,
          //   width:1,
          // ),
        ),
      ),
    ),
  );
}

// textbutton.............................................
Widget textbutton(String text, BuildContext context, ) {
  return Container(
    height: 46,
    width: 336,
    decoration: BoxDecoration(
      color: gray,
      borderRadius: BorderRadius.circular(28),
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: white,
        ),
      ),
    ),
  );
}





//addrecipenamess........................................

Widget addrecipename(context, String text1, String text2, TextEditingController controller) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return Column(
    children: [
      SizedBox(width: width / 12),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(text1,
                style: TextStyle(
                    color: white, fontSize: 16, fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
                keyboardType:  TextInputType.multiline,
                maxLines:null,
                controller: controller,
                style: TextStyle(color: white),
                decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: text2,
                hintStyle: TextStyle(color: gray),
              ),

              validator: (value){
                if(value!.isEmpty){
                  return "This field is required";
                }else{}
              },
            ),
          ),
        ],
      ),
    ],
  );
}

// dropdown............................................
Widget addrecipenamedrop(context, String text1, String text2) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return Column(
    children: [
      SizedBox(width: width / 12),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text1,
                    style: TextStyle(
                        color: white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
                Icon(
                  Icons.arrow_drop_down,
                  color: white,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: TextStyle(color: white),
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: text2,
                hintStyle: TextStyle(color: gray),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
////////////////////////////////////////////////////////////

//admin side userlist button........................................................111111111111111
Widget homelistbutton(context, text,) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return Center(
    child: Container(
      height: height / 20,
      width: width / 1.1,
      decoration: BoxDecoration(
        color: gray,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Center(                                
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: white,
          ),
        ),
      ),
    ),
  );
}

// user recipe button ............................................
Widget recipebutton(context, Color, text, ) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return Center(
    child: Container(
      height: height / 28,
      width: width / 2.6,
      decoration: BoxDecoration(
        color: Color,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: white,
          ),
        ),
      ),
    ),
  );
}
