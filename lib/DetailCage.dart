import 'dart:ui';

import 'package:flutter/material.dart';

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
      body: Column(
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
        ],
      ),
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
}

class ItemChoice {
  final int id;
  final String label;

  ItemChoice(this.id, this.label);
}
