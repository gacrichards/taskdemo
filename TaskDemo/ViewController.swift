//
//  ViewController.swift
//  TaskDemo
//
//  Created by Cole Richards on 5/8/17.
//  Copyright © 2017 emerz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let usecaseHandler = UseCaseHandler.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        test()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func test(){
        print("Starting task")
        usecaseHandler.execute(GetHelloWorldTask.init(),
                               with: GetHelloWorldTask.RequestValues.init(key:"key"),
                               and: UseCaseCallback<GetHelloWorldTask.ResponseValues>.init(
                                success:{response in
                                    print(response.getHelloWorld())
                               },
                                error:{
                                    print("error in hello world task")
                               }))
        print("Continuing on UI")
    }


}

