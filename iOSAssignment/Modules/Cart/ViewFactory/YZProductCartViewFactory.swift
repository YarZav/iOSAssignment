final class YZProductCartViewFactory: YZProductCartViewFactoryProtocol {
  // MARK: - YZProductCartViewFactoryProtocol

  func productCart() -> YZPresenterProtocol & YZProductCartOutputProtocol {
    let presenter = YZProductCartPresenter()
    let view = YZProductCartViewController(presenter: presenter)
    presenter.view = view
    return view
  }
}
