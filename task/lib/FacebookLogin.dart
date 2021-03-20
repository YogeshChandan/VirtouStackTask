
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:task/HomeScreen.dart';

class FacebookScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => FacebookScreenDesign();
}

class FacebookScreenDesign extends State<FacebookScreen> {
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  String _message = 'Log in/out by pressing the buttons below.';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Facebook Login",
          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        color: Colors.grey[700],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.all(14),
              child: Text(
                "Sign In",
                style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18,color: Colors.white),
                textAlign: TextAlign.center,
              )),
              Padding(padding: EdgeInsets.all(14),
              child: Text(
                "Sign in with your facebook account",
                style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),
                textAlign: TextAlign.center,
              )),
              new RaisedButton(
                onPressed: () => _login(),
                color: Colors.blue,
                child: new Text("Sign in with Facebook ", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white)),
              )
            ],
          ),
        ),
      )
    );
  }

  Future<Null> _login() async {
    final FacebookLoginResult result =
    await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        _showMessage('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen()));
        break;
      case FacebookLoginStatus.cancelledByUser:
        _showMessage('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        _showMessage('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  void _showMessage(String message) {
    setState(() {
      _message = message;
    });
  }

}