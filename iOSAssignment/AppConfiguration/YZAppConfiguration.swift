import UIKit

final class YZAppConfiguration: YZAppConfigurationProtocol {
  // MARK: - YZAppConfigurationProtocol

  lazy var coordinatorFlow: YZCoordinatorFlow = {
    let navigationController = UINavigationController()
    navigationController.navigationBar.tintColor = .black
    let router = YZRouter(rootController: navigationController)
    let coordinatorFlow = YZCoordinatorFlow(router: router)
    coordinatorFlow.start()
    return coordinatorFlow
  }()
}
