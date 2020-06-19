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
            ASAuthorizationAppleIDButton()
    }
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {}
}

final class SignInWithAppleCoordinator:NSObject{
    func getAppleRequest(){
        let appleIdProvider = ASAuthorizationAppleIDProvider()
        let request = appleIdProvider.createRequest()
        request.requestedScopes = [.fullName,.email]
        let authController = ASAuthorizationController(authorizationRequests: [request])
        authController.delegate = self
        authController.performRequests()
    }
    
    private func setUserInfo(for userID:String, fullName:String?, email:String?){
        ASAuthorizationAppleIDProvider().getCredentialState(forUserID: userID) { (credentialState, error) in
            var authState:String?
            switch credentialState{
            case .authorized: authState = "authorized"
            case .notFound: authState = "notFound"
            case .revoked: authState = "revoked"
            case .transferred: authState = "transferred"
            @unknown default:
                fatalError()
                
            }
            
        }
    }
    
}

extension SignInWithAppleCoordinator:ASAuthorizationControllerDelegate{
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Sign In with Apple Error: \(error.localizedDescription)")
    }
}
