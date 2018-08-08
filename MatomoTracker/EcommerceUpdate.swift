//
//  EcommerceUpdate.swift
//  MatomoTracker
//
//  Created by Yury Krainik on 8/8/18.
//  Copyright © 2018 Matomo. All rights reserved.
//

import Foundation

public class EcommerceUpdate {
	public var items: [String: EcommerceItem] = [:]
	public var revenue: Double = 0
	public let formatter: NumberFormatter

	public init(formatter: NumberFormatter) {
		self.formatter = formatter
	}

	public func jsonDict() -> [String: Any] {

		let jsonItems = items.map { item -> Any in
			item.value.jsonObject()
		}

		return ["idgoal": "0", "ec_items": jsonItems, "revenue": formatter.string(from: revenue as NSNumber) ?? "0"]
	}

	public func variables() throws -> [CustomVariable] {

		return try jsonDict().enumerated().map { (arg) -> CustomVariable in

			let (offset, element) = arg

			let data = try JSONSerialization.data(withJSONObject: element.value, options: [])
			let jsonValue = String.init(data: data, encoding: String.Encoding.utf8) ?? ""

			return CustomVariable(index: UInt(offset), name: element.key, value: jsonValue)
		}
	}

	public func addItem(_ item: EcommerceItem) {
		items[item.sku] = item
	}

	public func removeItem(_ item: EcommerceItem) {
		items.removeValue(forKey: item.sku)
	}

	public func clearAll() {
		items.removeAll()
		revenue = 0
	}
}
