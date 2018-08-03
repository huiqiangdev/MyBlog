//
//  Concrete_leafObject2.h
//  ComponentSimple
//
//  Created by lightning on 2018/8/3.
//  Copyright © 2018年 lightning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Abstract_ComponentProtocol2.h"

@interface Concrete_leafObject2 : NSObject<Abstract_ComponentProtocol2>
- (instancetype)initWithName:(NSString *)name;
@end
