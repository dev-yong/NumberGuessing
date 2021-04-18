//
//  App.swift
//  Application
//
//  Created by 이광용 on 2021/04/18.
//

import Foundation
import ApplicationModel

public final class App {

    public init() {
        let randomGenerator = RandomGenerator()
        let model = AppModel(generator: randomGenerator)
        let scanner = Scanner()
        runLoop(model, scanner)
    }
    
    func runLoop(
        _ model: AppModel,
        _ scanner: Scanner
    ) {
        while(!model.isCompleted) {
            if let output = model.flushOutput() {
                
                print(output)
            }
            print(model.process(input: scanner.nextLine()))
        }
    }
    
}

struct Scanner {
    
    func nextLine() -> String {
        return readLine() ?? ""
    }
    
}
