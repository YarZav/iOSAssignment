import UIKit

final class YZMainCoordinator: YZBaseCoordinator {
  // MARK: - Private property

  private let factory: YZMainViewFactoryProtocol
  private let router: YZRouterProtocol

  /// Corodiantor flow for product list (left TabBar item)
  private lazy var productListCoordinatorFlow: YZProductListCoordinator = {
    let coordinatorFlow = YZProductListCoordinator(router: createNewRouter())
    addAndStartCoordinator(coordinatorFlow)
    coordinatorFlow.onFinish = { [weak self] in self?.popAndRemoveCoordinators() }
    return coordinatorFlow
  }()

  /// Corodiantor flow for product cart (right TabBar item)
  private lazy var productCartCoordinatorFlow: YZProductCartCoordinator = {
    let coordinatorFlow = YZProductCartCoordinator(router: createNewRouter())
    addAndStartCoordinator(coordinatorFlow)
    coordinatorFlow.onFinish = { [weak self] in self?.popAndRemoveCoordinators() }
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
    factory: YZMainViewFactoryProtocol = YZMainViewFactory()
  ) {
    self.router = router
    self.factory = factory
  }
}

// MARK: - Coordinatable

extension YZMainCoordinator: YZCoordinatorProtocol {
  func start() {
    welcome()
  }
}

// MARK: - Private

private extension YZMainCoordinator {
  func createNewRouter() -> YZRouterProtocol {
    let navigationController = UINavigationController()
    return YZRouter(rootController: navigationController)
  }

  func addAndStartCoordinator(_ coordinator: YZCoordinatorProtocol) {
    addDependency(coordinator)
    coordinator.start()
  }

  func welcome() {
    let welcome = factory.welcome { [weak self] in self?.tabBar() }
    router.setRoot(welcome)
  }

  func tabBar() {
    let tabBar = factory.tabBar(list: productListCoordinatorFlow, cart: productCartCoordinatorFlow)
    router.push(tabBar, animated: true)
  }

  func popAndRemoveCoordinators() {
    [productListCoordinatorFlow, productCartCoordinatorFlow].forEach { removeDependency($0) }
    router.pop()
  }
}
