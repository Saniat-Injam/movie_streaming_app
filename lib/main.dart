import 'package:flutter/material.dart';
import 'package:movie_streaming_app/app.dart';

// void main() {
//   runApp(const MyApp());
// }

import 'package:device_preview/device_preview.dart';

void main() => runApp(
  DevicePreview(
    builder: (context) => MyApp(), // Wrap your app
  ),
);
