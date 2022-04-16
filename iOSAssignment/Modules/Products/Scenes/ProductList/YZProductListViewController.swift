import UIKit

final class YZProductListViewController: UIViewController, YZPresenterProtocol, YZProductListOutputProtocol {
  // MARK: - Private property

  private lazy var keyboardManager = YZKeyboardManager()
  private lazy var searchBar = YZSearchBar()
  private lazy var tableView = YZProductTableView()

  // MARK: - Internal property

  var presenter: YZProductListPresenterProtocol
  var onFinish: (() -> Void)?

  // MARK: - Init

  init(presenter: YZProductListPresenterProtocol) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Life circle

  override func viewDidLoad() {
    super.viewDidLoad()
    createUI()
    presenter.viewDidLoad()
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    keyboardManager.removeObservers()
  }
}

// MARK: - YZTabBarViewProtocol

extension YZProductListViewController: YZProductListViewProtocol {
  func reloadData() {
    tableView.products = presenter.displayedProducts
  }
}

// MARK: - Private

private extension YZProductListViewController {
  func createUI() {
    navigationItem.leftBarButtonItem = UIBarButtonItem.backButton(target: self, action: #selector(onBack))
    navigationItem.titleView = searchBar

    keyboardManager.delegate = self
    searchBar.editDelegate = self

    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
      tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
    ])
  }
}

// MARK: - YZSearchBarDelegate

extension YZProductListViewController: YZSearchBarDelegate {
  func search(by text: String) {
    presenter.search(by: text)
  }
}

// MARK: - Action

private extension YZProductListViewController {
  @objc
  func onBack() {
    onFinish?()
  }
}

// MARK: - YZKeyboardManagerDelegate

extension YZProductListViewController: YZKeyboardManagerDelegate {
  func onChangeHeight(_ height: CGFloat) {
    tableView.setBottomOffset(height)
  }
}
