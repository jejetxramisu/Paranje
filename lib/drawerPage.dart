import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:paranje_recreatelogin/ParanjeLogin.dart';
import 'package:paranje_recreatelogin/drawerItem.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageDrawer extends StatefulWidget {
  PageDrawer({Key? key}) : super(key: key);

  @override
  State<PageDrawer> createState() => _PageDrawerState();
}

class _PageDrawerState extends State<PageDrawer> {
  String? name = '';
  getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    name = await preferences.getString('name');
  }

  @override
  Widget build(BuildContext context) {
    getName();
    return Center(
        child: Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/userImg.jpg'),
                    radius: 40,
                  ),
                  Column(
                    children: [
                      Text(
                        name!,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(2, 82, 49, 1)),
                      )
                    ],
                  )
                ]),
          ),
          SizedBox(
            height: 50,
          ),
          buildDrawerItems(),
          SizedBox(
            height: 15,
          ),
          buildLogout()
        ],
      )),
    ));
  }

  Widget buildDrawerItems() {
    return Column(
      children: ItemBurgerMenu.all
          .map((item) => ListTile(
                title: Text(
                  item.title,
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(2, 82, 49, 1),
                      fontWeight: FontWeight.w600),
                ),
              ))
          .toList(),
    );
  }

  Widget buildLogout() {
    return InkWell(
      onTap: () async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.clear();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginParanje()),
            (route) => false);
      },
      child: ListTile(
        title: Text(
          'Keluar',
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.w700, fontSize: 20),
        ),
      ),
    );
  }
}
