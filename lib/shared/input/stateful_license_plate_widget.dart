import 'package:flutter/material.dart';

import 'license_plate_input_error.dart';
import '../models/license_plate.dart';
import 'license_plate_region_input.dart';

/// StatefulWidget for license plate
abstract class StatefulLicensePlateWidget<T extends LicensePlate>
    extends StatefulWidget {
  const StatefulLicensePlateWidget({
    Key? key,
    required this.size,
    required this.hintPlate,
    this.showFlag = false,
    this.onSubmitted,
  }) : super(key: key);

  /// Size of the license plate
  final double size;

  /// Hint value
  final T hintPlate;

  /// If true show RUS flag
  final bool showFlag;

  /// Call on enter ended
  final void Function(T? value, LicensePlateInputError? error)? onSubmitted;
}

/// State for StatefulLicensePlateWidget
abstract class StateLicensePlate<T extends LicensePlate,
    ST extends StatefulLicensePlateWidget<T>> extends State<ST> {

  /// Focuses for inputs fields
  List<FocusNode> focuses = [];

  /// Number of series + number inputs fields
  int numberInputsFields = 3;

  /// Color of the text
  Color? textColor;

  /// Color of the hint text
  Color? hintColor;

  /// The plate series
  String series = "";

  /// The plate number
  int? number;

  /// The plate region
  int? region;

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < numberInputsFields + 1; i++) {
      focuses.add(FocusNode());
      focuses[i].addListener(() {
        if (!focuses[i].hasFocus && !_isHasFocus()) {
          Future.delayed(Duration(milliseconds: 100), () {
            if (!_isHasFocus()) _submit();
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return makePlateWidget(_numberInput(), _regionInput());
  }

  /// Move focuse back for the focus with focusIndex
  void backFocusFor(int focusIndex) {
    int last = focusIndex - 1;

    if (!_isValidFocusIndex(last)) return;

    FocusScope.of(context).requestFocus(focuses[last]);
  }

  /// Move focuse forward for the focus with focusIndex
  void forwardFocusFor(int focusIndex) {
    int next = focusIndex + 1;

    if (!_isValidFocusIndex(next)) return;

    FocusScope.of(context).requestFocus(focuses[next]);
  }

  bool _isValidFocusIndex(int focusIndex) {
    return focusIndex >= 0 && focusIndex < focuses.length;
  }

  bool _isHasFocus() {
    return focuses.where((element) => element.hasFocus).isNotEmpty;
  }

  Widget _numberInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      children: numberInputs(),
    );
  }

  Widget _regionInput() {
    return LicensePlateRegionInput(
      size: widget.size,
      showFlag: widget.showFlag,
      hintRegion: widget.hintPlate.region,
      focusNode: focuses[numberInputsFields],
      textColor: textColor,
      hintColor: hintColor,
      onChange: (value) {
        region = value;
      },
      toBack: (value) {
        backFocusFor(numberInputsFields);
      },
    );
  }

  void _submit() {
    if (!isValidSeries()) {
      widget.onSubmitted?.call(null, LicensePlateInputError.series);
      return;
    }

    if (!isValidNumber()) {
      widget.onSubmitted?.call(null, LicensePlateInputError.number);
      return;
    }

    if (!isValidRegion()) {
      widget.onSubmitted?.call(null, LicensePlateInputError.region);
      return;
    }

    widget.onSubmitted?.call(makePlateModel(), null);
  }

  /// Return true if the plate series is valid
  bool isValidSeries();

  /// Return true if the plate number is valid
  bool isValidNumber();

  /// Return true if the plate region is valid
  bool isValidRegion();

  /// Make plate widget with number and region
  Widget makePlateWidget(Widget number, Widget region);

  /// Make the plate model
  T makePlateModel();

  /// Return inputs fields for the plate number + series
  List<Widget> numberInputs();
}
