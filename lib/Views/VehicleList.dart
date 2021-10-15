import 'package:flutter/material.dart';
import 'package:vtrak/Views/Components/BackgroundDecoration.dart';
import 'package:vtrak/Views/Components/BottomNavigation.dart';
import 'package:vtrak/Views/Components/appBar.dart';
import 'package:vtrak/Views/Components/helper.dart';

import 'Components/vehicleList.dart';

class VehicleList extends StatefulWidget {
  final bool axis;
  const VehicleList({Key key, this.axis}) : super(key: key);

  @override
  _VehicleListState createState() => _VehicleListState();
}

class _VehicleListState extends State<VehicleList> {
  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width/4.5;
    return Scaffold(
      appBar: appBar("VEHICLE LIST"),
      bottomNavigationBar: bottomNavigation(2,context),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width/2 -15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: color)
                      ),
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.keyboard_arrow_down_sharp,color: Colors.grey,),
                    ),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width/2 -15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: color)
                      ),
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.keyboard_arrow_down_sharp,color: Colors.grey,),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: color)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Center(
                    child: TextFormField(
                      onChanged: (val){
                        print(val);
                      },
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search,color: color,),
                        border: InputBorder.none,
                      ),
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
                  vehicleList(Colors.green, "images/vehicle_green.png",context,true),
                  SizedBox(height: 10,),
                  vehicleList(Colors.red, "images/vehicle_red.png",context,true)
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

}
