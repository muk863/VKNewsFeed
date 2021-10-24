//
//  AuthService.swift
//  VKNewsFeed
//
//  Created by username on 18.10.2021.
//
//7977810
import Foundation
import VK_ios_sdk

protocol AuthServiceDelegate: AnyObject {
    func authServiceShouldShow(_ viewController: UIViewController)
    func authServiceSignIn()
    func authServiceDidSignInFail()
}

class AuthService: NSObject, VKSdkDelegate, VKSdkUIDelegate {
    
    private let appId = "7977810"
    private let vkSdk: VKSdk
    
    weak var delegate: AuthServiceDelegate?
    
    var  token: String? {
        return VKSdk.accessToken().accessToken
    }
    
    var userId: String? {
        return VKSdk.accessToken().userId
    }
    
    override init() {
        vkSdk = VKSdk.initialize(withAppId: appId)
        super.init()
        print("VKSdk.initialize")
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    
    func wakeUpSession() {
        let scope = ["wall", "friends"]
        VKSdk.wakeUpSession(scope) { [delegate] (state, error) in
            switch state {
            case .authorized:
                print("authorized")
                delegate?.authServiceSignIn()
            case .initialized:
                print("initialized")
                VKSdk.authorize(scope)
            default:
                delegate?.authServiceDidSignInFail()
                fatalError(error!.localizedDescription)
            }
        }
    }
    
    // MARK: - VKSdkDelegate
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
        if result.token != nil {
            delegate?.authServiceSignIn()
        } else {
            print(result.error.localizedDescription)
        }
    }
    
    func vkSdkUserAuthorizationFailed() {
        print(#function)
    }
    
    // MARK: - VKSdkUIDelegate
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        delegate?.authServiceShouldShow(controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
}
