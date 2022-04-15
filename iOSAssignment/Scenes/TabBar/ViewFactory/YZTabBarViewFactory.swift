final class YZTabBarViewFactory: YZTabBarViewFactoryProtocol {
  // MARK: - YZTabBarViewFactoryProtocol

  func tabBar() -> YZPresenterProtocol & YZTabBarOutputProtocol {
    let view = YZTabBarViewController()
    let presenter = YZTabBarPresenter(view: view)
    view.presenter = presenter
    return view
  }
}
