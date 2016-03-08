//
//  TFPAddressBookViewController.m
//  TFPwechat
//
//  Created by foscam-hwh on 16/3/5.
//  Copyright © 2016年 foscam-hwh. All rights reserved.
//

#import "TFPAddressBookViewController.h"

@interface TFPAddressBookViewController ()

@end

@implementation TFPAddressBookViewController


@synthesize indexArray;
@synthesize LetterResultArr;
@synthesize stringsToSort;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
#if 1
    NSLog(@"w:%f h:%f",self.navigationController.view.frame.size.width,self.navigationController.view.frame.size.height);
    UITableView* view = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 640)];
    [self.view addSubview:view];
    view.delegate = self;
    view.dataSource = self;
    
    view.sectionIndexBackgroundColor = [UIColor clearColor];
//    view.sectionIndexMinimumDisplayRowCount = 10;
#endif

    self.edgesForExtendedLayout = UIRectEdgeNone;

    stringsToSort=[NSMutableArray arrayWithObjects:
                   @"2",
                   nil];
    [self getPeoplePicker];
    
//    LetterResultArr = [[NSMutableArray alloc] init];
//    
//    NSMutableArray* arr = [[NSMutableArray alloc] init];
//    [arr addObject:@"1a"];
//    [arr addObject:@"1b"];
//    [self.LetterResultArr addObject:arr];
//    
//    arr = [[NSMutableArray alloc] init];
//    [arr addObject:@"2a"];
//    [arr addObject:@"2b"];
//    [arr addObject:@"2c"];
//    [arr addObject:@"2c"];
//    [arr addObject:@"2c"];
//    [arr addObject:@"2c"];
//    [arr addObject:@"2c"];
//    [arr addObject:@"2c"];
//    [arr addObject:@"2c"];
//    [arr addObject:@"2c"];
//    [arr addObject:@"2c"];
//    [arr addObject:@"2c"];
//    [arr addObject:@"2c"];
//    [arr addObject:@"2c"];
//    [arr addObject:@"2c"];
//    [arr addObject:@"2c"];
//    [arr addObject:@"2c"];
//    [arr addObject:@"2c"];
//    [self.LetterResultArr addObject:arr];
    
    indexArray = [NSMutableArray arrayWithObjects:@"1",@"a",nil];
    
    self.indexArray = [ChineseString IndexArray:stringsToSort];
    self.LetterResultArr = [ChineseString LetterSortArray:stringsToSort];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -Section的Header的值
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *key = [indexArray objectAtIndex:section];
    return key;
}
#pragma mark - Section header view
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width*2, 20)];
    lab.backgroundColor = [UIColor lightGrayColor];
    lab.text = [indexArray objectAtIndex:section];
    lab.textColor = [UIColor whiteColor];
    return lab;
}
//#pragma mark - row height
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 65.0;
//}

#pragma mark -
#pragma mark Table View Data Source Methods
#pragma mark -设置右方表格的索引数组
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return indexArray;
}
#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    NSLog(@"title===%@",title);
    return index;
}

#pragma mark -允许数据源告知必须加载到Table View中的表的Section数。
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [indexArray count];
}
#pragma mark -设置表格的行数为数组的元素个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.LetterResultArr objectAtIndex:section] count];
}
#pragma mark -每一行的内容为数组相应索引的值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = [[self.LetterResultArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    return cell;
}
#pragma mark - Select内容为数组相应索引的值
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"---->%@",[[self.LetterResultArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:[[self.LetterResultArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]
                                                   delegate:nil
                                          cancelButtonTitle:@"YES" otherButtonTitles:nil];
    [alert show];
}

// 设置section的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}


#pragma mark - 开始从手机读取通讯录

-(void)getPeoplePicker
{
    ABAddressBookRef addressBook = ABAddressBookCreate();
    
    if (ABAddressBookGetAuthorizationStatus() != kABAuthorizationStatusAuthorized) {
        NSLog(@"没有拿到访问通讯录的授权！！");
        
        ABAddressBookRequestAccessWithCompletion
        (addressBook, ^(bool granted, CFErrorRef error)
         {
             dispatch_async(dispatch_get_main_queue(), ^{
                 if (error)
                     NSLog(@"Error: %@", (__bridge NSError *)error);
                 else if (!granted) {
                     UIAlertView *av = [[UIAlertView alloc]
                                        initWithTitle:@"通讯录授权设置"
                                        message:@"设置权限:设置>一般>隐私"
                                        delegate:nil
                                        cancelButtonTitle:nil
                                        otherButtonTitles:@"确定", nil, nil];
                     [av show];
                 }
                 else
                 {
                     //还原 ABAddressBookRef
                     //                     ABAddressBookRevert(addressBook);
                     //                     myContacts = [NSArray arrayWithArray:
                     //                                   (__bridge_transfer NSArray*)
                     //                                   ABAddressBookCopyArrayOfAllPeople(addressBook)];
                     //                     [tableView reloadData];
                 }
             });
         });
        
    }
    
    if (ABAddressBookGetAuthorizationStatus() != kABAuthorizationStatusAuthorized) {
        NSLog(@"还是没有拿到通讯录授权！！");
    }else{
        CFArrayRef array = ABAddressBookCopyArrayOfAllPeople(addressBook);
        if (CFArrayGetCount(array) == 0) {
            NSLog(@"people picker number is zero!!!");
        }
        
        for (int i=0; i<CFArrayGetCount(array); i++) {
            ABRecordRef person = CFArrayGetValueAtIndex(array, i);
            //读取firstname
            NSString *personName = (__bridge NSString*)ABRecordCopyValue(person, kABPersonFirstNameProperty);
            //读取lastname
            NSString *lastname = (__bridge NSString*)ABRecordCopyValue(person, kABPersonLastNameProperty);
            
            if ([lastname length]!=0 && [personName length] != 0) {
                NSString *name = [NSString stringWithFormat:@"%@%@",lastname,personName];
                if(name != nil){
                    NSLog(@"name:%@",name);
                    //            stringsToSort
                    [stringsToSort addObject:name];
                }else{
                    NSLog(@"name is nil!!!!");
                }
            }else if ([lastname length] != 0){
                if (lastname != nil) {
                    [stringsToSort addObject:lastname];
                }
            }else if([personName length] != 0){
                if (personName != nil) {
                    [stringsToSort addObject:personName];
                }
                
            }
            
            
        }
        
    }
    
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
