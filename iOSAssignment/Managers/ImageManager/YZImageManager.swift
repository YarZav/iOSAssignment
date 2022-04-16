import Foundation

/// Completion for image loading
typealias YZImageManagerCompletion = ((Result<Data?, YZURLError>) -> Void)?


protocol YZImageManagerProtocol {
  /// Loading image by URL
  ///
  /// - Parameters:
  ///   - url: URL with image (unfortunately iss return error with permissions access)
  ///   - complation: Completion with Result<Data, Error>
  func loadImage(with url: URL, complation: YZImageManagerCompletion)
}

final class YZImageManager {
  // MARK: - Private property

  private let urlSession: YZURLSessionProtocol

  // MARK: - Init

  /// Init with urlSession wrapper
  ///
  /// - Parameters:
  ///   - urlSession: Simple URL session wrapper
  init(urlSession: YZURLSessionProtocol = YZURLSession()) {
    self.urlSession = urlSession
  }
}

// MARK: - YZImageManagerProtocol

extension YZImageManager: YZImageManagerProtocol {
  func loadImage(with url: URL, complation: YZImageManagerCompletion) {
    let request = YZURLRequest(url: url, httpMethod: .get)
    urlSession.dataTask(with: request, completion: complation)
  }
}
