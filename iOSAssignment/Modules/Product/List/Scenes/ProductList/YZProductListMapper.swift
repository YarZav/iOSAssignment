import Foundation

final class YZProductListMapper {
  // MARK: - Private property

  private let commonMapper: YZProductMapperProtocol

  // MARK: - Init

  init(commonMapper: YZProductMapperProtocol = YZProductMapper()) {
    self.commonMapper = commonMapper
  }
}

// MARK: - YZTabBarMapperProtocol

extension YZProductListMapper: YZProductListMapperProtocol {
  func map(from networkModels: Products?) -> [YZProductModel] {
    networkModels?.products.compactMap { map(from: $0) } ?? []
  }

  func map(from coreDataModels: [YZProductCoreDataModel]?) -> [YZProductModel] {
    commonMapper.map(from: coreDataModels)
  }
}

// MARK: - Private

private extension YZProductListMapper {
  func map(from networkModel: ProductRaw?) -> YZProductModel? {
    guard
      let id = networkModel?.id, !id.isEmpty,
      let title = networkModel?.title, !title.isEmpty,
      let quantity = networkModel?.quantity, !quantity.isEmpty,
      let amount = networkModel?.prices?.price?.amount,
      let price = networkModel?.prices?.unitPrice?.price?.amount,
      let unit = networkModel?.prices?.unitPrice?.unit
    else { return nil }
    let urlString = networkModel?.imageInfo?.primaryView?.first?.url
    let url = urlString.flatMap { URL(string: $0) }
    return .init(
      id: id,
      title: title,
      quantity: quantity,
      price: Double(price) / Double(amount),
      unitPriceWithAmount: "\(price)/\(unit)",
      imageUrl: url
    )
  }
}
