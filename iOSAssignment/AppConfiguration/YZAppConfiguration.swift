import UIKit

final class YZAppConfiguration: YZAppConfigurationProtocol {
  // MARK: - Private property

  private var appNavigationController: UINavigationController {
    let navigationController = UINavigationController()
    navigationController.navigationBar.tintColor = .black
    return navigationController
  }

  // MARK: - YZAppConfigurationProtocol

  lazy var coordinatorFlow: YZCoordinatorFlow = {
    let router = YZRouter(rootController: appNavigationController)
    let coordinatorFlow = YZCoordinatorFlow(router: router)
    coordinatorFlow.start()
    return coordinatorFlow
  }()
}
