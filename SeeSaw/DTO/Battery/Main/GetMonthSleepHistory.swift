//
//  GetMonthSleepHistory.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/06/17.
//

import Foundation

struct GetMonthSleepHistory: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [SleepDayInfo]
}

struct SleepDayInfo: Codable {
    let day: Int
    let sleep: Int?
    let color: Int?
}
