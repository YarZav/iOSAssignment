import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  private let window = UIWindow(frame: UIScreen.main.bounds)

  private lazy var coordinatorFlow: YZCoordinatorFlow = {
    let navigationController = UINavigationController()
    let router = YZRouter(rootController: navigationController)
    let coordinatorFlow = YZCoordinatorFlow(router: router)
    coordinatorFlow.start()
    return coordinatorFlow
  }()


  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    window.rootViewController = coordinatorFlow.getNavigationController()
    window.makeKeyAndVisible()
    return true
  }
}
