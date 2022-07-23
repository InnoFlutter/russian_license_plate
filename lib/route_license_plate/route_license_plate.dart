import '../shared/models/license_plate.dart';

/// Model a license plate for taxis and buses
class RouteLicensePlate extends LicensePlate {
  RouteLicensePlate({
    required String series,
    required int number,
    required int region,
  })  : assert(isValidSeries(series)),
        assert(isValidNumber(number)),
        assert(isValidRegion(region)),
        super(series: series, number: number, region: region);

  /// Make license plate from string
  static from(String value) {
    if (value.length <= 5) return null;

    try {
      return RouteLicensePlate(
        series: value.substring(0, 2).toString(),
        number: int.parse(value.substring(2, 5).toString()),
        region: int.parse(value.substring(5)),
      );
    } catch (e) {
      return null;
    }
  }

  @override
  String toString() {
    return series + numberAsString + regionAsString;
  }

  @override
  String get numberAsString => LicensePlate.numberToString(number, 3);

  /// Return true if series is valid
  static bool isValidSeries(String series) {
    return series.length == 2 &&
        LicensePlate.isValidSeries(LicensePlate.toRus(series));
  }

  /// Return true if number is valid
  static bool isValidNumber(int number) {
    return number < 1000 && LicensePlate.isValidNumber(number);
  }

  /// Return true if region is valid
  static bool isValidRegion(int region) {
    return LicensePlate.isValidRegion(region);
  }
}
