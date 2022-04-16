final class YZProductsViewFactory: YZProductsViewFactoryProtocol {
  // MARK: - YZProductsViewFactoryProtocol

  func productList() -> YZPresenterProtocol & YZProductListOutputProtocol {
    let presenter = YZProductListPresenter()
    let view = YZProductListViewController(presenter: presenter)
    presenter.view = view
    return view
  }
}
