import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paranje_recreatelogin/CageModel.dart';
import 'package:paranje_recreatelogin/DetailCage.dart';
import 'package:paranje_recreatelogin/drawerPage.dart';
import 'package:paranje_recreatelogin/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Beranda extends StatefulWidget {
  Beranda({Key? key}) : super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> with SingleTickerProviderStateMixin {
  late bool isdraweropen;
  late bool isdragging = false;
  late double xOffset;
  late double yOffset;
  late double scalefactor;

  void opendrawer() => setState(() {
        xOffset = 230;
        yOffset = 150;
        scalefactor = 0.75;
        isdraweropen = true;
      });

  void closedrawer() => setState(() {
        xOffset = 0;
        yOffset = 0;
        scalefactor = 1;
        isdraweropen = false;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [buildDrawer(), buildPage()]),
      backgroundColor: Color.fromRGBO(205, 254, 234, 1),
    );
  }

  Widget buildDrawer() => SafeArea(
          child: Container(
        width: 270,
        child: PageDrawer(),
      ));

  @override
  void initState() {
    super.initState();
    closedrawer();
  }

  Widget buildPage() {
    return GestureDetector(
      onTap: closedrawer,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scalefactor),
        child: AbsorbPointer(
          absorbing: isdraweropen,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(isdraweropen ? 25 : 0),
              child: Container(
                child: HomePage(
                  opendrawer: () => opendrawer(),
                ),
              )),
        ),
      ),
    );
  }
}
