import UIKit

final class YZProductsCoordinator: YZBaseCoordinator {
  // MARK: - Private property

  private let factory: YZProductsViewFactoryProtocol
  private let router: YZRouterProtocol

  // MARK: - Init

  /// Init with 'factory', 'router'
  /// - Parameters:
  ///     router: View routing
  ///     factory: View factory
  /// - Returns: Coordinator flow
  init(
    router: YZRouterProtocol,
    factory: YZProductsViewFactoryProtocol = YZProductsViewFactory()
  ) {
    self.router = router
    self.factory = factory
  }
}

// MARK: - Internal

extension YZProductsCoordinator {
  func getNavigationController() -> UINavigationController? {
    return router.navigationController
  }
}

// MARK: - Coordinatable

extension YZProductsCoordinator: YZCoordinatorProtocol {
  func start() {
    productList()
  }
}

// MARK: - Private

private extension YZProductsCoordinator {
  func productList() {
    let tabBar = factory.productList()
    router.setRoot(tabBar)
  }
}
