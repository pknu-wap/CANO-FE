import Flutter
import UIKit
import KakaoSDKCommon
import KakaoSDKAuth

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
   // Setup Flutter MethodChannel to receive .env keys
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "com.example.cano/secure_keys",
                                       binaryMessenger: controller.binaryMessenger)

    channel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      if call.method == "setEnv", let args = call.arguments as? [String: String] {
        let kakaoApiKey = args["KAKAO_NATIVE_APP_KEY"]

        guard let kakaoApiKey = kakaoApiKey, !kakaoApiKey.isEmpty else {
            print("Kakao API Key is missing or empty.")
            result(FlutterError(code: "MISSING_API_KEY", message: "Kakao API Key is missing.", details: nil))
            return
        }

        KakaoSDK.initSDK(appKey: kakaoApiKey)
      }
    }
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    var result = false

    if url.absoluteString.hasPrefix("kakao"){
      result = super.application(app, open:url, options: options)
    }

    if !result {
      if (AuthApi.isKakaoTalkLoginUrl(url)) {
        return AuthController.handleOpenUrl(url: url)
      }
    }
    return result
  }
}
