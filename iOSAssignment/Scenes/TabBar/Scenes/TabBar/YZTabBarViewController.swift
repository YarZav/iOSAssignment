import UIKit

final class YZTabBarViewController: UITabBarController, YZPresenterProtocol, YZTabBarOutputProtocol {
  // MARK: - Internal property

  var presenter: YZTabBarPresenterProtocol!

  // MARK: - Life circle

  override func viewDidLoad() {
    super.viewDidLoad()
    self.createUI()
  }
}

// MARK: - YZTabBarViewProtocol

extension YZTabBarViewController: YZTabBarViewProtocol { }

// MARK: - Private

private extension YZTabBarViewController {
  func createUI() {
    view.backgroundColor = .yellow
  }
}
