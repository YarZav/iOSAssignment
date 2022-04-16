final class YZTabBarViewFactory: YZTabBarViewFactoryProtocol {
  // MARK: - YZTabBarViewFactoryProtocol

  func tabBar(productListCoordinatorFlow: YZProductsCoordinator) -> YZPresenterProtocol {
    let presenter = YZTabBarPresenter()
    let view = YZTabBarViewController(presenter: presenter)
    view.productListViewController = productListCoordinatorFlow.getNavigationController()
    presenter.view = view
    return view
  }
}
