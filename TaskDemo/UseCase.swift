//
//  UseCase.swift
//
//  Created by Cole Richards on 5/8/17.
//

import UIKit
/*!
 * The UseCaseClass is a parent class abstraction for subclasses to override the
 * single execute method with custom UseCaseRequestValues objects
 *
 * Because subclasses will give specific instances of UseCaseRequestValues this parent
 * class cannot be abstracted into a protocol, since objects conforming to the protocol
 * could not override the required execute method while recieving specific input on the 
 * request value object types
 */
class UseCase: NSObject {

    func executeUseCase<REQV:UseCaseRequestValues>(with request:REQV, and callback:UseCaseCallbackContract){
       print("parent usecase execution")
    }
    
}

