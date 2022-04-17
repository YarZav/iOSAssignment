final class YZMainViewFactory: YZMainViewFactoryProtocol {
  // MARK: - YZMainViewFactoryProtocol

  func welcome(_ onFinish: (() -> Void)?) -> YZPresenterProtocol & YZProductOutpoutProtocol {
    let view = YZWelcomeViewController()
    view.onFinish = onFinish
    return view
  }

  func tabBar(list: YZProductListCoordinator, cart: YZProductCartCoordinator) -> YZPresenterProtocol {
    let presenter = YZTabBarPresenter()
    let view = YZTabBarViewController(presenter: presenter)
    view.productListViewController = list.getNavigationController()
    view.productCartViewController = cart.getNavigationController()
    presenter.view = view
    return view
  }
}
