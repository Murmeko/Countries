//
//  ResponseHandler.swift
//  Countries
//
//  Created by Yiğit Erdinç on 9.01.2022.
//

import Moya

enum GeoDbApiResult<T> {
	case success(T)
	case failure(Error)
}

struct ResponseHandler {

	let errorLogger = ErrorLogger()

	func process<T: Decodable>(_ result: Result<Response, MoyaError>, to type: T.Type, _ errorLogger: ErrorLogger) -> GeoDbApiResult<T> {
		switch result {
		case .success(let response):
			do {
				let filteredResponse = try response.filterSuccessfulStatusCodes()
				return try decode(filteredResponse.data, to: type)
			} catch let filteringError {
				debugPrint("Error filtering response: \(filteringError)")
				errorLogger.log(filteringError, forUrl: response.requestUrl)
				return GeoDbApiResult.failure(filteringError)
			}

		case .failure(let moyaError):
			debugPrint("Error getting country list data: \(moyaError)")
			errorLogger.log(moyaError, forUrl: moyaError.requestUrl)
			return GeoDbApiResult.failure(moyaError)
		}
	}

	func decode<T: Decodable>(_ data: Data, to type: T.Type) throws -> GeoDbApiResult<T> {
		let decoder = JSONDecoder()
		do {
			let decodedData = try decoder.decode(type.self, from: data)
			return GeoDbApiResult.success(decodedData)
		} catch let decodingError {
			debugPrint("Error decoding response: \(decodingError)")
			errorLogger.log(decodingError, forUrl: "nil")
			return GeoDbApiResult.failure(decodingError)
		}
	}
}
