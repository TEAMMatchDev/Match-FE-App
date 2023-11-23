import UIKit
import Flutter
import Firebase //Firebase 추가
import UserNotifications // UserNotifications 추가
import NaverThirdPartyLogin // 네이버 로그인

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    FirebaseApp.configure() //Firebase 구성
    // 알림 권한 요청
        if #available(iOS 10.0, *) {
          UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
          let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
          UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: {_, _ in }
          )
        } else {
          let settings: UIUserNotificationSettings =
          UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
          application.registerUserNotificationSettings(settings)
        }

        application.registerForRemoteNotifications()


    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // 네이버로그인
  override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
           if url.absoluteString.hasPrefix("kakao"){
              super.application(app, open:url, options: options)
              return true
           } else if url.absoluteString.contains("thirdPartyLoginResult") {
              NaverThirdPartyLoginConnection.getSharedInstance().application(app, open: url, options: options)
              return true
           } else {
              return true
           }
       }
}


