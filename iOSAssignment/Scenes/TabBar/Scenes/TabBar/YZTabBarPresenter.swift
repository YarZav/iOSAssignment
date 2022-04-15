import Foundation
import UIKit

final class YZTabBarPresenter {
  // MARK: - Private property

  private weak var view: YZTabBarViewProtocol?
  private let interactor: YZTabBarInteractorProtocol
  private let mapper: YZTabBarMapperProtocol

  // MARK: - Init

  /// Init with 'view', 'interactor',  'mapper'
  ///
  /// - Parameters:
  ///   - view: View layer
  ///   - interactor: Interactor layer
  ///   - mapper: Mapper layer
  init(
    view: YZTabBarViewProtocol?,
    interactor: YZTabBarInteractorProtocol = YZTabBarInteractor(),
    mapper: YZTabBarMapperProtocol = YZTabBarMapper()
  ) {
    self.view = view
    self.interactor = interactor
    self.mapper = mapper
  }
}

// MARK: - YZTabBarPresenterProtocol

extension YZTabBarPresenter: YZTabBarPresenterProtocol { }
