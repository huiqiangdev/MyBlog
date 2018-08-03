//
//  Abstract_ComponentProtocol2.h
//  ComponentSimple
//
//  Created by lightning on 2018/8/3.
//  Copyright © 2018年 lightning. All rights reserved.
//  优化

#import <Foundation/Foundation.h>

@protocol Abstract_ComponentProtocol2 <NSObject>


/**
 子节点的名字
 */
@property (nonatomic, strong, readonly) NSString *name;

/**
 子节点
 */
@property (nonatomic, strong, readonly) NSMutableArray<id<Abstract_ComponentProtocol2>> *components;
/**
 具体的业务逻辑。
 */
- (void)doSomething;
/**
 移除
 
 @param child 移除子节点
 */
- (void)removeChild:(id<Abstract_ComponentProtocol2>)child;

/**
 添加子节点
 
 @param child 子节点
 */
- (void)addChild:(id<Abstract_ComponentProtocol2>)child;

/**
 获取某个节点
 
 @param index 位置
 @return 对应位置的节点
 */
- (id<Abstract_ComponentProtocol2>)getChildWithIndex:(NSInteger)index;

- (void)clear;



@end
