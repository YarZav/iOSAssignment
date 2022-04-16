import UIKit

final class YZWelcomeViewController: UIViewController, YZPresenterProtocol, YZWelcomeOutputProtocol {
  // MARK: - Constants

  private enum Constants {
    static let welcomeText = "welcome"
    static let buttonHeight: CGFloat = 44
  }

  // MARK: - Private property

  private lazy var welcomeButton: UIButton = {
    let button = UIButton.make(
      title: Constants.welcomeText,
      cornerRadius: Constants.buttonHeight / 2,
      borderColor: .black,
      backgroundColor: .white,
      target: self,
      action: #selector(onWelcome)
    )
    button.setTitleColor(.black, for: .normal)
    button.contentEdgeInsets = .init(top: 5, left: 12, bottom: 5, right: 12)
    return button
  }()

  // MARK: - Internal property

  var onFinish: (() -> Void)?
  
  // MARK: - Life circle

  override func viewDidLoad() {
    super.viewDidLoad()
    createUI()
  }

  override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      navigationController?.setNavigationBarHidden(true, animated: animated)
  }

  override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      navigationController?.setNavigationBarHidden(false, animated: animated)
  }
}

// MARK: - Private

private extension YZWelcomeViewController {
  func createUI() {
    view.backgroundColor = .systemBackground
    title = ""

    view.addSubview(welcomeButton)

    welcomeButton.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      welcomeButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      welcomeButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
      welcomeButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight)
    ])
  }
}

// MARK: - Action

private extension YZWelcomeViewController {
  @objc
  func onWelcome() {
    onFinish?()
  }
}
