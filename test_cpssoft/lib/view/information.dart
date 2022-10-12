import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_cpssoft/model/mUser.dart';

class Information extends StatelessWidget {
  Information();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Information '),
      ),
      body: ListView(
        children: [
          itemInfo(const Icon(Icons.person_add_alt_1),
              "digunakan untuk menambahkan data user ke list users"),
          itemInfo(const Icon(Icons.filter_alt),
              "digunakan untuk menfilter data list users berdasarkan Kota/City"),
          itemInfo(const Icon(Icons.sort),
              "digunakan untuk mengurutkan data list users berdasarkan nama, dimulai abjad A hingga Z"),
        ],
      ),
    );
  }
}

Widget itemInfo(Icon icon, String deskripsi) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Expanded(
          child: icon,
          flex: 1,
        ),
        Expanded(flex: 5, child: Text(deskripsi))
      ],
    ),
  );
}
