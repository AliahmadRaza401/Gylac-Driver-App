import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MapServices {
  static Future<Uint8List> getMarkerImage(BuildContext context) async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("asset/blackMarker.png");
    return byteData.buffer.asUint8List();
  }

  static Future<Uint8List> getMarkerWithSize(int width) async {
    ByteData data = await rootBundle.load("asset/blackMarker.png");
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
  static Future<Uint8List> getMarkerWithSize1(int width) async {
    ByteData data = await rootBundle.load("asset/no_order.png");
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  static Future<Uint8List> getMarkerWithSize2(int width) async {
    ByteData data = await rootBundle.load("asset/Rider.png");
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  static updateLocationInDB(driverID, latitude, longitude) {
    var collection = FirebaseFirestore.instance.collection('drivers');
    collection
        .doc(driverID)
        .update(
          {
            'latitude': latitude,
            'longitude': longitude,
          },
        ) // <-- Updated data
        .then((_) => print(
            ' update Location InDB Success___________________________________!'))
        .catchError((error) => print(' update Location InDB Failed: $error'));
  }

    static updateTrackStatusInDB(driverID, status) {
    var collection = FirebaseFirestore.instance.collection('drivers');
    collection
        .doc(driverID)
        .update(
          {
            'trackStatus': status,
         
          },
        ) // <-- Updated data
        .then((_) => print(
            ' update Location InDB Success___________________________________!'))
        .catchError((error) => print(' update Location InDB Failed: $error'));
  }
}
