// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields

// import 'dart:async';
// import 'dart:typed_data';

// import 'package:chappers/screens/map/distace_calculate.dart';
// import 'package:chappers/screens/map/go_map.dart';
// import 'package:chappers/screens/map/map_services.dart';
// import 'package:chappers/screens/map/map_widget.dart';
// import 'package:chappers/screens/startJobScreen.dart';
// import 'package:chappers/utils/app_route.dart';
// import 'package:chappers/utils/utils.dart';
// import 'package:chappers/widgets/dynamic_size.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:provider/provider.dart';

// import '../../services/fcm_services.dart';

// class BottomNavMap extends StatefulWidget {
//   @override
//   _BottomNavMapState createState() => _BottomNavMapState();
// }

// class _BottomNavMapState extends State<BottomNavMap> {
//   final Set<Marker> _markers = {};
//   LatLng currentLaltg;
//   final Set<Marker> markers = new Set();
//   Set<Polyline> _polyline = Set<Polyline>();
//   List<LatLng> _polylineCoordinates = [];
//   PolylinePoints _polylinePoints;
//   final Set<Circle> circle = Set<Circle>();
//   var rideTime = 0.0;
//   var ridedistance = 0.0;
//   LatLng distination = LatLng(31.561920, 74.348083);
//   bool displayUser = true;
//   StreamSubscription geoLocatorListiner;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _polylinePoints = PolylinePoints();
//   }

//   LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
//   GoogleMapController _mapController;

//   void _onMapCreated(GoogleMapController _cntlr) {
//     _mapController = _cntlr;

//     locatePosition(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: <Widget>[
//             GoogleMap(
//               initialCameraPosition:
//                   CameraPosition(target: _initialcameraposition),
//               mapType: MapType.normal,
//               onMapCreated: _onMapCreated,
//               myLocationEnabled: false,
//               markers: markers,
//               circles: circle,
//               polylines: _polyline,
//             ),
//             // allUSerCard(),

//             displayUser == true
//                 ? requestCard(context, () {
                         
//                     setState(() {
//                       displayUser = false;
//                     });
//                     //     Navigator.of(context)
//                     //         .push(MaterialPageRoute(builder: (context) => GoMap()));
//                     getLiveLocationUpdate();
//                   })
//                 : bottomDistanceCancelBtn(context, rideTime, ridedistance),
//           ],
//         ),
//       ),
//     );
//   }

//   locatePosition(BuildContext context) async {
//     print('i am in the location function');
//     LocationPermission permission;
//     permission = await Geolocator.requestPermission();
//     LocationPermission status = await Geolocator.checkPermission();
//     if (status == LocationPermission.denied) {
//       print("Location is Off =======================>>");
//     } else {
//       print("Location is ON =======================>>");
//       Position position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);
//       var currentPosition = position;
//       LatLng latLatPosition = LatLng(position.latitude, position.longitude);
//       barbarMarker(latLatPosition);

//       CameraPosition cameraPosition =
//           new CameraPosition(target: latLatPosition, zoom: 14);
//       _mapController
//           .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//     }
//   }

//   getLiveLocationUpdate() {
//     LatLng oldPos = LatLng(0, 0);
//     geoLocatorListiner =
//         Geolocator.getPositionStream().listen((Position position) {
//       LatLng liveLocation = LatLng(position.latitude, position.longitude);

//       CameraPosition cameraPosition =
//           new CameraPosition(target: liveLocation, zoom: 17);
//       _mapController
//           .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//       //Update data in DB
//       MapServices.updateLocationInDB(
//         position.latitude,
//         position.longitude,
//       );
//       // Create Polylines
//       if (_polylineCoordinates == null || _polylineCoordinates.isEmpty) {
//         setPolylineOnMap(
//           position.latitude,
//           position.longitude,
//           distination.latitude,
//           distination.longitude,
//         );
//       }

//       setState(() {
//         markers.removeWhere((marker) => marker.markerId.value == 'barbar');
//         circle.removeWhere((circle) => circle.circleId.value == 'barbar');
//         CameraPosition cameraPosition =
//             new CameraPosition(target: liveLocation, zoom: 17);
//         _mapController
//             .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

//         barbarMarker(liveLocation);
//         // distance time
//         ridedistance =
//             calculateHarvesineDistanceInKM(liveLocation, distination);
//         rideTime = calculateETAInMinutes(ridedistance, 30);
//       });
//       if (ridedistance == 0 || ridedistance < 0.10) {
//         AppRoutes.push(context, StartJob());
//       }
//     });
//   }

//   void setPolylineOnMap(double startLat, double startLong, double destiLat,
//       double destiLong) async {
//     print("String Polyline..............................");

//     PolylineResult result = await _polylinePoints.getRouteBetweenCoordinates(
//         mapKey,
//         PointLatLng(startLat, startLong),
//         PointLatLng(destiLat, destiLong));
//     if (result.status == "OK") {
//       result.points.forEach((PointLatLng point) {
//         _polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });
//       userMarkers(LatLng(destiLat, destiLong));
//       setState(() {
//         _polyline.add(Polyline(
//             width: 5,
//             polylineId: PolylineId('polyline'),
//             color: Colors.red,
//             points: _polylineCoordinates));
//       });
//     } else {
//       print("Polyline Not Generated!!!!!!!!!!!!!!!!");
//     }
//   }

//   Future<Set<Marker>> barbarMarker(showLocation) async {
//     Uint8List imageData = await MapServices.getMarkerImage(context);
//     final Uint8List markerIcon = await MapServices.getMarkerWithSize(180);
//     //markers to place on map
//     setState(() {
//       markers.add(Marker(
//           markerId: MarkerId('barbar'),
//           position: showLocation,
//           infoWindow: InfoWindow(title: 'This is Barbar'),
//           draggable: false,
//           zIndex: 2,
//           flat: true,
//           anchor: Offset(0.5, 0.5),
//           icon: BitmapDescriptor.fromBytes(markerIcon)));

//       //add more markers here

//       circle.add(Circle(
//           circleId: CircleId("barbar"),
//           // radius: showLocation.accuracy,
//           radius: 50,
//           zIndex: 1,
//           strokeColor: Colors.red,
//           strokeWidth: 2,
//           center: showLocation,
//           fillColor: Colors.red.withAlpha(70)));
//     });
//     return markers;
//   }

//   Future<Set<Marker>> userMarkers(showLocation) async {
//     setState(() {
//       markers.add(Marker(
//         markerId: MarkerId("user"),
//         position: showLocation,
//         draggable: false,
//         zIndex: 2,
//         flat: true,
//         anchor: Offset(0.5, 0.5),
//         icon: BitmapDescriptor.defaultMarker, //Icon for Marker
//       ));
//     });
//     return markers;
//   }

//   // Widget allUSerCard() {
//   //   return Positioned(
//   //     bottom: 0,
//   //     child: Container(
//   //       height: dynamicHeight(context, 0.4),
//   //       width: dynamicWidth(context, 1),
//   //       padding: EdgeInsets.symmetric(
//   //         horizontal: dynamicWidth(context, 0.05),
//   //         vertical: 20,
//   //       ),
//   //       decoration: BoxDecoration(
//   //         color: Colors.white,
//   //         borderRadius: BorderRadius.only(
//   //           topLeft: Radius.circular(40),
//   //           topRight: Radius.circular(40),
//   //         ),
//   //       ),
//   //       child: SingleChildScrollView(
//   //         child: Column(
//   //           children: [
//   //             Text("All Request"),
//   //             requestCard(context, "user 1", () {
//   //               print("OnTaP_______________________________");
//   //               // setState(() {
//   //               //   displayUser = false;
//   //               // });
//   //               Navigator.of(context)
//   //                   .push(MaterialPageRoute(builder: (context) => GoMap()));
//   //               // getLiveLocationUpdate();
//   //             }),
//   //             Divider(
//   //               thickness: 1,
//   //               color: Colors.grey,
//   //             ),
//   //             requestCard(context, "user 2", () {
//   //               // setState(() {
//   //               //   displayUser = false;
//   //               // });
//   //               Navigator.of(context)
//   //                   .push(MaterialPageRoute(builder: (context) => GoMap()));
//   //               // getLiveLocationUpdate();
//   //             }),
//   //             Divider(
//   //               thickness: 1,
//   //               color: Colors.grey,
//   //             ),
//   //             requestCard(context, "user 3", () {
//   //               // setState(() {
//   //               //   displayUser = false;
//   //               // });
//   //               Navigator.of(context)
//   //                   .push(MaterialPageRoute(builder: (context) => GoMap()));
//   //               // getLiveLocationUpdate();
//   //             }),
//   //             Divider(
//   //               thickness: 1,
//   //               color: Colors.grey,
//   //             ),
//   //             requestCard(context, "user 4", () {
//   //               // setState(() {
//   //               //   displayUser = false;
//   //               // });
//   //               Navigator.of(context)
//   //                   .push(MaterialPageRoute(builder: (context) => GoMap()));
//   //               // getLiveLocationUpdate();
//   //             }),
//   //             Divider(
//   //               thickness: 1,
//   //               color: Colors.grey,
//   //             ),
//   //           ],
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }

//   @override
//   void dispose() {
//     _disposeController();
//     super.dispose();
//   }

//   Future<void> _disposeController() async {
//     final GoogleMapController controller = await _mapController;
//     controller.dispose();
//     geoLocatorListiner?.cancel();
//     super.dispose();
//   }
// }
