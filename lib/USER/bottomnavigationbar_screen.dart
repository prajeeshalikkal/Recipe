import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/CONSTANTS/mycolors.dart';
import 'package:recipeapp/PROVIDER/mainprovider.dart';
import 'package:recipeapp/USER/home_screen.dart';
import 'package:recipeapp/USER/profile_screen.dart';
import 'package:recipeapp/USER/search_screen.dart';

class Bottombar extends StatefulWidget {
  String userid;
  String name;
  String phone;
  String photo;
  
  Bottombar({super.key, required this.userid, required this.name, required this.phone, required this.photo});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int selectedIndex = 0;
  bool isProfileLoaded = false;

  void _itemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (index == 2 && !isProfileLoaded) {
        Provider.of<mainprovider>(context, listen: false).Editpro(widget.userid);
        Provider.of<mainprovider>(context, listen: false).getCheckFav(widget.userid);
        isProfileLoaded = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("printname: " + widget.name);
    print("printUserid: " + widget.userid);
    var pages = [
      home(userid: widget.userid, name: widget.name, phone: widget.phone, photo: widget.photo),
      search(userid: widget.userid, name: widget.name, phone: widget.phone, photo: widget.photo),
      Profile(userid: widget.userid, name: widget.name, phone: widget.phone, photo: widget.photo),
    ];

    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromARGB(255, 255, 72, 0),
        unselectedItemColor: Colors.white,
        backgroundColor: bottamcolor.withOpacity(1),
        selectedLabelStyle: TextStyle(fontSize: 12),
        unselectedLabelStyle: TextStyle(fontSize: 12),
        currentIndex: selectedIndex,
        onTap: _itemTapped,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search_outlined),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person_2_outlined),
          ),
        ],
      ),
    );
  }
}
