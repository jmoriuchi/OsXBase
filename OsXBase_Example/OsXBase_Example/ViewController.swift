//
//  ViewController.swift
//  OsXBase_Example
//
//  Created by Junichi Moriuchi on 2016/08/06.
//  Copyright © 2016年 Junichi Moriuchi. All rights reserved.
//

import Cocoa
import OsXBase

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let current = MessageUtility.currentDateString
        print("\(current)")
        
        let baseExample = BaseExample()
        baseExample?.main()
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

