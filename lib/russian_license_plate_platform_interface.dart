import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'russian_license_plate_method_channel.dart';

abstract class RussianLicensePlatePlatform extends PlatformInterface {
  /// Constructs a RussianLicensePlatePlatform.
  RussianLicensePlatePlatform() : super(token: _token);

  static final Object _token = Object();

  static RussianLicensePlatePlatform _instance = MethodChannelRussianLicensePlate();

  /// The default instance of [RussianLicensePlatePlatform] to use.
  ///
  /// Defaults to [MethodChannelRussianLicensePlate].
  static RussianLicensePlatePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [RussianLicensePlatePlatform] when
  /// they register themselves.
  static set instance(RussianLicensePlatePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
