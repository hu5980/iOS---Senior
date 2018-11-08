//
//  ViewController.swift
//  RXSwiftStudy
//
//  Created by Bruce on 2018/11/8.
//  Copyright © 2018年 Bruce. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    let neverSequence = Observable<String>.never()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let neverSequenceSubsciption = neverSequence.subscribe { (_) in
            print("This will never be printed")
        }
        
        neverSequenceSubsciption.disposed(by: disposeBag)
        // Do any additional setup after loading the view, typically from a nib.
    }
}

