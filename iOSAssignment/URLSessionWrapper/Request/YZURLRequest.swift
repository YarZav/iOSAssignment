import Foundation

public final class YZURLRequest: YZURLRequestProtocol {
  // MARK: - Public property

  public var url: URL
  public var httpMethod: YZURLRequestType

  // MARK: - Init

  /// Init with 'url', 'httpMethod'
  ///
  /// - Parameters:
  ///       url: URL path for request data
  ///       httpMethod: HTTP method (POST, GET, PUT etc)
  public init(url: URL, httpMethod: YZURLRequestType) {
    self.url = url
    self.httpMethod = httpMethod
  }
}
