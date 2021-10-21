
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIClient{
  final baseUrl="http://www.ideetracker.com/mob_trk/";
  buildHeader(){
    return { 'Accept' : 'application/json', 'cache-control' : 'no-cache'};
  }
  static errorToast(String msg) {
    return SnackBar(
      content: Text(msg, style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.red,
      duration: Duration(seconds:2),
    );
  }
  static successToast(String msg) {
    return SnackBar(
      content: Text(msg, style: TextStyle(color: Colors.white),),
      duration: Duration(seconds:2),
    );
  }

  userData(data)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("clientId", data["ClientID"].toString());
    pref.setString("USeqNo", data["USeqNo"].toString());
  }
  login(String username, String password, String mobile, String lat, String long)async{
    final header = buildHeader();
    final response = await http.get(baseUrl+'mRegisterPg.jsp?Str_iMeiNo=1&Str_Model=Android'
        '&Str_Lat=$lat&Str_Long=$long&Str_GPS=Y&Client_ID=0&Str_UserID=$username'
        '&Str_Pwd=$password&Str_Mob=$mobile&Str_GCMID=1122'
        ,headers: header);
    print(response.statusCode);
    if(response.statusCode==200){
      final data=await json.decode(response.body);
      if(data["Success"]==1){
        userData(data);
      }
      return data;
    }
    else{
      return 'failed';
    }
  }
  setPin(String pin, String lat, String long)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    final uSeqNo= pref.getString("uSeqNo");
    final clientId= pref.getString("clientId");
    final header = buildHeader();
    final response = await http.get(baseUrl+'mSetPinPg.jsp?Str_iMeiNo=1&Str_Model=Android&'
        'Str_Lat=$lat&Str_Long=$long&Str_GPS=Y&Client_ID=$clientId&Str_USeqNo=$uSeqNo&Str_Pin=$pin'
        ,headers: header);
    print(response.statusCode);
    if(response.statusCode==200){
      final data=await json.decode(response.body);

      return data;
    }
    else{
      return 'failed';
    }
  }
  getPin(String pin, String lat, String long)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    final uSeqNo= pref.getString("uSeqNo");
    final clientId= pref.getString("clientId");
    final header = buildHeader();
    final response = await http.get(baseUrl+'mLoginPg.jsp?Str_iMeiNo=1&'
        'Str_Model=Android&Str_Lat=$lat&Str_Long=$long&Str_GPS=Y&Client_ID=$clientId&Str_USeqNo=$uSeqNo&Str_Pin=$pin'
        ,headers: header);
    print(response.statusCode);
    if(response.statusCode==200){
      final data=await json.decode(response.body);
      return data;
    }
    else{
      return 'failed';
    }
  }
}