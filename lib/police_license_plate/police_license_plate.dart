import '../shared/models/license_plate.dart';

/// Model a license plate for police cars
class PoliceLicensePlate extends LicensePlate {
  PoliceLicensePlate({
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
      return PoliceLicensePlate(
        series: value[0],
        number: int.parse(value.substring(1, 5).toString()),
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
  String get numberAsString => LicensePlate.numberToString(number, 4);

  /// Return true if series is valid
  static bool isValidSeries(String series) {
    return series.length == 1 &&
        LicensePlate.isValidSeries(LicensePlate.toRus(series));
  }

  /// Return true if number is valid
  static bool isValidNumber(int number) {
    return number < 10000 && LicensePlate.isValidNumber(number);
  }

  /// Return true if region is valid
  static bool isValidRegion(int region) {
    return LicensePlate.isValidRegion(region);
  }
}
