import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'russian_license_plate_platform_interface.dart';

/// An implementation of [RussianLicensePlatePlatform] that uses method channels.
class MethodChannelRussianLicensePlate extends RussianLicensePlatePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('russian_license_plate');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
