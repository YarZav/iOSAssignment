import UIKit

/// Router completion block
typealias YZRouterCompletions = [UIViewController: YZCompletion]

final class YZRouter: NSObject {
  // MARK: - Private property

  private var rootController: UINavigationController?
  private var completions: YZRouterCompletions

  // MARK: - Init

  /// Init with 'rootController'
  ///
  /// - Parameters:
  ///       rootController: root UInavigationController
  init(
    rootController: UINavigationController? = UINavigationController()
  ) {
    self.rootController = rootController
    completions = [:]
  }
}

// MARK: - Private

private extension YZRouter {
  private func performCompletionBlock(for controller: UIViewController) {
    guard let completion = completions[controller] else { return }

    completion()
    completions.removeValue(forKey: controller)
  }
}

// MARK: - YZRouterProtocol

extension YZRouter: YZRouterProtocol {
  // MARK: - View

  var navigationController: UINavigationController? {
    return rootController
  }

  var viewController: UIViewController? {
    return rootController?.viewControllers.last
  }

  // MARK: - Push

  func push(
    _ moduleTo: YZPresenterProtocol?
  ) {
    push(moduleTo, animated: true)
  }

  public func push(
    _ moduleTo: YZPresenterProtocol?,
    animated: Bool
  ) {
    push(moduleTo, animated: animated, completion: nil)
  }

  public func push(
    _ moduleTo: YZPresenterProtocol?,
    animated: Bool,
    completion: YZCompletion?
  ) {
    guard let controller = moduleTo?.viewController else { return }
    if let completion = completion {
      completions[controller] = completion
    }
    rootController?.pushViewController(controller, animated: animated)
  }

  // MARK: - New stack

  public func setRoot(_ module: YZPresenterProtocol?) {
    setRoot(module, hideBar: false)
  }

  public func setRoot(_ module: YZPresenterProtocol?, hideBar: Bool) {
    guard let controller = module?.viewController else { return }
    rootController?.setViewControllers([controller], animated: false)
    rootController?.isNavigationBarHidden = hideBar
  }
}
