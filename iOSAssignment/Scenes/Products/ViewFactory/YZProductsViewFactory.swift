final class YZProductsViewFactory: YZProductsViewFactoryProtocol {
  // MARK: - YZTabBarViewFactoryProtocol

  func productList() -> YZPresenterProtocol {
    let presenter = YZProductListPresenter()
    let view = YZProductListViewController(presenter: presenter)
    presenter.view = view
    return view
  }
}
