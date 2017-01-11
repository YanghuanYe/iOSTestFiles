//
//  ContactsViewController.m
//  urlsession
//
//  Created by apple on 2017/1/11.
//  Copyright © 2017年 YYH. All rights reserved.
//

#import "ContactsViewController.h"
// system vc
#import <ContactsUI/ContactsUI.h> // iOS 9 No-UI
#import <Contacts/Contacts.h>

@interface ContactsViewController ()<CNContactPickerDelegate>

@end

@implementation ContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"通讯录" style:UIBarButtonItemStylePlain target:self action:@selector(getContacts)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
}
- (void)getContacts {
    // iOS 9 No-UI
    CNContactPickerViewController *contactVC = [CNContactPickerViewController new];
    contactVC.delegate = self;
    [self presentViewController:contactVC animated:YES completion:nil];
    
    /* iOS 9 With-UI
    CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    
    if (status != CNAuthorizationStatusAuthorized) {
        return;
    }
    
    CNContactStore *contactStore = [CNContactStore new];
    NSArray *keys = @[CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey];
    CNContactFetchRequest *request = [[CNContactFetchRequest alloc] initWithKeysToFetch:keys];
    [contactStore enumerateContactsWithFetchRequest:request error:nil usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
        NSString *lastName = contact.familyName;
        NSString *firstName = contact.givenName;
        NSLog(@"%@ %@", lastName, firstName);
        
        // get contact phone number
        NSArray *phoneNums = contact.phoneNumbers;
        for (CNLabeledValue *labeledValue in phoneNums) {
            // get phone num KEY
            NSString *phoneLabel = labeledValue.label;
            
            // get phone num
            CNPhoneNumber *phoneNumber = labeledValue.value;
            NSString *phoneValue = phoneNumber.stringValue;
            NSLog(@"%@ %@", phoneLabel, phoneValue);
        }
    }];
     */
}

- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact {
    // get contact name
    NSString *lastName = contact.familyName;
    NSString *firstName = contact.givenName;
    NSLog(@"%@ %@", lastName, firstName);
    
    // get contact phone number
    NSArray *phoneNums = contact.phoneNumbers;
    for (CNLabeledValue *labeledValue in phoneNums) {
        // get phone num KEY
        NSString *phoneLabel = labeledValue.label;
        
        // get phone num
        CNPhoneNumber *phoneNumber = labeledValue.value;
        NSString *phoneValue = phoneNumber.stringValue;
        NSLog(@"%@ %@", phoneLabel, phoneValue);
    }
}
- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContacts:(NSArray<CNContact *> *)contacts {
    for (CNContact *contact in contacts) {
        // get contact name
        NSString *lastName = contact.familyName;
        NSString *firstName = contact.givenName;
        NSLog(@"%@ %@", lastName, firstName);
        
        // get contact phone number
        NSArray *phoneNums = contact.phoneNumbers;
        for (CNLabeledValue *labeledValue in phoneNums) {
            // get phone num KEY
            NSString *phoneLabel = labeledValue.label;
            
            // get phone num
            CNPhoneNumber *phoneNumber = labeledValue.value;
            NSString *phoneValue = phoneNumber.stringValue;
            NSLog(@"%@ %@", phoneLabel, phoneValue);
        }
    }
}

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
