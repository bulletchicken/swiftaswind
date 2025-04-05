//
//  run_script.swift
//  swiftaswind
//
//  Created by Jeremy Su on 2025-04-04.
//
import Foundation
import PythonKit

func run_script(prompt: String) -> PythonObject {
    let sys = Python.import("sys")
    sys.path.append("/Users/jeremysu/Documents/swiftaswind/swiftaswind/")
    let file = Python.import("main")
    
    let response = file.call_openai(prompt)
    print(response)
    return response
}
