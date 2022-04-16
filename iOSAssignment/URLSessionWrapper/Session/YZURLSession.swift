import Foundation

public final class YZURLSession {
  // MARK: - Private property

  private let urlSession = URLSession.shared
  private enum Constants {
    static let unknownStatusCodeText = "Unknown status code"
    static let unknownDataText = "Unknown data"
    static let successStatusCodeRange =  200..<300
  }

  // MARK: - Init

  public init() { }
}

// MARK: - YZURLSessionProtocol

extension YZURLSession: YZURLSessionProtocol {
  public func dataTask(
    with request: YZURLRequestProtocol,
    completion: ((Result<Data?, YZURLError>) -> Void)?
  ) {
    let task = urlSession
      .dataTask(with: urlRequest(for: request)) { (data, response, error) in
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
          completion?(.failure(.unspecified(statusMessage: Constants.unknownStatusCodeText)))
          return
        }

        switch statusCode {
        case Constants.successStatusCodeRange:
          guard let data = data else {
            completion?(.failure(.unspecified(statusMessage: Constants.unknownDataText)))
            return
          }
          completion?(.success(data))
        default:
          let error = statusCode.urlError()
          completion?(.failure(error))
        }
      }
    task.resume()
  }
}

// MARK: - Private

extension YZURLSession {
  func urlRequest(for request: YZURLRequestProtocol) -> URLRequest {
    var urlRequest = URLRequest(url: request.url)
    urlRequest.httpMethod = request.httpMethod.rawValue
    return urlRequest
  }
}
