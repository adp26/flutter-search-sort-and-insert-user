import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_cpssoft/model/mUser.dart';
import 'package:test_cpssoft/view/addUser.dart';
import 'package:test_cpssoft/view/information.dart';
import 'package:test_cpssoft/view/sortFilterView.dart';
import 'package:test_cpssoft/view/userDetail.dart';
import 'package:test_cpssoft/viewmodel/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserView extends StatelessWidget {
  TextEditingController keyword = TextEditingController();
  String filter = "Kota";

  @override
  Widget build(BuildContext context) {
    UserBloc users = context.read<UserBloc>();
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: IconButton(
                onPressed: () {
                  Get.to(() => Information());
                },
                icon: const Icon(
                  Icons.info,
                ),
              ),
            ),
          )
        ],
        centerTitle: true,
        title: const Text("List Users"),
      ),
      body: Container(
        margin: EdgeInsets.all(8.0),
        child: BlocBuilder<UserBloc, Map>(
            bloc: users,
            builder: (context, state) {
              if (state['listbase'].isNotEmpty) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(5.0) //
                            ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: const InputDecoration(
                                        fillColor: Colors.white,
                                        // border: InputBorder.none,
                                        hintText: 'searching user...',
                                        hintStyle: TextStyle(
                                            fontStyle: FontStyle.italic)),
                                    controller: keyword,
                                    onChanged: (value) {
                                      if (value != "") {
                                        users.process(
                                            keyword: value,
                                            filter: state['filter'],
                                            sort: state['sort']);
                                      } else {
                                        users.process(
                                            keyword: "&126%kosong",
                                            filter: state['filter'],
                                            sort: state['sort']);
                                      }

                                      // users.search(value);
                                    },
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    bool result =
                                        await Get.to(() => const AddUser());
                                    if (result) users.increment();
                                  },
                                  icon: const Icon(
                                    Icons.person_add_alt_1,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () async {
                                      if (!state['sort']) {
                                        users.process(
                                            sort: true,
                                            filter: state['filter']);
                                      } else {
                                        users.process(
                                          sort: false,
                                          filter: state['filter'],
                                        );
                                      }
                                    },
                                    icon: Icon(
                                      Icons.sort,
                                      color: state['sort']
                                          ? Colors.blue
                                          : Colors.black,
                                    ),
                                  ),
                                  Text("nama"),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () async {
                                      String result = await Get.to(() =>
                                          SortFilter(
                                              title: "Filter By Kota",
                                              Jenis: state['listCity']));
                                      if (result != "") {
                                        filter = result;
                                        // users.FilterByCity(result);
                                        users.process(
                                            filter: true,
                                            datafilter: result,
                                            sort: state['sort']);
                                      }
                                      if (result == "reset") {
                                        filter = "Kota";

                                        users.process(
                                            filter: false, sort: state['sort']);
                                      }
                                    },
                                    icon: Icon(
                                      Icons.filter_alt,
                                      color: state['filter']
                                          ? Colors.blue
                                          : Colors.black,
                                    ),
                                  ),
                                  Text(filter),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(5.0) //
                              ),
                        ),
                        child: Scrollbar(
                          isAlwaysShown: true,
                          trackVisibility: true,
                          child: ListView.builder(
                            itemCount: state['sort'] ||
                                    state['filter'] ||
                                    keyword.text != ""
                                ? state['list_search'].length
                                : state['listbase'].length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  if (state['sort'] ||
                                      state['filter'] ||
                                      keyword.text != "") {
                                    Get.to(UserDetail(
                                        state['list_search'][index]));
                                  } else {
                                    Get.to(
                                        UserDetail(state['listbase'][index]));
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${state['sort'] || state['filter'] || keyword.text != "" ? (state['list_search'][index].name) : state['listbase'][index].name}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return _buildLoading();
            }),
      ),
    );
  }
}

Widget _buildLoading() => Center(child: CircularProgressIndicator());
