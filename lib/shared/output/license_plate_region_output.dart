import 'package:flutter/material.dart';
import 'package:russian_license_plate/shared/decoration/license_plate_region_decoration.dart';

import '../decoration/license_plate_region_decoration.dart';

/// License plate region output
class LicensePlateRegionOutput extends StatelessWidget {
  const LicensePlateRegionOutput({
    this.showFlag = false,
    Key? key,
    required this.region,
    required this.size,
    this.textColor,
  }) : super(key: key);

  /// Widget with region code
  final int region;

  /// Size of the license plate
  final double size;

  /// If true show RUS flag
  final bool showFlag;

  /// Text color
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return LicensePlateRegionDecoration(
      size: size,
      showFlag: showFlag,
      textColor: textColor,
      region: Text(
        "${region < 10 ? "0" : ""}$region",
        style: TextStyle(
            fontSize: size * 0.8,
            color: textColor,
            fontFamily: "RoadNumbers",
            package: "russian_license_plate"
        ),
      ),
    );
  }
}
