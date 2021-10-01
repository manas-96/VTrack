import 'package:flutter/material.dart';
import 'package:vtrak/Views/Components/BackgroundDecoration.dart';
import 'package:vtrak/Views/Components/BottomNavigation.dart';
import 'package:vtrak/Views/Components/appBar.dart';
import 'package:vtrak/Views/Components/helper.dart';

class VehicleList extends StatefulWidget {
  const VehicleList({Key key}) : super(key: key);

  @override
  _VehicleListState createState() => _VehicleListState();
}

class _VehicleListState extends State<VehicleList> {
  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width/4.5;
    return Scaffold(
      appBar: appBar("VEHICLE LIST"),
      bottomNavigationBar: bottomNavigation(2),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: color)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: TextFormField(
                    onChanged: (val){

                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search,color: color,),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  truck(Colors.green, "images/vehicle_green.png", "05", w),
                  truck(Colors.red, "images/vehicle_red.png", "05", w),
                  truck(Colors.blue, "images/vehicle_blue.png", "05", w),
                  truck(Colors.black, "images/vehicle_red.png", "05", w),
                ],
              ),
              SizedBox(height: 10,),
              ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  vehicleList(Colors.green, "images/vehicle_green.png"),
                  SizedBox(height: 10,),
                  vehicleList(Colors.red, "images/vehicle_red.png")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  truck(Color color1, String path, String number, double w){
    return Container(
      width: w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: color1)
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 30,
              width: w/2.3,
              decoration: backgroundDecoration(path),
            ),
            Text(number,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),)
          ],
        ),
      ),
    );
  }
  vehicleList(Color color1,String path){
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(

        border: Border(
          left: BorderSide(color: color1,width: 3),
          top: BorderSide(color: Colors.grey,width: 1),
          bottom: BorderSide(color: Colors.grey,width: 1),
          right: BorderSide(color: Colors.grey,width: 1),
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: MediaQuery.of(context).size.width-90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("GBH1534J",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                      Text(DateTime.now().toString(),style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Text("0 KM/H | 0 KM | oSpd: 0",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                SizedBox(height: 5,),
                Text("Driver Name",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                SizedBox(height: 5,),
                Text("13, Kaki Bukit Road 4, Singapore 417807",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
              ],
            ),
            Container(
              height: 30,
              width: 45,
              decoration: backgroundDecoration(path),
            )
          ],
        ),
      )
    );
  }
}
