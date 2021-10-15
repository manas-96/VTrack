import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:vtrak/Views/Components/helper.dart';

import 'Components/CustomSwitch.dart';


class VehicleDetails extends StatefulWidget {
  const VehicleDetails({Key key}) : super(key: key);

  @override
  _VehicleDetailsState createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails> {
  bool engineValue = false;
  bool doorValue = false;
  TextStyle textStyle = TextStyle(fontSize: 18,fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.65,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30)
        )
      ),
      child: Column(
        children: [
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)
                )
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("GBH1534J",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text("15 mins stop",style: TextStyle(fontSize: 15,color: Colors.white),),
                    ),
                  ),
                  Icon(Icons.location_pin,color: Colors.white,)
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.65-100,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0,right: 12,top:8),
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 15,),
                      Text("Driver Name",style: textStyle,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0,right: 12,top:8),
                  child: Row(
                    children: [
                      Icon(Icons.timer),
                      SizedBox(width: 15,),
                      Text(DateTime.now().toString().split(".").first,style: textStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0,right: 12,top:8),
                  child: Row(
                    children: [
                      Icon(Icons.speed),
                      SizedBox(width: 15,),
                      Text("0 KM/H | 0 KM | oSpd: 0",style: textStyle),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 12.0,right: 12,top:8),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 3,color: Colors.red)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text("50",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                        ),
                      ),
                      SizedBox(width: 15,),
                      Text("oSpd: 0",style: textStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0,right: 12,top:8),
                  child: Row(
                    children: [
                      Icon(Icons.speed),
                      SizedBox(width: 15,),
                      Text("NB: 0 | HB: 0 | EHB: 0 | HA: 0",style: textStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0,right: 12,top:8),
                  child: Container(width: MediaQuery.of(context).size.width,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_pin),
                            SizedBox(width: 15,),
                            Container(
                              width: MediaQuery.of(context).size.width*0.7,
                              child: Text("13, Kaki Bukit Road 4, Singapore 417807",
                                  style: textStyle,
                                overflow: TextOverflow.clip,
                              ),
                            )
                          ],
                        ),
                        Icon(Icons.subdirectory_arrow_right_sharp),
                      ],
                    ),
                  ),
                ),


                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Container(
                    height: 2,width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueGrey[800]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Remote Service",style: TextStyle(color: Colors.white,fontSize: 21,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width*0.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,

                                  children: [
                                    Text("ENGINE",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                                    SizedBox(height: 15,),
                                    Container(
                                      width: MediaQuery.of(context).size.width*0.4,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              Icon(Icons.power_settings_new,color: Colors.white,),
                                              Text("ON",style: TextStyle(color: Colors.white,fontSize: 15),)
                                            ],
                                          ),
                                          SizedBox(width: 5,),
                                          CustomSwitch(

                                            value: engineValue,
                                            onChanged: (value) {
                                              print("VALUE : $value");
                                              setState(() {
                                                engineValue = value;
                                              });
                                            },
                                          ),
                                          SizedBox(width: 5,),
                                          Column(
                                            children: [
                                              Icon(Icons.power_settings_new,color: Colors.white,),
                                              Text("OFF",style: TextStyle(color: Colors.white,fontSize: 15),)
                                            ],
                                          ),

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 1.5,
                                height: 120,
                                color: Colors.white,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width*0.42,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("DOOR",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                                    SizedBox(height: 15,),
                                    Container(
                                      width: MediaQuery.of(context).size.width*0.42,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              Icon(Icons.lock,color: Colors.white,),
                                              Text("LOCK",style: TextStyle(color: Colors.white,fontSize: 15),)
                                            ],
                                          ),
                                          SizedBox(width: 5,),
                                          CustomSwitch(

                                            value: doorValue,
                                            onChanged: (value) {
                                              print("VALUE : $value");
                                              setState(() {
                                                doorValue = value;
                                              });
                                            },
                                          ),
                                          SizedBox(width: 5,),
                                          Column(
                                            children: [
                                              Icon(Icons.lock,color: Colors.white,),
                                              Text("UNLOCK",style: TextStyle(color: Colors.white,fontSize: 15),)
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
