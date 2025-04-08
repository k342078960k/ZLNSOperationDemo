//
//  ZLOCNSOperation.m
//  ZLNSOperationDemo
//
//  Created by Zach Lee on 2025/4/8.
//

#import "ZLOCNSOperation.h"

@implementation ZLOCNSOperation

- (void)main {
    // 在这里实现操作的具体逻辑
    for (int i = 0; i < 2; i++) {
        [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
        NSLog(@"1ZLOCNSOperation---%@", [NSThread currentThread]); // 打印当前线程
    }
}

@end
