import 'package:flutter/material.dart';
import '../shared/decoration/license_plate_decoration.dart';

/// Decoration license plate for standart cars
class StandartLicensePlateDecoration extends StatelessWidget {
  const StandartLicensePlateDecoration({
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
      color: Colors.white,
      borderColor: Colors.black,
      size: size,
      number: number,
      leftNumberPadding: 0.25,
      rightNumberPadding: 0.05,
      region: region,
    );
  }
}
