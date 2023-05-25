//
//  ProjectReportViewModel.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/25.
//

import Alamofire
import Foundation
import KeychainSwift

class ProjectReportViewModel: ObservableObject {
    let keychain = KeychainSwift()
    let baseUrl = "http://\(Bundle.main.infoDictionary?["BASE_URL"] ?? "nil baseUrl")"
    
    func getProjectReportFirst(projectId: Int, completion: @escaping (ProjectReportFirstResult) -> Void) {
        let url = "\(baseUrl)/api/project/\(projectId)/report"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: GetProjectReportFirstResponse.self) { response in
                switch response.result {
                case .success(let res):
                    completion(res.result)
                case .failure(let error):
                    print("DEBUG get project report 1: \(error)")
                }
            }
    }
    
    func getProjectReportSecond(projectId: Int, completion: @escaping (ProjectReportSecondResult) -> Void) {
        let url = "\(baseUrl)/api/project/{projectId}/report/battery"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: GetProjectReportSecondResponse.self) { response in
                switch response.result {
                case .success(let res):
                    completion(res.result)
                case .failure(let error):
                    print("DEBUG get project report 2: \(error)")
                }
            }
    }
}
