//
//  EditViewController.m
//  ContactForm
//
//  Created by administrator on 4/5/17.
//  Copyright © 2017 Yu Cheng. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()<UITextViewDelegate>

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLbl.text=self.nameDetect;
    self.textView.text = @"Please edit text";
    self.textView.textColor = [UIColor lightGrayColor];
    self.textView.delegate = self;
    // Do any additional setup after loading the view.
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
// when you touch screen, keyboard is hidden.
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    UITouch * touch = [touches anyObject];
//    if(touch.phase == UITouchPhaseBegan) {
//        [self.textView resignFirstResponder];
//    }
//}

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    self.textView.text = @"";
    self.textView.textColor = [UIColor blackColor];
    return YES;
}

-(void) textViewDidChange:(UITextView *)textView
{
    if(self.textView.text.length == 0){
        self.textView.textColor = [UIColor lightGrayColor];
        self.textView.text = @"Please edit text";
        [self.textView resignFirstResponder];
    }
}
- (IBAction)onClickedDoneBtn:(id)sender {
    if (![self.textView.text isEqualToString:@"Please edit text"] && ![self.textView.text isEqualToString:@""]) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ContactFormViewController *vc =(ContactFormViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ContactFormViewController"];
        if ([self.nameDetect isEqualToString:@"First Name"]) {
            vc.firstName=self.textView.text;
            vc.lastName=self.lastName;
            vc.age=self.age;
            vc.gender=self.gender;
            vc.address1=self.address1;
            vc.address2=self.address2;
            vc.zipCode=self.zipCode;
            vc.state=self.state;
        } else if ([self.nameDetect isEqualToString:@"Last Name"]) {
            vc.firstName=self.firstName;
            vc.lastName=self.textView.text;
            vc.age=self.age;
            vc.gender=self.gender;
            vc.address1=self.address1;
            vc.address2=self.address2;
            vc.zipCode=self.zipCode;
            vc.state=self.state;
        } else if ([self.nameDetect isEqualToString:@"Age"]) {
            vc.firstName=self.firstName;
            vc.lastName=self.lastName;
            vc.age=self.textView.text;
            vc.gender=self.gender;
            vc.address1=self.address1;
            vc.address2=self.address2;
            vc.zipCode=self.zipCode;
            vc.state=self.state;
        } else if ([self.nameDetect isEqualToString:@"Address 1"]) {
            vc.firstName=self.firstName;
            vc.lastName=self.lastName;
            vc.age=self.age;
            vc.gender=self.gender;
            vc.address1=self.textView.text;
            vc.address2=self.address2;
            vc.zipCode=self.zipCode;
            vc.state=self.state;
        } else if ([self.nameDetect isEqualToString:@"Address 2"]) {
            vc.firstName=self.firstName;
            vc.lastName=self.lastName;
            vc.age=self.age;
            vc.gender=self.gender;
            vc.address1=self.address1;
            vc.address2=self.textView.text;
            vc.zipCode=self.zipCode;
            vc.state=self.state;
        } else if ([self.nameDetect isEqualToString:@"Zip Code"]) {
            vc.firstName=self.firstName;
            vc.lastName=self.lastName;
            vc.age=self.age;
            vc.gender=self.gender;
            vc.address1=self.address1;
            vc.address2=self.address2;
            vc.zipCode=self.textView.text;
            vc.state=self.state;
        } else if ([self.nameDetect isEqualToString:@"State"]) {
            vc.firstName=self.firstName;
            vc.lastName=self.lastName;
            vc.age=self.age;
            vc.gender=self.gender;
            vc.address1=self.address1;
            vc.address2=self.address2;
            vc.zipCode=self.zipCode;
            vc.state=self.textView.text;
        }
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"Error"
                                     message:@"Text don't have to empty."
                                     preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* okButton = [UIAlertAction
                                    actionWithTitle:@"OK"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {
                                        //Handle your yes please button action here
                                    }];
        [alert addAction:okButton];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (IBAction)onClickedCancelBtrn:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ContactFormViewController *vc =(ContactFormViewController *)[storyboard instantiateViewControllerWithIdentifier:@"ContactFormViewController"];
    if ([self.nameDetect isEqualToString:@"First Name"]) {
        vc.firstName=@"";
        vc.lastName=self.lastName;
        vc.age=self.age;
        vc.gender=self.gender;
        vc.address1=self.address1;
        vc.address2=self.address2;
        vc.zipCode=self.zipCode;
        vc.state=self.state;
    } else if ([self.nameDetect isEqualToString:@"Last Name"]) {
        vc.firstName=self.firstName;
        vc.lastName=@"";
        vc.age=self.age;
        vc.gender=self.gender;
        vc.address1=self.address1;
        vc.address2=self.address2;
        vc.zipCode=self.zipCode;
        vc.state=self.state;
    } else if ([self.nameDetect isEqualToString:@"Age"]) {
        vc.firstName=self.firstName;
        vc.lastName=self.lastName;
        vc.age=@"";
        vc.gender=self.gender;
        vc.address1=self.address1;
        vc.address2=self.address2;
        vc.zipCode=self.zipCode;
        vc.state=self.state;
    } else if ([self.nameDetect isEqualToString:@"Address 1"]) {
        vc.firstName=self.firstName;
        vc.lastName=self.lastName;
        vc.age=self.age;
        vc.gender=self.gender;
        vc.address1=@"";
        vc.address2=self.address2;
        vc.zipCode=self.zipCode;
        vc.state=self.state;
    } else if ([self.nameDetect isEqualToString:@"Address 2"]) {
        vc.firstName=self.firstName;
        vc.lastName=self.lastName;
        vc.age=self.age;
        vc.gender=self.gender;
        vc.address1=self.address1;
        vc.address2=@"";
        vc.zipCode=self.zipCode;
        vc.state=self.state;
    } else if ([self.nameDetect isEqualToString:@"Zip Code"]) {
        vc.firstName=self.firstName;
        vc.lastName=self.lastName;
        vc.age=self.age;
        vc.gender=self.gender;
        vc.address1=self.address1;
        vc.address2=self.address2;
        vc.zipCode=@"";
        vc.state=self.state;
    } else if ([self.nameDetect isEqualToString:@"State"]) {
        vc.firstName=self.firstName;
        vc.lastName=self.lastName;
        vc.age=self.age;
        vc.gender=self.gender;
        vc.address1=self.address1;
        vc.address2=self.address2;
        vc.zipCode=self.zipCode;
        vc.state=@"";
    }
    [self.navigationController pushViewController:vc animated:YES];
}
@end
