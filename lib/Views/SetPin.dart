import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:vtrak/DataService/APIClient.dart';
import 'package:vtrak/Views/GetPin.dart';

import 'Components/BackgroundDecoration.dart';
import 'Components/helper.dart';


class SetPin extends StatefulWidget {
  final clientId;
  const SetPin({Key key, this.clientId}) : super(key: key);

  @override
  _SetPinState createState() => _SetPinState();
}

class _SetPinState extends State<SetPin> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: backgroundDecoration("images/bg.png"),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 200,
                  decoration: backgroundDecoration("images/logo_v-trak.png"),
                ),
                SizedBox(height: 20,),
                Text("Set Your Login Pin",
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                ),
                SizedBox(height: 20,),
                Form(
                  key: formKey,
                  child: PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 6,
                    obscureText: false,
                    obscuringCharacter: '*',
                    animationType: AnimationType.fade,

                    pinTheme: PinTheme(
                      activeColor: Colors.white,
                      inactiveColor: Colors.white,
                      disabledColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedColor: Colors.white,
                      selectedFillColor: Colors.white,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(15),
                      fieldHeight: MediaQuery.of(context).size.height/18,
                      fieldWidth: MediaQuery.of(context).size.width/8,
                      activeFillColor:Colors.white,
                    ),
                    cursorColor: Colors.black,
                    animationDuration: Duration(milliseconds: 300),
                    textStyle: TextStyle(fontSize: 20, height: 1.6),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
                    errorAnimationController: errorController,
                    controller: textEditingController,
                    keyboardType: TextInputType.number,
                    boxShadows: [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                    onCompleted: (v) {
                      print("Completed");
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  ),
                ),
                SizedBox(height: 10,),

                Container(width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    color: color,
                    onPressed: (){
                      if(currentText==""){
                        _scaffoldKey.currentState.showSnackBar(APIClient.errorToast("Please set your pin"));
                      }
                      else{
                        setPin();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("SET",
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
  setPin()async{
    final result = await APIClient().setPin(currentText,'1');
    print(result);
    if(result=="failed"){
      _scaffoldKey.currentState.showSnackBar(APIClient.errorToast("Failed"));
    }
    else if(result["Success"]==0){
      _scaffoldKey.currentState.showSnackBar(APIClient.errorToast(result["Rmkrs"]));
    }
    else{
      Get.to(GetPin());
    }
  }
}
