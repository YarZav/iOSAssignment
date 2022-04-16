// VIEW -> PRESENTER
protocol YZProductListPresenterProtocol {
  /// Action when view did load
  func viewDidLoad()
}

// PRESENTER -> VIEW
protocol YZProductListViewProtocol: AnyObject { }

// PRESENTER -> MAPPER
protocol YZProductListMapperProtocol { }

// INTERACTOR -> PRESENTER
protocol YZProductListInteractorProtocol {
  /// Fetch data from service layer
  func fetchProducts() -> Products?
}
