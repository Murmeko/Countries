//
//  RestCountriesApi.swift
//  Countries
//
//  Created by Yiğit Erdinç on 14.01.2022.
//

import Moya

enum FurtherCountryDetailsApiMethods {
	case furtherDetails(countryCode: String)
}

struct RestCountriesApi {
	let apiMethods: FurtherCountryDetailsApiMethods
}

extension RestCountriesApi: TargetType {
	var baseURL: URL {
		return URL(string: "https://restcountries.com/v2/alpha")!
	}

	var path: String {
		switch apiMethods {
		case .furtherDetails(countryCode: let countryCode):
			return "\(countryCode)"
		}
	}

	var method: Method {
		return .get
	}

	var task: Task {
		return .requestPlain
	}

	var headers: [String : String]? {
		return nil
	}
}
