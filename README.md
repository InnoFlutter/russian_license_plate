# russian_license_plate

Input and output widgets for russian cars' license plates.

License plates types:
- **Standart** for regular cars. Examle: `В257УК 27`. 
- **Route** for taxis and buses. Examle: `TA001 125`.
- **Police** for polices casr. Examle: `M0001 716`.

![Image](https://github.com/InnoFlutter/russian_license_plate/blob/main/img/full_example.gif?raw=true)

## Getting Started 🛠

- Add the following dependency to pubspec.yaml of your project: 

```
dependencies:
  russian_license_plate: ^0.0.1
```

- Press `Pub get` (for Android Studio) or run `flutter packages upgrade`

- Import `plates.dart` to your code.

```
import 'package:russian_license_plate/plates.dart';
```

## Usage 

### Standart output 🚗

License plate output for regular cars.

![Image](https://github.com/InnoFlutter/russian_license_plate/blob/main/img/standart_output.png?raw=true)

***Class***: **`StandartLicensePlateOutput`**

***Parameters***:
- **`size`** (`double`) - size of the widget
- **`licensePlate`** (`StandartLicensePlate`) - output license plate
- **`showFlag`** (`bool`) - show russian flag under region number if true, default value is `true`

***Code example:***
```dart
StandartLicensePlateOutput(
    size: 70,
    licensePlate: StandartLicensePlate.from("В257УК27"),
)
```

### Standart input 🚘

License plate input for regular cars.

![Image](https://github.com/InnoFlutter/russian_license_plate/blob/main/img/standart_input.png?raw=true)

***Class***: **`StandartLicensePlateInput`**

***Parameters***:
- **`size`** (`double`) - size of the widget
- **`hintPlate`** (`StandartLicensePlate?`) - input hint license plate, default value is `B257YK27`
- **`showFlag`** (`bool`) - show russian flag under region number if true, default value is `true`
- **`onSubmitted`** (`Function(StandartLicensePlate?, LicensePlateInputError?)?`) - called when user end entered

***Code example:***
```dart
StandartLicensePlateInput(
    size: 70,
    onSubmitted: (value, error) {
        print("$value $error");
    },
)
```

### Route output 🚕

License plate output for taxis and buses.

![Image](https://github.com/InnoFlutter/russian_license_plate/blob/main/img/route_output.png?raw=true)

***Class***: **`RouteLicensePlateOutput`**

***Parameters***:
- **`size`** (`double`) - size of the widget
- **`licensePlate`** (`RouteLicensePlate`) - output license plate

***Code example:***
```dart
RouteLicensePlateOutput(
    size: 70,
    licensePlate: RouteLicensePlate.from("ТА010116"),
)
```

### Route input 🚖

License plate input for taxis and buses.

![Image](https://github.com/InnoFlutter/russian_license_plate/blob/main/img/route_input.png?raw=true) 

***Class***: **`RouteLicensePlateInput`**

***Parameters***:
- **`size`** (`double`) - size of the widget
- **`hintPlate`** (`RouteLicensePlate?`) - input hint license plate, default value is `TA777125`
- **`onSubmitted`** (`Function(RouteLicensePlate?, LicensePlateInputError?)?`) - called when user end entered

***Code example:***
```dart
RouteLicensePlateInput(
    size: 70,
    onSubmitted: (value, error) {
        print("$value $error");
    },
)
```

### Police output 🚓

License plate output for police cars.

![Image](https://github.com/InnoFlutter/russian_license_plate/blob/main/img/police_output.png?raw=true)

***Class***: **`PoliceLicensePlateOutput`**

***Parameters***:
- **`size`** (`double`) - size of the widget
- **`licensePlate`** (`PoliceLicensePlate`) - output license plate

***Code example:***
```dart
PoliceLicensePlateOutput(
    size: 70,
    licensePlate: PoliceLicensePlate.from("M6666716"),
)
```

### Police input 🚔

License plate input for police cars.

![Image](https://github.com/InnoFlutter/russian_license_plate/blob/main/img/police_input.png?raw=true)

***Class***: **`PoliceLicensePlateInput`**

***Parameters***:
- **`size`** (`double`) - size of the widget
- **`hintPlate`** (`PoliceLicensePlate?`) - input hint license plate, default value is `M000125`
- **`onSubmitted`** (`Function(PoliceLicensePlate?, LicensePlateInputError?)?`) - called when user end entered

***Code example:***
```dart
PoliceLicensePlateInput(
    size: 70,
    onSubmitted: (value, error) {
        print("$value $error");
    },
)
```

## License ✍️

We use [MIT licence](LICENSE).

## Support ❤️🤑

You can **[support me here](https://www.tinkoff.ru/cf/2HnHfETmeEv)**.

## Package 🧃

You can find the package [here](https://pub.dev/packages/russian_license_plate)
