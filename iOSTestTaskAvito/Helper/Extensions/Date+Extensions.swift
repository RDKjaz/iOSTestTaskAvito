//
//  Date+Extensions.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

import Foundation

extension Date {
    func toString(format: String) -> String {
        let dateFormatter = DateFormatter.createLocaledFormatter(dateFormat: format)
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
