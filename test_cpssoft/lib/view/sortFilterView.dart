import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SortFilter extends StatefulWidget {
  String? title = "";
  List? Jenis = [];
  SortFilter({this.title, this.Jenis});

  @override
  _SortFilterState createState() => _SortFilterState();
}

class _SortFilterState extends State<SortFilter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Get.back(result: "reset");
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("Reset")),
            ),
          )
        ],
        leading: IconButton(
          splashColor: Colors.transparent,
          onPressed: () {
            Get.back(result: "");
          },
          icon: const Icon(Icons.keyboard_arrow_left, size: 40),
        ),
        title: Text(widget.title!),
      ),
      body: ListView.builder(
          itemCount: widget.Jenis!.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Get.back(result: widget.Jenis![index].name.toString());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.Jenis![index].name.toString()),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.black,
                  )
                ],
              ),
            );
          }),
    );
  }
}
