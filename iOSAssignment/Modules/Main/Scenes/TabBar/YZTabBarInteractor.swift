final class YZTabBarInteractor {
  // MARK: - Private property

  private let coreDataRepository: YZProductRepositoryProtocol

  // MARK: - Init

  init(coreDataRepository: YZProductRepositoryProtocol = YZProductRepository()) {
    self.coreDataRepository = coreDataRepository
  }
}

// MARK: - YZTabBarInteractorProtocol

extension YZTabBarInteractor: YZTabBarInteractorProtocol {
  func countInCart() -> Int {
    Int(coreDataRepository.getAll()?.compactMap { $0.countInCart }.reduce(0, +) ?? 0)
  }
}
