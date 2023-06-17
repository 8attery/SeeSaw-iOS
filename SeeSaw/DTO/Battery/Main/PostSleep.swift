//
//  PostSleep.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/06/17.
//

import Foundation

struct PostSleepResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Int
}
