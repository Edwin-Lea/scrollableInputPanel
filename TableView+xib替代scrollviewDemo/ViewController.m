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
@property (weak, nonatomic) IBOutlet UIButton* voiceBtn;
@property (weak, nonatomic) IBOutlet UIButton* presentBtn;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //背景图片
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_dark"]]];

    //设置tableView代理方法
    _tableView.delegate = self;
    _tableView.dataSource = self;

    [self setup];
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

    //设置按钮的具体风格
    [self.voiceBtn setBackgroundColor:[UIColor colorWithRed:0 / 255.0 green:0 / 255.0 blue:0 / 255.0 alpha:0.5]];
    [_voiceBtn setTitle:@"按住 说话" forState:UIControlStateNormal];
    //添加点击事件
    [_voiceBtn addTarget:self action:@selector(voiceClick) forControlEvents:UIControlEventTouchUpInside];
    [_voiceBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //设置边框
    _voiceBtn.layer.borderWidth = 1;
    _voiceBtn.layer.borderColor = [UIColor whiteColor].CGColor;

    [self.presentBtn setBackgroundColor:[UIColor colorWithRed:0 / 255.0 green:0 / 255.0 blue:0 / 255.0 alpha:0.5]];
    [_presentBtn setTitle:@"提交" forState:UIControlStateNormal];
    //添加点击事件
    [_presentBtn addTarget:self action:@selector(presentClick) forControlEvents:UIControlEventTouchUpInside];
    [_presentBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //设置边框
    _presentBtn.layer.borderWidth = 1;
    _presentBtn.layer.borderColor = [UIColor whiteColor].CGColor;
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
