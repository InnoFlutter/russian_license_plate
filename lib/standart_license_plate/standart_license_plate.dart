import '../shared/models/license_plate.dart';

/// Model a license plate for standart cars
class StandartLicensePlate extends LicensePlate {
  StandartLicensePlate({
    required String series,
    required int number,
    required int region,
  })  : assert(isValidSeries(series)),
        assert(isValidNumber(number)),
        assert(isValidRegion(region)),
        super(series: series, number: number, region: region);

  /// Make license plate from string
  static from(String value) {
    if (value.length <= 6) return null;

    try {
      return StandartLicensePlate(
        series: value[0] + value[4] + value[5],
        number: int.parse(value.substring(1, 4).toString()),
        region: int.parse(value.substring(6)),
      );
    } catch (e) {
      return null;
    }
  }

  @override
  String toString() {
    return firstSeriesPart + numberAsString + secondSeriesPart + regionAsString;
  }

  @override
  String get numberAsString => LicensePlate.numberToString(number, 3);

  String get firstSeriesPart => series[0];

  String get secondSeriesPart => series[1] + series[2];

  /// Return true if series is valid
  static bool isValidSeries(String series) {
    return series.length == 3 &&
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
