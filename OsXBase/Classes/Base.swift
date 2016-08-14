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

    //  The Base class instance count.
    static var instanceCount = 0
    
    //  The error log object.
    static var errorLog: ErrorLog? = nil
    
    //  The application log object.
    static var appLog: Log? = nil
    
    
    /**
     Creates an Base class instance, and then executes initialization for the instance.
     
     An error log object and an application log object is created if the initialization is the first time.
     
     */
    public init?() {
        Base.instanceCount += 1
        
        //  Executes the following block if it is the first time.
        if Base.instanceCount <= 1 {
            
            //  Defines the application name as OsXBase if it has not been defined yet.
            if AppDefinitions.AppName == "" {
                AppDefinitions.AppName = "OsXBase"
            }
            //  Create an error log object, and then stores it as a property.
            guard let errorLog = createErrorLog() else {
                return nil
            }
            Base.errorLog = errorLog

            //  Create an application log object, and then stores it as a property.
            guard let appLog = createAppLog() else {
                return nil
            }
            Base.appLog = appLog
        }
    }
    
    /**
     Discards the Base class instance which has turned into unused after post-processing for the instance.
     
     The error log object and the application log object will be discarded together if the Base class instance is the last one.

     */
    deinit {
        Base.instanceCount -= 1
        if Base.instanceCount <= 0 {
            Base.errorLog = nil
            Base.appLog = nil
        }
    }
    
    /**
     Just answers given an expected reply.
     
     - parameter repely: The expected reply.
     */
    public func answer(reply: Bool) {
        if (reply) {
            print("**** Yes, I do at \(#function) in \(#file)")
        } else {
            print("**** No, I don't at \(#function) in \(#file)")
        }
    }
    
    /**
     Creates an error log object.
     
     The log filename is "\(The application name]_ERROR_\(The current date).log"
     The log directry is given as an application difinition.
     
     - returns: An error log object.
     */
    func createErrorLog() -> ErrorLog? {
        let logPath = "\(AppDefinitions.LogDirectory)/\(AppDefinitions.AppName)_ERROR_\(MessageUtility.currentDateString()).log"
        return ErrorLog(filePath: logPath, isAppendMode: true)
    }

    /**
     Creates an application log object.
     
     The log filename is "\(The application name]_APP_\(The current date).log"
     The log directry is given as an application difinition.
     
     - returns: An application log object.
     */
    func createAppLog() -> Log? {
        let logPath = "\(AppDefinitions.LogDirectory)/\(AppDefinitions.AppName)_APP_\(MessageUtility.currentDateString()).log"
        return Log(filePath: logPath, isAppendMode: true)
    }
    
    /**
     Writes the given error information with the current date and time into the log.
     
     Just only calls the method of the error log object.
     A formatted error information stirng includes an error summary and an additional details description.
     
     - parameter error:    An error summary.
     - parameter detail:   An additional detail description.
     - parameter file:     The filename of the file where the error code line is.
     - parameter line:     The line number of the error code line. In fact, the line number is the lien of the caller of this method.
     - parameter function: The function name of the function where the error code line is. The function means a fucntion, a method or a property.
     */
    public func writeErrorMessage(error: String, details: String = "*", file: String = #file, line: Int = #line, function: String = #function) {
        Base.errorLog?.writeErrorMessage(error, details: details, file: file, line: line, function: function)
    }
    
    /**
     Writes the given message into the log.
     
     - parameter message: A message to be logged.
     */
    func writeLogMessage(message: String) {
        Base.appLog?.writeMessage(message)
    }
}
