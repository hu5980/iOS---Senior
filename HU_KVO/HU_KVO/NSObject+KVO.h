//
//  NSObject+KVO.h
//  HU_KVO
//
//  Created by Bruce on 2018/12/3.
//  Copyright © 2018年 Bruce. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^PGObservingBlock)(id observedObject, NSString *observedKey, id oldValue, id newValue);

@interface NSObject (KVO)

- (void)PG_addObserver:(NSObject *)observer
                forKey:(NSString *)key
             withBlock:(PGObservingBlock)block;

- (void)PG_removeObserver:(NSObject *)observer forKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
