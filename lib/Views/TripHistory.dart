import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'Components/appBar.dart';



class TripHistory extends StatefulWidget {
  const TripHistory({Key key}) : super(key: key);

  @override
  _TripHistoryState createState() => _TripHistoryState();
}

class _TripHistoryState extends State<TripHistory> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(23.5204, 87.3119);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("TRIP HISTORY"),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
            Positioned(
              bottom: 30,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Container(
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 38,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(color: Colors.black,width: 1)
                            )
                          ),
                          alignment: Alignment.center,
                          child: Icon(Icons.pause,color: Colors.black,),
                        ),
                        Container(
                          width: 38,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(color: Colors.black,width: 1)
                              )
                          ),
                          alignment: Alignment.center,
                          child: Icon(Icons.play_arrow,color: Colors.black,),
                        ),
                        Container(
                          width: 38,
                          height: 40,
                          alignment: Alignment.center,
                          child: Icon(Icons.stop,color: Colors.black,),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
