//
//  SVGImageProcessor.swift
//  Countries
//
//  Created by Yiğit Erdinç on 9.01.2022.
//

import UIKit
import Kingfisher
import SVGKit

public struct SVGImageProcessor: ImageProcessor {
		public var identifier: String = "com.appidentifier.webpprocessor"
		public func process(item: ImageProcessItem, options: KingfisherParsedOptionsInfo) -> KFCrossPlatformImage? {
				switch item {
				case .image(let image):
						return image
				case .data(let data):
						let svgImage = SVGKImage(data: data)
						return svgImage?.uiImage
				}
		}
}
