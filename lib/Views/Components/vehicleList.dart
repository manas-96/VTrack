import 'package:flutter/material.dart';

import 'BackgroundDecoration.dart';
import 'helper.dart';



vehicleList(Color color1,String path, context,bool listPage){
  return Container(
      width: listPage?MediaQuery.of(context).size.width:MediaQuery.of(context).size.width*0.8,
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: listPage?null:BorderRadius.circular(10),
          border: listPage?Border(
            left: BorderSide(color: color1,width: 3),
            top: BorderSide(color: Colors.grey,width: 1),
            bottom: BorderSide(color: Colors.grey,width: 1),
            right: BorderSide(color: Colors.grey,width: 1),
          ):Border.all(color: color,width: 2),

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
                Container(width: MediaQuery.of(context).size.width*0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("GBH1534J",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                      Text(DateTime.now().toString().split(".").first,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
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
              height: 50,
              width: 40,
              decoration: backgroundDecoration(path),
            )
          ],
        ),
      )
  );
}
