import UIKit

final class YZTabBarViewController: UITabBarController, YZPresenterProtocol {
  // MARK: - Internal property

  var presenter: YZTabBarPresenterProtocol
  var productListViewController: UIViewController?

  // MARK: - Init

  init(presenter: YZTabBarPresenterProtocol) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
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

// MARK: - YZTabBarViewProtocol

extension YZTabBarViewController: YZTabBarViewProtocol { }

// MARK: - Private

private extension YZTabBarViewController {
  func createUI() {
    view.backgroundColor = .systemBackground

    delegate = self
  }

  func updateUI() {
    if let productListViewController = self.productListViewController {
      let productListItem = UITabBarItem(title: "List", image: nil, selectedImage: nil)
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
