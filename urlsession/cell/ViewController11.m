//
//  ViewController11.m
//  urlsession
//
//  Created by apple on 2016/11/25.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "ViewController11.h"
#import <AddressBookUI/ABPeoplePickerNavigationController.h>
#import <AddressBook/ABPerson.h>
#import <AddressBookUI/ABPersonViewController.h>

@interface ViewController11 ()<ABPeoplePickerNavigationControllerDelegate>

@end

@implementation ViewController11

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(50, 50, 200, 200);
    [btn setTitle:@"nnnnnn" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(tiaozhuan) forControlEvents:UIControlEventTouchUpInside];
    
//    [self loadPerson];
}

- (void)tiaozhuan{
    NSURL*url=[NSURL URLWithString:@"prefs:root=Privacy&path=CONTACTS"];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)loadPerson
{
    /****************
    四种状态：kABAuthorizationStatusNotDetermined  用户未选择，用户还没有决定是否授权你的程序进行访问
    kABAuthorizationStatusRestricted iOS设备上一些许可配置阻止程序与通讯录数据库进行交互
    kABAuthorizationStatusDenied  用户明确的拒绝了你的程序对通讯录的访问
    kABAuthorizationStatusAuthorized  用户已经授权给你的程序对通讯录进行访问
    ****************/
    ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, NULL);
    
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined) {
        ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error){
            
            CFErrorRef *error1 = NULL;
            ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error1);
            [self copyAddressBook:addressBook];
        });
    }
    else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized){
        
        CFErrorRef *error = NULL;
        ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error);
        NSArray *arr = [self copyAddressBook:addressBook];
        NSLog(@"%@", arr);
    }
    else {
        dispatch_async(dispatch_get_main_queue(), ^{
            // 更新界面
//            [hud turnToError:@"没有获取通讯录权限"];
            NSLog(@"没有获取通讯录权限");
        });
    }
}

//获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
- (NSString *)firstCharactor:(NSString *)aString
{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pinYin = [str capitalizedString];
    //获取并返回首字母
    return [pinYin substringToIndex:1];
}

- (NSArray *)copyAddressBook:(ABAddressBookRef)addressBook
{
    CFIndex numberOfPeople = ABAddressBookGetPersonCount(addressBook);
    CFArrayRef people = ABAddressBookCopyArrayOfAllPeople(addressBook);
    
    NSMutableArray *contactArr = [[NSMutableArray alloc] init];
    for ( int i = 0; i < numberOfPeople; i++){
        ABRecordRef person = CFArrayGetValueAtIndex(people, i);
        //Last Name = Family Name = 姓;
        //First Name = Given Name = 名
        NSString *firstName = (__bridge NSString *)(ABRecordCopyValue(person, kABPersonFirstNameProperty));
        NSString *lastName = (__bridge NSString *)(ABRecordCopyValue(person, kABPersonLastNameProperty));
        NSMutableString *nameStr = [[NSMutableString alloc] init];
        if (lastName.length != 0) {
            [nameStr appendFormat:@"%@", lastName];
        }
        if (firstName.length != 0) {
            [nameStr appendFormat:@"%@", firstName];
        }
        if (firstName.length == 0 && lastName.length == 0) {
            [nameStr appendFormat:@"#无名字"];
        }
        NSString *firstChar = [self firstCharactor:nameStr];
        //读取organization公司
        NSString *organization = (__bridge NSString*)ABRecordCopyValue(person, kABPersonOrganizationProperty);
        
        //读取电话多值
        ABMultiValueRef phone = ABRecordCopyValue(person, kABPersonPhoneProperty);
        NSMutableArray *phoneArr = [NSMutableArray arrayWithCapacity:ABMultiValueGetCount(phone)];
        //!!!!!!!!如果没有电话号码，传给小亮一个包含一个空元素的电话号码数组
//        if (!ABMultiValueGetCount(phone)) {
//            [phoneArr addObject:[NSNull null]];
//        }
        for (int k = 0; k<ABMultiValueGetCount(phone); k++)
        {
            //获取电话Label
            NSString * personPhoneLabel = (__bridge NSString*)ABAddressBookCopyLocalizedLabel(ABMultiValueCopyLabelAtIndex(phone, k));
            //获取該Label下的电话值
            NSString * personPhone = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phone, k);
            [phoneArr addObject:personPhone];
        }
        
        //读取照片
        NSData *image = (__bridge NSData*)ABPersonCopyImageData(person);
        
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [dic setObject:nameStr forKey:@"nameStr"];
        [dic setObject:phoneArr forKey:@"phoneArr"];
        [dic setObject:firstChar forKey:@"firstChar"];
        [contactArr addObject:dic];
    }
    return contactArr;
}

////取消选择
//- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
//{
//    [peoplePicker dismissViewControllerAnimated:YES completion:nil];
//}
//
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    //1. 创建联系人选择控制器
//    ABPeoplePickerNavigationController *picker = [ABPeoplePickerNavigationController new];
//    //2. 设置代理，注意不是 Delegate
//    picker.peoplePickerDelegate = self;
//    //3. 模态视图弹出
//    [self presentViewController:picker animated:YES completion:nil];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
