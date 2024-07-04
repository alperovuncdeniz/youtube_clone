import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void showErrorSnackBar(String message, context) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );

pickVideo() async {
  XFile? file = await ImagePicker().pickVideo(source: ImageSource.gallery);
  File video = File(file!.path);
  if (video != null) {
    return video;
  }
}

putFileInStorage(file, number, fileType) async {
  final ref = FirebaseStorage.instance.ref().child("$fileType/$number");
  final upload = ref.putFile(file);
  final snapshot = await upload;
  String downloadUrl = await snapshot.ref.getDownloadURL();
  return downloadUrl;
}
