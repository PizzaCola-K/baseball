//
//  OAuthManager.swift
//  baseball
//
//  Created by 박정하 on 2021/05/12.
//

import Foundation
import AuthenticationServices

//class OAuthManager: NSObject, ASWebAuthenticationPresentationContextProviding {
//
//    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
//        return self.view.window ?? ASPresentationAnchor()
//    }
//
//    var webAuthSession: ASWebAuthenticationSession?
//
//    let callbackUrlScheme = "baseball"
//    let url = URL.init(string: "https://github.com/login/oauth/authorize?client_id=3cfbaec21ba44b149d79")
//    webAuthSession = ASWebAuthenticationSession.init(url: url!, callbackURLScheme: callbackUrlScheme, completionHandler: { (callBack:URL?, error:Error?) in
//        //             handle auth response
//        guard error == nil, let successURL = callBack else {
//            return
//        }
//        let oauthToken = NSURLComponents(string: (successURL.absoluteString))?.queryItems?.filter({$0.name == "code"}).first
//
//        let tempstring: String = "\(oauthToken!)"
//
//        let urlurl: URL = URL(string: "http://ec2-3-35-10-144.ap-northeast-2.compute.amazonaws.com/auth?\(tempstring)")!
//        var request: URLRequest = URLRequest.init(url: urlurl)
//
//        request.httpMethod = "GET"
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            print(String(data: data!, encoding: String.Encoding.utf8))
//        }.resume()
//    })
//
//    // Kick it off
//    webAuthSession?.presentationContextProvider = self
//    webAuthSession?.start()
//
//
//}
