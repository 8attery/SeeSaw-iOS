//
//  GetMonthActivityHistory.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/06/17.
//

import Foundation

struct GetMonthActivityHistory: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [ActivityDayInfo]
}

struct ActivityDayInfo: Codable {
    let day: Int
    let activity: Int?
    let color: Int?
}
