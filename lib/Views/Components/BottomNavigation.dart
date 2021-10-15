import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vtrak/Views/AlertScreen.dart';
import 'package:vtrak/Views/Components/helper.dart';
import 'package:vtrak/Views/HomePage.dart';
import 'package:vtrak/Views/VehicleDetails.dart';
import 'package:vtrak/Views/VehicleHistory.dart';
import 'package:vtrak/Views/VehicleList.dart';
import 'package:vtrak/Views/VehicleReport.dart';


bottomNavigation(int index, context){
  return BottomAppBar(
    child: Container(height: 60,color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              onTap: (){
                if(index!=1){
                  Get.to(HomePage());
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: index==1?color:Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,height: 30,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/Rectangle 20.png'),fit: BoxFit.contain
                          )
                      ),
                    ),
                    Text("Map", style: TextStyle(color: index!=1?color:Colors.white,fontSize: 14,fontWeight: FontWeight.bold),)
                  ],
                ),
              )
            ),
            InkWell(
              onTap: (){
                if(index!=2){
                  Get.to(VehicleList());
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: index==2?color:Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 50,height: 30,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/Rectangle 21.png'),fit: BoxFit.contain
                          )
                      ),
                    ),
                    Text("List",
                      style: TextStyle(color: index!=2?color:Colors.white,fontSize: 14,fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                if(index!=3){
                  Get.to(VehicleHistory());
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: index==3?color:Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 50,height: 30,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/Rectangle 26.png'),fit: BoxFit.contain
                          )
                      ),
                    ),
                    Text("History",
                      style: TextStyle(color: index!=3?color:Colors.white,fontSize: 14,fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                if(index!=4){
                  Get.to(VehicleReport());
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: index==4?color:Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 50,height: 30,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/Rectangle -2.png'),fit: BoxFit.contain
                          )
                      ),
                    ),
                    Text("Report",
                      style: TextStyle(color: index!=4?color:Colors.white,fontSize: 14,fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                if(index!=5){
                  Get.to(AlertScreen());
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: index==5?color:Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 50,height: 30,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/Rectangle -1.png'),fit: BoxFit.contain
                          )
                      ),
                    ),
                    Text("Alert",
                      style: TextStyle(color: index!=5?color:Colors.white,fontSize: 14,fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                if(index!=6){
                  _onBackPressed(context);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: index==6?color:Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 50,height: 30,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/Rectangle 16.png'),fit: BoxFit.contain
                          )
                      ),
                    ),
                    Text("Logout",
                      style: TextStyle(color: index!=6?color:Colors.white,fontSize: 14,fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    ),
  );
}
Future<bool> _onBackPressed(context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('LOGOUT'),
          content: Text('Do you really want to logout?'),
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