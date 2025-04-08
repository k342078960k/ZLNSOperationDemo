//
//  ZLNSOperationOCModel.h
//  ZLNSOperationDemo
//
//  Created by Zach Lee on 2025/4/8.
//

#import <Foundation/Foundation.h>
#import "ZLOCNSOperation.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZLNSOperationOCModel : NSObject

- (NSInvocationOperation *)useInvocationOperation;
- (NSBlockOperation *)useBlockOperation;
- (ZLOCNSOperation *)useCustomOperation;
- (void)addOperationToQueue;
- (void)addOperationWithBlockToQueue;
- (void)setMaxConcurrentOperationCount:(int)count;
- (void)addDependency;
- (void)communication;
@end

NS_ASSUME_NONNULL_END
