//
//  Moya.Response+Extensions.swift
//  Countries
//
//  Created by Yiğit Erdinç on 9.01.2022.
//

import Moya

private let noRequestUrl = "no request URL"

extension Moya.Response {
	var requestUrl: String {
		return self.request?.url?.absoluteString ?? noRequestUrl
	}
}
