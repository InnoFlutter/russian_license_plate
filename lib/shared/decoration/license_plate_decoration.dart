import 'package:flutter/material.dart';

/// Decorator for license plates
class LicensePlateDecoration extends StatelessWidget {
  const LicensePlateDecoration(
      {this.borderColor = Colors.black,
      this.color = Colors.white,
      Key? key,
      required this.size,
      required this.number,
      required this.region,
      this.leftNumberPadding = 0.2,
      this.rightNumberPadding = 0})
      : super(key: key);

  /// Size of the license plate
  final double size;

  /// Color of the plate border
  final Color borderColor;

  /// Clor of the plate background color
  final Color color;

  /// Widget with series + number
  final Widget number;

  /// Widget with region code
  final Widget region;

  /// Padding from left side of number widget
  final double leftNumberPadding;

  /// Padding from right side of number widget
  final double rightNumberPadding;

  @override
  Widget build(BuildContext context) {
    BorderSide border = BorderSide(
      width: size * 0.045,
      color: borderColor,
    );
    Radius borderRadius = Radius.circular(size * 0.2);

    return Container(
      width: size * 5.2,
      height: size * 1.12,
      child: DecoratedBox(
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                side: border, borderRadius: BorderRadius.all(borderRadius)),
            color: color),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(
                left: size * leftNumberPadding,
                right: size * rightNumberPadding,
              ),
              child: Center(child: number),
            )),
            Container(
              constraints: BoxConstraints(minWidth: size * 1.3),
              height: size * 1.12,
              child: DecoratedBox(
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          side: border,
                          borderRadius: BorderRadius.only(
                            topRight: borderRadius,
                            bottomRight: borderRadius,
                          )),
                      color: color),
                  child: Padding(
                    padding: EdgeInsets.only(right: size * 0.1),
                    child: Center(child: region),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
