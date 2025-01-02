import Flutter
import UIKit

// import GoogleMaps
//
// @main
// @objc class AppDelegate: FlutterAppDelegate {
//     override func application(
//       _ application: UIApplication,
//       didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//     ) -> Bool {
//         // Google Maps API key setup
//         GMSServices.provideAPIKey("AIzaSyDlyelUlpPGiEtnNjZmTi002Ce0ezXyVi8")
//
//         GeneratedPluginRegistrant.register(with: self)
//         return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//     }
// }

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
