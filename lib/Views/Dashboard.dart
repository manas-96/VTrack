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
          icon: Icon(Icons.phone_android,color: Colors.white,),
          onPressed: (){

          },
        ),
        title: Text("Dashboard",style: appBarStyle),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none,color: Colors.white,),
            onPressed: (){

            },
          ),
          IconButton(
            icon: Icon(Icons.refresh,color: Colors.white,),
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
          child: ListView(
            children: [
              SizedBox(height: 1,),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 60,
                      color: color,
                      child: Icon(Icons.person,color: Colors.white,size: 40,),
                    ),

                    Container(
                      alignment: Alignment.centerLeft,
                      height: 50,
                      width:MediaQuery.of(context).size.width- 82,
                      color: color,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text("Mohamed Asik",style: TextStyle(color: Colors.white,fontSize: 18),),
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
                      color: color,
                      child: Icon(Icons.add,color: Colors.white,size: 40,),
                    ),

                    Container(
                        alignment: Alignment.centerLeft,
                        height: 50,
                        width:MediaQuery.of(context).size.width- 82,
                        color: color,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text("GDB1234",style: TextStyle(color: Colors.white,fontSize: 18),),
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
                      color: color,
                      child: Icon(Icons.calendar_today,color: Colors.white,size: 40,),
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        height: 50,
                        width:MediaQuery.of(context).size.width- 82,
                        color: color,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text("04-10-2021",style: TextStyle(color: Colors.white,fontSize: 18),),
                            ),

                          ],
                        )
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                color: color,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    padding: EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 12/13
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
                                  height: 50,width: 60,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage("${APIClient().baseUrl}"+widget.data[index]["Btn_Img"]),
                                      fit: BoxFit.cover
                                    )
                                  ),
                                ),
                                SizedBox(height: 4,),
                                Text(widget.data[index]["Btn_Text"],
                                  style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
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
              SizedBox(
                height: MediaQuery.of(context).size.height*0.08,
              ),
              Container(color: color,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_pin,color: Colors.white,),
                          SizedBox(width: 2,),
                          Text("219 UPPER BUKIT TIMAH RD, SINGAPORE",
                            style: TextStyle(color: Colors.white,fontSize: 18),
                          )
                        ],
                      ),
                      SizedBox(height: 5,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person,color: Colors.white,),
                            SizedBox(width: 5,),
                            Icon(Icons.person,color: Colors.white),
                            SizedBox(width: 5,),
                            Icon(Icons.person,color: Colors.white),
                            SizedBox(width: 5,),
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
