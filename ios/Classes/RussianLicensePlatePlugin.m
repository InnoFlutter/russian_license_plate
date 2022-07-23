#import "RussianLicensePlatePlugin.h"
#if __has_include(<russian_license_plate/russian_license_plate-Swift.h>)
#import <russian_license_plate/russian_license_plate-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "russian_license_plate-Swift.h"
#endif

@implementation RussianLicensePlatePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftRussianLicensePlatePlugin registerWithRegistrar:registrar];
}
@end
