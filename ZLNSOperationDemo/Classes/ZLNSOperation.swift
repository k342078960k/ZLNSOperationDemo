//
//  ZLNSOperation.swift
//  ZLNSOperationDemo
//
//  Created by Zach Lee on 2025/4/8.
//

import UIKit

public class ZLNSOperation: Operation {
    public override func main() {
        for _ in 0..<2 {
            Thread.sleep(forTimeInterval: 2)
            NSLog("1ZLNSOperation---\(Thread.current)")
        }
    }
}

extension ZLNSOperation: @unchecked Sendable {
    // This class is already thread-safe, so we can just use it as-is.
    // No additional code is needed here.
}

