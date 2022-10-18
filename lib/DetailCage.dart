import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Detailcage extends StatefulWidget {
  String? namaKandang, hari, populasi, ayamDead, bobot;
  Detailcage(
      {Key? key,
      required this.namaKandang,
      required this.hari,
      required this.populasi,
      required this.ayamDead,
      required this.bobot})
      : super(key: key);

  @override
  State<Detailcage> createState() => _DetailcageState();
}

class _DetailcageState extends State<Detailcage> {
  PanelController popupDropDown = new PanelController();
  bool isSelected = false;
  final listChoices = <ItemChoice>[
    ItemChoice(1, 'Hari 10'),
    ItemChoice(2, 'Hari 11'),
    ItemChoice(3, 'Hari 12'),
    ItemChoice(4, 'Hari 13'),
    ItemChoice(5, 'Hari 14'),
    ItemChoice(6, 'Hari 15'),
    ItemChoice(7, 'Hari 16'),
    ItemChoice(8, 'Hari 17'),
  ];
  var idSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(2, 82, 49, 1),
        title: Text('Detail Kandang'),
      ),
      body: Stack(children: [
        Column(
          children: [
            buildCage(),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Divider(
                thickness: 7,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            buildChipsDay(),
            buildOtherActivity(),
          ],
        ),
        buildPanelDropdown()
      ]),
    );
  }

  Widget buildCage() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        top: 20,
        right: 20,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/KandangImage2.png',
                width: 60,
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.namaKandang.toString(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    SizedBox(height: 3),
                    Text(
                      widget.hari.toString(),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(4, 149, 89, 1)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  thickness: 1,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Populasi',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${widget.populasi} ekor',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ayam Mati',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${widget.ayamDead} ekor',
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 16),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bobot Sampel',
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${widget.bobot} gr',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 150,
                        height: 45,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              side: BorderSide(
                                  width: 2,
                                  color: Color.fromRGBO(2, 82, 49, 1)),
                              primary: Color.fromRGBO(2, 82, 49, 1),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Detail Kandang',
                              style: TextStyle(fontSize: 17),
                            )),
                      ),
                      Container(
                        width: 150,
                        height: 45,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              primary: Color.fromRGBO(2, 82, 49, 1),
                            ),
                            onPressed: () {
                              setState(() {});
                            },
                            child: Text(
                              'Panen',
                              style: TextStyle(fontSize: 17),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildChipsDay() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 10,
                children: listChoices
                    .map((e) => ChoiceChip(
                          selectedColor: Color.fromRGBO(205, 254, 234, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(6),
                                  topLeft: Radius.circular(6),
                                  bottomLeft: Radius.circular(6),
                                  bottomRight: Radius.circular(6))),
                          backgroundColor: Colors.transparent,
                          side: BorderSide(color: Color.fromRGBO(2, 82, 49, 1)),
                          label: Text(
                            e.label,
                          ),
                          selected: idSelected == e.id,
                          onSelected: (_) => setState(() {
                            idSelected = e.id;
                            isSelected = true;
                          }),
                          labelStyle: TextStyle(
                              color: idSelected == e.id
                                  ? Color.fromRGBO(2, 82, 49, 1)
                                  : Color.fromRGBO(133, 173, 156, 1)),
                        ))
                    .toList(),
              ),
            ),
          ),
          Expanded(
              child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                side: BorderSide(color: Color.fromRGBO(2, 82, 49, 1))),
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Color.fromRGBO(2, 82, 49, 1),
            ),
            onPressed: () {},
          ))
        ],
      ),
    );
  }

  Widget buildOtherActivity() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            popupDropDown.open();
          });
        },
        child: Container(
            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
            decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(194, 214, 206, 1)),
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Kegiatan Lainnya',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Lihat Semua',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(4, 149, 89, 1)),
                )
              ],
            )),
      ),
    );
  }

  Widget buildPanelDropdown() {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        child: SlidingUpPanel(
          padding: EdgeInsets.only(top: 20, right: 30, left: 30, bottom: 10),
          backdropEnabled: true,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          minHeight: 0,
          maxHeight: 600,
          controller: popupDropDown,
          panelBuilder: (controller) =>
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Text(
                "Kegiatan Lainnya",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
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
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('• '),
                    Expanded(
                        child: Column(
                      children: [
                        Text(
                          'Sampling bobot ayam sebanyak 80 ekor ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                              'Timbang 10 ekor per timbangan pada seluruh bagian kandang. Penimbangan dilakukan pada sore hari sebelum pemberian pakan',
                              // textAlign: TextAlign.justify,
                              style: TextStyle(
                                  // wordSpacing: 2,
                                  fontSize: 16,
                                  height: 1.2,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ],
                    ))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 2,
                  color: Color.fromRGBO(224, 235, 230, 1),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('•'),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      children: [
                        Text(
                          'Pemberian Medikasi',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        )
                      ],
                    )
                  ],
                )
              ],
            )
          ]),
        ));
  }
}

class ItemChoice {
  final int id;
  final String label;

  ItemChoice(this.id, this.label);
}
