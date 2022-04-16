import UIKit

final class YZTabBarViewController: UITabBarController, YZPresenterProtocol {
  // MARK: - Constants

  private enum Constants {
    static let listText = "List"
  }

  // MARK: - Internal property

  var productListViewController: UIViewController?

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
    if let productListViewController = self.productListViewController {
      let productListItem = UITabBarItem(title: Constants.listText, image: nil, selectedImage: nil)
      productListViewController.tabBarItem = productListItem
      viewControllers = [productListViewController]
    }
  }
}

// MARK: - UITabBarControllerDelegate

extension YZTabBarViewController: UITabBarControllerDelegate {
  func tabBarController(
    _ tabBarController: UITabBarController,
    shouldSelect viewController: UIViewController
  ) -> Bool {
    return true
  }
}
