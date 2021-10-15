import 'package:flutter/material.dart';
import 'package:vtrak/Views/Components/BackgroundDecoration.dart';
import 'package:vtrak/Views/Components/BottomNavigation.dart';
import 'package:vtrak/Views/Components/appBar.dart';
import 'package:vtrak/Views/Components/helper.dart';


class VehicleReport extends StatefulWidget {
  const VehicleReport({Key key}) : super(key: key);

  @override
  _VehicleReportState createState() => _VehicleReportState();
}

class _VehicleReportState extends State<VehicleReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("VEHICLE REPORT"),
      bottomNavigationBar: bottomNavigation(4,context),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 35,
                      width: MediaQuery.of(context).size.width/2 -15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: color)
                      ),
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Select Report",style: TextStyle(fontWeight: FontWeight.bold),),
                            Icon(Icons.keyboard_arrow_down_sharp,color: Colors.grey,)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 35,
                      width: MediaQuery.of(context).size.width/2 -15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: color)
                      ),
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Select Vehicle",style: TextStyle(fontWeight: FontWeight.bold),),
                            Icon(Icons.keyboard_arrow_down_sharp,color: Colors.grey,)
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: color)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("22/09/2021 00:00",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13),),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: color)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("22/09/2021 00:00",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13),),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blueGrey[900]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("   Search   ",
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.white),),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.grey,
                height: 1.6,
              )
            ],
          ),
        ),
      ),
    );
  }
}
