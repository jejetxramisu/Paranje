import 'package:flutter/material.dart';
import 'package:paranje_recreatelogin/DrawerModel.dart';
import 'package:paranje_recreatelogin/beranda.dart';

class ItemBurgerMenu {
  static const beranda = BurgerMenuModel(title: 'Beranda');
  static const panen = BurgerMenuModel(title: 'Panen');
  static const administrasi = BurgerMenuModel(title: 'Administrasi');
  static const hargakontrak = BurgerMenuModel(title: 'Harga Kontrak');
  static const hasilproduksi = BurgerMenuModel(title: 'Hasil Produksi');
  static const bukupanduan = BurgerMenuModel(title: 'Buku Panduan');
  static const gantipassword = BurgerMenuModel(title: 'Ganti Password');

  static final List<BurgerMenuModel> all = [
    beranda,
    panen,
    administrasi,
    hargakontrak,
    hasilproduksi,
    bukupanduan,
    gantipassword
  ];
}
