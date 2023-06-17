//
//  GetSevenDaysBatteryHistory.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/06/17.
//

import Foundation

struct GetSevenDaysBatteryHistoryResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [BatteryHistory]
}
struct BatteryHistory: Codable {
    let date: String
    let batteryPercentage: Int
}
