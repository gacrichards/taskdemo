//
//  UseCaseHandler.swift
//
//  Created by Cole Richards on 5/8/17.
//

import UIKit

/*!
 * The UseCaseHandler provides a simple executer on a worker thread keeping operations 
 * of submitted task the main UI thread
 *
 * Results of the execution are posted back to the main UI thread via the UseCaseCallback
 *
 * Typically a simple application will only need one usecase handler instance and should
 * consider placing a single instance of UseCaseHandler in an application dependency container.
 *
 */
class UseCaseHandler: NSObject {
    
    let workerQueue : DispatchQueue
    let label = "usecase-handler-queue"
    
    /*!
     * A simple queue is created for task execution on init
     */
    override init(){
         workerQueue = DispatchQueue.init(label: label)
    }
    
    /*!
     * To create more involved worker queues we can initialize with identical 
     * parameters to DispatchQueue
     */
    init(label: String, qos: DispatchQoS, attributes: DispatchQueue.Attributes, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency, target: DispatchQueue){
        workerQueue = DispatchQueue.init(label: label, qos: qos, attributes: attributes, autoreleaseFrequency: autoreleaseFrequency, target: target)
    }

    /*!
     * The use of generics in this function allow UseCase implementations
     * to specify the request valuse type passed to their implementation of executeUseCase
     */
    func execute<Use:UseCase, Req:UseCaseRequestValues, Call:UseCaseCallbackContract>(_ usecase:Use, with request:Req, and callback:Call){
        workerQueue.async {
            usecase.executeUseCase(with: request, and: callback)
        }
    }
}
