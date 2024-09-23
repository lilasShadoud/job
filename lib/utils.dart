// import 'package:flutter/material.dart';
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source)async{
final ImagePicker _imagePicker =ImagePicker();
XFile? _file =await _imagePicker.pickImage(source: source);
if (_file!= null) {
  return await _file.readAsBytes();
}
print('no Image selected');
} 