//
//  BatteryDashboardViewModel.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/26.
//

import Alamofire
import Combine
import Foundation
import KeychainSwift

class BatteryDashboardViewModel: ObservableObject {
    let keychain = KeychainSwift()
    let baseUrl = "http://\(Bundle.main.infoDictionary?["BASE_URL"] ?? "nil baseUrl")"
    
    @Published var isLoading: String = "..."
    
    func getMonthActivityHistory(year: Int, month: Int, completion: @escaping (String, [ActivityDayInfo]) -> Void) {
        let url = "\(baseUrl)/api/battery/history/activity?year=\(year)&month=\(month)"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(keychain.get("accessToken") ?? "")"
        ]
        
        self.isLoading = "isLoading"
        
        DispatchQueue.global().async {
            AF.request(url, method: .get, encoding: JSONEncoding.default, headers: headers)
                .responseDecodable(of: GetMonthActivityHistory.self) { response in
                    switch response.result {
                    case .success(let res):
                        var histories: [ActivityDayInfo] = []
                        for data in res.result {
                            let day = data.day
                            let activity = data.activity
                            let color = data.color
                            histories.append(ActivityDayInfo(day: day, activity: activity, color: color))
                        }
                        completion(self.isLoading, histories)
                    case .failure(let error):
                        print("DEBUG get month activity: \(error)")
                    }
                }
            
            DispatchQueue.main.async {
                self.isLoading = "Already Loaded"
            }
        }
    }
}
