final class YZTabBarViewFactory: YZTabBarViewFactoryProtocol {
  // MARK: - YZTabBarViewFactoryProtocol

  func welcome(_ onFinish: (() -> Void)?) -> YZPresenterProtocol & YZWelcomeOutputProtocol {
    let view = YZWelcomeViewController()
    view.onFinish = onFinish
    return view
  }

  func tabBar(list: YZProductsCoordinator, cart: YZProductCartCoordinator) -> YZPresenterProtocol {
    let view = YZTabBarViewController()
    view.productListViewController = list.getNavigationController()
    view.productCartViewController = cart.getNavigationController()
    return view
  }
}
