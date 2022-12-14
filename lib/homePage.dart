import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:http/http.dart' as http;
import 'CageModel.dart';
import 'DetailCage.dart';

class HomePage extends StatefulWidget {
  final VoidCallback opendrawer;

  HomePage({Key? key, required this.opendrawer}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(2, 82, 49, 1),
        title: Center(child: Text('Beranda')),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
        leading:
            IconButton(onPressed: widget.opendrawer, icon: Icon(Icons.menu)),
      ),
      body: dashboard(),
    );
  }

  String dropdownValue = 'Semua Kandang';
  bool _isLoad = false;
  PanelController popupDropDown = new PanelController();
  List<String> dropdownDataNama = [
    'Semua Kandang',
    'Kandang Aktif',
    'Kandang Tidak Aktif'
  ];
  List<String> dropdownDataJumlah = ['24', '12', '12'];
  CageModel? cageModel;
  List<CageModel> _data = [];
  String? token = '';
  String? name = '';
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController? _controller;
  Animation<double>? _scaleAnimation;
  Animation<double>? _menuScaleAnimation;
  Animation<Offset>? _slideAnimation;

  Future<CageModel?> getAllListPL() async {
    setState(() {
      _isLoad = true;
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = await preferences.getString('token');
    name = await preferences.getString('name');
    var data = await http.get(
        Uri.parse("https://paranje-api.ptape.com/v1/cage?limit=10&page=1"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    print(data.body);
    cageModel = CageModel.fromJson(json.decode(data.body.toString()));
    setState(() {
      _isLoad = false;
    });
    return cageModel;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // print(cageModel);
  }

  Widget dashboard() {
    return Stack(children: [
      buildPage(),
      buildUserName(),
      buildCardList(),
      buildPanelDropdown(),
    ]);
  }

  Widget buildUserName() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hai $name",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Selamat datang di perternakanmu",
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w300, color: Colors.white),
          ),
          buildDropdown(),
        ],
      ),
    );
  }

  Widget buildPage() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Stack(children: [
        Container(
            alignment: Alignment.topCenter,
            height: 250,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/berandaBackground.png',
                    )))),
      ])
    ]);
  }

  Widget buildDropdown() {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 40),
      child: GestureDetector(
        onTap: () {
          setState(() {
            popupDropDown.open();
          });
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          height: 60,
          child: Row(
            children: [
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Semua Kandang',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    ),
                  )),
              Expanded(
                  child: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPanelDropdown() {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SlidingUpPanel(
          padding: EdgeInsets.only(top: 20, right: 30, left: 30, bottom: 10),
          backdropEnabled: true,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          minHeight: 0,
          maxHeight: 300,
          controller: popupDropDown,
          panelBuilder: (controller) =>
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Text(
                "Tampilkan",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(2, 82, 49, 1)),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  setState(() {
                    popupDropDown.close();
                  });
                },
                icon: Icon(Icons.close),
                color: Color.fromRGBO(2, 82, 49, 1),
                iconSize: 30,
              )
            ]),
            SizedBox(
              height: 10,
            ),
            for (int i = 0; i < dropdownDataNama.length; i++)
              Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: RadioListTile(
                  activeColor: Color.fromRGBO(2, 82, 49, 1),
                  value: dropdownDataNama[i],
                  groupValue: dropdownValue,
                  onChanged: (value) {
                    setState(() {
                      dropdownValue = value as String;
                    });
                  },
                  title: Text(
                    dropdownDataNama[i],
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(2, 82, 49, 1)),
                  ),
                  secondary: Text(
                    dropdownDataJumlah[i] + ' kandang',
                    style: TextStyle(color: Color.fromRGBO(2, 82, 49, 1)),
                  ),
                ),
              )
          ]),
        ));
  }

  Widget buildCardList() {
    return FutureBuilder(
      future: getAllListPL(),
      builder: ((BuildContext context, AsyncSnapshot<CageModel?> snapshot) {
        return snapshot.data == null
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.only(top: 200, left: 15, right: 15),
                child: ListView.builder(
                    itemCount: snapshot.data!.data!.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 2,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Image(
                                  width: 50,
                                  height: 50,
                                  image: AssetImage('assets/KandangImage.png'),
                                ),
                                title: Text(
                                  cageModel!.data!.data![index].name.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                subtitle: Text(
                                  cageModel!.data!.data![index].logActivity
                                      as String,
                                  style: TextStyle(
                                      color: Color.fromRGBO(4, 149, 89, 1),
                                      fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 4),
                                child: Divider(thickness: 1),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8, left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Populasi',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            cageModel!
                                                .data!.data![index].population
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800),
                                          )
                                        ]),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Ayam Mati',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            cageModel!
                                                .data!.data![index].deadChicken
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800),
                                          )
                                        ]),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Bobot Sampel',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            cageModel!
                                                .data!.data![index].weightSample
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800),
                                          )
                                        ]),
                                  ],
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(bottom: 15),
                              //   child: Container(
                              //     padding: EdgeInsets.only(
                              //         top: 10, right: 10, left: 10, bottom: 10),
                              //     decoration: BoxDecoration(
                              //         color: Color.fromRGBO(255, 238, 238, 1)),
                              //     margin: EdgeInsets.only(
                              //         top: 20, left: 16, right: 16),
                              //     child: Column(
                              //       crossAxisAlignment:
                              //           CrossAxisAlignment.start,
                              //       children: [
                              //         Row(
                              //           children: [
                              //             Column(
                              //               crossAxisAlignment:
                              //                   CrossAxisAlignment.start,
                              //               children: [
                              //                 Text(
                              //                   'Cek Suhu Pukul 14:00',
                              //                   style: TextStyle(
                              //                       color: Colors.red,
                              //                       fontSize: 19,
                              //                       fontWeight:
                              //                           FontWeight.w800),
                              //                 ),
                              //                 SizedBox(
                              //                   height: 5,
                              //                 ),
                              //               ],
                              //             ),
                              //             Spacer(),
                              //             Image.asset(
                              //               'assets/bellLogo.png',
                              //               width: 25,
                              //             )
                              //           ],
                              //         ),
                              //         Text(
                              //           'Sesuaikan suhu standart',
                              //           style: TextStyle(
                              //               color: Colors.red,
                              //               fontSize: 19,
                              //               fontWeight: FontWeight.w500),
                              //         ),
                              //         SizedBox(
                              //           height: 5,
                              //         ),
                              //         Text(
                              //           'berdasarkan bobot (29??C - 31??C)',
                              //           style: TextStyle(
                              //               color: Colors.red,
                              //               fontSize: 19,
                              //               fontWeight: FontWeight.w500),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, bottom: 15),
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: TextButton(
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  side: BorderSide(
                                                      color: Color.fromRGBO(
                                                          2, 82, 49, 1)))),
                                        ),
                                        onPressed: (() {
                                          setState(() {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Detailcage(
                                                          namaKandang:
                                                              cageModel!
                                                                  .data!
                                                                  .data![index]
                                                                  .name,
                                                          hari: cageModel!
                                                              .data!
                                                              .data![index]
                                                              .logActivity,
                                                          populasi: cageModel!
                                                              .data!
                                                              .data![index]
                                                              .population
                                                              .toString(),
                                                          ayamDead: cageModel!
                                                              .data!
                                                              .data![index]
                                                              .deadChicken
                                                              .toString(),
                                                          bobot: cageModel!
                                                              .data!
                                                              .data![index]
                                                              .weightSample
                                                              .toString(),
                                                        )));
                                          });
                                        }),
                                        child: Text(
                                          "Lihat Detail",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color:
                                                  Color.fromRGBO(2, 82, 49, 1)),
                                        ))),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              );
      }),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation!,
      child: ScaleTransition(
        scale: _menuScaleAnimation!,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Beranda",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 10),
                Text("Panen",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 10),
                Text("Barang Masuk",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 10),
                Text("Buku Panduan",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 10),
                Text("Ganti Password",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
