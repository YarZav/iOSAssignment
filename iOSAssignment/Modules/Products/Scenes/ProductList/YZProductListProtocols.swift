// OUTPUT
protocol YZProductListOutputProtocol {
  var onFinish: (() -> Void)? { get set }
}

// VIEW -> PRESENTER
protocol YZProductListPresenterProtocol {
  /// Displayed list of products
  var displayedProducts: [YZProductModel] { get }

  /// Action when view did load
  func viewDidLoad()

  /// Search models by text
  func search(by text: String)

  /// Sort dispalyed data
  func didSort(_ isDesc: Bool)
}

// PRESENTER -> VIEW
protocol YZProductListViewProtocol: AnyObject {
  /// Reload data in table view
  func reloadData()
}

// PRESENTER -> MAPPER
protocol YZProductListMapperProtocol {
  func map(from networkModels: Products?) -> [YZProductModel]
}

// INTERACTOR -> PRESENTER
protocol YZProductListInteractorProtocol {
  /// Fetch data from service layer
  func fetchProducts() -> Products?
}
