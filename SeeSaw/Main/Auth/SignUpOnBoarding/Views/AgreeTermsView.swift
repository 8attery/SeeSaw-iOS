//
//  AgreeTermsView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/04.
//

import SwiftUI

struct AgreeTermsView: View {
    @State var dataTermAgree: Bool = false
    @State var usingTermAgree: Bool = false
    @State var marketingTermAgree: Bool = false
    var requiredTermsAllAgree: Bool {
        return dataTermAgree && usingTermAgree
    }
    var allTermsAllAgree: Bool {
        return dataTermAgree && usingTermAgree && marketingTermAgree
    }
    @State var showPersonalSheet = false
    @State var showUsingSheet = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                progressBar
                    .padding(.bottom, 28)
                
                titleView
                
                Divider()
                    .padding(.bottom, 20)
                
                VStack {
                    Button {
                        showPersonalSheet = true
                    } label: {
                        TermView(isNecessary: true,
                                 title: "개인정보 수집 및 이용 동의",
                                 isTermAgree: $dataTermAgree)
                    }
                    
                    Button {
                        showUsingSheet = true
                    } label: {
                        TermView(isNecessary: true,
                                 title: "이용약관 동의",
                                 isTermAgree: $usingTermAgree)
                    }
                    
                    TermView(isNecessary: false,
                             title: "마케팅 수신 동의",
                             isTermAgree: $marketingTermAgree,
                             showChevron: false)
                }
                
                Divider()
                
                allTermsAgreeView
                
                Spacer()
                
                NavigationLink {
                    UserInfoView(agreeMarketing: $marketingTermAgree)
                } label: {
                    CapsuleButtonView(color: requiredTermsAllAgree ? Color.Gray900 : Color.Gray400,
                                      text: "다음",
                                      size: .large)
                }
                .disabled(requiredTermsAllAgree == false)
            }
            .padding(20)
            .background(Color.Gray200)
            .sheet(isPresented: $showPersonalSheet) {
                SafariView(url: URL(string: "https://www.notion.so/f15a8e252dbd4a1eaf441c089b8495d4?pvs=4")!)
                    .ignoresSafeArea()
            }
            .sheet(isPresented: $showUsingSheet) {
                SafariView(url: URL(string: "https://www.notion.so/82bb4ba23d4f4d859745945556da5281?pvs=4")!)
                    .ignoresSafeArea()
            }
        }
    }
    
    var progressBar: some View {
        HStack(spacing: 8) {
            Rectangle()
                .cornerRadius(12, corners: .allCorners)
                .frame(height: 6)
                .foregroundColor(.SeeSawGreen)
            
            Rectangle()
                .cornerRadius(12, corners: .allCorners)
                .frame(height: 6)
                .foregroundColor(.Gray300)
        }
    }
    
    var titleView: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("안녕하세요 :)\n약관에 동의해주세요")
                .font(.ssHeading2)
                .foregroundColor(.GrayBlack)
            Text("여러분의 개인정보와 서비스 이용 권리, 시소가 지켜드릴게요")
                .font(.ssWhiteBody2)
                .foregroundColor(.Gray600)
                .padding(.vertical, 20)
        }
    }
    
    var allTermsAgreeView: some View {
        Button {
            if allTermsAllAgree {
                dataTermAgree = false
                usingTermAgree = false
                marketingTermAgree = false
            } else {
                dataTermAgree = true
                usingTermAgree = true
                marketingTermAgree = true
            }
        } label: {
            HStack(alignment: .center) {
                Image(systemName: "checkmark.square")
                    .font(.system(size: 28))
                    .foregroundColor(allTermsAllAgree ? .black : .Gray600)
                Text("모두 동의할게요")
                    .font(.ssBlackTitle2)
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}

struct TermView: View {
    let isNecessary: Bool
    let title: String
    @Binding var isTermAgree: Bool
    var showChevron: Bool = true
    
    var body: some View {
        HStack(alignment: .center) {
            Button {
                isTermAgree.toggle()
            } label: {
                Image(systemName: "checkmark.square")
                    .font(.system(size: 28))
                    .foregroundColor(isTermAgree ? .GrayBlack : .Gray400)
            }
            Text("(\(isNecessary ? "필수" : "선택"))")
                .font(.ssBlackBody1)
                .foregroundColor(isTermAgree ? .GrayBlack : .Gray400)
            Text(title)
                .font(.ssBlackBody2)
                .foregroundColor(isTermAgree ? .GrayBlack : .Gray400)
            Spacer()
            if showChevron {
                Image(systemName: "chevron.right")
                    .foregroundColor(isTermAgree ? .GrayBlack : .Gray400)
            }
        }
        .padding(.bottom, 20)
    }
}

struct AgreeTermsView_Previews: PreviewProvider {
    static var previews: some View {
        AgreeTermsView()
    }
}
