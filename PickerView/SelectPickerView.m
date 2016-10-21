//
//  SelectPickerView.m
//  PickerView
//
//  Created by 李展 on 2016/10/21.
//  Copyright © 2016年 李展. All rights reserved.
//

#import "SelectPickerView.h"

@interface SelectPickerView()
@property(nonatomic , strong)NSArray *dataArray;
@property(nonatomic , strong)NSMutableArray *resultArray;
@end
@implementation SelectPickerView
//static NSArray *dataArray;
@synthesize dataArray;
@synthesize ConfirmBlock;
-(void)awakeFromNib{
    [super awakeFromNib];
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
}
-(NSMutableArray *)resultArray{
    if (_resultArray == nil) {
        self.resultArray = [NSMutableArray array];
    }
    return _resultArray;
}
-(void)addData:(NSArray *)allDataArray{
    self.dataArray = allDataArray;
    NSMutableArray *tempArray = [NSMutableArray new];
    for (int i = 0; i < allDataArray.count; i ++) {
        NSMutableArray *arr = [NSMutableArray new];
        if (i == 0) {
            arr = allDataArray[i];
        }else{
            arr = allDataArray[i][0];
        }
        [tempArray insertObject:arr atIndex:i];
    }
    NSLog(@"拼接数组%@",tempArray);
    _dataArray = [NSArray arrayWithArray:tempArray];
    NSMutableArray *tempArray1 = [NSMutableArray array];
    for (int i = 0; i < _dataArray.count; i ++) {
        [tempArray1 insertObject:_dataArray[i][0] atIndex:i];
    }
    self.resultArray = tempArray1;
    [_pickerView reloadAllComponents];
}
#pragma mark ----pickerViewDelegate
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    return _dataArray.count;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [_dataArray[component]count];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
        NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:_dataArray];        for (NSInteger i = component + 1; i < _dataArray.count; i ++) {
            NSArray *arr = self.dataArray[i][row];
            [mutableArray removeObjectAtIndex:i];
            [mutableArray insertObject:arr atIndex:i];
            [_pickerView selectRow:0 inComponent:i animated:YES];
        }
        _dataArray = [NSArray arrayWithArray:mutableArray];
    [self.resultArray removeObjectAtIndex:component];
    [self.resultArray insertObject:_dataArray[component][row] atIndex:component];
        NSLog(@"选中结果%@",self.resultArray);
        [_pickerView reloadAllComponents];
    
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return _dataArray[component][row];

}
#pragma mark ----确定
- (IBAction)comfirmAction:(id)sender {
        [self removeFromSuperview];
        self.ConfirmBlock(self.resultArray);
}
#pragma mark ----取消
- (IBAction)cancleAction:(id)sender {
    [self removeFromSuperview];
}





@end
