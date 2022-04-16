import UIKit

final class YZProductTableView: UIView {
  // MARK: - Constants

  private enum Constants {
    static let emptyImageName = "empty"
  }

  // MARK: - Private property

  private lazy var emptyImageView = UIImageView.plain(Constants.emptyImageName)
  private lazy var tableView = UITableView(cells: [YZProductCell.self], dataSource: self)

  // MARK: - Intertnal property

  var products: [YZProductModel] {
    didSet {
      tableView.reloadData()
      if products.isEmpty {
        let height = bounds.height
        let frame: CGRect = .init(x: 0, y: height / 10, width: bounds.width, height: height / 3)
        tableView.addFooterView(emptyImageView, frame: frame)
      } else {
        tableView.addFooterView(UIView(), frame: .zero)
      }
    }
  }

  // MARK: - Init

  init() {
    products = []
    super.init(frame: .zero)
    createUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Private

private extension YZProductTableView {
  func createUI() {
    addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: topAnchor),
      tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
      tableView.leftAnchor.constraint(equalTo: leftAnchor),
      tableView.rightAnchor.constraint(equalTo: rightAnchor)
    ])
  }
}

// MARK: - Internal

extension YZProductTableView {
  func setBottomOffset(_ offset: CGFloat) {
    tableView.setBottomInset(offset)
  }
}

// MARK: - UITableViewDataSource

extension YZProductTableView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    products.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: YZProductCell = tableView.dequeueCell(indexPath: indexPath)
    cell.product = products[indexPath.row]
    return cell
  }
}
