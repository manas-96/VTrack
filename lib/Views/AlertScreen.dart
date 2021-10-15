import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vtrak/Views/Components/BottomNavigation.dart';
import 'package:vtrak/Views/Components/appBar.dart';
import 'package:vtrak/Views/Components/helper.dart';


class AlertScreen extends StatefulWidget {
  const AlertScreen({Key key}) : super(key: key);

  @override
  _AlertScreenState createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("ALERT SETTING"),
      bottomNavigationBar: bottomNavigation(5,context),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              switchButton(speeding, 1, "Speeding alert"),
              switchButton(engine, 2, "Engine ON / OFF alert"),
              switchButton(entry, 3, "Entry / Exit Geo-fence alert"),
              switchButton(maintenance, 4, "Maintenance alert"),
              switchButton(fuel, 5, "Fuel alert"),
              switchButton(gps, 6, "GPS Device Offline alert"),
            ],
          ),
        ),
      ),
    );
  }

  bool speeding=false;
  bool engine=false;
  bool entry=false;
  bool maintenance=false;
  bool fuel=false;
  bool gps=false;

  switchButton(bool val, int number, String title){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 1
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),
              Container(
                child: CupertinoSwitch(
                  value: val,
                  onChanged: (value){
                    if(number==1){
                      setSpeeding(value);
                    }
                    else if(number==2){
                      setEngine(value);
                    }
                    else if(number==3){
                      setEntry(value);
                    }
                    else if(number==4){
                      setMaintenance(value);
                    }
                    else if(number==5){
                      setFuel(value);
                    }
                    else{
                      setGps(value);
                    }
                  },
                  activeColor: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  setSpeeding(bool val){
    setState(() {
      speeding=val;
    });
  }
  setEngine(bool val){
    setState(() {
      engine=val;
    });
  }
  setEntry(bool val){
    setState(() {
      entry=val;
    });
  }
  setMaintenance(bool val){
    setState(() {
      maintenance=val;
    });
  }
  setFuel(bool val){
    setState(() {
      fuel=val;
    });
  }
  setGps(bool val){
    setState(() {
      gps=val;
    });
  }
}
