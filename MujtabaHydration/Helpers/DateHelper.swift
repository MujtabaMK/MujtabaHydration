//
//  DateHelper.swift
//  MujtabaHydration
//
//  Created by Mujtaba Khan on 27/03/24.
//

import Foundation

class DateHelper {
    
    // Returns the date string of a date instance
    static func getDateString(day:Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: day)
    }
    
    // Returns the time string of a date instance
    static func getTimeString(time:Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: time)
    }
    
}
