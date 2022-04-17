import Foundation

final class YZProductMapper: YZProductMapperProtocol {
  // MARK: - YZProductMapperProtocol

  func map(from coreDataModels: [YZProductCoreDataModel]?) -> [YZProductModel] {
    coreDataModels?.compactMap { map(from: $0) } ?? []
  }
}

// MARK: - Private

private extension YZProductMapper {
  func map(from coreDataModel: YZProductCoreDataModel?) -> YZProductModel? {
    guard
      let id = coreDataModel?.id,
      let title = coreDataModel?.title, !title.isEmpty,
      let quantity = coreDataModel?.quantity, !quantity.isEmpty,
      let price = coreDataModel?.price,
      let unitPriceWithAmount = coreDataModel?.unitPriceWithAmount, !unitPriceWithAmount.isEmpty,
      let imageUrl = coreDataModel?.imageUrl, !imageUrl.isEmpty, let url = URL(string: imageUrl)
    else { return nil }
    return .init(
      id: id,
      title: title,
      quantity: quantity,
      price: price,
      unitPriceWithAmount: unitPriceWithAmount,
      imageUrl: url,
      countInCart: coreDataModel?.countInCart ?? 0
    )
  }
}

