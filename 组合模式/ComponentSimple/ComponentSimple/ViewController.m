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
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    concrete_ComponentObject *rootObject = [[concrete_ComponentObject alloc] initWithName:@"根节点"];
    concrete_ComponentObject *firstObject = [[concrete_ComponentObject alloc] initWithName:@"第一个节点"];
    concrete_ComponentObject *secondObject = [[concrete_ComponentObject alloc] initWithName:@"第二个节点"];
    concret_leafObject *nochildObject = [[concret_leafObject alloc] initWithName:@"最后一个节点"];
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
