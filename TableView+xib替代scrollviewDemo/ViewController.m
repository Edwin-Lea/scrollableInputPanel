//
//  ViewController.m
//  TableView+xib替代scrollviewDemo
//
//  Created by li on 16/12/26.
//  Copyright © 2016年 li. All rights reserved.
//

#import "TableViewCell.h"
#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView* tableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //背景图片
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_dark"]]];
    [self setup];
    //设置tableView代理方法
    _tableView.delegate = self;
    _tableView.dataSource = self;
}
- (void)setup
{
    //注册nib文件加载自己定制的cell。
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    //设置tableView的背景透明度
    self.tableView.backgroundColor = [UIColor colorWithRed:255 / 255.0f green:255 / 255.0f blue:255 / 255.0f alpha:0];
    //禁止tableView弹性效果
    _tableView.bounces = NO;
    //去掉cell的分割线
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //隐藏滚动条
    self.tableView.showsVerticalScrollIndicator = NO;
}
#pragma mark----tableView的代理方法----
- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    //设置tableView的行数为1
    return 1;
}
- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    //使用xib自定义cell
    TableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.backgroundColor = [UIColor colorWithRed:255 / 255.0f green:255 / 255.0f blue:255 / 255.0f alpha:0];
    //设置tableView的cell不可点击
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //设置cell最下边两个按钮的具体风格
    [cell.voiceBtn setBackgroundColor:[UIColor colorWithRed:0 / 255.0 green:0 / 255.0 blue:0 / 255.0 alpha:0.5]];
    [cell.voiceBtn setTitle:@"按住 说话" forState:UIControlStateNormal];
    //添加点击事件
    [cell.voiceBtn addTarget:self action:@selector(voiceClick) forControlEvents:UIControlEventTouchUpInside];
    [cell.voiceBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //设置边框
    cell.voiceBtn.layer.borderWidth = 1;
    cell.voiceBtn.layer.borderColor = [UIColor whiteColor].CGColor;

    [cell.presentBtn setBackgroundColor:[UIColor colorWithRed:0 / 255.0 green:0 / 255.0 blue:0 / 255.0 alpha:0.5]];
    [cell.presentBtn setTitle:@"提交" forState:UIControlStateNormal];
    //添加点击事件
    [cell.presentBtn addTarget:self action:@selector(presentClick) forControlEvents:UIControlEventTouchUpInside];
    [cell.presentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //设置边框
    cell.presentBtn.layer.borderWidth = 1;
    cell.presentBtn.layer.borderColor = [UIColor whiteColor].CGColor;

    return cell;
}
- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    //行高
    return 700;
}
- (void)voiceClick
{
    NSLog(@"点击了录制语音按钮！");
}
- (void)presentClick
{
    NSLog(@"点击了提交按钮！");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
