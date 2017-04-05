//
//  ContactFormViewController.h
//  ContactForm
//
//  Created by administrator on 4/5/17.
//  Copyright © 2017 Yu Cheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactFormViewController : UIViewController
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *gender;
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *age;
@property (strong, nonatomic) NSString *address1;
@property (strong, nonatomic) NSString *address2;
@property (strong, nonatomic) NSString *zipCode;
@property (strong, nonatomic) NSString *state;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *firstNameTField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTField;
@property (weak, nonatomic) IBOutlet UITextField *ageTField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSegment;
@property (weak, nonatomic) IBOutlet UITextField *address1TField;
@property (weak, nonatomic) IBOutlet UITextField *address2TField;
@property (weak, nonatomic) IBOutlet UITextField *zipCodeTField;
@property (weak, nonatomic) IBOutlet UITextField *stateTField;
- (IBAction)onClickedDoneBtn:(id)sender;
- (IBAction)onClickedClearBtn:(id)sender;
- (IBAction)onClickedGenderBtn:(id)sender;

@end
