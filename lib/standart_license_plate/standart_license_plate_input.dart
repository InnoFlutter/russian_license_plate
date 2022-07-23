import 'package:flutter/material.dart';
import 'package:russian_license_plate/shared/input/license_plate_input_error.dart';

import '../shared/models/license_plate.dart';
import '../shared/input/stateful_license_plate_widget.dart';
import '../shared/input/fields/fixed_digit_input.dart';
import '../shared/input/fields/fixed_latters_input.dart';
import 'standart_license_plate.dart';
import 'standart_license_plate_decoration.dart';

/// Input widget for a license plate for standarts cars
class StandartLicensePlateInput
    extends StatefulLicensePlateWidget<StandartLicensePlate> {
  StandartLicensePlateInput({
    Key? key,
    required double size,
    StandartLicensePlate? hintPlate,
    bool showFlag = true,
    Function(StandartLicensePlate?, LicensePlateInputError?)? onSubmitted,
  }) : super(
          key: key,
          size: size,
          hintPlate: hintPlate ?? StandartLicensePlate.from("B257YK27"),
          showFlag: showFlag,
          onSubmitted: onSubmitted,
        );

  @override
  State<StandartLicensePlateInput> createState() =>
      _StandartLicensePlateInputState();
}

class _StandartLicensePlateInputState
    extends StateLicensePlate<StandartLicensePlate, StandartLicensePlateInput> {
  String _seriasFirstPart = "";
  String _seriasSecondPart = "";

  @override
  String get series => _seriasFirstPart + _seriasSecondPart;

  @override
  List<Widget> numberInputs() {
    return [
      FixedLattersInput(
        size: widget.size,
        numberLatters: 1,
        focusNode: focuses[0],
        hintText: LicensePlate.toEng(widget.hintPlate.firstSeriesPart),
        textAlign: TextAlign.left,
        onChange: (value) {
          _seriasFirstPart = value;
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
        textAlign: TextAlign.center,
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
      FixedLattersInput(
        size: widget.size,
        numberLatters: 2,
        focusNode: focuses[2],
        hintText: LicensePlate.toEng(widget.hintPlate.secondSeriesPart),
        textAlign: TextAlign.right,
        onChange: (value) {
          _seriasSecondPart = value;
        },
        toForward: (value) {
          forwardFocusFor(2);
        },
        toBack: (value) {
          backFocusFor(2);
        },
      ),
    ];
  }

  @override
  StandartLicensePlate makePlateModel() {
    return StandartLicensePlate(
      series: series,
      number: number!,
      region: region!,
    );
  }

  @override
  Widget makePlateWidget(Widget number, Widget region) {
    return StandartLicensePlateDecoration(
      size: widget.size,
      number: number,
      region: region,
    );
  }

  @override
  bool isValidSeries() {
    return StandartLicensePlate.isValidSeries(series);
  }

  @override
  bool isValidNumber() {
    return StandartLicensePlate.isValidNumber(number ?? 0);
  }

  @override
  bool isValidRegion() {
    return StandartLicensePlate.isValidRegion(region ?? 0);
  }
}
