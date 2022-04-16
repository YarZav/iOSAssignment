import UIKit

@main
final class AppDelegate: UIResponder {
  private let window = UIWindow(frame: UIScreen.main.bounds)

  private lazy var coordinatorFlow: YZCoordinatorFlow = {
    let navigationController = UINavigationController()
    navigationController.navigationBar.tintColor = .black
    let router = YZRouter(rootController: navigationController)
    let coordinatorFlow = YZCoordinatorFlow(router: router)
    coordinatorFlow.start()
    return coordinatorFlow
  }()
}

// MARK: - UIApplicationDelegate

extension AppDelegate: UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    window.rootViewController = coordinatorFlow.getNavigationController()
    window.makeKeyAndVisible()
    return true
  }
}
