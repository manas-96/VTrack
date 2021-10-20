import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtrak/DataService/APIClient.dart';
import 'package:vtrak/Views/Components/appBar.dart';

import 'Components/helper.dart';
import 'HomePage.dart';



class Dashboard extends StatefulWidget {
  final data;
  const Dashboard({Key key, this.data}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Color dashboardColor=Color(0xffffccbc);
  @override
  void initState() {
    print(widget.data);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: color,
        leading: IconButton(
          icon: Icon(Icons.menu,color: Colors.white,size: 38,),
          onPressed: (){

          },
        ),
        title: Text("DASHBOARD",style: appBarStyle),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications,color: Colors.white,size: 38,),
            onPressed: (){

            },
          ),
          IconButton(
            icon: Icon(Icons.refresh,color: Colors.white,size: 38,),
            onPressed: (){

            },
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 1,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: dashboardColor
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 60,
                                child: Icon(Icons.person,color: Colors.black,size: 40,),
                              ),

                              Container(
                                  alignment: Alignment.centerLeft,
                                  height: 50,
                                  width:MediaQuery.of(context).size.width- 82,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text("Mohamed Asik",style: TextStyle(color: Colors.black,fontSize: 18),),
                                  )
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 60,
                                child: ImageIcon(
                                  AssetImage("images/Icons/veh_plus_b.png")
                                ),
                              ),

                              Container(
                                  alignment: Alignment.centerLeft,
                                  height: 50,
                                  width:MediaQuery.of(context).size.width- 82,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text("GDB1234",style: TextStyle(color: Colors.black,fontSize: 18),),
                                  )
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Container(
                                height: 45,
                                width: 55,
                                child: ImageIcon(
                                    AssetImage("images/Icons/metro-calendar.png")
                                ),
                              ),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  height: 50,
                                  width:MediaQuery.of(context).size.width- 82,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5.0),
                                        child: Text("04-10-2021",style: TextStyle(color: Colors.black,fontSize: 18),),
                                      ),

                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: MediaQuery.of(context).size.height*0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: dashboardColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        padding: EdgeInsets.all(10),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 15,
                            childAspectRatio: 9/9
                        ),
                        itemCount: widget.data.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[900],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                                child: InkWell(
                                    onTap: (){
                                      if(widget.data[index]["Btn_Text"]=="VTRAK"){
                                        Get.to(HomePage());
                                      }
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 40,width: 50,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage("${APIClient().baseUrl}"+widget.data[index]["Btn_Img"]),
                                                  fit: BoxFit.cover
                                              )
                                          ),
                                        ),
                                        SizedBox(height: 4,),
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Text(widget.data[index]["Btn_Text"],
                                            style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    )
                                )
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: dashboardColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_pin,color: Colors.black,size: 38,),
                          SizedBox(width: 5,),
                          Container(
                            width: MediaQuery.of(context).size.width*0.7,
                            child: Text("219 UPPER BUKIT TIMAH RD, SINGAPORE",
                              style: TextStyle(color: Colors.black,fontSize: 18),
                              overflow: TextOverflow.clip,
                            ),
                          )
                        ],
                      ),
                      Divider(thickness: 2,),
                      SizedBox(height: 5,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageIcon(
                              AssetImage("images/Icons/GPS_G.png",),size: 40,
                            ),
                            SizedBox(width: 15,),
                            ImageIcon(
                              AssetImage("images/Icons/Truck_104px.png",),size: 40,
                            ),
                            SizedBox(width: 15,),
                            ImageIcon(
                              AssetImage("images/Icons/Truck_104px.png",),size: 40,
                            ),
                            SizedBox(width: 15,),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
