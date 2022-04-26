import 'dart:developer';

import 'package:driver_app/providers/auth_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class FirebaseServices {
  static Future<String> imageUpload(imageFile, name, BuildContext context) async {
    log("Saving Image...");
    dynamic image;
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(name);
    UploadTask uploadTask = ref.putFile(imageFile);
    await uploadTask.then((res) {
      image = res.ref.getDownloadURL();
    }).catchError((e) {
    
        Provider.of<AuthProvider>(context, listen: false).isLoading(false);
      print('e: $e');
    });
    return image;
  }
}
