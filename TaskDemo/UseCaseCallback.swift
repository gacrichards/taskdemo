//
//  UseCaseCallback.swift
//
//  Created by Cole Richards on 5/8/17.
//

import UIKit

/*!
 * The UseCaseCallback class is initialized with two blocks that are interpreted 
 * as the main thread callbacks for onSuccess(<response>) and onError(). 
 *
 * The object conforming to UseCaseResponseValues will be defined on initialization giving 
 * the success block access to the specific objects packaged by UseCaseResponseValues
 */
class UseCaseCallback<RESP:UseCaseResponseValues>: NSObject, UseCaseCallbackContract{
    
    let success: (RESP)->()
    let error: ()->()
    
    init(success:@escaping (RESP)->(), error:@escaping ()->()){
        self.success = success
        self.error = error
    }
    
    func onSuccess(_ response: UseCaseResponseValues) {
        if let resp = response as? RESP{
            onNotifyResponse(resp)
        }else{
            onError()
        }
    }
    
    func onNotifyResponse(_ response: RESP) {
        DispatchQueue.main.async {
            self.success(response)
        }
    }
    
    func onError(){
        DispatchQueue.main.async {
            self.error()
        }
    }
}
