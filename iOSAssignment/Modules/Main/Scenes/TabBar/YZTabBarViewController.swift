import UIKit

final class YZTabBarViewController: UITabBarController, YZPresenterProtocol {
  // MARK: - Constants

  private enum Constants {
    static let listText = NSLocalizedString("ListKey", comment: "")
    static let cartText = NSLocalizedString("CartKey", comment: "")
  }

  // MARK: - Internal property

  var productListViewController: UIViewController?
  var productCartViewController: UIViewController?

  // MARK: - Life circle

  override func viewDidLoad() {
    super.viewDidLoad()
    self.createUI()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    updateUI()
  }
}

// MARK: - Private

private extension YZTabBarViewController {
  func createUI() {
    view.backgroundColor = .systemBackground
    delegate = self
  }

  func updateUI() {
    navigationController?.setNavigationBarHidden(true, animated: false)
    addTabBarItem(for: productListViewController, title: Constants.listText)
    addTabBarItem(for: productCartViewController, title: Constants.cartText)
    viewControllers = [productListViewController, productCartViewController].compactMap { $0 }
  }

  func addTabBarItem(for viewController: UIViewController?, title: String) {
    guard let viewController = viewController else { return }
    let tabBarItem = UITabBarItem(title: title, image: nil, selectedImage: nil)
    viewController.tabBarItem = tabBarItem
  }
}

// MARK: - UITabBarControllerDelegate

extension YZTabBarViewController: UITabBarControllerDelegate {
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    return true
  }
}
