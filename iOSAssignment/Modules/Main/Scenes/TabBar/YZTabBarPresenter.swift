final class YZTabBarPresenter {
  // MARK: - Private property

  private let interactor: YZTabBarInteractorProtocol
  private let productManager: YZProductManagerProtocol

  // MARK: - Internal property

  weak var view: YZTabBarViewProtocol?

  // MARK: - Init

  /// Init with 'interactor',  'mapper'
  ///
  /// - Parameters:
  ///   - interactor: Interactor layer
  ///   - mapper: Mapper layer
  init(
    interactor: YZTabBarInteractorProtocol = YZTabBarInteractor(),
    productManager: YZProductManagerProtocol = YZProductManager.shared
  ) {
    self.interactor = interactor
    self.productManager = productManager

    self.productManager.addObserver(self)
  }
}

// MARK: - YZTabBarPresenterProtocol

extension YZTabBarPresenter: YZTabBarPresenterProtocol {
  func viewWillAppear() {
    let count = interactor.countInCart()
    view?.reloadBadge(count)
  }
}

extension YZTabBarPresenter: YZProductManagerDelegate {
  func didChanged() {
    viewWillAppear()
  }

  func didDeleted() {
    viewWillAppear()
  }
}
