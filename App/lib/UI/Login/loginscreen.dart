import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:App/bloc/blocs/user_bloc_provider.dart';
import 'package:App/models/global.dart';
import 'package:flutter/services.dart';
import 'package:App/models/classes/user.dart';
import 'package:App/UI/HomePage/homepage.dart';

class LoginPage extends StatefulWidget {
  final bool newUser;

  const LoginPage({Key key, this.newUser}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final bool newUser;
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController usercontroller = new TextEditingController();
  TextEditingController firstcontroller = new TextEditingController();
  TextEditingController lastcontroller = new TextEditingController();
  TextEditingController passcontroller = new TextEditingController();
  TextEditingController confcontroller = new TextEditingController();
  FocusNode emailnode = FocusNode();
  FocusNode usernode = FocusNode();
  FocusNode firstnode = FocusNode();
  FocusNode lastnode = FocusNode();
  FocusNode passnode = FocusNode();
  FocusNode confnode = FocusNode();

  // _LoginPageState(this.newUser);
  // User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widget.newUser ? getSignupPage() : getSigninPage(),
      ),
    );
  }

  Widget getSigninPage() {
    // final logo = Hero(
    //   tag: 'hero',
    //   child: CircleAvatar(
    //     backgroundColor: Colors.transparent,
    //     radius: 48.0,
    //     child: Image.asset('assets/UI/logo.png'),
    //   ),
    // );

    final createAccountButton = Container(
      child: Center(
        child: FlatButton(
          onPressed: null,
          child: Text(
            "create account",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );

    final createAccount = Container(
      child: Center(
        child: Text(
          "Don't have an account?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w100,
          ),
        ),
      ),
    );
    final user = TextFormField(
      controller: usercontroller,
      autofocus: false,
      focusNode: usernode,
      decoration: InputDecoration(
        hintText: 'Username',
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      focusNode: passnode,
      controller: passcontroller,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Container(
      height: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xff00f2fe),
            Color(0xff4facfe),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xff191919),
            offset: Offset(2, 5),
            blurRadius: 3,
          ),
          BoxShadow(
            color: Color(0xff212121),
            offset: Offset(-2, -5),
            blurRadius: 3,
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: login,
          child: Center(
            child: Text('Sign in',
                style: TextStyle(color: Colors.white, fontSize: 25)),
          ),
        ),
      ),
    );

    final title = Center(
      child: Text(
        "Welcome to the App",
        style: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );

    return Scaffold(
      backgroundColor: darkGreyColor,
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          Container(
            height: 300,
            child: title,
          ),
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: user,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: password,
          ),
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 100),
            child: loginButton,
          ),
          Container(
            child: createAccount,
            padding: EdgeInsets.only(bottom: 10),
          ),
          Container(
            child: createAccountButton,
          ),
        ],
      ),
    );
  }

  Widget getSignupPage() {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/UI/logo.png'),
      ),
    );

    final email = TextFormField(
      controller: emailcontroller,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      focusNode: emailnode,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      focusNode: passnode,
      controller: passcontroller,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final firstname = TextFormField(
      controller: firstcontroller,
      autofocus: false,
      focusNode: firstnode,
      decoration: InputDecoration(
        hintText: 'First Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final lastname = TextFormField(
      autofocus: false,
      focusNode: lastnode,
      controller: lastcontroller,
      decoration: InputDecoration(
        hintText: 'Last Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final username = TextFormField(
      autofocus: false,
      focusNode: usernode,
      controller: usercontroller,
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final confirmpass = TextFormField(
      autofocus: false,
      focusNode: confnode,
      controller: confcontroller,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Retype your Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Container(
      height: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xff00f2fe),
            Color(0xff4facfe),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xff191919),
            offset: Offset(2, 5),
            blurRadius: 3,
          ),
          BoxShadow(
            color: Color(0xff212121),
            offset: Offset(-2, -5),
            blurRadius: 3,
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: registerUser,
          child: Center(
            child: Text('Register',
                style: TextStyle(color: Colors.white, fontSize: 25)),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: darkGreyColor,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            firstname,
            SizedBox(height: 8.0),
            lastname,
            SizedBox(height: 8.0),
            username,
            SizedBox(height: 8.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 8.0),
            confirmpass,
            SizedBox(height: 24.0),
            loginButton,
          ],
        ),
      ),
    );
  }

  Future registerUser() async {
    String errorTitle = '';
    String errorMessage = '';
    if (passcontroller.text == confcontroller.text &&
        (confcontroller.text != '' &&
            firstcontroller.text != '' &&
            lastcontroller.text != '' &&
            usercontroller.text != '' &&
            emailcontroller.text != '')) {
      // print("some1");
      User user = await bloc.registerUser(
          usercontroller.text,
          firstcontroller.text,
          lastcontroller.text,
          passcontroller.text,
          emailcontroller.text);
      // print(user);
      if (user != null) {
        // return user;
        saveApiKey(user);
        setState(() {
          Navigator.pushReplacement(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => new MyHomePage()));
        });
      }
      return null;
    } else {
      errorTitle = 'Wrong Input!';
      if (firstcontroller.text == '') {
        errorMessage = 'Enter the First Name';
        firstnode.requestFocus();
      } else if (lastcontroller.text == '') {
        errorMessage = 'Enter the Last Name';
        lastnode.requestFocus();
      } else if (usercontroller.text == '') {
        errorMessage = 'Enter the  Username';
        usernode.requestFocus();
      } else if (emailcontroller.text == '') {
        errorMessage = 'Enter the Email address';
        emailnode.requestFocus();
      } else if (passcontroller.text == '') {
        errorMessage = 'Enter the Password';
        passnode.requestFocus();
      } else if (confcontroller.text == '') {
        errorMessage = 'Retype the Password';
        confnode.requestFocus();
      } else if (passcontroller.text != confcontroller.text) {
        errorMessage = 'Enter the correct password';
        confcontroller.text = '';
        confnode.requestFocus();
      }
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text(errorTitle),
            content: new Text(errorMessage),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future login() async {
    String errorTitle = '';
    String errorMessage = '';
    if (usercontroller.text != '' && passcontroller.text != '') {
      // print("some1");
      User user = await bloc.signinUser(
        usercontroller.text,
        passcontroller.text,
      );
      if (user != null) {
        saveApiKey(user);
        setState(() {
          Navigator.pushReplacement(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) => new MyHomePage()));
        });
      }
      return null;
    } else {
      errorTitle = 'Wrong Input!';
      if (usercontroller.text == '') {
        errorMessage = 'Enter the  Username';
        usernode.requestFocus();
      } else if (passcontroller.text == '') {
        errorMessage = 'Enter the Password';
        passnode.requestFocus();
      }
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text(errorTitle),
            content: new Text(errorMessage),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
  // Future getUser() async {
  //   var result = await http.get('http://127.0.0.1:5000/api/register');
  //   print(result.body);
  //   return result;
  // }

  void saveApiKey(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // print(user.apiKey);
    prefs.setString('API_TOKEN', user.apiKey);
  }
}
