//
//  ErrorLog.swift
//  OsXBase
//
//  Created by Junichi Moriuchi on 2016/08/07.
//
//

import Cocoa

/**
 The ErrorLog class which is subclass of Log class represents an error log entity.
 
 An ErrorLog class instance having its own file provides methods to write error messages.
 
 You can give instances an instruction of whether opening the log with append mode when the instances is created.
 */

class ErrorLog: Log {
    
    /// The latest loged error message for unit test.
    var latestErrorMessage = ""
    
    /**
     Creates an instance, and then executes initialization for the instance.
     
     Nothing to do as the ErrorLog instance itself.
     
     - parameter filePath:  The file path of its own file.
     - parameter isAppendMode: A file opening option being ture if append mode.
     
     - returns: The created instance.
     */
    override init?(filePath: String, isAppendMode: Bool) {
        
        //  Calls superclass initializaton.
        super.init(filePath: filePath, isAppendMode: isAppendMode)
    }
    
    /**
     Writes the given error information with the current date and time into the log.
     
     A formatted error information stirng includes an error summary and an additional details description.
     
     - parameter error:    An error summary.
     - parameter detail:   An additional detail description.
     - parameter file:     The filename of the file where the error code line is.
     - parameter line:     The line number of the error code line. In fact, the line number is the lien of the caller of this method.
     - parameter function: The function name of the function where the error code line is. The function means a fucntion, a method or a property.
     */
    func writeErrorMessage(error: String, details: String = "*", file: String = #file, line: Int = #line, function: String = #function) {
        
        //  Gets the formatted error message and write it into the log file.
        let errorMessage = MessageUtility.errorMessage(error, details: details, file: file, line: line, function: function)
        writeMessage(errorMessage)
        
        //  Stores the message as the latest message.
        self.latestErrorMessage = error
    }

}
