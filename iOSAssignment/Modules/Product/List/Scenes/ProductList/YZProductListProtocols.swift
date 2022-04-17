// VIEW -> PRESENTER
protocol YZProductListPresenterProtocol {
  /// Displayed list of products
  var displayedProducts: [YZProductModel] { get }

  /// Count for badge in TabBar
  var badgeCount: Int16 { get }

  /// Action when view did load
  func viewDidLoad(with searchText: String)

  /// Search models by text
  func search(by text: String)

  /// Sort dispalyed data
  func didSort(_ isDesc: Bool)

  /// Tap on plus in button for adding
  func onAdd(model: YZProductModel?)
}

// PRESENTER -> VIEW
protocol YZProductListViewProtocol: AnyObject {
  /// Search text
  var searchText: String { get }

  /// Reload data in table view
  func reloadData()
}

// PRESENTER -> MAPPER
protocol YZProductListMapperProtocol: YZProductMapperProtocol {
  /// Map API model to Business model
  func map(from networkModels: Products?) -> [YZProductModel]
}

// INTERACTOR -> PRESENTER
protocol YZProductListInteractorProtocol {
  /// Fetch data from API service layer
  func fetchAPIProducts() -> Products?

  /// Fetch data from Data Base service layer
  func fetchCoreDataProducts() -> [YZProductCoreDataModel]?

  /// Save to core data model
  func saveCoreDataProduct(_ product: YZProductModel)
}
