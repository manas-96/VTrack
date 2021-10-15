import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtrak/Views/TripHistory.dart';

import 'Components/BottomNavigation.dart';
import 'Components/appBar.dart';
import 'Components/helper.dart';


class VehicleHistory extends StatefulWidget {
  const VehicleHistory({Key key}) : super(key: key);

  @override
  _VehicleHistoryState createState() => _VehicleHistoryState();
}

class _VehicleHistoryState extends State<VehicleHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("VEHICLE HISTORY"),
      bottomNavigationBar: bottomNavigation(3,context),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: color)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Select Vehicle",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                  width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: color)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Text("22/09/2021"),
                            SizedBox(width: 4,),
                            Icon(Icons.calendar_today,color: color,)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: color)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Text("22:59"),
                            SizedBox(width: 4,),
                            Icon(Icons.keyboard_arrow_down_outlined,color: Colors.grey,)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: color)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Text("22:59"),
                            SizedBox(width: 4,),
                            Icon(Icons.keyboard_arrow_down_outlined,color: Colors.grey,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 2,),
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: Colors.blueGrey[800],
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text("Search",style: TextStyle(color: Colors.white),),
                    ),
                    onPressed: (){

                    },
                  ),
                ),
              ),
              SizedBox(height: 2,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 2,
                color: Colors.blueGrey,
              ),
              SizedBox(height: 10,),
              history(),
              SizedBox(height: 10,),
              history(),
              SizedBox(height: 10,),
              history(),
            ],
          ),
        ),
      ),
    );
  }
  history(){
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all()
      ),
      child: InkWell(
        onTap: (){
          Get.to(TripHistory());
        },
        child: Row(

          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.69,
              child: Row(
                children: [
                  Container(
                    height: 120,
                    width: 4,
                    color: Colors.green,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:4.0,right: 4,),
                    child: Container(
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 24,width: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(),
                            ),
                            alignment: Alignment.center,
                            child: Container(height: 16,width: 16,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("images/vehicle_red.png")
                                  )
                              ),
                            ),
                          ),
                          SizedBox(height: 4,),
                          Container(
                            height: 5,width: 5,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                              border: Border.all(),
                            ),
                          ),
                          SizedBox(height: 4,),
                          Container(
                            height: 5,width: 5,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                              border: Border.all(),
                            ),
                          ),
                          SizedBox(height: 4,),
                          Container(
                            height: 5,width: 5,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                              border: Border.all(),
                            ),
                          ),
                          SizedBox(height: 4,),
                          Container(
                            height: 5,width: 5,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                              border: Border.all(),
                            ),
                          ),
                          SizedBox(height: 4,),
                          Container(
                            height: 24,width: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(),
                            ),
                            alignment: Alignment.center,
                            child: Container(height: 16,width: 16,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("images/vehicle_green.png")
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8,bottom: 8,right: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("355 bukit, Abc, Singapore 123456",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            Text("22/09/2021  10:30 am",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12))
                          ],
                        ),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("355 bukit, Abc, Singapore 123456",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            Text("22/09/2021  10:30 am",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  height: 120,
                  width: 2,
                  color: Colors.black,
                ),
                Column(
                  children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width*0.3 -20 ,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black,width: 1),
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(//mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.timer),
                            SizedBox(width: 3,),
                            Column(
                              children: [
                                Text("Duration"),
                                Text("00:15:00")
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width*0.3 -20 ,
                      decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black,width: 1),
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(//mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.timer),
                            SizedBox(width: 3,),
                            Column(
                              children: [
                                Text("Distance"),
                                Text("15 KM")
                              ],
                            )
                          ],
                        ),
                      ),

                    ),
                    Container(
                      height: 35,
                      width: MediaQuery.of(context).size.width*0.3 -20 ,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(//mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey[800],
                                  borderRadius: BorderRadius.circular(3)
                              ),

                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(Icons.wrap_text,color: Colors.white,size: 18,),
                              ),
                            ),
                            SizedBox(width: 5,),
                            Text("View")

                          ],
                        ),
                      ),

                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}
