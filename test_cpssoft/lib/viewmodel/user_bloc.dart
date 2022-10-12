import 'package:bloc/bloc.dart';
import 'package:test_cpssoft/network/userNetwork.dart';

class UserBloc extends Cubit<Map> {
  UserBloc()
      : super({
          "listbase": [],
          "list_search": [],
          "listCity": [],
          "sort": false,
          "filter": false,
          "datafilter": "",
          "search": ""
        }) {
    increment();
  }
  UserNetwork objUser = UserNetwork();
  void increment() async {
    List data = await objUser.getUser();
    List listcity = await objUser.getCity();

    emit({
      "listbase": data,
      "list_search": data,
      "listCity": listcity,
      "sort": state['sort'],
      "filter": state['filter'],
      "datafilter": state['datafilter'],
      "search": state['search'],
    });
  }

  void process(
      {String keyword = "",
      String datafilter = "",
      bool filter = false,
      bool sort = false}) async {
    List data = [];
    if (keyword == "") {
      keyword = state['search'];
    }
    if (keyword == "&126%kosong") {
      keyword = "";
    }
    if (datafilter == "") {
      datafilter = state['datafilter'];
    }
    List rawData = List.from(state['listbase']);
    //filter data
    if (filter) {
      for (var val in rawData) {
        if (val.city.toString().toLowerCase() == datafilter.toLowerCase()) {
          data.add(val);
        }
      }
    }

    //sort data
    if (sort) {
      if (data.isNotEmpty) {
        print("sort data not null");
        data.sort((a, b) {
          return (a.name.toString().toLowerCase())
              .compareTo(b.name.toString().toLowerCase());
        });
      } else {
        print("sort data  null");
        rawData.sort((a, b) {
          return (a.name.toString().toLowerCase())
              .compareTo(b.name.toString().toLowerCase());
        });
        data = List.from(rawData);
      }
    }
    //search data
    List result = [];
    if (data.isNotEmpty) {
      print("search data not null");
      print(keyword);
      for (var val in data) {
        if (val.name.toString().toLowerCase().contains(keyword.toLowerCase())) {
          result.add(val);
        }
      }
    } else {
      print("search data  null");
      for (var val in rawData) {
        if (val.name.toString().toLowerCase().contains(keyword.toLowerCase())) {
          result.add(val);
        }
      }
    }
    if (result.isEmpty && keyword != "") {
      data = [];
      rawData = [];
    }
    emit({
      "listbase": state['listbase'],
      "list_search":
          result.isNotEmpty ? result : (data.isNotEmpty ? data : rawData),
      "listCity": state['listCity'],
      "sort": sort,
      "filter": filter,
      "datafilter": datafilter,
      "search": keyword,
    });
    // emit({
    //   "listbase": state['listbase'],
    //   "list_search": data,
    //   "list_filter": state['list_filter'],
    //   "listCity": state['listCity'],
    //   "sort": state['sort'],
    //   "filter": state['filter']
    // });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
