//
//  ViewController.m
//  LoadHighQualityImage
//
//  Created by lightning on 2018/8/2.
//  Copyright © 2018年 lightning. All rights reserved.
//

#import "ViewController.h"


typedef void(^runloopBlock)(void);

static NSString * IDENTIFIER = @"IDENTIFIER";
static CGFloat CELL_HEIGHT = 135.f;

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *exampleTableView;
@property(nonatomic,strong)NSMutableArray * tasks;

@end

@implementation ViewController

-(void)timerMethod{
    //不干任何事情!
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [NSTimer scheduledTimerWithTimeInterval:0.0001 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
    
    
    _tasks = [NSMutableArray array];
    //注册Cell
    [self.exampleTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:IDENTIFIER];
    
    [self addRunloopObserver];
    
}

//MARK: 内部实现方法

//添加文字
+(void)addlabel:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 300, 25)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor redColor];
    label.text = [NSString stringWithFormat:@"%zd - Drawing index is top priority", indexPath.row];
    label.font = [UIFont boldSystemFontOfSize:13];
    label.tag = 4;
    [cell.contentView addSubview:label];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(5, 99, 300, 35)];
    label1.lineBreakMode = NSLineBreakByWordWrapping;
    label1.numberOfLines = 0;
    label1.backgroundColor = [UIColor clearColor];
    label1.textColor = [UIColor colorWithRed:0 green:100.f/255.f blue:0 alpha:1];
    label1.text = [NSString stringWithFormat:@"%zd - Drawing large image is low priority. Should be distributed into different run loop passes.", indexPath.row];
    label1.font = [UIFont boldSystemFontOfSize:13];
    label1.tag = 5;
    [cell.contentView addSubview:label1];
    
}


//加载第一张
+(void)addImage1With:(UITableViewCell *)cell{
    //第一张
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 20, 85, 85)];
    imageView.tag = 1;
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"spaceship" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:path1];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = image;
    [UIView transitionWithView:cell.contentView duration:0.3 options:(UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve) animations:^{
        [cell.contentView addSubview:imageView];
    } completion:nil];
}



//加载第二张
+(void)addImage2With:(UITableViewCell *)cell{
    //第二张
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(105, 20, 85, 85)];
    imageView1.tag = 2;
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"spaceship" ofType:@"png"];
    UIImage *image1 = [UIImage imageWithContentsOfFile:path1];
    imageView1.contentMode = UIViewContentModeScaleAspectFit;
    imageView1.image = image1;
    [UIView transitionWithView:cell.contentView duration:0.3 options:(UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve) animations:^{
        [cell.contentView addSubview:imageView1];
    } completion:nil];
}
//加载第三张
+(void)addImage3With:(UITableViewCell *)cell{
    //第三张
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(200, 20, 85, 85)];
    imageView2.tag = 3;
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"spaceship" ofType:@"png"];
    UIImage *image2 = [UIImage imageWithContentsOfFile:path1];
    imageView2.contentMode = UIViewContentModeScaleAspectFit;
    imageView2.image = image2;
    [UIView transitionWithView:cell.contentView duration:0.3 options:(UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve) animations:^{
        [cell.contentView addSubview:imageView2];
    } completion:nil];
}

//MARK:  UI初始化方法
//设置tableview大小
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.exampleTableView.frame = self.view.bounds;
}

//Cell 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CELL_HEIGHT;
}

//加载tableview
- (void)loadView {
    self.view = [UIView new];
    self.exampleTableView = [UITableView new];
    self.exampleTableView.delegate = self;
    self.exampleTableView.dataSource = self;
    [self.view addSubview:self.exampleTableView];
}

#pragma mark - <tableview>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 399;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:IDENTIFIER];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    //干掉contentView上面的子控件!! 节约内存!!
    for (NSInteger i = 1; i <= 5; i++) {
        //干掉contentView 上面的所有子控件!!
        [[cell.contentView viewWithTag:i] removeFromSuperview];
    }
    //添加文字
    [ViewController addlabel:cell indexPath:indexPath];
    //添加图片
    [self addTasks:^{
        [ViewController addImage1With:cell];
    }];
    
    [self addTasks:^{
        [ViewController addImage2With:cell];
    }];
    
    [self addTasks:^{
        [ViewController addImage3With:cell];
    }];
    
    
    return cell;
}



#pragma mark - <CFRunloop>

-(void)addTasks:(runloopBlock)task{
    
    [self.tasks addObject:task];
    if (self.tasks.count > 18) {
        [self.tasks removeObjectAtIndex:0];
    }
    
    
}


//一下都是C语言的!!
-(void)addRunloopObserver{
    //获取Runloop
    CFRunLoopRef runloop = CFRunLoopGetCurrent();
    //定义一个context
    CFRunLoopObserverContext context = {
        0,
        (__bridge void *)(self),
        &CFRetain,
        &CFRelease,
        NULL
    };
    
    //定义观察者
    static CFRunLoopObserverRef runloopObserver;
    runloopObserver = CFRunLoopObserverCreate(NULL, kCFRunLoopBeforeWaiting, YES, 0, &callBack, &context);
    
    //添加观察者
    CFRunLoopAddObserver(runloop, runloopObserver, kCFRunLoopCommonModes);
    
    
    //C里面 一旦creat new copy
    CFRelease(runloopObserver);
}


void callBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
    ViewController * vc = (__bridge ViewController *)info;
    if(vc.tasks.count == 0){
        return;
    }
    runloopBlock block = vc.tasks.firstObject;
    block();
    [vc.tasks removeObjectAtIndex:0];
    
    
}
@end
