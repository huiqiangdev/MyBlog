//
//  Concrete_ComponentObject2.m
//  ComponentSimple
//
//  Created by lightning on 2018/8/3.
//  Copyright © 2018年 lightning. All rights reserved.
//

#import "Concrete_ComponentObject2.h"

@interface Concrete_ComponentObject2 () {
    NSString * _name;
    NSMutableArray * _components;
}
@end

@implementation Concrete_ComponentObject2

- (instancetype)initWithName:(NSString *)name {
    if (self = [super init]) {
        _name = name;
        _components = [NSMutableArray array];
    }
    return self;
}
- (NSString *)name {
    return _name;
}
- (NSMutableArray<id<Abstract_ComponentProtocol2>> *)components {
    return _components;
}
/**
 具体的业务逻辑。
 */
- (void)doSomething {
    NSLog(@"%@",self.name);
    for (id<Abstract_ComponentProtocol2> component in self.components) {
        [component doSomething];
    }
    
}
/**
 移除
 
 @param child 移除子节点
 */
- (void)removeChild:(id<Abstract_ComponentProtocol2>)child {
    [self.components removeObject:child];
}

/**
 添加子节点
 
 @param child 子节点
 */
- (void)addChild:(id<Abstract_ComponentProtocol2>)child {
    [self.components addObject:child];
}

/**
 获取某个节点
 
 @param index 位置
 @return 对应位置的节点
 */
- (id<Abstract_ComponentProtocol2>)getChildWithIndex:(NSInteger)index {
    return [self.components objectAtIndex:index];
}

- (void)clear {
    [self.components removeAllObjects];
}
@end
