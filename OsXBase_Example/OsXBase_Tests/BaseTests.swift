//
//  BaseTests.swift
//  OsXBase_Example
//
//  Created by Junichi Moriuchi on 2016/08/12.
//  Copyright © 2016年 Junichi Moriuchi. All rights reserved.
//

@testable import OsXBase

import Quick
import Nimble

class BaseTests: QuickSpec {
    override func spec() {
        describe("a base instance") {
            describe("its init") {
                context("when the init is called at first time"){
                    it("is created normally") {
                        let target = Base()
                        expect(target).notTo(beNil())
                    }
                    
                    let fileManager = NSFileManager()
                    
                    it("the init creates an error log file"){
                        let logPath = "\(AppDefinitions.LogDirectory)/\(AppDefinitions.AppName)_ERROR_\(MessageUtility.currentDateString()).log"
                        expect(fileManager.fileExistsAtPath(logPath)).to(beTrue())
                    }
                    it("the init creates an log file"){
                        let logPath = "\(AppDefinitions.LogDirectory)/\(AppDefinitions.AppName)_LOG_\(MessageUtility.currentDateString()).log"
                        expect(fileManager.fileExistsAtPath(logPath)).to(beTrue())
                    }
                }
            }
        }
    }
}