final class YZTabBarViewFactory: YZTabBarViewFactoryProtocol {
  // MARK: - YZTabBarViewFactoryProtocol

  func welcome(_ onFinish: (() -> Void)?) -> YZPresenterProtocol & YZWelcomeOutputProtocol {
    let view = YZWelcomeViewController()
    view.onFinish = onFinish
    return view
  }

  func tabBar(productListCoordinatorFlow: YZProductsCoordinator) -> YZPresenterProtocol {
    let view = YZTabBarViewController()
    view.productListViewController = productListCoordinatorFlow.getNavigationController()
    return view
  }
}
