import 'package:flutter/material.dart';
import 'package:russian_license_plate/shared/input/license_plate_input_error.dart';

import '../shared/models/license_plate.dart';
import '../shared/input/stateful_license_plate_widget.dart';
import '../shared/input/fields/fixed_digit_input.dart';
import '../shared/input/fields/fixed_latters_input.dart';
import 'route_license_plate.dart';
import 'route_license_plate_decoration.dart';

/// Input widget for a license plate for taxis and buses
class RouteLicensePlateInput
    extends StatefulLicensePlateWidget<RouteLicensePlate> {
  RouteLicensePlateInput({
    Key? key,
    required double size,
    RouteLicensePlate? hintPlate,
    Function(RouteLicensePlate?, LicensePlateInputError?)? onSubmitted,
  }) : super(
          key: key,
          size: size,
          hintPlate: hintPlate ?? RouteLicensePlate.from("TA777125"),
          showFlag: false,
          onSubmitted: onSubmitted,
        );

  @override
  State<RouteLicensePlateInput> createState() => _RouteLicensePlateInputState();
}

class _RouteLicensePlateInputState
    extends StateLicensePlate<RouteLicensePlate, RouteLicensePlateInput> {
  @override
  List<Widget> numberInputs() {
    return [
      FixedLattersInput(
        size: widget.size,
        numberLatters: 2,
        focusNode: focuses[0],
        hintText: LicensePlate.toEng(widget.hintPlate.series),
        textAlign: TextAlign.left,
        onChange: (value) {
          series = value;
        },
        toForward: (value) {
          forwardFocusFor(0);
        },
      ),
      FixedDigitInput(
        size: widget.size,
        numberDigits: 3,
        focusNode: focuses[1],
        hintText: widget.hintPlate.numberAsString,
        textAlign: TextAlign.right,
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
  RouteLicensePlate makePlateModel() {
    return RouteLicensePlate(
      series: series,
      number: number!,
      region: region!,
    );
  }

  @override
  Widget makePlateWidget(Widget number, Widget region) {
    return RouteLicensePlateDecoration(
      size: widget.size,
      number: number,
      region: region,
    );
  }

  @override
  bool isValidSeries() {
    return RouteLicensePlate.isValidSeries(series);
  }

  @override
  bool isValidNumber() {
    return RouteLicensePlate.isValidNumber(number ?? 0);
  }

  @override
  bool isValidRegion() {
    return RouteLicensePlate.isValidRegion(region ?? 0);
  }
}
