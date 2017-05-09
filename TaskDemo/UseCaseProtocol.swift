//
//  UseCaseProtocol.swift
//
//  Created by Cole Richards on 5/8/17.
//

import Foundation

/*!
 * UseCaseCallbackContract is a required abstraction for the UseCaseCallback implementation
 * UseCaseCallback implementations are required to specify their flavor of response values 
 * on initialization.
 */
protocol UseCaseCallbackContract {
    /*!
     * The successful callback with UseCaseResponseValues specified by the implementation of 
     * UseCaseCallback
     *
     * Passes any resulting values for a task in custom classes conforming to UseCaseResponseValues
     * The success callback must take the protocol abstraction for the specified
     * UseCaseResponseValues so that implementations of UseCaseCallback may specify 
     * UseCaseResponseValues
     */
    func onSuccess(_ response:UseCaseResponseValues)
    
    /*!
     * The Error response invoked if a task in unsuccessfull
     */
    func onError()
}

/*!
 * UseCaseRequestValues and UseCaseResponseValues are just wrappers for container objects
 * holding input and output values for usecases. As of now there are no requirements for these
 * protocols and their benefit is for code readability.
 */
protocol UseCaseRequestValues {}
protocol UseCaseResponseValues {}
