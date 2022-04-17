final class YZProductCartInteractor {
  // MARK: - Private property

  private let coreDataRepository: YZProductRepositoryProtocol

  // MARK: - Init

  init(coreDataRepository: YZProductRepositoryProtocol = YZProductRepository()) {
    self.coreDataRepository = coreDataRepository
  }
}

// MARK: - YZProductCartInteractorProtocol

extension YZProductCartInteractor: YZProductCartInteractorProtocol {
  func fetchCoreDataProducts() -> [YZProductCoreDataModel]? {
    coreDataRepository.getAll()
  }

  func deleteCoreDataProduct(by id: String) {
    coreDataRepository.delete(by: id, callback: { _ in })
  }
}
