import UIKit

final class YZProductListViewController: UIViewController, YZPresenterProtocol, YZProductOutpoutProtocol {
  // MARK: - Private property

  private let keyboardManager = YZKeyboardManager()
  private let searchBar = YZSearchBar()
  private let tableView = YZProductTableView(hasAdded: true)
  private let headerView = YZProductHeaderView()

  // MARK: - Internal property

  var presenter: YZProductListPresenterProtocol
  var searchText: String { searchBar.text ?? "" }
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
    presenter.viewDidLoad(with: searchBar.text ?? "")
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
    headerView.products = presenter.displayedProducts
  }
}

// MARK: - Private

private extension YZProductListViewController {
  func createUI() {
    navigationItem.leftBarButtonItem = UIBarButtonItem.back(target: self, action: #selector(onBack))
    navigationItem.titleView = searchBar

    keyboardManager.delegate = self
    searchBar.editDelegate = self
    headerView.delegate = self
    tableView.delegate = self

    view.addSubview(tableView)
    view.addSubview(headerView)
    [tableView, headerView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    NSLayoutConstraint.activate([
      headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      headerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
      headerView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),

      tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
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

// MARK: - YZProductHeaderDelegate

extension YZProductListViewController: YZProductHeaderDelegate {
  func didSort(_ isDesc: Bool) {
    presenter.didSort(isDesc)
  }
}

// MARK: - YZProductTableViewDelegate

extension YZProductListViewController: YZProductTableViewDelegate {
  func onTap(model: YZProductModel?) {
    presenter.onAdd(model: model)
  }
}
