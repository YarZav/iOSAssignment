import UIKit

final class YZCoordinatorFlow: YZBaseCoordinator {
  // MARK: - Private property

  private let factory: YZCoordinatorFactoryProtocol
  private let router: YZRouterProtocol

  // MARK: - Init

  /// Init with 'router', 'factory',
  ///
  /// - Parameters:
  ///   - router: Router for moving in stack of views
  ///   - factory: Factory of children coordinator flows
  init(
    router: YZRouterProtocol,
    factory: YZCoordinatorFactoryProtocol = YZCoordinatorFactory()
  ) {
    self.router = router
    self.factory = factory
    super.init()
  }
}

// MARK: - YZCoordinatorProtocol

extension YZCoordinatorFlow: YZCoordinatorProtocol {
  func start() {
    childCoordinators.forEach { removeDependency($0) }
    startMainCoordinator()
  }
}

// MARK: - Internal

extension YZCoordinatorFlow {
  func getNavigationController() -> UINavigationController? {
    return router.navigationController
  }
}

// MARK: - Private

private extension YZCoordinatorFlow {
  func startMainCoordinator() {
    let mainCoordinator = factory.mainCoordinator(router: router)
    addDependency(mainCoordinator)
    mainCoordinator.start()
  }
}
