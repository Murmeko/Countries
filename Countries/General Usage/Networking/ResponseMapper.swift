//
//  ResponseMapper.swift
//  Countries
//
//  Created by Yiğit Erdinç on 9.01.2022.
//

import Moya

struct ResponseMapper {

	let responseHandler: ResponseHandler
	let errorLogger: ErrorLogger

	init(responseHandler: ResponseHandler, errorLogger: ErrorLogger) {
		self.responseHandler = responseHandler
		self.errorLogger = errorLogger
	}

	func map<DecodableObject: Decodable>(_ result: Result<Moya.Response, MoyaError>, of type: DecodableObject.Type, _ response: @escaping (GeoDbApiResult<DecodableObject>) -> Void) {
		response(responseHandler.process(result, to: type, errorLogger))
	}

	static func initialize() -> ResponseMapper {
		let responseHandler = ResponseHandler()
		let errorLogger = ErrorLogger()

		return ResponseMapper(responseHandler: responseHandler, errorLogger: errorLogger)
	}
}
