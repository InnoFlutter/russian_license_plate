import 'package:flutter/material.dart';
import 'package:russian_license_plate/shared/models/license_plate.dart';

import '../shared/output/stateless_license_plate_widget.dart';
import 'standart_license_plate.dart';
import 'standart_license_plate_decoration.dart';

/// Output widget for a license plate for standart cars
class StandartLicensePlateOutput
    extends StatelessLicensePlateWidget<StandartLicensePlate> {
  StandartLicensePlateOutput({
    Key? key,
    required StandartLicensePlate licensePlate,
    required double size,
    bool showFlag = true,
  }) : super(
            key: key,
            licensePlate: licensePlate,
            size: size,
            showFlag: showFlag);

  @override
  Widget makeDecoration(Widget number, Widget region) {
    return StandartLicensePlateDecoration(
      size: size,
      number: number,
      region: region,
    );
  }

  @override
  List<Widget> numberInputs() {
    return [
      Text(
        LicensePlate.toEng(licensePlate.firstSeriesPart),
        textAlign: TextAlign.left,
        style: TextStyle(
          height: 1.18,
          fontSize: fontSize,
          fontFamily: "RoadNumbers",
          package: "russian_license_plate",
        ),
      ),
      Expanded(
        child: Center(
          child: Text(
            licensePlate.numberAsString,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
              fontFamily: "RoadNumbers",
              package: "russian_license_plate",
            ),
          ),
        ),
      ),
      Text(
        LicensePlate.toEng(licensePlate.secondSeriesPart),
        textAlign: TextAlign.right,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: "RoadNumbers",
          package: "russian_license_plate",
        ),
      ),
    ];
  }
}
