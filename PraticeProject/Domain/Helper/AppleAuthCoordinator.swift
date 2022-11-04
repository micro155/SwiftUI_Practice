//
//  AppleAuthCoordinator.swift
//  PraticeProject
//
//  Created by 백동열 on 2022/08/27.
//

import Foundation
import CryptoKit
import AuthenticationServices
import FirebaseAuth

class AppleAuthCoordinator: NSObject {
    var currentNonce: String?
    let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func startAppleLogin() {
        let nonce = randomNonceString()
        currentNonce = nonce
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        print("authorizationController called 1")
        authorizationController.presentationContextProvider = self
        print("authorizationController called 2")
        authorizationController.performRequests()
        print("authorizationController called 3")
        print("request info : \(String(describing: request.user))")
    }
    
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            return String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
    // Adapted from https://auth0.com/docs/api-auth/tutorials/nonce#generate-a-cryptographically-random-nonce
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: Array<Character> =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
                }
                return random
            }
            
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
}

extension AppleAuthCoordinator: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let nonce = currentNonce else {
                fatalError("Invalid state: A login callback was received, but no login request was sent.")
            }
            guard let appleIDToken = appleIDCredential.identityToken else {
                print("Unable to fetch identity token")
                return
            }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                return
            }
            
            // Initialize a Firebase credential.
            let credential = OAuthProvider.credential(withProviderID: "apple.com",
                                                      idToken: idTokenString,
                                                      rawNonce: nonce)
            
            //Firebase 작업
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if error != nil {
                    // Error. If error.code == .MissingOrInvalidNonce, make sure
                    // you're sending the SHA256-hashed nonce as a hex string with
                    // your request to Apple.
                    print(error!.localizedDescription)
                    return
                }
                // User is signed in to Firebase with Apple.
                // ...
                print("isloginSuccess called 1")
                UserDefaults.standard.setValue(true, forKey: "isLogin")
            }
            print("isloginSuccess called 2, appleCredential Info : \(appleIDCredential.realUserStatus), email: \(String(describing: appleIDCredential.email)), state: \(String(describing: appleIDCredential.state)), fullName: \(String(describing: appleIDCredential.fullName!)), authorization_code: \(String(decoding: appleIDCredential.authorizationCode!, as: UTF8.self)), id_token_string: \(idTokenString)")
        }
        print("isloginSuccess called 3")
    }
}

extension AppleAuthCoordinator: ASAuthorizationControllerPresentationContextProviding {
    public func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        window!
    }
}
