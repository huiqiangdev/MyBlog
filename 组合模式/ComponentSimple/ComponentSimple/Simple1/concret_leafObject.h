//
//  concret_leafObject.h
//  ComponentSimple
//
//  Created by lightning on 2018/8/3.
//  Copyright © 2018年 lightning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "abstract_ComponentProtocol.h"
@interface concret_leafObject : NSObject<abstract_ComponentProtocol>
- (instancetype)initWithName:(NSString *)name;


@end
