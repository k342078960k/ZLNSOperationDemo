//
//  ZLNSOperationOCModel.m
//  ZLNSOperationDemo
//
//  Created by Zach Lee on 2025/4/8.
//

#import "ZLNSOperationOCModel.h"

@implementation ZLNSOperationOCModel
/**
 * 使用子类 NSInvocationOperation
 */
- (NSInvocationOperation *)useInvocationOperation {
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task1) object:nil];
    return operation;
}

- (NSBlockOperation *)useBlockOperation {
    NSBlockOperation* operation = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"1NSBlockOperation---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    return operation;
}

- (ZLOCNSOperation *)useCustomOperation {
    ZLOCNSOperation* operation = [[ZLOCNSOperation alloc] init];
    return operation;
}

- (void)addOperationToQueue {
    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
    NSInvocationOperation* operation1 = [self useInvocationOperation];
    NSBlockOperation* operation2 = [self useBlockOperation];
    [operation2 addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"2NSBlockOperation---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    ZLOCNSOperation* operation3 = [self useCustomOperation];

    // 添加操作到队列
    [queue addOperation:operation1];
    [queue addOperation:operation2];
    [queue addOperation:operation3];
}

- (void)addOperationWithBlockToQueue {
    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
    [queue addOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"1---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [queue addOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"2---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [queue addOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"3---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
}

- (void)setMaxConcurrentOperationCount:(int)count {
    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = count; // 设置最大并发操作数
    [queue addOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"1---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [queue addOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"2---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [queue addOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"3---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [queue addOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"4---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
}

- (void)addDependency {
    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
    NSInvocationOperation* operation1 = [self useInvocationOperation];
    NSBlockOperation* operation2 = [self useBlockOperation];
    [operation2 addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"2NSBlockOperation---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    ZLOCNSOperation* operation3 = [self useCustomOperation];

    [operation2 addDependency:operation1];
    [operation3 addDependency:operation2];
    [operation2 removeDependency:operation1];
    // 添加操作到队列
    [queue addOperation:operation1];
    [queue addOperation:operation2];
    [queue addOperation:operation3];
}

- (void)communication {
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [queue addOperationWithBlock:^{
        // 异步进行耗时操作
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"1---%@", [NSThread currentThread]); // 打印当前线程
        }

        // 回到主线程
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            // 进行一些 UI 刷新等操作
            for (int i = 0; i < 2; i++) {
                [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
                NSLog(@"2---%@", [NSThread currentThread]); // 打印当前线程
            }
        }];
    }];
}

/**
 * 任务1
 */
- (void)task1 {
    for (int i = 0; i < 2; i++) {
        [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
        NSLog(@"1NSInvocationOperation---%@", [NSThread currentThread]); // 打印当前线程
    }
}
@end
