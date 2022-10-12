import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:test_cpssoft/model/mCity.dart';
import 'package:test_cpssoft/model/mUser.dart';

class UserNetwork {
  final String _urlUser =
      "https://627e360ab75a25d3f3b37d5a.mockapi.io/api/v1/accurate/user";
  final String _urlCity =
      "https://627e360ab75a25d3f3b37d5a.mockapi.io/api/v1/accurate/city";

  Future<List<User>> getUser() async {
    List<User> users = [];
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse(_urlUser));

    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        String strResult = await response.stream.bytesToString();
        if (strResult != "") {
          print(strResult);
          dynamic objResult = await jsonDecode(strResult);
          if (objResult.length > 0) {
            print(objResult);
            print(objResult.runtimeType);
            for (var val in objResult) {
              users.add(User.fromJson(val));
            }

            return users;
          } else {
            return users;
          }
        } else {
          return users;
        }
      } else {
        return users;
      }
    } catch (error) {
      return users;
    }
  }

  Future<bool> addUser(User user) async {
    List<User> users = [];
    // dynamic objParam = {
    //   "secretkey": strSecretKey,
    //   "phone": Phone,
    //   "user_active": user_active,
    // };
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(_urlUser));
    request.body = json.encode(user.toJson());

    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  Future<List<City>> getCity() async {
    List<City> city = [];
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse(_urlCity));

    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        String strResult = await response.stream.bytesToString();
        if (strResult != "") {
          print(strResult);
          dynamic objResult = await jsonDecode(strResult);
          if (objResult.length > 0) {
            for (var val in objResult) {
              city.add(City.fromJson(val));
            }
            return city;
          } else {
            return city;
          }
        } else {
          return city;
        }
      } else {
        return city;
      }
    } catch (error) {
      return city;
    }
  }
}
