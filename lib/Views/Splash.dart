import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vtrak/Views/Components/BackgroundDecoration.dart';
import 'package:vtrak/Views/GetPin.dart';
import 'package:vtrak/Views/Login.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  isLogin()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(pref.getString("isLogin")!=null){
      Get.to(GetPin());
    }
    else{
      Get.to(Login());
    }
  }
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 1),
        (){
          isLogin();
        }
    );
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: backgroundDecoration("images/bg.png"),
        child: Center(
          child: Container(
            height: 80,
            width: 150,
            decoration: backgroundDecoration("images/logo_v-trak.png"),
          ),
        ),
      ),
    );
  }
}
