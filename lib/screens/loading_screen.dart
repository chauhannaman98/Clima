import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void geoLocation() async {
    Position position = await getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
    );
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            geoLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
