final class YZProductCartPresenter {
  // MARK: - Private property

  private let interactor: YZProductCartInteractorProtocol
  private let mapper: YZProductCartMapperProtocol

  // MARK: - Internal property

  weak var view: YZProductCartViewProtocol?
  var products: [YZProductModel] = []

  // MARK: - Init

  /// Init with 'interactor',  'mapper'
  ///
  /// - Parameters:
  ///   - interactor: Interactor layer
  ///   - mapper: Mapper layer
  init(
    interactor: YZProductCartInteractorProtocol = YZProductCartInteractor(),
    mapper: YZProductCartMapperProtocol = YZProductCartMapper()
  ) {
    self.interactor = interactor
    self.mapper = mapper
  }
}

// MARK: - YZProductCartPresenterProtocol

extension YZProductCartPresenter: YZProductCartPresenterProtocol {
  func viewDidAppear() {
    view?.reloadData()
  }
}
