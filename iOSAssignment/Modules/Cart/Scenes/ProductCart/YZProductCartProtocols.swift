// OUTPUT
protocol YZProductCartOutputProtocol {
  var onFinish: (() -> Void)? { get set }
}

// VIEW -> PRESENTER
protocol YZProductCartPresenterProtocol {
  /// List of products in cart
  var products: [YZProductModel] { get set }

  /// Fetch data
  func viewDidAppear()
}

// PRESENTER -> VIEW
protocol YZProductCartViewProtocol: AnyObject {
  /// Reload data in table
  func reloadData()
}

// PRESENTER -> MAPPER
protocol YZProductCartMapperProtocol {
}

// INTERACTOR -> PRESENTER
protocol YZProductCartInteractorProtocol {
}
