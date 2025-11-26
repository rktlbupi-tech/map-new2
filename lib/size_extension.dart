import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;

extension SizeExtension on num {
  double sp(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return (this / 360) * width;
  }
}

const double figmaBaseWidth = 375; // set your base design width

extension PxExtension on num {
  double px(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return (this / figmaBaseWidth) * screenWidth;
  }
}

Future<BitmapDescriptor> bitmapFromNetwork(
  String url, {
  int width = 120,
}) async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) return BitmapDescriptor.defaultMarker;

    final bytes = response.bodyBytes;
    final decoded = img.decodeImage(bytes);
    if (decoded == null) return BitmapDescriptor.defaultMarker;

    final resized = img.copyResize(decoded, width: width);
    final resizedBytes = img.encodePng(resized);
    return BitmapDescriptor.fromBytes(resizedBytes);
  } catch (e) {
    print('Error loading network marker: $e');
    return BitmapDescriptor.defaultMarker;
  }
}
