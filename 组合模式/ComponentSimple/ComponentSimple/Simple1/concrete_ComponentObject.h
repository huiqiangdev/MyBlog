//
//  concrete_ComponentObject.h
//  ComponentSimple
//
//  Created by lightning on 2018/8/3.
//  Copyright © 2018年 lightning. All rights reserved.
//  具体的节点类

#import <Foundation/Foundation.h>
#import "abstract_ComponentProtocol.h"
@interface concrete_ComponentObject : NSObject<abstract_ComponentProtocol>
- (instancetype)initWithName:(NSString *)name;

/**
 移除

 @param child 移除子节点
 */
- (void)removeChild:(id<abstract_ComponentProtocol>)child;

/**
 添加子节点

 @param child 子节点
 */
- (void)addChild:(id<abstract_ComponentProtocol>)child;

/**
 获取某个节点

 @param index 位置
 @return 对应位置的节点
 */
- (id<abstract_ComponentProtocol>)getChildWithIndex:(NSInteger)index;
@end
