import UIKit

final class YZTabBarCoordinator: YZBaseCoordinator {
  // MARK: - Private property

  private let factory: YZTabBarViewFactoryProtocol
  private let router: YZRouterProtocol

  private lazy var productListCoordinatorFlow: YZProductsCoordinator = {
    let navigationController = UINavigationController()
    let router = YZRouter(rootController: navigationController)
    let coordinatorFlow = YZProductsCoordinator(router: router)
    coordinatorFlow.start()
    return coordinatorFlow
  }()

  // MARK: - Init

  /// Init with 'factory', 'router'
  /// - Parameters:
  ///     router: View routing
  ///     factory: View factory
  /// - Returns: Coordinator flow
  init(
    router: YZRouterProtocol,
    factory: YZTabBarViewFactoryProtocol = YZTabBarViewFactory()
  ) {
    self.router = router
    self.factory = factory
  }
}

// MARK: - Coordinatable

extension YZTabBarCoordinator: YZCoordinatorProtocol {
  func start() {
    welcome()
  }
}

// MARK: - Private

private extension YZTabBarCoordinator {
  func welcome() {
    let welcome = factory.welcome { [weak self] in self?.tabBar() }
    router.setRoot(welcome)
  }

  func tabBar() {
    let tabBar = factory.tabBar(productListCoordinatorFlow: productListCoordinatorFlow)
    router.setRoot(tabBar, hideBar: true)
  }
}
