import UIKit

final class YZProductListCoordinator: YZBaseCoordinator & YZProductOutpoutProtocol {
  // MARK: - Private property

  private let factory: YZProductListViewFactoryProtocol
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
    factory: YZProductListViewFactoryProtocol = YZProductListViewFactory()
  ) {
    self.router = router
    self.factory = factory
  }
}

// MARK: - Internal

extension YZProductListCoordinator {
  func getNavigationController() -> UINavigationController? {
    return router.navigationController
  }
}

// MARK: - Coordinatable

extension YZProductListCoordinator: YZCoordinatorProtocol {
  func start() {
    productList()
  }
}

// MARK: - Private

private extension YZProductListCoordinator {
  func productList() {
    var productList = factory.productList()
    productList.onFinish = { [weak self] in
      self?.onFinish?()
    }
    router.setRoot(productList)
  }
}
