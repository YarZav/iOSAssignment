// VIEW -> PRESENTER
protocol YZProductCartPresenterProtocol {
  /// List of products in cart
  var products: [YZProductModel] { get set }

  /// Count for badge in TabBar
  var badgeCount: Int16 { get }

  /// Fetch data
  func viewDidAppear()

  /// Delete product from cart and list
  func onDelete(model: YZProductModel?)
}

// PRESENTER -> VIEW
protocol YZProductCartViewProtocol: AnyObject {
  /// Reload data in table
  func reloadData()
}

// INTERACTOR -> PRESENTER
protocol YZProductCartInteractorProtocol {
  /// Fetch data from Core Data service layer
  func fetchCoreDataProducts() -> [YZProductCoreDataModel]?

  /// Delete data from Core Data servise layer
  func deleteCoreDataProduct(by id: String)
}
