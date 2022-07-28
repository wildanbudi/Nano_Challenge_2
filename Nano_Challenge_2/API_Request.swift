//
//  API_Request.swift
//  Nano_Challenge_2
//
//  Created by Wildan Budi on 27/07/22.
//

import Foundation
import NotionClient

let REQUEST_TIMEOUT: TimeInterval = 20

class APIRequest: NSObject {
    
    static let shared = APIRequest()
    
    func postRequest( onSuccess: @escaping ([NotionPage]?) -> Void, onError: @escaping (Error?) -> Void){
        
        let client = NotionClient.init(token: "secret_7Cu7sh54EJPo08vODShBGj33eRoDRKFl6CBzBrG1Sib")
        client.queryDatabase(withId: "4311a5d2cd014497acbf84da904fcc79") { (data, error) in
            if error == nil{
                onSuccess(data)
            }else{
                onError(error)
            }
        }
        
    }
}
