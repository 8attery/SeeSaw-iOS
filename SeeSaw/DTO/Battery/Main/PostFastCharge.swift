//
//  PostFastCharge.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/06/17.
//

import Foundation

struct PostFastChargeResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: FastChargeResult
}

struct FastChargeResult: Codable {
    let valueId: Int
    let chargeName: String
    let createdAt: String
}
