import 'package:flutter/material.dart';
import '../shared/decoration/license_plate_decoration.dart';

/// Decoration license plate for police cars
class RouteLicensePlateDecoration extends StatelessWidget {
  const RouteLicensePlateDecoration({
    Key? key,
    required this.size,
    required this.number,
    required this.region,
  }) : super(key: key);

  /// Size of the license plate
  final double size;

  /// Widget with series + number
  final Widget number;

  /// Widget with region code
  final Widget region;

  @override
  Widget build(BuildContext context) {
    return LicensePlateDecoration(
      color: Color(0xfff6ae26),
      borderColor: Colors.black,
      size: size,
      number: number,
      leftNumberPadding: 0.35,
      rightNumberPadding: 0.2,
      region: region,
    );
  }
}
