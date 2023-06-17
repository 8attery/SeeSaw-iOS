//
//  GetBattery.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/06/17.
//

import Foundation

struct GetBatteryResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: BatteryInfo
}

struct BatteryInfo: Codable {
    let battery: Int
    let fastChargeTitle: String?
    let fastChargeValue: String?
    let todayActivity: Int?
    let activityGoal: Int?
    let todaySleep: Int?
    let sleepGoal: Int?
    
    private enum CodingKeys: String, CodingKey {
        case battery = "curBattery"
        case fastChargeTitle = "chargeName"
        case fastChargeValue = "valueName"
        case todayActivity = "curActivity"
        case activityGoal = "activityGoal"
        case todaySleep = "curSleep"
        case sleepGoal = "sleepGoal"
    }
}
