//
//  EcommerceOrder.swift
//  MatomoTracker
//
//  Created by Yury Krainik on 8/8/18.
//  Copyright © 2018 Yury Krainik. All rights reserved.
//

import Foundation

public class EcommerceOrder: EcommerceUpdate {
	public let orderId: String
	public var subtotal: Double?
	public var shipping: Double?
	public var discount: Double?
	public var tax: Double?

	public init(orderId: String, formatter: NumberFormatter) {
		self.orderId = orderId
		super.init(formatter: formatter)
	}

	public override func jsonDict() -> [String : Any] {
		var dict = super.jsonDict()
		dict["id"] = orderId

		if let subtotal = subtotal {
			dict["ec_st"] = formatter.string(from: subtotal as NSNumber)
		}

		if let shipping = shipping {
			dict["ec_sh"] = formatter.string(from: shipping as NSNumber)
		}

		if let discount = discount {
			dict["ec_dt"] = formatter.string(from: discount as NSNumber)
		}

		if let tax = tax {
			dict["ec_tx"] = formatter.string(from: tax as NSNumber)
		}

		return dict
	}

	public override func clearAll() {
		super.clearAll()
		subtotal = nil
		shipping = nil
		discount = nil
		tax = nil
	}
}
