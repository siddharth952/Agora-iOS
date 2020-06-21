//
//  AppleIdButton.swift
//  agora-ios
//
//  Created by Siddharth sen on 6/1/20.
//  Copyright © 2020 HalfPolygon. All rights reserved.
//

import SwiftUI
import AuthenticationServices

// Wrapping ASAuthorizationAppleIdButton, so we could use it in SwiftUI
struct AppleIdButton: UIViewRepresentable {
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        ASAuthorizationAppleIDButton(authorizationButtonType: .signIn, authorizationButtonStyle: .black)
    }
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
    }
}


final class SignInWithAppleCoordinator: NSObject {
    
//    func getUserInfo() {
//       if let userData = UserDefaults.standard.object(forKey: "user") as? Data,
//       let userDecoded = try? JSONDecoder().decode(DatabaseUser.self, from:  userData) {
//          print("UserData: \(userDecoded)")
//          DatabaseUser = userDecoded
//       }
//    }

    func getApppleRequest() {
        let appleIdProvider = ASAuthorizationAppleIDProvider()
        let request = appleIdProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        let authController = ASAuthorizationController(authorizationRequests: [request])
        authController.delegate = self
        authController.performRequests()
    }
    
    private func setUserInfo(for userId: String, fullName: String?, email: String?) {
        ASAuthorizationAppleIDProvider().getCredentialState(forUserID: userId) { credentialState, error in
            var authState: String?
            
            switch credentialState {
                case .authorized: authState = "authorized"
                case .revoked: authState = "revoked"
                case .notFound: authState = "notFound"
                case .transferred: authState = "transferred"
                @unknown default:
                        fatalError()
                }
            
            //Call signup with given email , fullname and userId
            
            //let user = DatabaseUser(fullName: fullName ?? "not provided", email: email ?? "email")
//            if let userEncoded = try? JSONEncoder().encode(user) {
//                UserDefaults.standard.set(userEncoded, forKey: "user")
//            }
        }
    }
    
    
}

extension SignInWithAppleCoordinator: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let credential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let fullName = (credential.fullName?.givenName ?? "")
            print(credential.authorizationCode)
            setUserInfo(for: credential.user, fullName: fullName, email: credential.email)
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Sign In with Apple ID Error: \(error.localizedDescription)")
    }
}


final class AppleViewModel: ObservableObject {
    var signInWithApple = SignInWithAppleCoordinator()
    
    @Published var user: DatabaseUser?
    
    func getRequest() {
        signInWithApple.getApppleRequest()
    }
    
//    func getUserInfo() {
//        if let userData = UserDefaults.standard.object(forKey: "user") as? Data,
//            let userDecoded = try? JSONDecoder().decode(User.self, from: userData) {
//            print("UserData: \(userDecoded)")
//            user = userDecoded
//        }
//    }
}
