/// Model for license plate
abstract class LicensePlate {
  /// The plate series
  final String series;

  /// The plate number
  final int number;

  /// The plate region
  final int region;

  LicensePlate({
    required series,
    required this.number,
    required this.region,
  })  : series = toRus(series),
        assert(isValidSeries(toRus(series))),
        assert(isValidNumber(number)),
        assert(isValidRegion(region));

  @override
  String toString() {
    return series + numberAsString + regionAsString;
  }

  /// Return numer + series in string format
  String get numberAsString;

  /// Return region as string
  String get regionAsString => LicensePlate.numberToString(region, 2);

  static const _engToRus = {
    "A": "А",
    "B": "В",
    "E": "Е",
    "K": "К",
    "M": "М",
    "H": "Н",
    "O": "О",
    "P": "Р",
    "C": "С",
    "T": "Т",
    "Y": "У",
    "X": "Х",
  };

  /// Translate series in number from English to Russian latters
  static String toRus(String value) {
    String result = value.toUpperCase();
    _engToRus.forEach((key, value) {
      result = result.replaceAll(key, value);
    });
    return result;
  }

  /// Translate series in number from Russian to English latters
  static String toEng(String value) {
    String result = value.toUpperCase();
    _engToRus.forEach((key, value) {
      result = result.replaceAll(value, key);
    });
    return result;
  }

  /// Present number as string with insignificant zeros
  static String numberToString(int number, int minSize) {
    String result = number.toString();
    int toMinSize = minSize - result.length;
    return ("0" * toMinSize) + result;
  }

  /// Return true if series is valid
  static bool isValidSeries(String series) {
    return series.isNotEmpty && LicensePlate._isValidLatter(series);
  }

  /// Return true if number is valid
  static bool isValidNumber(int number) {
    return number > 0;
  }

  /// Return true if region is valid
  static bool isValidRegion(int region) {
    return region > 0 && region < 1000;
  }

  static bool _isValidLatter(String value) {
    return value.runes.where((element) {
      return !_engToRus.containsValue(String.fromCharCode(element));
    }).isEmpty;
  }
}
