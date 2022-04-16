import UIKit

final class YZProductListViewController: UITabBarController, YZPresenterProtocol {
  // MARK: - Private property

  private lazy var searchBar: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.sizeToFit()
    searchBar.delegate = self
    return searchBar
  }()

  private lazy var tableView: UITableView = {
    UITableView(
      cells: [UITableViewCell.self],
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
}

// MARK: - YZTabBarViewProtocol

extension YZProductListViewController: YZProductListViewProtocol { }

// MARK: - Private

private extension YZProductListViewController {
  func createUI() {
    navigationItem.titleView = searchBar

    navigationController?.navigationBar.prefersLargeTitles = false
    navigationItem.largeTitleDisplayMode = .never
  }
}

// MARK: - UISearchBarDelegate

extension YZProductListViewController: UISearchBarDelegate {
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    searchBar.showsCancelButton = true
  }

  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
  }

  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
    searchBar.text = ""
    searchBar.showsCancelButton = false
  }
}

// MARK: - UITableViewDataSource

extension YZProductListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = tableView.dequeueCell(indexPath: indexPath)
    return cell
  }
}

// MARK: - UITableViewDelegate

extension YZProductListViewController: UITableViewDelegate { }
