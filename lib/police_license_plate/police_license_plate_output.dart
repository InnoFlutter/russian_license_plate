import 'package:flutter/material.dart';
import 'package:russian_license_plate/shared/models/license_plate.dart';

import '../shared/output/stateless_license_plate_widget.dart';
import 'police_license_plate.dart';
import 'police_license_plate_decoration.dart';

/// Output widget for a license plate for police cars
class PoliceLicensePlateOutput
    extends StatelessLicensePlateWidget<PoliceLicensePlate> {
  PoliceLicensePlateOutput({
    Key? key,
    required PoliceLicensePlate licensePlate,
    required double size,
  }) : super(licensePlate: licensePlate, size: size);

  @override
  Widget makeDecoration(Widget number, Widget region) {
    return PoliceLicensePlateDecoration(
      size: size,
      number: number,
      region: region,
    );
  }

  @override
  Color? get textColor => PoliceLicensePlateDecoration.borderColor;

  @override
  List<Widget> numberInputs() {
    return [
      Text(
        LicensePlate.toEng(licensePlate.series),
        textAlign: TextAlign.left,
        style: TextStyle(
          height: 1.18,
          fontSize: fontSize,
          fontFamily: "RoadNumbers",
          package: "russian_license_plate",
          color: textColor,
        ),
      ),
      Center(
        child: Text(
          licensePlate.numberAsString,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: "RoadNumbers",
            package: "russian_license_plate",
            color: textColor,
          ),
        ),
      ),
    ];
  }
}
