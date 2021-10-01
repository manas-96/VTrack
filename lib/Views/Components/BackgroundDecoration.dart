import 'package:flutter/material.dart';
import 'package:vtrak/Views/Components/helper.dart';



backgroundDecoration(String path){
  return BoxDecoration(
    image: DecorationImage(
      image: AssetImage(path),fit: BoxFit.fill
    )
  );
}


/// vehicle report container decoration

vehicleReportDecoration(){
  return BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    border: Border.all(color: color)
  );
}