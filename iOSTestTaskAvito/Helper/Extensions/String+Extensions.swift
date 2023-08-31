//
//  String+Extensions.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

import Foundation

extension String {
    func convertToDate() -> Date? {
        let format = "yyyy-MM-dd"
        let dateFormatter = DateFormatter.createLocaledFormatter(dateFormat: format)
        return dateFormatter.date(from: self)
    }
}
