import 'dart:convert';

import 'package:App/UI/Intray/intray_page.dart';
import 'package:App/UI/Login/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/global.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:App/models/classes/user.dart';
import 'package:App/bloc/blocs/user_bloc_provider.dart';
import 'package:App/UI/HomePage/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      // home: MyHomePage(),
      home: FutureBuilder(
        future: getApiKey(),
        builder: (context, snapshot) {
          print(snapshot.data);
          // var result = await getUser();
          if (snapshot.hasData && snapshot.data)
            return new MyHomePage();
          else
            return new LoginPage(
              newUser: false,
            );
        },
      ),
    );
    //  void signupPressed(){
    // }
  }

  Future<String> getUser() async {
    // print('hello again');
    var result = await http.get('http://127.0.0.1:5000/api/register');
    // print(json.decode(result.body)['data']);
    // return json.decode(result.body)['data']['api_key'];
  }

  Future<bool> getApiKey() async {
    // print('hello');
    String apiKey = await getUser();
    // print(apiKey);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      // print('something');

      String savedApiKey = prefs.getString('API_TOKEN');
      // print(savedApiKey);
      if (savedApiKey != null && savedApiKey != "") {
        return true;
      }
    } catch (Exception) {
      // apiKey = '';
      print("Error");
    }
    return false;
  }
}
