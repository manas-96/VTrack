import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtrak/Views/Components/BackgroundDecoration.dart';
import 'package:vtrak/Views/Components/helper.dart';
import 'package:vtrak/Views/SetPin.dart';


class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String username='';
  String password='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: backgroundDecoration("images/bg.png"),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 200,
                  decoration: backgroundDecoration("images/logo_v-trak.png"),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15,top: 4,bottom: 4),
                    child: TextFormField(
                      onChanged: (val){
                        username=val;
                      },
                      decoration: InputDecoration(
                        hintText: 'User name',
                        border: InputBorder.none
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15,top: 4,bottom: 4),
                    child: TextFormField(
                      obscureText: true,
                      onChanged: (val){
                        password=val;
                      },
                      decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                Container(width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    color: color,
                    onPressed: (){
                      Get.to(SetPin());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text("LOGIN",
                        style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                    ),

                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
