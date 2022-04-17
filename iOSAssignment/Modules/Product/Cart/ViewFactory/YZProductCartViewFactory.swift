final class YZProductCartViewFactory: YZProductCartViewFactoryProtocol {
  // MARK: - YZProductCartViewFactoryProtocol

  func productCart() -> YZPresenterProtocol & YZProductOutpoutProtocol {
    let presenter = YZProductCartPresenter()
    let view = YZProductCartViewController(presenter: presenter)
    presenter.view = view
    return view
  }
}
