import UIKit

final class YZProductListViewController: UITabBarController, YZPresenterProtocol {
  // MARK: - Private property

  private lazy var searchBar: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.sizeToFit()
    searchBar.tintColor = .black
    searchBar.delegate = self
    return searchBar
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
    tableView.reloadData()
  }
}

// MARK: - Private

private extension YZProductListViewController {
  func createUI() {
    navigationItem.titleView = searchBar

    navigationController?.navigationBar.prefersLargeTitles = false
    navigationItem.largeTitleDisplayMode = .never

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

// MARK: - UISearchBarDelegate

extension YZProductListViewController: UISearchBarDelegate {
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    searchBar.showsCancelButton = true
  }

  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) { }

  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
    searchBar.text = ""
    searchBar.showsCancelButton = false
  }
}

// MARK: - UITableViewDataSource

extension YZProductListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    presenter.products.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: YZProductCell = tableView.dequeueCell(indexPath: indexPath)
    cell.product = presenter.products[indexPath.row]
    return cell
  }
}

// MARK: - UITableViewDelegate

extension YZProductListViewController: UITableViewDelegate { }
