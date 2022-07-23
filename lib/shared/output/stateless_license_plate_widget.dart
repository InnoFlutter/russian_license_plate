import 'package:flutter/material.dart';

import 'license_plate_region_output.dart';
import '../models/license_plate.dart';

/// StatelessWidget for license plate
abstract class StatelessLicensePlateWidget<T extends LicensePlate>
    extends StatelessWidget {
  StatelessLicensePlateWidget({
    Key? key,
    required this.licensePlate,
    required this.size,
    this.showFlag = false,
  })  : fontSize = size * 1.2,
        super(key: key);

  /// Output value
  final T licensePlate;

  /// Size of the license plate
  final double size;

  /// Font size
  final double fontSize;

  /// If true show RUS flag
  final bool showFlag;

  /// Text color
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return makeDecoration(
        _numberOutput(),
        LicensePlateRegionOutput(
          region: licensePlate.region,
          textColor: textColor,
          size: size,
          showFlag: showFlag,
        ));
  }

  Widget _numberOutput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: numberInputs(),
    );
  }

  /// Male decoration for the plate from number and region
  Widget makeDecoration(Widget number, Widget region);

  /// Return outputs fields for the plate number + series
  List<Widget> numberInputs();
}
