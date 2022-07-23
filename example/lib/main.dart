import 'package:flutter/material.dart';
import 'package:russian_license_plate/plates.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Plugin example app'),
        // ),
        body: SingleChildScrollView(child: _body()),
      ),
    );
  }

  Widget _body() {
    return Container(
      alignment: Alignment.topCenter,
      child: Wrap(
        children: [
          _makeBlock(
            input: _standartLicensePlateInput(),
            outputMaker: _standartLicensePlateOutput,
            error: _standartLicensePlateInputError,
          ),
          _makeBlock(
            input: _routeLicensePlateInput(),
            outputMaker: _routeLicensePlateOutput,
            error: _routeLicensePlateInputError,
          ),
          _makeBlock(
            input: _policeLicensePlateInput(),
            outputMaker: _policeLicensePlateOutput,
            error: _policeLicensePlateInputError,
          ),
        ],
      ),
    );
  }

  /*******************--[Standart cars license plate usage]--*******************/
  /**
   * License plate for regulars cars.
   * Examples: "В257УК 27", "Р474АО 125"
   * **/

  /// Create a standart license plate "P474AO 125"
  StandartLicensePlate _standartLicensePlateValue =
      StandartLicensePlate.from("P474AO125");

  Widget _standartLicensePlateOutput(double size) {
    /// Standart license plate output
    ///
    /// - size: widget size
    /// - licensePlate: plate model
    return StandartLicensePlateOutput(
      size: size,
      licensePlate: _standartLicensePlateValue,
    );
  }

  /// Input error
  LicensePlateInputError? _standartLicensePlateInputError;

  Widget _standartLicensePlateInput() {
    /// Standart cars license plate input
    ///
    /// - size: widget size
    /// - onSubmitted: called when user entered license plate
    ///   - value: license plate model
    ///   - error: input error
    return StandartLicensePlateInput(
      size: 75,
      onSubmitted: (value, error) {
        if (value != null) {
          _standartLicensePlateValue = value;
        }
        _standartLicensePlateInputError = error;
        setState(() {});
      },
    );
  }

  /*******************--[Standart cars license plate usage]--*******************/

  /*******************--[Route cars license plate usage]--*******************/
  /**
   * License plate for taxis and buses.
   * Examples: "ТА 001 27", "АА 123 125"
   * **/

  /// Create a route license plate "TA 001 27"
  RouteLicensePlate _routeLicensePlateValue = RouteLicensePlate.from("TA00127");

  Widget _routeLicensePlateOutput(double size) {
    /// Route license plate output
    ///
    /// - size: widget size
    /// - licensePlate: plate model
    return RouteLicensePlateOutput(
      size: size,
      licensePlate: _routeLicensePlateValue,
    );
  }

  /// Input error
  LicensePlateInputError? _routeLicensePlateInputError;

  Widget _routeLicensePlateInput() {
    /// Route cars license plate input
    ///
    /// - size: widget size
    /// - onSubmitted: called when user entered license plate
    ///   - value: license plate model
    ///   - error: input error
    return RouteLicensePlateInput(
      size: 75,
      onSubmitted: (value, error) {
        if (value != null) {
          _routeLicensePlateValue = value;
        }
        _routeLicensePlateInputError = error;
        setState(() {});
      },
    );
  }

  /*******************--[Route cars license plate usage]--*******************/

  /*******************--[Police cars license plate usage]--*******************/
  /**
   * License plate for taxis and buses.
   * Examples: "М 6666 716", "А 0001 16"
   * **/

  /// Create a police license plate "M 6666 716"
  PoliceLicensePlate _policeLicensePlateValue =
      PoliceLicensePlate.from("M6666716");

  Widget _policeLicensePlateOutput(double size) {
    /// Police license plate output
    ///
    /// - size: widget size
    /// - licensePlate: plate model
    return PoliceLicensePlateOutput(
      size: size,
      licensePlate: _policeLicensePlateValue,
    );
  }

  /// Input error
  LicensePlateInputError? _policeLicensePlateInputError;

  Widget _policeLicensePlateInput() {
    /// Police cars license plate input
    ///
    /// - size: widget size
    /// - onSubmitted: called when user entered license plate
    ///   - value: license plate model
    ///   - error: input error
    return PoliceLicensePlateInput(
      size: 75,
      onSubmitted: (value, error) {
        if (value != null) {
          _policeLicensePlateValue = value;
        }
        _policeLicensePlateInputError = error;
        setState(() {});
      },
    );
  }

  /*******************--[Police cars license plate usage]--*******************/

  /// Make block with a input and different size outputs
  Widget _makeBlock({
    required Widget input,
    required LicensePlateInputError? error,
    required Widget Function(double) outputMaker,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
              input,
              _showInputErrorFor(error),
            ] +
            sizes
                .map((size) => outputMaker(size))
                .toList()
                .map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: e,
                    ))
                .toList(),
      ),
    );
  }

  /// Sizes for outputs
  List<double> sizes = [75, 50, 25];

  /// Error widget
  Widget _showInputErrorFor(LicensePlateInputError? error) {
    if (error == null) {
      return const Text(
        "No errors",
        style: TextStyle(color: Colors.green),
      );
    }

    String errorIn;
    switch (error) {
      case LicensePlateInputError.region:
        errorIn = "region";
        break;
      case LicensePlateInputError.series:
        errorIn = "series";
        break;
      case LicensePlateInputError.number:
        errorIn = "number";
        break;
    }
    return Text(
      "Error in $errorIn",
      style: const TextStyle(color: Colors.red),
    );
  }
}
