import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(SampleMapScreen());

class SampleMapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transition Demo',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  final _googleplex = new CameraPosition(
    target: LatLng(37.421512, -122.084101),
    zoom: 12.0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Hero(
        tag: 'mapHero',
        child: GoogleMap(
          initialCameraPosition: _googleplex,
          onTap: (latLng) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return DetailScreen(_googleplex);
            }));
          },
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  DetailScreen(this._position);
  final _position;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Hero(
        tag: 'mapHero',
        child: GoogleMap(
          initialCameraPosition: _position,
        ),
      ),
    );
  }
}
