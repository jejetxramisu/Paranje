import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paranje_recreatelogin/CreateNewPassword.dart';
import 'package:paranje_recreatelogin/loginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:http/http.dart' as http;

import 'beranda.dart';

class LoginParanje extends StatefulWidget {
  LoginParanje({Key? key}) : super(key: key);

  @override
  State<LoginParanje> createState() => _LoginParanjeState();
}

class _LoginParanjeState extends State<LoginParanje> {
  PanelController popup = new PanelController();
  PanelController popupError = new PanelController();
  PanelController popupWaiting = new PanelController();
  final _formKey = GlobalKey<FormState>();
  TextEditingController nomorhp = TextEditingController();
  TextEditingController password = TextEditingController();
  bool visibilityicon = false;
  LoginModel? loginModel;

  @override
  void initState() {
    super.initState();
    // getSession();
  }

  addData(noHp, password) async {
    try {
      var response = await http.post(
          Uri.parse("https://paranje-api.ptape.com/v1/auth/login"),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode({"phone": noHp, "password": password}));
      print(response.statusCode);
      final output = jsonDecode(response.body);
      loginModel = LoginModel.fromJson(json.decode(response.body.toString()));

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Proses Data")));
        if (loginModel!.message == 'OK') {
          saveSession(loginModel!.data!.token.toString(),
              loginModel!.data!.name.toString());
        }
        Future.delayed(Duration(seconds: 1), (() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Beranda()));
        }));
      } else {
        popupError.open();
      }
      print(response.statusCode);
      print(response.body);
    } catch (e) {
      throw e.toString();
    }
  }

  saveSession(String token, String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('token', token);
    await preferences.setString('name', name);
    await preferences.setBool('isLogin', true);
    print(preferences.getString('token'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: [
        buildPage(),
        buildPanelForgotPassword(),
        buildPanelError(),
        buildPanelWaiting(),
      ]),
    ));
  }

  Widget buildPage() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: 240,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage(
                      'assets/backgroundLogin.png',
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50.0, left: 50.0, top: 35),
            child: Image.asset('assets/imageLogin.png'),
          )
        ],
      ),
      Padding(
          padding:
              const EdgeInsets.only(top: 30, left: 30, bottom: 20, right: 30),
          child: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Masuk Akun',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color.fromRGBO(2, 82, 49, 1)),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Nomor Hp",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                    colorScheme: ThemeData()
                        .colorScheme
                        .copyWith(primary: Color.fromRGBO(2, 82, 49, 1))),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kamu belum mengisi nomor HP';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: nomorhp,
                  decoration: InputDecoration(
                      hintText: "Masukkan nomor HP",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(194, 214, 206, 1),
                          fontWeight: FontWeight.w800,
                          fontSize: 19)),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Password",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                    colorScheme: ThemeData()
                        .colorScheme
                        .copyWith(primary: Color.fromRGBO(2, 82, 49, 1))),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kamu belum mengisi password';
                    }
                    return null;
                  },
                  obscureText: !visibilityicon,
                  controller: password,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            visibilityicon = !visibilityicon;
                          });
                        },
                        icon: Icon(
                          visibilityicon
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color.fromRGBO(2, 82, 49, 1),
                        ),
                      ),
                      hintText: "Masukkan Password",
                      hintStyle: TextStyle(
                          color: Color.fromRGBO(194, 214, 206, 1),
                          fontWeight: FontWeight.w800,
                          fontSize: 19)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(2, 82, 49, 1)),
                  onPressed: (() {
                    setState(() {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        addData(nomorhp.text, password.text);
                        // if (nomorhp.text == '08112288990' &&
                        //     password.text == 'admin321') {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //       const SnackBar(content: Text("Proses Data")));
                        //   getData(nomorhp.text, password.text);
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => Beranda()));
                        // } else {
                        //   popupError.open();
                        // }
                      }
                    });
                  }),
                  child: Text(
                    "Masuk",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              )),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  onPressed: (() {
                    setState(() {
                      popup.open();
                    });
                  }),
                  child: Text(
                    "Saya Lupa Password",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(2, 82, 49, 1)),
                  ),
                ),
              ))
            ]),
          )),
    ]);
  }

  Widget buildPanelForgotPassword() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SlidingUpPanel(
        padding: EdgeInsets.only(top: 20, right: 30, left: 30, bottom: 10),
        backdropEnabled: true,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        minHeight: 0,
        maxHeight: 200,
        controller: popup,
        panelBuilder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Lupa Password",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(2, 82, 49, 1)),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Apakah kamu ingin menyetel ulang password?",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(2, 82, 49, 1)),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: TextButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                          color:
                                              Color.fromRGBO(2, 82, 49, 1)))),
                        ),
                        onPressed: (() {
                          setState(() {
                            popup.close();
                          });
                        }),
                        child: Text(
                          "Tidak",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(2, 82, 49, 1)),
                        ))),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(2, 82, 49, 1))),
                        onPressed: (() {
                          setState(() {
                            popupWaiting.open();
                            popup.close();
                          });
                        }),
                        child: Text(
                          "Ya",
                          style: TextStyle(fontSize: 18),
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildPanelError() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SlidingUpPanel(
        padding: EdgeInsets.only(top: 20, right: 30, left: 30, bottom: 10),
        backdropEnabled: true,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        minHeight: 0,
        maxHeight: 300,
        controller: popupError,
        panelBuilder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset("assets/Shape.png")),
            SizedBox(
              height: 14,
            ),
            Text(
              "Nomor HP/Password salah",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(2, 82, 49, 1)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Mohon cek kembali dan masukkan nomor HP atau Password dengan benar.",
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(2, 82, 49, 1)),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(2, 82, 49, 1))),
                        onPressed: (() {
                          setState(() {
                            popupError.close();
                          });
                        }),
                        child: Text(
                          "Oke",
                          style: TextStyle(fontSize: 18),
                        ))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPanelWaiting() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SlidingUpPanel(
        padding: EdgeInsets.only(top: 30, right: 30, left: 30, bottom: 10),
        backdropEnabled: true,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        minHeight: 0,
        maxHeight: 260,
        controller: popupWaiting,
        panelBuilder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mohon tunggu sebentar",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(2, 82, 49, 1)),
            ),
            SizedBox(
              height: 27,
            ),
            Text(
              "Admin akan segera mengirimkan password sementara untuk kamu.",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(2, 82, 49, 1)),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(2, 82, 49, 1))),
                        onPressed: (() {
                          setState(() {
                            Timer(Duration(seconds: 1), (() {
                              popupWaiting.close();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => NewPassword()));
                            }));
                          });
                        }),
                        child: Text(
                          "oke",
                          style: TextStyle(fontSize: 18),
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
