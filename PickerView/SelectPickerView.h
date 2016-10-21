//
//  SelectPickerView.h
//  PickerView
//
//  Created by 李展 on 2016/10/21.
//  Copyright © 2016年 李展. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectPickerView : UIView<UIPickerViewDataSource,UIPickerViewDelegate>
{


    __weak IBOutlet UIView *bg;


    __weak IBOutlet UIPickerView *_pickerView;
    NSArray *_dataArray;

}
-(void)addData:(NSArray *)allDataArray;
///分区数
@property(nonatomic , assign)NSInteger sectionNumber;
@property(nonatomic , strong)void(^ConfirmBlock)(NSArray *resultArray);
@end
