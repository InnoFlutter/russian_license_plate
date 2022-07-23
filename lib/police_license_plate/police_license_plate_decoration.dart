import 'package:flutter/material.dart';
import '../shared/decoration/license_plate_decoration.dart';

/// Decoration license plate for a police car
class PoliceLicensePlateDecoration extends StatelessWidget {
  const PoliceLicensePlateDecoration({
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

  /// Color of the plate border
  static Color borderColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return LicensePlateDecoration(
      color: Color(0xff044db8),
      borderColor: borderColor,
      size: size,
      number: number,
      leftNumberPadding: 0.375,
      rightNumberPadding: 0.375,
      region: region,
    );
  }
}
