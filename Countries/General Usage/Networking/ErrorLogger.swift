//
//  ErrorLogger.swift
//  Countries
//
//  Created by Yiğit Erdinç on 9.01.2022.
//

import FirebaseCrashlytics

class ErrorLogger {
	func log(_ error: Error, forUrl requestUrl: String) {
		let additionalUserInfo = ["URL": requestUrl]
		let tempError = error as NSError
		let recordableError = NSError(domain: tempError.domain, code: tempError.code, userInfo: additionalUserInfo)
		Crashlytics.crashlytics().record(error: recordableError)
	}
}
