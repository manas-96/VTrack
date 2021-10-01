import 'package:flutter/material.dart';

import 'helper.dart';



appBar(title){
  return AppBar(
    centerTitle: true,
    backgroundColor: color,
    leading: IconButton(
      icon: Icon(Icons.notifications,color: Colors.white,),
      onPressed: (){

      },
    ),
    title: Text(title,style: appBarStyle),
  );
}