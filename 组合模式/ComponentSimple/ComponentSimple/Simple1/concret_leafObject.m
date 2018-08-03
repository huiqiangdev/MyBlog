//
//  concret_leafObject.m
//  ComponentSimple
//
//  Created by lightning on 2018/8/3.
//  Copyright © 2018年 lightning. All rights reserved.
//  没有子节点的节点

#import "concret_leafObject.h"
@interface concret_leafObject ()
{
    NSString * _name;
    NSMutableArray * _components;
}
@end

@implementation concret_leafObject
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
- (NSString *)name {
    return _name;
}
- (NSMutableArray<id<abstract_ComponentProtocol>> *)components {
    return _components;
}

@end
