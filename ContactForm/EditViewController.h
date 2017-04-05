//
//  EditViewController.h
//  ContactForm
//
//  Created by administrator on 4/5/17.
//  Copyright © 2017 Yu Cheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactFormViewController.h"

@interface EditViewController : UIViewController
@property (strong, nonatomic) NSString *nameDetect;
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *age;
@property (strong, nonatomic) NSString *gender;
@property (strong, nonatomic) NSString *address1;
@property (strong, nonatomic) NSString *address2;
@property (strong, nonatomic) NSString *zipCode;
@property (strong, nonatomic) NSString *state;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
- (IBAction)onClickedDoneBtn:(id)sender;
- (IBAction)onClickedCancelBtrn:(id)sender;


@end
