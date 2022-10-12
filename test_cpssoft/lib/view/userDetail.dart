import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_cpssoft/model/mUser.dart';

class UserDetail extends StatelessWidget {
  User user;
  UserDetail(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('User Detail'),
      ),
      body: ListView(
        children: [
          itemAddUser("Name", user.name.toString()),
          itemAddUser("Address", user.address.toString()),
          itemAddUser("Email", user.email.toString()),
          itemAddUser("Phone Number", user.phoneNumber.toString()),
          itemAddUser("City", user.city.toString()),
        ],
      ),
    );
  }
}

Widget itemAddUser(String label, String value) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(value),
        const SizedBox(
          height: 7,
        ),
      ],
    ),
  );
}
