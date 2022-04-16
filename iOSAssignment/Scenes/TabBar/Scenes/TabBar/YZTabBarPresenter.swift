final class YZTabBarPresenter {
  // MARK: - Private property

  private let interactor: YZTabBarInteractorProtocol
  private let mapper: YZTabBarMapperProtocol

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
    mapper: YZTabBarMapperProtocol = YZTabBarMapper()
  ) {
    self.interactor = interactor
    self.mapper = mapper
  }
}

// MARK: - YZTabBarPresenterProtocol

extension YZTabBarPresenter: YZTabBarPresenterProtocol { }
