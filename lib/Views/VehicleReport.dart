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
      bottomNavigationBar: bottomNavigation(4),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: vehicleReportDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Select Report",style: vehicleReport,),
                        Icon(Icons.arrow_forward_ios_sharp,color: Colors.grey,size: 24,),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: vehicleReportDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Select Vehicle",style: vehicleReport,),
                        Icon(Icons.arrow_forward_ios_sharp,color: Colors.grey,size: 24,),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: vehicleReportDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Select Report",style: vehicleReport,),
                        Text("22/09/2021 00:00",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),)
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: vehicleReportDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Select Report",style: vehicleReport,),
                        Text("22/09/2021 23:59",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),)

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
