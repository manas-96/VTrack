import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vtrak/Views/Components/BackgroundDecoration.dart';
import 'package:vtrak/Views/Components/BottomNavigation.dart';
import 'package:vtrak/Views/Components/vehicleList.dart';
import 'package:vtrak/Views/Notifications.dart';
import 'package:vtrak/Views/VehicleDetails.dart';
import 'Components/helper.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showDetails=false;
  bool showList=false;

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('EXIT'),
            content: Text('Do you really want to exit?'),
            actions: <Widget>[
              RaisedButton(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('NO',style: TextStyle(color: Colors.white),),
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              RaisedButton(
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('YES',style: TextStyle(color: Colors.white),),
                ),
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
              Positioned(
                top: MediaQuery.of(context).size.height/2-20,
                left: MediaQuery.of(context).size.width/2-20,
                child: InkWell(
                  onTap: (){
                    setState(() {
                      showList=!showList;
                    });
                  },
                  child: Container(
                    height: 40,width: 40,
                    decoration: backgroundDecoration("images/vehicle_red.png"),
                  ),
                ),
              ),
              showList?Positioned(
                bottom: 50,
                child: InkWell(
                  onTap: (){
                    setState(() {
                      showDetails=true;
                      showList=false;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    child:  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: vehicleList(
                              Colors.green,
                              "images/vehicle_green.png",
                              context,
                              false
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ):Container(),
              showDetails?Positioned(
                bottom: 0,
                child: InkWell(
                  onTap: (){
                    setState(() {
                      showDetails=false;
                    });
                  },
                  child: VehicleDetails(),
                ),
              ):Container(),
            ],
          )
        ),
          bottomNavigationBar:  bottomNavigation(1,context)
      ),
    );
  }
}
