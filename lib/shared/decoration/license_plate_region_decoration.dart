import 'package:flutter/material.dart';

/// Decorator for region of license plates
class LicensePlateRegionDecoration extends StatelessWidget {
  const LicensePlateRegionDecoration({
    Key? key,
    this.showFlag = false,
    required this.region,
    required this.size,
    this.textColor,
  }) : super(key: key);

  /// Widget with region code
  final Widget region;

  /// Size of the license plate
  final double size;

  /// If true show RUS flag
  final bool showFlag;

  /// Color of the text
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        region,
        Padding(
          padding: EdgeInsets.only(bottom: size * 0.1),
          child: Baseline(
            baseline: size * 0.1,
            baselineType: TextBaseline.alphabetic,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size * 0.05),
                  child: Text(
                    "RUS",
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: size * 0.2,
                    ),
                  ),
                ),
                if (showFlag) ...[ _flag() ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _flag() {
    return Container(
      height: size * 0.22,
      width: size * 0.4,
      decoration: BoxDecoration(
        border: Border.all(
          width: size * 0.02,
          color: Colors.black,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Color(0xff0033a0)),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Color(0xffda291c)),
            ),
          )
        ],
      ),
    );
  }
}
