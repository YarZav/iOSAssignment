import UIKit

protocol YZSearchBarDelegate: AnyObject {
  /// Search by new text
  func search(by text: String)
}

final class YZSearchBar: UISearchBar {
  // MARK: - Constants

  private enum Constants {
    static let searchPlacehodler = "Search"
  }

  // MARK: - Internal property

  weak var editDelegate: YZSearchBarDelegate?

  // MARK: - Init

  override init(frame: CGRect) {
    super.init(frame: frame)
    sizeToFit()
    tintColor = .black
    delegate = self
    placeholder = Constants.searchPlacehodler
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - UISearchBarDelegate

extension YZSearchBar: UISearchBarDelegate {
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    searchBar.showsCancelButton = true
  }

  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    editDelegate?.search(by: searchText)
  }

  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
    searchBar.showsCancelButton = false
  }
}
