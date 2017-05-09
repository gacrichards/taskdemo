//
//  GetHelloWorldTask.swift
//  TaskDemo
//
//  Created by Cole Richards on 5/8/17.
//  Copyright © 2017 emerz. All rights reserved.
//

import UIKit

class GetHelloWorldTask: UseCase {
    
    override init(){
        super.init()
    }
    
    override func executeUseCase<REQV:RequestValues>(with request:REQV, and callback:UseCaseCallbackContract){
        if (request.getRequestKey() == "key"){
            let response = ResponseValues.init(hw: "Hello World")
            //Sleep for 10 seconds to simulate a terribly intensive and long asyncronous process
            sleep(10)
            callback.onSuccess(response)
        }
    }
    
    
    class RequestValues : UseCaseRequestValues{
        private let requestKey:String
        
        init(key:String){
            self.requestKey = key
        }
        
        func getRequestKey()->String{
            return requestKey
        }
    }
    
    class ResponseValues : UseCaseResponseValues{
        private let helloWorld:String
        
        init(hw:String){
            self.helloWorld = hw
        }
        
        func getHelloWorld()->String{
            return helloWorld
        }
        
    }
}

