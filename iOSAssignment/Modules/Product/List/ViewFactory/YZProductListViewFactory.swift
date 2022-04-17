final class YZProductListViewFactory: YZProductListViewFactoryProtocol {
  // MARK: - YZProductsViewFactoryProtocol

  func productList() -> YZPresenterProtocol & YZProductOutpoutProtocol {
    let presenter = YZProductListPresenter()
    let view = YZProductListViewController(presenter: presenter)
    presenter.view = view
    return view
  }
}
