final class YZProductListPresenter {
  // MARK: - Private property

  private let interactor: YZProductListInteractorProtocol
  private let mapper: YZProductListMapperProtocol

  // MARK: - Internal property

  weak var view: YZProductListViewProtocol?
  var products: [YZProduct] = []

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
    let networkModel = interactor.fetchProducts()
    products = mapper.map(from: networkModel)
    view?.reloadData()
  }

  func search(by text: String) {
    
  }
}
