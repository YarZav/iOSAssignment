final class YZProductListInteractor {
  // MARK: - Private property

  private let apiRepository: ProductsRepositoryType
  private let coreDataRepository: YZProductRepositoryProtocol

  // MARK: - Init

  /// Init with 'repository'
  ///
  /// - Parameters:
  ///   - repository: Local service layer
  init(
    apiRepository: ProductsRepositoryType = ProductsRepository(),
    coreDataRepository: YZProductRepositoryProtocol = YZProductRepository()
  ) {
    self.apiRepository = apiRepository
    self.coreDataRepository = coreDataRepository
  }
}

// MARK: - YZProductListInteractorProtocol

extension YZProductListInteractor: YZProductListInteractorProtocol {
  func fetchAPIProducts() -> Products? {
    apiRepository.fetchRawProducts()
  }

  func fetchCoreDataProducts() -> [YZProductCoreDataModel]? {
    coreDataRepository.getAll()
  }

  func saveCoreDataProduct(_ product: YZProductModel) {
    coreDataRepository.save(product, callback: { _ in })
  }
}
