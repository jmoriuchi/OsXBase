//
//  Base.swift
//  OsXBase
//
//  Created by Junichi Moriuchi on 2016/08/11.
//
//

import Cocoa

/**
 
 The Base class is the base class for all application classes.
 
 */

public class Base {

    //  The instance count.
    static var instanceCount = 0
    
    //  The error log.
    static var errorLog: ErrorLog? = nil
    
    //  The log.
    static var log: Log? = nil
    
    
    public init?() {
        Base.instanceCount += 1
        if Base.instanceCount <= 1 {
            if AppDefinitions.AppName == "" {
                AppDefinitions.AppName = "OsXBase"
            }
            guard let error = openErrorLog() else {
                return nil
            }
            Base.errorLog = error
            guard let log = openLog() else {
                return nil
            }
            Base.log = log
        }
    }
    
    deinit {
        Base.instanceCount -= 1
        if Base.instanceCount <= 0 {
            Base.errorLog = nil
            Base.log = nil
        }
    }
    
    public func answer(answer: Bool) {
        if (answer) {
            print("**** Yes, I do at \(#function) in \(#file)")
        } else {
            print("**** No, I don't at \(#function) in \(#file)")
        }
    }
    
    func openErrorLog() -> ErrorLog? {
        let logPath = "\(AppDefinitions.LogDirectory)/\(AppDefinitions.AppName)_ERROR_\(MessageUtility.currentDateString()).log"
        return ErrorLog(filePath: logPath, isAppendMode: true)
    }

    func openLog() -> Log? {
        let logPath = "\(AppDefinitions.LogDirectory)/\(AppDefinitions.AppName)_LOG_\(MessageUtility.currentDateString()).log"
        return Log(filePath: logPath, isAppendMode: true)
    }
}
