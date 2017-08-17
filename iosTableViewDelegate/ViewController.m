//
//  ViewController.m
//  iosTableViewDelegate
//
//  Created by necfol on 2017/8/17.
//  Copyright © 2017年 Necfol. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableview;

@end

static NSString *ID = @"cell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    self.tableview.rowHeight = 70;
    self.tableview.dataSource = self;
    self.tableview.delegate = self;
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    [self.view addSubview:self.tableview];
    
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.textLabel.text = [NSString stringWithFormat:@"测试-----%zd", indexPath.row];
    return cell;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}
/**
 选中某一行
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"选中了-------%zd", indexPath.row);
}
/**
 取消选中某一行
 */
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"取消选中-------%zd", indexPath.row);
}
/**
 定义某一行的高度
 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2) {
        return 100;
    }
    return 50;
}
@end
