final class YZProductListPresenter {
  // MARK: - Private property

  private let interactor: YZProductListInteractorProtocol
  private let mapper: YZProductListMapperProtocol
  private let productManager: YZProductManagerProtocol

  private var products: [YZProductModel] = []

  // MARK: - Internal property

  weak var view: YZProductListViewProtocol?
  var displayedProducts: [YZProductModel] = []
  var badgeCount: Int16 {
    products.compactMap { $0.countInCart }.reduce(0, +)
  }

  // MARK: - Init

  /// Init with 'interactor',  'mapper'
  ///
  /// - Parameters:
  ///   - interactor: Interactor layer
  ///   - mapper: Mapper layer
  init(
    interactor: YZProductListInteractorProtocol = YZProductListInteractor(),
    mapper: YZProductListMapperProtocol = YZProductListMapper(),
    productManager: YZProductManagerProtocol = YZProductManager.shared
  ) {
    self.interactor = interactor
    self.mapper = mapper
    self.productManager = productManager

    self.productManager.addObserver(self)
  }
}

// MARK: - YZProductListPresenterProtocol

extension YZProductListPresenter: YZProductListPresenterProtocol {
  func viewDidLoad(with searchText: String) {
    /// Get data from fake API
    products = mapper.map(from: interactor.fetchAPIProducts())
    /// Get data from Core Data
    let productsFromCoreData = mapper.map(from: interactor.fetchCoreDataProducts())
    /// Update count in the Cart
    products.forEach { productFromAPI in
      let count = productsFromCoreData.first(where: { $0.id == productFromAPI.id })?.countInCart
      productFromAPI.countInCart = Int16(count ?? 0)
    }
    /// Search by text
    search(by: searchText)
  }

  func search(by text: String) {
    /// When search text is empty show hole list
    /// Another side show filtered list
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

  func onAdd(model: YZProductModel?) {
    guard let model = model else { return }
    model.countInCart += 1
    interactor.saveCoreDataProduct(model)
  }
}

// MARK: - YZProductManagerDelegate'

extension YZProductListPresenter: YZProductManagerDelegate {
  func didChanged() { }
  
  func didDeleted() {
    viewDidLoad(with: view?.searchText ?? "")
  }
}
