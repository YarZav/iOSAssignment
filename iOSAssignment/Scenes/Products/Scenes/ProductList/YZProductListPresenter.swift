final class YZProductListPresenter {
  // MARK: - Private property

  private let interactor: YZProductListInteractorProtocol
  private let mapper: YZProductListMapperProtocol

  // MARK: - Internal property

  weak var view: YZProductListViewProtocol?

  // MARK: - Init

  /// Init with 'interactor',  'mapper'
  ///
  /// - Parameters:
  ///   - interactor: Interactor layer
  ///   - mapper: Mapper layer
  init(
    interactor: YZProductListInteractorProtocol = YZProductListInteractor(),
    mapper: YZProductListMapperProtocol = YZProductListMapper()
  ) {
    self.interactor = interactor
    self.mapper = mapper
  }
}

// MARK: - YZProductListPresenterProtocol

extension YZProductListPresenter: YZProductListPresenterProtocol {
  func viewDidLoad() {
    let products = interactor.fetchProducts()
    print(products as Any)
  }
}
