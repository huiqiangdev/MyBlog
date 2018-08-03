//
//  concrete_ComponentObject.m
//  ComponentSimple
//
//  Created by lightning on 2018/8/3.
//  Copyright © 2018年 lightning. All rights reserved.
//  具体的节点类

#import "concrete_ComponentObject.h"

@interface concrete_ComponentObject () {
    NSString * _name;
    NSMutableArray * _components;
}
@end
@implementation concrete_ComponentObject

- (void)doSomething {
    NSLog(@"%@",self.name);
    for ( id<abstract_ComponentProtocol> component in self.components) {
        [component doSomething];
    }
}
- (instancetype)initWithName:(NSString *)name {
    if (self = [super init]) {
        _name = name;
        _components = [NSMutableArray array];
    }
    return self;
}
- (void)addChild:(id<abstract_ComponentProtocol>)child {
    [self.components addObject:child];
}
- (void)removeChild:(id<abstract_ComponentProtocol>)child {
    [self.components removeObject:child];
}
- (id<abstract_ComponentProtocol>)getChildWithIndex:(NSInteger)index {
    return [self.components objectAtIndex:index];
}

- (NSString *)name {
    return _name;
}
- (NSMutableArray<id<abstract_ComponentProtocol>> *)components {
    return _components;
}
@end
