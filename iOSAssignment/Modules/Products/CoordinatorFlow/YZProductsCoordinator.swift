import UIKit

final class YZProductsCoordinator: YZBaseCoordinator & YZProductsCoordinatorOutput {
  // MARK: - Private property

  private let factory: YZProductsViewFactoryProtocol
  private let router: YZRouterProtocol

  // MARK: - Internal property

  var onFinish: (() -> Void)?

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
    var productList = factory.productList()
    productList.onFinish = { [weak self] in
      self?.onFinish?()
    }
    router.setRoot(productList)
  }
}
