import UIKit

final class YZProductCartViewController: UIViewController, YZPresenterProtocol, YZProductCartOutputProtocol {
  // MARK: - Private property

  private lazy var tableView = YZProductTableView()

  // MARK: - Internal property

  var presenter: YZProductCartPresenterProtocol
  var onFinish: (() -> Void)?

  // MARK: - Init

  init(presenter: YZProductCartPresenterProtocol) {
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
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    presenter.viewDidAppear()
  }
}

// MARK: - YZProductCartViewProtocol

extension YZProductCartViewController: YZProductCartViewProtocol {
  func reloadData() {
    tableView.products = presenter.products
  }
}

// MARK: - Action

private extension YZProductCartViewController {
  @objc
  func onBack() {
    onFinish?()
  }
}

// MARK: - Private

private extension YZProductCartViewController {
  func createUI() {
    navigationItem.leftBarButtonItem = UIBarButtonItem.backButton(target: self, action: #selector(onBack))
    
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
