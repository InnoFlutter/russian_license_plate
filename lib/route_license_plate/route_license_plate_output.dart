import 'package:flutter/material.dart';
import 'package:russian_license_plate/shared/models/license_plate.dart';

import '../shared/output/stateless_license_plate_widget.dart';
import 'route_license_plate.dart';
import 'route_license_plate_decoration.dart';

/// Output widget for a license plate for taxis and buses
class RouteLicensePlateOutput
    extends StatelessLicensePlateWidget<RouteLicensePlate> {
  RouteLicensePlateOutput({
    Key? key,
    required RouteLicensePlate licensePlate,
    required double size,
  }) : super(key: key, licensePlate: licensePlate, size: size);

  @override
  Widget makeDecoration(Widget number, Widget region) {
    return RouteLicensePlateDecoration(
      size: size,
      number: number,
      region: region,
    );
  }

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
          ),
        ),
      ),
    ];
  }
}
