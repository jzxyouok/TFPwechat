//
//  TFPAddressBookViewController.h
//  TFPwechat
//
//  Created by foscam-hwh on 16/3/5.
//  Copyright © 2016年 foscam-hwh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChineseString.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>


@interface TFPAddressBookViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain)NSMutableArray *indexArray;
//设置每个section下的cell内容
@property(nonatomic,retain)NSMutableArray *LetterResultArr;
@property(nonatomic,retain)NSMutableArray *stringsToSort;

@end
