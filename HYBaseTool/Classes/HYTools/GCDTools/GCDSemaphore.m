//
//  GCDSemaphore.m
//  GCDDemo
//
//  Created by cc on 2017/5/12.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "GCDSemaphore.h"

@interface GCDSemaphore ()

@property (strong,readwrite,nonatomic) dispatch_semaphore_t dispatchSemaphore;

@end
@implementation GCDSemaphore

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dispatchSemaphore = dispatch_semaphore_create(0);
    }
    return self;
}

- (instancetype)initWithValue:(long)value
{
    self = [super init];
    if (self) {
        self.dispatchSemaphore = dispatch_semaphore_create(value);
    }
    return self;
}

- (BOOL)signal
{
    return dispatch_semaphore_signal(self.dispatchSemaphore) != 0;
}

- (void)wait
{
    dispatch_semaphore_wait(self.dispatchSemaphore, DISPATCH_TIME_FOREVER);
}

- (BOOL)wait:(ino64_t)delta
{
    return dispatch_semaphore_wait(self.dispatchSemaphore, dispatch_time(DISPATCH_TIME_NOW, delta)) == 0;
}
@end
