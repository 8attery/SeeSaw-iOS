//
//  BatteryDashboardView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/11.
//

import Combine
import SwiftUI

struct BatteryDashboardView: View {
    @AppStorage("nickname") var nickname: String = ""
    @State private var showBatteryInformation: Bool = false
    
    @State var battery: Int = 0
    
    @State var isFastChargeExist: Bool = true
    @State var fastChargeTitle: String = "홍제천 산책하기"
    @State var fastChargeValue: String = "가치"
    @State var showFastChargeExistPopUp: Bool = false
    
    @State var isEnergyGoalExist: Bool = true
    @State var energyGoal: Int = 111
    @State var todayEnergy: Int = 111
    
    @State var isSleepGoalExist: Bool = true
    @State var sleepGoal: Int = 0
    @State var todaySleepAmount: Int = 8
    @State var isTodaySleepAmountExist: Bool = false
    @State var sleepCondition: String = "Good"
    
    private var healthStore: HealthStore?
    @ObservedObject var batteryDashboardVM = BatteryDashboardViewModel()
    @StateObject var batteryVM = BatteryViewModel()
    
    @AppStorage("healthAuth") var healthAuth: Bool = false
    
    init() {
        healthStore = HealthStore()
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                MainToolBar(feature: .lifeLog)
                
                GeometryReader { geometry in
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .center, spacing: 0) {
                            title
                                .padding(.top, 10)
                                .padding(.horizontal, 20)
                            
//                            Text("\(batteryDashboardVM.isLoading)")
                            
                            // 배터리
                            ZStack(alignment: .topTrailing) {
                                // 배터리 원형 그래프
                                BatteryProgressCircleView(geometry: geometry, battery: $battery)
                                
                                // 배터리 정보 버튼
                                batteryInfoButton
                            }
                            .padding(.top, 12)
                            
                            // 고속충전
                            BatteryDashboardFastChargeView(isFastChargeExist: $isFastChargeExist, fastChargeTitle: $fastChargeTitle, fastChargeValue: $fastChargeValue, showFastChargeExistPopUp: $showFastChargeExistPopUp)
                            
                            // 활동량, 수면
                            VStack {
                                HStack {
                                    BatteryDashboardEnergyView(isEnergyGoalExist: $isEnergyGoalExist, energyGoal: $energyGoal, todayEnergy: $todayEnergy)
                                    
                                    BatteryDashboardSleepView(isSleepGoalExist: $isSleepGoalExist, sleepGoal: $sleepGoal, todaySleepAmount: $todaySleepAmount, isTodaySleepAmountExist: $isTodaySleepAmountExist, sleepCondition: $sleepCondition)
                                }
                                .padding(12)
                                .padding(.bottom, 8)
                            }
                            .background(Color.Gray100)
                            .padding(.bottom, 72)
                        }
                    } // ScrollView
                } // GeometryReder
                .background(Color.Gray200)
            }
            
            if $showFastChargeExistPopUp.wrappedValue {
                FastChargeExistPopUpView(showFastChargeExistPopUp: $showFastChargeExistPopUp)
            }
        }
        .navigationTitle("")
        .sheet(isPresented: $showBatteryInformation, content: {
            if #available(iOS 16.0, *) {
                BatteryInformationView()
                    .presentationDetents([.fraction(0.60)])
                    .presentationDragIndicator(.visible)
            } else {
                BatteryInformationView()
            }
        })
        .onAppear {
            print("DEBUG BatteryDashoboard: onAppear")
            fetchData()
            postEnergy()
            batteryDashboardVM.getMonthActivityHistory(year: 2023, month: 5) { isLoading, _ in
                print("finish combine test\(isLoading)")
            }
        }
        .refreshable {
            fetchData()
        }
    }
    
    // ##님의 에너지 배터리
    var title: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(nickname)님의")
                Text("에너지 배터리")
            }
            .font(.ssHeading1)
            
            Spacer()
        }
    }
    
    // 배터리에 대한 정보 모달을 보여주는 버튼
    var batteryInfoButton: some View {
        Button {
            showBatteryInformation = true
        } label: {
            Image(systemName: "questionmark.circle")
                .font(.system(size: 28))
                .foregroundColor(.Gray400)
                .padding(.trailing, 20)
        }
    }
    
    // 배터리 정보 데이터 가져오기
    func fetchData() {
        batteryVM.getBattery { batteryInfo in
            battery = batteryInfo.battery
            
            if let chargeTitle = batteryInfo.fastChargeTitle, let value = batteryInfo.fastChargeValue {
                isFastChargeExist = true
                fastChargeTitle = chargeTitle
                fastChargeValue = value
            } else {
                isFastChargeExist = false
            }
            
            if let activity = batteryInfo.todayActivity, let goal = batteryInfo.activityGoal {
                isEnergyGoalExist = true
                todayEnergy = activity
                energyGoal = goal
            } else {
                isEnergyGoalExist = false
            }
            
            if let goal = batteryInfo.sleepGoal {
                isSleepGoalExist = true
                sleepGoal = goal
                if let sleep = batteryInfo.todaySleep {
                    isTodaySleepAmountExist = true
                    todaySleepAmount = sleep
                    if sleep >= goal {
                        sleepCondition = "Good"
                    } else if sleep >= goal / 2 {
                        sleepCondition = "Bad"
                    } else {
                        sleepCondition = "Terrible"
                    }
                }
            } else {
                isSleepGoalExist = false
            }
        }
    }
    
    func postEnergy() {
        if healthAuth {
            healthStore?.getActivityEnergyBurned(completion: { energy in
                batteryVM.postEnergy(todayEnergy: Int(energy))
            })
        }
    }
}

struct BatteryDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryDashboardView()
    }
}
