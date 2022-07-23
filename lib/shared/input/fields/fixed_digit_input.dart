import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'fixed_symbols_input.dart';

/// Input fixed number of digits
class FixedDigitInput extends StatefulWidget {
  const FixedDigitInput({
    Key? key,
    required this.size,
    required this.numberDigits,
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

  /// Number of input digits
  final int numberDigits;

  /// UI size of the widget
  final double size;

  /// Call on enter ended
  final void Function(int? value)? onSubmitted;

  /// Call on change value
  final void Function(int? value)? onChange;

  /// Call when user chose a forward input field
  final void Function(int? value)? toForward;

  /// Call when user chose a previous input field
  final void Function(int? value)? toBack;

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
  State<FixedDigitInput> createState() => _FixedDigitInputState();
}

class _FixedDigitInputState extends State<FixedDigitInput> {
  @override
  Widget build(BuildContext context) {
    return FixedSymbolsInput(
      size: widget.size,
      numberSymbols: widget.numberDigits,
      onSubmitted: (value) {
        widget.onSubmitted?.call(_toInt(value));
      },
      onChange: (value) {
        widget.onChange?.call(_toInt(value));
      },
      toForward: (value) {
        widget.toForward?.call(_toInt(value));
      },
      toBack: (value) {
        widget.toBack?.call(_toInt(value));
      },
      focusNode: widget.focusNode,
      keyboardType: TextInputType.number,
      hintText: widget.hintText,
      textAlign: widget.textAlign,
      hintColor: widget.hintColor,
      textColor: widget.textColor,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
      ],
    );
  }

  int? _toInt(String value) {
    return value.isEmpty ? null : int.parse(value);
  }
}
