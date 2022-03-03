//
//  NetworkManager.swift
//  Countries
//
//  Created by Yiğit Erdinç on 9.01.2022.
//

import Foundation
import Moya

class NetworkManager {

	private let provider = MoyaProvider<GeoDbApi>()
	private let secondaryProvider = MoyaProvider<RestCountriesApi>()

	func fetchCountryList(pageIndex: Int, completion: @escaping (CountryListModel?) -> Void) {
		provider.request(.init(apiMethods: .listCountries(pageIndex: pageIndex, pageSize: 10))) { moyaResult in
			let reponseMapper = ResponseMapper.initialize()
			reponseMapper.map(moyaResult, of: CountryListModel.self) { result in
				switch result {
				case .success(let countryListModel):
					completion(countryListModel)
				case .failure(let countryListError):
					debugPrint("Request failed because: \(countryListError)")
					completion(nil)
				}
			}
		}
	}

	func fetchCountryDetails(countryCode: String, completion: @escaping (CountryDetailsModel?) -> Void) {
		provider.request(.init(apiMethods: .countryDetails(countryCode: countryCode))) { moyaResult in
			let reponseMapper = ResponseMapper.initialize()
			reponseMapper.map(moyaResult, of: CountryDetailsModel.self) { result in
				switch result {
				case .success(let countryListModel):
					completion(countryListModel)
				case .failure(let countryListError):
					debugPrint("Request failed because: \(countryListError)")
					completion(nil)
				}
			}
		}
	}

	func fetchFurtherCountryDetails(countryCode: String, completion: @escaping (CountryDetailsSecondModel?) -> Void) {
		secondaryProvider.request(.init(apiMethods: .furtherDetails(countryCode: countryCode))) { moyaResult in
			let reponseMapper = ResponseMapper.initialize()
			reponseMapper.map(moyaResult, of: CountryDetailsSecondModel.self) { result in
				switch result {
				case .success(let countryListModel):
					completion(countryListModel)
				case .failure(let countryListError):
					debugPrint("Request failed because: \(countryListError)")
					completion(nil)
				}
			}
		}
	}
}
