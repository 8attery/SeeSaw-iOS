//
//  GetProjectReportFirst.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/25.
//

import Foundation

struct GetProjectReportFirstResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: ProjectReportFirstResult
}

struct ProjectReportFirstResult: Codable {
    let projectReportInfoDto: ProjectReportInfo
    let emotion1: String
    let emotion2: String
    let projectMiddleFinalQnaDto: ProjectMiddleFinalQna
    let todayAnswerCount: Int
    let recordAnswerCount: Int
    let simpleRecordInfo: [SimpleRecordInfo]
    let answerContentList: [AnswerContentList]
}

struct ProjectReportInfo: Codable {
    let value: String
    let projectName: String
    let startedAt: String
    let endedAt: String
    let projectIntensity: String
    let projectGoal: String
    let jointProject: [String]
}

struct ProjectMiddleFinalQna: Codable {
    let middleAnswer: String
    let finalAnswer: String
}

struct SimpleRecordInfo: Codable {
    let createdAt: String
    let content: String
}

struct AnswerContentList: Codable {
    let remembranceType: String
    let choice: Int?
    let content: String
}
