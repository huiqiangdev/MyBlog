//
//  ViewController.m
//  ComponentSimple
//
//  Created by lightning on 2018/8/3.
//  Copyright © 2018年 lightning. All rights reserved.
//

#import "ViewController.h"
#import "concrete_ComponentObject.h"
#import "concret_leafObject.h"
#import "Concrete_ComponentObject2.h"
#import "Concrete_leafObject2.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  
    [self sample2];
}
- (void)sample1 {
    concrete_ComponentObject *rootObject = [[concrete_ComponentObject alloc] initWithName:@"根节点"];
    concrete_ComponentObject *firstObject = [[concrete_ComponentObject alloc] initWithName:@"第一个节点"];
    concrete_ComponentObject *secondObject = [[concrete_ComponentObject alloc] initWithName:@"第二个节点"];
    concret_leafObject *nochildObject = [[concret_leafObject alloc] initWithName:@"最后一个节点"];
    [rootObject addChild:firstObject];
    [rootObject addChild:secondObject];
    [secondObject addChild:nochildObject];
    [rootObject doSomething];
}
- (void)sample2 {
    Concrete_ComponentObject2 *rootObject = [[Concrete_ComponentObject2 alloc] initWithName:@"根节点"];
    Concrete_ComponentObject2 *firstObject = [[Concrete_ComponentObject2 alloc] initWithName:@"第一个节点"];
    Concrete_ComponentObject2 *secondObject = [[Concrete_ComponentObject2 alloc] initWithName:@"第二个节点"];
    Concrete_leafObject2 *nochildObject = [[Concrete_leafObject2 alloc] initWithName:@"最后一个节点"];
    [rootObject addChild:firstObject];
    [rootObject addChild:secondObject];
    [secondObject addChild:nochildObject];
    [rootObject doSomething];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
