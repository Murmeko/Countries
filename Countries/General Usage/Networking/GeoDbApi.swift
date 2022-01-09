//
//  GeoDbApi.swift
//  Countries
//
//  Created by Yiğit Erdinç on 9.01.2022.
//

import Moya

enum ApiMethods {
	case listCountries(pageIndex: Int, pageSize: Int)
	case countryDetails(countryCode: String)
}
struct GeoDbApi {
	let apiMethods: ApiMethods
}

extension GeoDbApi: TargetType {
	var baseURL: URL {
		return URL(string: "https://wft-geo-db.p.rapidapi.com/v1/geo")!
	}

	var path: String {
		switch apiMethods {
		case .listCountries:
			return "/countries"
		case .countryDetails(countryCode: let countryCode):
			return "/countries/\(countryCode)"
		}
	}

	var method: Method {
		return .get
	}

	var task: Task {
		switch apiMethods {
		case .listCountries(pageIndex: let pageIndex, pageSize: let pageSize):
			return .requestParameters(parameters: ["offset": "\(pageIndex * 10)",
																						 "limit": "\(pageSize)"],
																encoding: URLEncoding.default)
		case .countryDetails:
			return .requestPlain
		}
	}

	var headers: [String : String]? {
		return ["x-rapidapi-host": "wft-geo-db.p.rapidapi.com",
						"x-rapidapi-key": "626c829f2cmsh76a887c2bfba749p1685c7jsn51365c173f12"]
	}
}
