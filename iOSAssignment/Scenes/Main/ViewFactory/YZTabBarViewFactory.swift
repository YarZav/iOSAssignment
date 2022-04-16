final class YZTabBarViewFactory: YZTabBarViewFactoryProtocol {
  // MARK: - YZTabBarViewFactoryProtocol

  func welcome(_ onFinish: (() -> Void)?) -> YZPresenterProtocol & YZWelcomeOutputProtocol {
    let view = YZWelcomeViewController()
    view.onFinish = onFinish
    return view
  }

  func tabBar(productListCoordinatorFlow: YZProductsCoordinator) -> YZPresenterProtocol {
    let presenter = YZTabBarPresenter()
    let view = YZTabBarViewController(presenter: presenter)
    view.productListViewController = productListCoordinatorFlow.getNavigationController()
    presenter.view = view
    return view
  }
}
