import UIKit

@main
final class AppDelegate: UIResponder {
  private let window = UIWindow(frame: UIScreen.main.bounds)
  private let appConfiguration: YZAppConfigurationProtocol = YZAppConfiguration()
}

// MARK: - UIApplicationDelegate

extension AppDelegate: UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    window.rootViewController = appConfiguration.coordinatorFlow.getNavigationController()
    window.makeKeyAndVisible()
    return true
  }
}
