//
//  abstract_ComponentProtocol.h
//  ComponentSimple
//
//  Created by lightning on 2018/8/3.
//  Copyright © 2018年 lightning. All rights reserved.
//  抽象的根节点

#import <Foundation/Foundation.h>

@protocol abstract_ComponentProtocol <NSObject>
/**
 具体的业务逻辑。
 */
- (void)doSomething;

/**
 子节点的名字
 */
@property (nonatomic, strong, readonly) NSString *name;

/**
 子节点
 */
@property (nonatomic, strong, readonly) NSMutableArray<id<abstract_ComponentProtocol>> *components;

@end
