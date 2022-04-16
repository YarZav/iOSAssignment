final class YZProductListPresenter {
  // MARK: - Private property

  private let interactor: YZProductListInteractorProtocol
  private let mapper: YZProductListMapperProtocol
  private var products: [YZProductModel] = []

  // MARK: - Internal property

  weak var view: YZProductListViewProtocol?
  var displayedProducts: [YZProductModel] = []

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
    displayedProducts = mapper.map(from: networkModel)
    view?.reloadData()
  }

  func search(by text: String) {
    if text.isEmpty {
      displayedProducts = products
    } else {
      displayedProducts = products.filter { $0.title.lowercased().contains(text.lowercased()) }
    }
    view?.reloadData()
  }

  func didSort(_ isDesc: Bool) {
    displayedProducts.sort { isDesc ? $0.price < $1.price : $0.price > $1.price }
    view?.reloadData()
  }
}
