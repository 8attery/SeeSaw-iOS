//
//  LoginView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/04.
//

import AuthenticationServices
import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @StateObject var kakaoAuthVM = KakaoAuthViewModel(isLoggedIn: false)
    @State private var idTokenString = ""
    
    @AppStorage("nickname") var nickname: String = ""
    
    var body: some View {
        ZStack {
            Image("LoginBackground")
                .resizable()
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                Text("시소와 함께\n일과 삶 사이의 균형을 찾아보세요")
                    .multilineTextAlignment(.center)
                    .font(.ssHeading2)
                    .padding(.top, 60)
                
                Spacer()
                
                Button {
                    kakaoAuthVM.handleKakaoLogin { idToken in
                        authVM.login(req: PostLoginRequest(provider: "kakao",
                                                           idToken: idToken,
                                                           accessToken: "",
                                                           refreshToken: "")) { serverNickname in
                            nickname = serverNickname
                        }
                    }
                } label: {
                    kakaoLoginButton
                }
                
                SignInWithAppleButton(.signIn) { request in
                    request.requestedScopes = [.email, .fullName]
                } onCompletion: { result in
                    switch result {
                    case .success(let auth):
                        switch auth.credential {
                        case let credential as ASAuthorizationAppleIDCredential:
                            print("DEBUG realuserstatus: \(credential.realUserStatus)")
                            
                            guard let idToken = credential.identityToken else { return }
                            idTokenString = String(data: idToken, encoding: .utf8) ?? ""
                            print("DEBUG identityToken: \(idTokenString)")
                            
                            authVM.login(req: PostLoginRequest(provider: "apple",
                                                               idToken: idTokenString,
                                                               accessToken: "",
                                                               refreshToken: "")) { serverNickname in
                                nickname = serverNickname
                            }
                        default:
                            print("DEBUG: sign success but credetial is nil")
                        }
                    case .failure(let error):
                        print("DEBUG: apple login fail: \(error)")
                    }
                }
                .frame(height: 60)
                .frame(maxWidth: .infinity)
            }
            .padding(20)
        }
    }
    
    var kakaoLoginButton: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color.KakaoColor)
                .frame(height: 60)
            HStack {
                Image("KakaoLoginLogo")
                Text("Login with Kakao")
                    .font(.system(size: 24))
                    .foregroundColor(.black.opacity(0.85))
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
