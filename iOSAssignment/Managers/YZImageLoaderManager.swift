import Foundation

protocol YZImageLoaderManagerProtocol {
  /// Loading image by URL
  ///
  /// - Parameters:
  ///   - url: URL with image (unfortunately iss return error with permissions access)
  ///   - complation: Completion with Result<Data, Error>
  func loadImage(with url: URL, complation: ((Result<Data?, YZURLError>) -> Void)?)
}

final class YZImageLoaderManager {
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

// MARK: - YZImageLoaderManagerProtocol

extension YZImageLoaderManager: YZImageLoaderManagerProtocol {
  func loadImage(with url: URL, complation: ((Result<Data?, YZURLError>) -> Void)?) {
    let request = YZURLRequest(url: url, httpMethod: .get)
    urlSession.dataTask(with: request, completion: complation)
  }
}
