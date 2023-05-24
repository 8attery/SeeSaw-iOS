//
//  ProjectDetailViewModel.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/24.
//

import Alamofire
import Foundation
import KeychainSwift

class ProjectDetailViewModel: ObservableObject {
    let keychain = KeychainSwift()
    let baseUrl = "http://\(Bundle.main.infoDictionary?["BASE_URL"] ?? "nil baseUrl")"
    
    func getProjectDetailInfo(projectId: Int, completion: @escaping (ProjectDetailInfo) -> Void) {
        let url = "\(baseUrl)/api/project/\(projectId)"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: GetProjectDetailInfoResponse.self) { response in
                switch response.result {
                case .success(let res):
                    let projectDetailInfo = res.result
                    completion(projectDetailInfo)
                case .failure(let error):
                    print("DEBUG Api-getValues: \(error)")
                }
            }
    }
}
