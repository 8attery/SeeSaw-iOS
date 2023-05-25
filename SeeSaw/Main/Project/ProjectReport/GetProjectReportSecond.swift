//
//  GetProjectReportSecond.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/25.
//

import Foundation

struct GetProjectReportSecondResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: ProjectReportSecondResult
}

struct ProjectReportSecondResult: Codable {
    let energyReport: EnergyReport
    let chargeReport: ChargeReport
    let healthReport: HealthReport
}

struct EnergyReport: Codable {
    let avg: Int
    let max: Int
    let min: Int
}

struct ChargeReport: Codable {
    let valueCountList: [ValueCount]
}

struct ValueCount: Codable {
    let name: String
    let count: Int
}

struct HealthReport: Codable {
    let activityAvg: Int
    let sleepAvg: Int
}
