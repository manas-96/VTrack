import 'package:android_intent/android_intent.dart';
import 'package:background_location/background_location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vtrak/DataService/APIClient.dart';
import 'package:vtrak/Views/Components/BackgroundDecoration.dart';
import 'package:vtrak/Views/Components/helper.dart';
import 'package:vtrak/Views/SetPin.dart';
class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool task=false;
  String username='';
  String password='';
  String mobile="";
  final Geolocator geolocator = Geolocator()
    ..forceAndroidLocationManager;

  Position _currentPosition;

  enableGps()async{
    bool isLocationEnabled = await Geolocator().isLocationServiceEnabled();
    print(isLocationEnabled);
    if(!isLocationEnabled){

    }
  }
  _getCurrentLocation() async{
    bool isLocationEnabled = await Geolocator().isLocationServiceEnabled();
    print(isLocationEnabled);
    if(!isLocationEnabled){
      if (Theme.of(context).platform == TargetPlatform.android) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Can't get current location"),
              content:
              const Text('Please make sure you enable GPS and try again'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    final AndroidIntent intent = AndroidIntent(
                        action: 'android.settings.LOCATION_SOURCE_SETTINGS');
                    intent.launch();
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
    else{
      geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
          .then((Position position) {
        setState(() {
          task=true;
          login();
          _currentPosition = position;
          BackgroundLocation.startLocationService();
        });
      }).catchError((e) {
        print(e);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15,top: 4,bottom: 4),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (val){
                        mobile=val;
                      },
                      decoration: InputDecoration(
                          hintText: 'Mobile number',
                          border: InputBorder.none
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                Container(width: MediaQuery.of(context).size.width,
                  height: 54,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    color: color,
                    onPressed: (){
                      if(username==""){
                        _scaffoldKey.currentState.showSnackBar(APIClient.errorToast("Please enter username"));
                      }
                      else if(password==""){
                        _scaffoldKey.currentState.showSnackBar(APIClient.errorToast("Please enter your password"));
                      }
                      else if(mobile==""){
                        _scaffoldKey.currentState.showSnackBar(APIClient.errorToast("Please enter mobile number"));
                      }
                      else{
                        _getCurrentLocation();

                      }
                    },
                    child: Padding(
                      padding: task?EdgeInsets.all(8.0):const EdgeInsets.all(14.0),
                      child: task?CircularProgressIndicator(

                        backgroundColor: Colors.white,
                      )
                          :Text("LOGIN",
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
  login()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    final result = await APIClient().login(username, password, mobile,
        _currentPosition.latitude.toString(), _currentPosition.longitude.toString());

    print(result);
    print(_currentPosition.longitude.toString());
    if(mounted){
      setState(() {
        task=false;
      });
    }
    if(result=="failed"){
      _scaffoldKey.currentState.showSnackBar(APIClient.errorToast("Failed"));
    }
    else if(result["Success"]==0){
      _scaffoldKey.currentState.showSnackBar(APIClient.errorToast(result["Rmkrs"]));
    }
    else{
      _scaffoldKey.currentState.showSnackBar(APIClient.successToast("Successfully registered"));
      Future.delayed(
          Duration(seconds: 2),
              (){
                pref.setString("isLogin", "true");
                Get.to(SetPin());
          }
      );

    }
  }
  getImei()async{
    String imei = await ImeiPlugin.getImei();
    List<String> multiImei = await ImeiPlugin.getImeiMulti(); //for double-triple SIM phones
    String uuid = await ImeiPlugin.getId();
    print(imei);
  }
}
