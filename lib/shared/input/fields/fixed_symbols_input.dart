import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Input fixed number of symbols
class FixedSymbolsInput extends StatefulWidget {
  const FixedSymbolsInput({
    Key? key,
    required this.size,
    required this.numberSymbols,
    this.onSubmitted,
    this.inputFormatters,
    this.focusNode,
    this.onChange,
    this.toForward,
    this.toBack,
    this.keyboardType,
    this.hintText = "",
    this.hintColor,
    this.textAlign = TextAlign.center,
    this.textColor,
  }) : super(key: key);

  /// Number of input simbols
  final int numberSymbols;

  /// UI size of the widget
  final double size;

  /// Call on enter ended
  final void Function(String value)? onSubmitted;

  /// Call on change
  final void Function(String value)? onChange;

  /// Call when user chose a forward input field
  final void Function(String value)? toForward;

  /// Call when user chose a previous input field
  final void Function(String value)? toBack;

  /// Formater the input
  final List<TextInputFormatter>? inputFormatters;

  /// Focuse node
  final FocusNode? focusNode;

  /// Kyboard type for input
  final TextInputType? keyboardType;

  /// Hint text
  final String hintText;

  /// Text align
  final TextAlign textAlign;

  /// Text color
  final Color? textColor;

  /// Hint color
  final Color? hintColor;

  @override
  State<FixedSymbolsInput> createState() => _FixedSymbolsInputState();
}

class _FixedSymbolsInputState extends State<FixedSymbolsInput> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double fontK = 1.2;
    double width = widget.size * fontK * (widget.numberSymbols * 0.44 + 0.06);

    return Container(
      width: width,
      height: widget.size,
      alignment: Alignment.bottomCenter,
      child: RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (event) {
          if (event is RawKeyDownEvent) {
            if (_isMoveBack(event)) {
              widget.toBack?.call(controller.text);
            }
            if (_isMoveForward(event)) {
              widget.toForward?.call(controller.text);
            }
          }
        },
        child: Baseline(
          baseline: widget.size * 0.87,
          baselineType: TextBaseline.alphabetic,
          child: TextField(
            controller: controller,
            textAlign: widget.textAlign,
            textAlignVertical: TextAlignVertical.bottom,
            keyboardType: widget.keyboardType,
            maxLines: 1,
            maxLength: widget.numberSymbols,
            inputFormatters: widget.inputFormatters,
            focusNode: widget.focusNode,
            autocorrect: false,
            enableSuggestions: false,
            smartDashesType: SmartDashesType.disabled,
            smartQuotesType: SmartQuotesType.disabled,
            decoration: InputDecoration(
              border: InputBorder.none,
              counterText: "",
              hintStyle: TextStyle(
                color: widget.hintColor,
              ),
              hintText: widget.hintText,
            ),
            style: TextStyle(
              color: widget.textColor,
              height: 1.18,
              fontSize: fontK * (widget.size - 4.3),
              fontFamily: "RoadNumbers",
              package: "russian_license_plate",
            ),
            onChanged: (value) {
              widget.onChange?.call(value);
              if (value.length >= widget.numberSymbols) {
                widget.toForward?.call(value);
              }
            },
            onSubmitted: (value) {
              widget.onSubmitted?.call(value);
            },
          ),
        ),
      ),
    );
  }

  bool _isMoveForward(RawKeyEvent event) {
    const keyes = [LogicalKeyboardKey.arrowRight];
    return (controller.selection.base.offset == controller.text.length) &&
        keyes.contains(event.logicalKey);
  }

  bool _isMoveBack(RawKeyEvent event) {
    const keyes = [LogicalKeyboardKey.backspace, LogicalKeyboardKey.arrowLeft];
    return (controller.selection.base.offset == 0) &&
        keyes.contains(event.logicalKey);
  }
}
