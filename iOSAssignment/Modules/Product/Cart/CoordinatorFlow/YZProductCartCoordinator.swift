import UIKit

final class YZProductCartCoordinator: YZBaseCoordinator & YZProductOutpoutProtocol {
  // MARK: - Private property

  private let factory: YZProductCartViewFactoryProtocol
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
    factory: YZProductCartViewFactoryProtocol = YZProductCartViewFactory()
  ) {
    self.router = router
    self.factory = factory
  }
}

// MARK: - Internal

extension YZProductCartCoordinator {
  func getNavigationController() -> UINavigationController? {
    return router.navigationController
  }
}

// MARK: - Coordinatable

extension YZProductCartCoordinator: YZCoordinatorProtocol {
  func start() {
    productCart()
  }
}

// MARK: - Private

private extension YZProductCartCoordinator {
  func productCart() {
    var productList = factory.productCart()
    productList.onFinish = { [weak self] in
      self?.onFinish?()
    }
    router.setRoot(productList)
  }
}
