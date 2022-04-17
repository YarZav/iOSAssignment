final class YZProductCartPresenter {
  // MARK: - Private property

  private let interactor: YZProductCartInteractorProtocol
  private let mapper: YZProductMapperProtocol
  private let productManager: YZProductManagerProtocol

  // MARK: - Internal property

  weak var view: YZProductCartViewProtocol?
  var products: [YZProductModel] = []
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
    interactor: YZProductCartInteractorProtocol = YZProductCartInteractor(),
    mapper: YZProductMapperProtocol = YZProductMapper(),
    productManager: YZProductManagerProtocol = YZProductManager.shared
  ) {
    self.interactor = interactor
    self.mapper = mapper
    self.productManager = productManager

    self.productManager.addObserver(self)
  }
}

// MARK: - YZProductCartPresenterProtocol

extension YZProductCartPresenter: YZProductCartPresenterProtocol {
  func viewDidAppear() {
    products = mapper.map(from: interactor.fetchCoreDataProducts())
    view?.reloadData()
  }

  func onDelete(model: YZProductModel?) {
    guard let model = model else { return }
    products.removeAll { $0.id == model.id }
    interactor.deleteCoreDataProduct(by: model.id)
    view?.reloadData()
  }
}

// MARK: - YZProductManagerDelegate'

extension YZProductCartPresenter: YZProductManagerDelegate {
  func didChanged() {
    viewDidAppear()
  }
  
  func didDeleted() { }
}
