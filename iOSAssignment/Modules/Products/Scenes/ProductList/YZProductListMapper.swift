import Foundation

final class YZProductListMapper: YZProductListMapperProtocol {
  // MARK: - YZTabBarMapperProtocol

  func map(from networkModels: Products?) -> [YZProductModel] {
    networkModels?.products.compactMap { map(from: $0) } ?? []
  }
}

// MARK: - Private

private extension YZProductListMapper {
  func map(from networkModel: ProductRaw?) -> YZProductModel? {
    guard
      let title = networkModel?.title, !title.isEmpty,
      let quantity = networkModel?.quantity, !quantity.isEmpty,
      let amount = networkModel?.prices?.price?.amount,
      let price = networkModel?.prices?.unitPrice?.price?.amount,
      let unit = networkModel?.prices?.unitPrice?.unit
    else { return nil }
    let urlString = networkModel?.imageInfo?.primaryView?.first?.url
    let url = urlString.flatMap { URL(string: $0) }
    return .init(
      title: title,
      quantity: quantity,
      price: Decimal((Double(price) / Double(amount))),
      unitPriceWithAmount: "\(price)/\(unit)",
      imageUrl: url
    )
  }
}
