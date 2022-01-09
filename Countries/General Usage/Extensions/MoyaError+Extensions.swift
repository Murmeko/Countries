//
//  MoyaError+Extensions.swift
//  Countries
//
//  Created by Yiğit Erdinç on 9.01.2022.
//

import Moya

private let noRequestUrl = "no request URL"

extension MoyaError {
	var requestUrl: String {
		return self.response?.request?.url?.absoluteString ?? noRequestUrl
	}
}
