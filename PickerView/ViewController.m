//
//  ViewController.m
//  PickerView
//
//  Created by 李展 on 2016/10/21.
//  Copyright © 2016年 李展. All rights reserved.
//

#import "ViewController.h"
#import "SelectPickerView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)pickerViewAction:(id)sender {
    
    SelectPickerView *selectPickerView = (SelectPickerView *)[[NSBundle mainBundle]loadNibNamed:@"SelectPickerView" owner:nil options:nil].lastObject;
    
    NSArray *arra2 = @[@[@"河南省",@"山西省",@"江苏省"],@[@"云南省",@"四川省",@"陕西省"],@[@"吉林省",@"黑龙江省"],@[@"广东省",@"湖南省",@"广西省"]];
    NSArray *arra1 = @[@[@"艾欧尼亚",@"战争学院"],@[@"无畏先锋",@"扭曲丛林"]];
    NSArray *array0 = @[@"电信区",@"联通区"];
    NSArray *arraay = @[array0];
    [selectPickerView addData:arraay];
    [self.view addSubview:selectPickerView];
    selectPickerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    selectPickerView.ConfirmBlock = ^(NSArray *dataArray){
        NSLog(@"%@",dataArray);
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
