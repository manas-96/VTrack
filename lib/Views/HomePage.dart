import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vtrak/Views/Components/BottomNavigation.dart';
import 'package:vtrak/Views/Notifications.dart';

import 'Components/helper.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('You are going to exit the application!!'),
            actions: <Widget>[
              FlatButton(
                child: Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('YES'),
                onPressed: () {
                  //check?Navigator.pop(context):
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
              ),
            ],
          );
        });
  }
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(23.5204, 87.3119);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: _onBackPressed,
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height/14,
                left: 30,
                child: InkWell(
                  onTap: (){
                    Get.to(Notifications());
                  },
                  child: Container(
                    height: 50,width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all()
                    ),
                    child: Icon(Icons.notifications_active_outlined,color: color,size: 35,),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height/14-5,
                left: 60,
                child: InkWell(
                  onTap: (){
                    Get.to(Notifications());
                  },
                  child: Container(
                    height: 20,width: 20,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.red,width: 1.5)
                    ),
                    alignment: Alignment.center,
                    child: Text("2",style: TextStyle(color: Colors.red),),
                  ),
                ),
              ),
            ],
          )
        ),
          bottomNavigationBar:  bottomNavigation(1)
      ),
    );
  }
}
