//
//  ViewController.swift
//  ZLNSOperationDemo
//
//  Created by 李哲楷 on 04/08/2025.
//  Copyright (c) 2025 李哲楷. All rights reserved.
//

import UIKit
import ZLNSOperationDemo

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // OC NSOperation
        //使用子类 NSInvocationOperation
//        let a = ZLNSOperationOCModel().useInvocationOperation()
//        a.start()
//        // 在其他线程使用子类 NSInvocationOperation
//        Thread.detachNewThread {
//            let a = ZLNSOperationOCModel().useInvocationOperation()
//            a.start()
//        }
        //使用子类 NSBlockOperation
//        let b = ZLNSOperationOCModel().useBlockOperation()
//        b.start()
        /**
         * 使用子类 NSBlockOperation
         * 调用方法 AddExecutionBlock:
         */
//        let c = ZLNSOperationOCModel().useBlockOperation()
//        c.addExecutionBlock {
//            for _ in 0..<2 {
//                Thread.sleep(forTimeInterval: 2)
//                print("2---\(Thread.current)")
//            }
//        }
//        c.addExecutionBlock {
//            for _ in 0..<2 {
//                Thread.sleep(forTimeInterval: 2)
//                print("3---\(Thread.current)")
//            }
//        }
//        c.addExecutionBlock {
//            for _ in 0..<2 {
//                Thread.sleep(forTimeInterval: 2)
//                print("4---\(Thread.current)")
//            }
//        }
//        c.addExecutionBlock {
//            for _ in 0..<2 {
//                Thread.sleep(forTimeInterval: 2)
//                print("5---\(Thread.current)")
//            }
//        }
//        c.addExecutionBlock {
//            for _ in 0..<2 {
//                Thread.sleep(forTimeInterval: 2)
//                print("6---\(Thread.current)")
//            }
//        }
//        c.addExecutionBlock {
//            for _ in 0..<2 {
//                Thread.sleep(forTimeInterval: 2)
//                print("7---\(Thread.current)")
//            }
//        }
//        c.addExecutionBlock {
//            for _ in 0..<2 {
//                Thread.sleep(forTimeInterval: 2)
//                print("8---\(Thread.current)")
//            }
//        }
//        c.start()
        /**
         * 使用自定义继承自 NSOperation 的子类
         */
//        let d = ZLNSOperationOCModel().useCustomOperation()
//        d.start()
        /**
         * 使用 addOperation: 将操作加入到操作队列中
         */
//        ZLNSOperationOCModel().addOperationToQueue()
        /**
         * 使用 addOperationWithBlock: 将操作加入到操作队列中
         */
//        ZLNSOperationOCModel().addOperationWithBlockToQueue()
        /**
         * 设置 MaxConcurrentOperationCount（最大并发操作数）
         */
//        ZLNSOperationOCModel().setMaxConcurrentOperationCount(3)
        /**
         * 操作依赖
         * 使用方法：addDependency:
         */
//        ZLNSOperationOCModel().addDependency()
        /**
         * 线程间通信
         */
        ZLNSOperationOCModel().communication()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

