import 'dart:async';

import 'package:flutter/material.dart';
import 'package:paranje_recreatelogin/ParanjeLogin.dart';
import 'package:paranje_recreatelogin/beranda.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ParanjeSplashscreen extends StatefulWidget {
  ParanjeSplashscreen({Key? key}) : super(key: key);

  @override
  State<ParanjeSplashscreen> createState() => _ParanjeSplashscreenState();
}

class _ParanjeSplashscreenState extends State<ParanjeSplashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2), () async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      if (preferences.getString('token') == null) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginParanje()));
      } else {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Beranda()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/bgSplashscreen.png"))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Center(child: Image.asset("assets/ParanjeLogo.png")),
            Center(child: Image.asset("assets/NameParanje.png")),
            Expanded(child: Container()),
            Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Center(child: Image.asset("assets/Ver2.1.2.png"))),
          ],
        ),
      ),
    );
  }
}
