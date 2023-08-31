//
//  extentions.swift
//  NasaImages
//
//  Created by Kevin Martinez on 8/30/23.
//

import Foundation

extension String {
    ///  Convert date string format from "YYYY-MM-dd" to a string formate as "Mar 16, 2023" for example
    /// - Returns: return the date as the name of the month the day and the year.
    func toDate() -> String? {
        let dateFormater = DateFormatter()
        
        dateFormater.dateFormat = "YYYY-MM-dd"
        let date = dateFormater.date(from: self)
        let formatedDate = date?.formatted(.dateTime.month().day().year())
        return formatedDate
    }
}
