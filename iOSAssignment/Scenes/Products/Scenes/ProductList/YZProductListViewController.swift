import UIKit

final class YZProductListViewController: UIViewController, YZPresenterProtocol, YZProductListOutputProtocol {
  // MARK: - Constants

  private enum Constants {
    static let backImageName = "chevron.backward"
    static let searchPlacehodler = "Search"
    static let welcomeImageName = "welcome"
  }

  // MARK: - Private property

  private lazy var searchBar: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.sizeToFit()
    searchBar.tintColor = .black
    searchBar.delegate = self
    searchBar.placeholder = Constants.searchPlacehodler
    return searchBar
  }()

  private lazy var emptyImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: Constants.welcomeImageName))
    imageView.contentMode = .scaleAspectFit
    imageView.clipsToBounds = true
    return imageView
  }()

  private lazy var tableView: UITableView = {
    UITableView(
      cells: [YZProductCell.self],
      dataSource: self,
      delegate: self,
      allowsSelection: false
    )
  }()

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

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    let notification = NotificationCenter.default
    notification.addObserver(
      self,
      selector: #selector(keyboardWillShow),
      name: UIResponder.keyboardWillShowNotification,
      object: nil
    )
    notification.addObserver(
      self,
      selector: #selector(keyboardWillHide),
      name: UIResponder.keyboardWillHideNotification,
      object: nil
    )
  }

  override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      NotificationCenter.default.removeObserver(self)
  }
}

// MARK: - Action

extension YZProductListViewController {
  @objc
  func keyboardWillShow(notification: Notification) {
    let userInfoKey = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
    guard let keyboardHeight = (userInfoKey as? NSValue)?.cgRectValue.height else { return }
    tableView.setBottomInset(keyboardHeight)
  }

  @objc
  func keyboardWillHide(notification: Notification) {
    tableView.setBottomInset(0)
  }
}

// MARK: - YZTabBarViewProtocol

extension YZProductListViewController: YZProductListViewProtocol {
  func reloadData() {
    tableView.tableFooterView = nil
    tableView.reloadData()
    if presenter.displayedProducts.isEmpty {
      let height = view.bounds.height
      let frame: CGRect = .init(x: 0, y: height / 10, width: view.bounds.width, height: height / 3)
      tableView.addFooterView(emptyImageView, frame: frame)
    } else {
      tableView.addFooterView(UIView(), frame: .zero)
    }
  }
}

// MARK: - Private

private extension YZProductListViewController {
  func createUI() {
    backButton()

    navigationItem.titleView = searchBar
    view.addSubview(tableView)

    tableView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
      tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
    ])
  }

  func backButton() {
    let backButton = UIBarButtonItem(
      image: UIImage(systemName: Constants.backImageName),
      style: .plain,
      target: self,
      action: #selector(onBack)
    )
    backButton.tintColor = .black
    navigationItem.leftBarButtonItem = backButton
  }
}

// MARK: - UISearchBarDelegate

extension YZProductListViewController: UISearchBarDelegate {
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    searchBar.showsCancelButton = true
  }

  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    presenter.search(by: searchText)
  }

  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
    searchBar.text = ""
    searchBar.showsCancelButton = false
  }
}

// MARK: - Action

private extension YZProductListViewController {
  @objc
  func onBack() {
    onFinish?()
  }
}

// MARK: - UITableViewDataSource

extension YZProductListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    presenter.displayedProducts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: YZProductCell = tableView.dequeueCell(indexPath: indexPath)
    cell.product = presenter.displayedProducts[indexPath.row]
    return cell
  }
}

// MARK: - UITableViewDelegate

extension YZProductListViewController: UITableViewDelegate { }
