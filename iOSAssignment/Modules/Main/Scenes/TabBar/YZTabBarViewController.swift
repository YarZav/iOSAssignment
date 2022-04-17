import UIKit

final class YZTabBarViewController: UITabBarController, YZPresenterProtocol {
  // MARK: - Constants

  private enum Constants {
    static let listText = NSLocalizedString("ListKey", comment: "")
    static let cartText = NSLocalizedString("CartKey", comment: "")
    static let listImageName = "doc.text.magnifyingglass"
    static let cartImageName = "cart"
  }

  // MARK: - Internal property

  var presenter: YZTabBarPresenterProtocol
  var productListViewController: UIViewController?
  var productCartViewController: UIViewController?

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
    presenter.viewWillAppear()
  }
}

// MARK: - Private

private extension YZTabBarViewController {
  func createUI() {
    view.backgroundColor = .systemBackground
    delegate = self
  }

  func updateUI() {
    tabBar.unselectedItemTintColor = .black
    tabBar.tintColor = .systemYellow
    navigationController?.setNavigationBarHidden(true, animated: false)
    addTabBarItem(for: productListViewController, title: Constants.listText, imageName: Constants.listImageName)
    addTabBarItem(for: productCartViewController, title: Constants.cartText, imageName: Constants.cartImageName)
    viewControllers = [productListViewController, productCartViewController].compactMap { $0 }
  }

  func addTabBarItem(
    for viewController: UIViewController?,
    title: String,
    imageName: String
  ) {
    guard let viewController = viewController else { return }
    let tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: imageName), selectedImage: nil)
    viewController.tabBarItem = tabBarItem
  }
}

// MARK: - YZTabBarViewProtocol

extension YZTabBarViewController: YZTabBarViewProtocol {
  func reloadBadge(_ count: Int) {
    tabBar.items?.last?.badgeValue = "\(count)"
    tabBar.items?.last?.badgeColor = .systemYellow
  }
}

// MARK: - UITabBarControllerDelegate

extension YZTabBarViewController: UITabBarControllerDelegate {
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    return true
  }
}
