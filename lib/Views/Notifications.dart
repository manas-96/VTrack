import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtrak/Views/Components/helper.dart';



class Notifications extends StatefulWidget {
  const Notifications({Key key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              print("bal");
              Get.back();

            },
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white,width: 2)
              ),
              child: Icon(Icons.arrow_back,color: Colors.white,),
            ),
          ),
        ),
        title: Text("NOTIFICATION",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            notifications(true, true, "GBB6501H", "Engine On   17-09-2021  12:36"),
            notifications(false, true, "GBB6501H", "Engine On   17-09-2021  12:36"),
            notifications(true, false, "GBB6501H", "Engine On   17-09-2021  12:36"),
            notifications(false, false, "GBB6501H", "Engine On   17-09-2021  12:36")
          ],
        ),
      ),
    );
  }
  notifications(bool pic, bool tail,String title, String sub){
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
      child: Card(
        child: Container(
          width: MediaQuery.of(context).size.width,

          child: Padding(
            padding: const EdgeInsets.only(left :8 , right: 8),
            child: ListTile(
              leading: Container(
                height: 50,width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black),
                  image: DecorationImage(
                    image: pic?AssetImage("images/IGN_engine_green.png"):
                    AssetImage("images/IGN_engine_red.png")
                  )
                ),
              ),
              title: Text(title),
              subtitle: Text(sub),
              trailing: tail?
              Container(
                height: 12,width: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle
                    ),
                  ),
                ),
              ):Container(height: 1,width: 1,),
            ),
          ),
        ),
      ),
    );
  }
}
