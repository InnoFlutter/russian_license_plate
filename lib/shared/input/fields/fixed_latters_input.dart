import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'fixed_symbols_input.dart';
import '../../models/license_plate.dart';

class FixedLattersInput extends StatefulWidget {
  const FixedLattersInput({
    Key? key,
    required this.size,
    required this.numberLatters,
    this.focusNode,
    this.onSubmitted,
    this.onChange,
    this.toForward,
    this.toBack,
    this.hintText = "",
    this.textAlign = TextAlign.center,
    this.hintColor,
    this.textColor,
  }) : super(key: key);

  /// Number of input latters
  final int numberLatters;

  /// UI size of the widget
  final double size;

  /// Call on enter ended
  final void Function(String value)? onSubmitted;

  /// Call on change value
  final void Function(String value)? onChange;

  /// Call when user chose a forward input field
  final void Function(String value)? toForward;

  /// Call when user chose a previous input field
  final void Function(String value)? toBack;

  /// Focuse node
  final FocusNode? focusNode;

  /// Hint text
  final String hintText;

  /// Text align
  final TextAlign textAlign;

  /// Text color
  final Color? textColor;

  /// Hint color
  final Color? hintColor;

  @override
  State<FixedLattersInput> createState() => _FixedLattersInputState();
}

class _FixedLattersInputState extends State<FixedLattersInput> {
  @override
  Widget build(BuildContext context) {
    return FixedSymbolsInput(
      size: widget.size,
      numberSymbols: widget.numberLatters,
      onSubmitted: widget.onSubmitted,
      onChange: widget.onChange,
      toForward: widget.toForward,
      toBack: widget.toBack,
      focusNode: widget.focusNode,
      keyboardType: TextInputType.visiblePassword,
      hintText: widget.hintText,
      textAlign: widget.textAlign,
      hintColor: widget.hintColor,
      textColor: widget.textColor,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
            RegExp('[AaАаBbВвEeЕеKkКкMmМмHhНнOoОоPpРрCcСсTtТтYyУуXxХх]')),
        TextInputFormatter.withFunction(
          (oldValue, newValue) => newValue.copyWith(
            text: LicensePlate.toEng(newValue.text),
          ),
        ),
      ],
    );
  }
}
