import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:test_cpssoft/view/userView.dart';
import 'package:test_cpssoft/viewmodel/user_bloc.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:test_cpssoft/viewmodel/locator.dart';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: GetMaterialApp(
        title: 'List User',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: UserView(),
      ),
    );
  }
}
