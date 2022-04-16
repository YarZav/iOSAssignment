final class YZProductListInteractor {
  // MARK: - Private property

  private let repository: ProductsRepositoryType

  // MARK: - Init

  /// Init with 'repository'
  ///
  /// - Parameters:
  ///   - repository: Local service layer
  init(repository: ProductsRepositoryType = ProductsRepository()) {
    self.repository = repository
  }
}

// MARK: - YZProductListInteractorProtocol

extension YZProductListInteractor: YZProductListInteractorProtocol {
  func fetchProducts() -> Products? {
    repository.fetchRawProducts()
  }
}
