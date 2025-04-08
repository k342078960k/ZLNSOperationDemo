//
//  ZLNSOperationModel.swift
//  ZLNSOperationDemo
//
//  Created by Zach Lee on 2025/4/8.
//

import UIKit

//- (NSInvocationOperation *)useInvocationOperation;
//- (NSBlockOperation *)useBlockOperation;
//- (ZLOCNSOperation *)useCustomOperation;
//- (void)addOperationToQueue;
//- (void)addOperationWithBlockToQueue;
//- (void)setMaxConcurrentOperationCount:(int)count;
//- (void)addDependency;
//- (void)communication;

public class ZLNSOperationModel: NSObject {
    public func useBlockOperation() -> BlockOperation {
        let o = BlockOperation {
            for _ in 0..<2 {
                Thread.sleep(forTimeInterval: 2)
                NSLog("1BlockOperation---\(Thread.current)")
            }
        }
        return o
    }
    
    public func useCustomOperation() -> ZLNSOperation {
        let o = ZLNSOperation()
        return o
    }
    
    public func addOperationToQueue() {
        let queue = OperationQueue()
        let o1 = useBlockOperation()
        o1.addExecutionBlock {
            for _ in 0..<2 {
                Thread.sleep(forTimeInterval: 2)
                NSLog("2BlockOperation---\(Thread.current)")
            }
        }
        let o2 = useCustomOperation()
        
        queue.addOperation(o1)
        queue.addOperation(o2)
    }
    
    public func addOperationWithBlockToQueue() {
        let queue = OperationQueue()
        queue.addOperation {
            for _ in 0..<2 {
                Thread.sleep(forTimeInterval: 2)
                NSLog("1---\(Thread.current)")
            }
        }
        queue.addOperation {
            for _ in 0..<2 {
                Thread.sleep(forTimeInterval: 2)
                NSLog("2---\(Thread.current)")
            }
        }
        queue.addOperation {
            for _ in 0..<2 {
                Thread.sleep(forTimeInterval: 2)
                NSLog("3---\(Thread.current)")
            }
        }
        queue.addOperation {
            for _ in 0..<2 {
                Thread.sleep(forTimeInterval: 2)
                NSLog("4---\(Thread.current)")
            }
        }
    }
    
    public func setMaxConcurrentOperationCount(_ count: Int) {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = count
        queue.addOperation {
            for _ in 0..<2 {
                Thread.sleep(forTimeInterval: 2)
                NSLog("1---\(Thread.current)")
            }
        }
        queue.addOperation {
            for _ in 0..<2 {
                Thread.sleep(forTimeInterval: 2)
                NSLog("2---\(Thread.current)")
            }
        }
        queue.addOperation {
            for _ in 0..<2 {
                Thread.sleep(forTimeInterval: 2)
                NSLog("3---\(Thread.current)")
            }
        }
        queue.addOperation {
            for _ in 0..<2 {
                Thread.sleep(forTimeInterval: 2)
                NSLog("4---\(Thread.current)")
            }
        }
    }
    
    public func addDependency() {
        let queue = OperationQueue()
        let o1 = useBlockOperation()
        let o2 = useBlockOperation()
        o2.addDependency(o1)
        o2.removeDependency(o1)
        queue.addOperation(o1)
        queue.addOperation(o2)
    }
    
    public func communication() {
        let queue = OperationQueue()
        queue.addOperation {
            for _ in 0..<2 {
                Thread.sleep(forTimeInterval: 2)
                NSLog("1---\(Thread.current)")
            }
            OperationQueue.main.addOperation {
                for _ in 0..<2 {
                    Thread.sleep(forTimeInterval: 2)
                    NSLog("1---\(Thread.current)")
                }
            }
        }
    }
}
