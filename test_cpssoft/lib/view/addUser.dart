import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_cpssoft/model/mUser.dart';
import 'package:test_cpssoft/network/userNetwork.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController city = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Add"),
        leading: IconButton(
          splashColor: Colors.transparent,
          onPressed: () async {
            Get.back(result: false);
          },
          icon: const Icon(Icons.keyboard_arrow_left, size: 40),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          itemAddUser("Name", name),
          itemAddUser("Address", address),
          itemAddUser("City", city),
          itemAddUser("Email", email),
          itemAddUser("Phone Number", phoneNumber),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: ElevatedButton(
                  onPressed: () async {
                    UserNetwork userNetwork = UserNetwork();
                    User user = User(
                        name: name.text,
                        address: address.text,
                        city: city.text,
                        phoneNumber: phoneNumber.text,
                        email: email.text);
                    await userNetwork.addUser(user);
                    Get.back(result: true);
                  },
                  style: ElevatedButton.styleFrom(
                    // primary: AppTheme.warnaHijau,
                    minimumSize: Size(100, 40),
                    padding: EdgeInsets.only(left: 43, right: 43),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(72.5)),
                    ),
                  ),
                  child: Text("Save")))
        ],
      ),
    );
  }
}

Widget itemAddUser(String label, TextEditingController value) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: value,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 29.0, right: 10.0),
            hintText: 'Insert your $label',
            hintStyle: const TextStyle(
                fontStyle: FontStyle.italic,
                fontFamily: 'OpenSans',
                fontSize: 15),
            focusColor: Colors.white70,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}
