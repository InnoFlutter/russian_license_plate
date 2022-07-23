import 'package:flutter/material.dart';
import 'package:russian_license_plate/shared/input/license_plate_input_error.dart';

import '../shared/models/license_plate.dart';
import '../shared/input/stateful_license_plate_widget.dart';
import '../shared/input/fields/fixed_digit_input.dart';
import '../shared/input/fields/fixed_latters_input.dart';
import 'police_license_plate.dart';
import 'police_license_plate_decoration.dart';

/// Input widget for a license plate for police cars
class PoliceLicensePlateInput
    extends StatefulLicensePlateWidget<PoliceLicensePlate> {
  PoliceLicensePlateInput({
    Key? key,
    required double size,
    PoliceLicensePlate? hintPlate,
    Function(PoliceLicensePlate?, LicensePlateInputError?)? onSubmitted,
  }) : super(
          key: key,
          size: size,
          hintPlate: hintPlate ?? PoliceLicensePlate.from("M000125"),
          showFlag: false,
          onSubmitted: onSubmitted,
        );

  @override
  State<PoliceLicensePlateInput> createState() =>
      _PoliceLicensePlateInputState();
}

class _PoliceLicensePlateInputState
    extends StateLicensePlate<PoliceLicensePlate, PoliceLicensePlateInput> {
  @override
  List<Widget> numberInputs() {
    return [
      FixedLattersInput(
        size: widget.size,
        numberLatters: 1,
        focusNode: focuses[0],
        hintText: LicensePlate.toEng(widget.hintPlate.series),
        textAlign: TextAlign.left,
        hintColor: hintColor,
        textColor: textColor,
        onChange: (value) {
          series = value;
        },
        toForward: (value) {
          forwardFocusFor(0);
        },
      ),
      FixedDigitInput(
        size: widget.size,
        numberDigits: 4,
        focusNode: focuses[1],
        hintText: widget.hintPlate.numberAsString,
        textAlign: TextAlign.right,
        hintColor: hintColor,
        textColor: textColor,
        onChange: (value) {
          number = value;
        },
        toForward: (value) {
          forwardFocusFor(1);
        },
        toBack: (value) {
          backFocusFor(1);
        },
      ),
    ];
  }

  @override
  int get numberInputsFields => 2;

  @override
  PoliceLicensePlate makePlateModel() {
    return PoliceLicensePlate(
      series: series,
      number: number!,
      region: region!,
    );
  }

  @override
  Widget makePlateWidget(Widget number, Widget region) {
    return PoliceLicensePlateDecoration(
      size: widget.size,
      number: number,
      region: region,
    );
  }

  @override
  Color? get textColor => PoliceLicensePlateDecoration.borderColor;

  @override
  Color? get hintColor => Color(0xbed9d9d9);

  @override
  bool isValidSeries() {
    return PoliceLicensePlate.isValidSeries(series);
  }

  @override
  bool isValidNumber() {
    return PoliceLicensePlate.isValidNumber(number ?? 0);
  }

  @override
  bool isValidRegion() {
    return PoliceLicensePlate.isValidRegion(region ?? 0);
  }
}
