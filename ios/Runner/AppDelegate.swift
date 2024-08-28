import UIKit
import Flutter
import Firebase
import FirebaseMessaging



@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    
  ) -> Bool {
    FirebaseApp.configure()
    
    
    // if #available(iOS 10.0, *) {
    //   UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    // }
    UNUserNotificationCenter.current().delegate = self
    
    GeneratedPluginRegistrant.register(with: self)
  
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

   func application(application: UIApplication,
                 didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
          print("Device Token \(deviceToken)")        
    Messaging.messaging().apnsToken = deviceToken
}
}



