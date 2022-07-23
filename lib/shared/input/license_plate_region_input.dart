import 'package:flutter/material.dart';
import 'package:russian_license_plate/shared/decoration/license_plate_region_decoration.dart';

import '../decoration/license_plate_region_decoration.dart';
import 'fields/fixed_digit_input.dart';

class LicensePlateRegionInput extends StatelessWidget {
  const LicensePlateRegionInput({
    Key? key,
    required this.size,
    this.showFlag = false,
    this.focusNode,
    this.onSubmitted,
    this.onChange,
    this.toForward,
    this.toBack,
    this.hintRegion = 125,
    this.hintColor,
    this.textColor,
  }) : super(key: key);

  /// Size of the region license plate
  final double size;

  /// If true show RUS flag
  final bool showFlag;

  /// Call on enter ended
  final void Function(int? value)? onSubmitted;

  /// Call on change value
  final void Function(int? value)? onChange;

  /// Call when user chose a forward input field
  final void Function(int? value)? toForward;

  /// Call when user chose last previous input field
  final void Function(int? value)? toBack;

  /// Focuse node
  final FocusNode? focusNode;

  /// Hint region
  final int hintRegion;

  /// Text color
  final Color? textColor;

  /// Hint color
  final Color? hintColor;

  @override
  Widget build(BuildContext context) {
    return LicensePlateRegionDecoration(
      size: size,
      showFlag: showFlag,
      textColor: textColor,
      region: Padding(
        padding: EdgeInsets.only(bottom: size * 0.11),
        child: FixedDigitInput(
          size: size * 0.72,
          numberDigits: 3,
          hintText: hintRegion.toString(),
          focusNode: focusNode,
          onSubmitted: onSubmitted,
          onChange: onChange,
          toForward: toForward,
          toBack: toBack,
          hintColor: hintColor,
          textColor: textColor,
        ),
      ),
    );
  }
}
