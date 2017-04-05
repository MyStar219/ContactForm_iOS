//
//  ContactFormViewController.m
//  ContactForm
//
//  Created by administrator on 4/5/17.
//  Copyright © 2017 Yu Cheng. All rights reserved.
//

#import "ContactFormViewController.h"
#import "EditViewController.h"

@interface ContactFormViewController ()<UITextFieldDelegate>

@end

@implementation ContactFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.firstNameTField.delegate=self;
    self.lastNameTField.delegate=self;
    self.ageTField.delegate=self;
    self.address1TField.delegate=self;
    self.address2TField.delegate=self;
    self.zipCodeTField.delegate=self;
    self.stateTField.delegate=self;
    self.firstNameTField.text=self.firstName;
    self.lastNameTField.text=self.lastName;
    self.ageTField.text=self.age;
    self.address1TField.text=self.address1;
    self.address2TField.text=self.address2;
    self.zipCodeTField.text=self.zipCode;
    self.stateTField.text=self.state;
    self.gender=@"Male";
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
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.tag == 0) {
        self.name=@"First Name";
        [self showEditViewController];
    } else if (textField.tag == 1) {
        self.name=@"Last Name";
        [self showEditViewController];
    } else if (textField.tag == 2) {
        self.name=@"Age";
        [self showEditViewController];
    } else if (textField.tag == 3) {
        self.name=@"Address 1";
        [self showEditViewController];
    } else if (textField.tag == 4) {
        self.name=@"Address 2";
        [self showEditViewController];
    } else if (textField.tag == 5) {
        self.name=@"Zip Code";
        [self showEditViewController];
    } else if (textField.tag == 6) {
        self.name=@"State";
        [self showEditViewController];
    }
}
-(void) showEditViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    EditViewController *vc =(EditViewController *)[storyboard instantiateViewControllerWithIdentifier:@"EditViewController"];
    vc.firstName=self.firstNameTField.text;
    vc.lastName=self.lastNameTField.text;
    vc.age=self.ageTField.text;
    vc.gender=self.gender;
    vc.address1=self.address1TField.text;
    vc.address2=self.address2TField.text;
    vc.zipCode=self.zipCodeTField.text;
    vc.state=self.stateTField.text;
    vc.nameDetect=self.name;
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)onClickedDoneBtn:(id)sender {
    if (![self.firstNameTField.text isEqualToString:@""] && ![self.lastNameTField.text isEqualToString:@""] && ![self.ageTField.text isEqualToString:@""] && ![self.address1TField.text isEqualToString:@""] && ![self.address2TField.text isEqualToString:@""] && ![self.zipCodeTField.text isEqualToString:@""] && ![self.stateTField.text isEqualToString:@""]) {
        //Here YOUR URL
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://kidcarejourney.com/contact_form/request.php?action=registor&"]];
        
        //create the Method "GET" or "POST"
        [request setHTTPMethod:@"POST"];
        //Pass The String to server(YOU SHOULD GIVE YOUR PARAMETERS INSTEAD OF MY PARAMETERS)
        NSString *userUpdate =[NSString stringWithFormat:@"firstname=%@&lastname=%@&age=%@&gender=%@&address1=%@&address2=%@&zipcode=%@&state=%@",self.firstNameTField.text,self.lastNameTField.text,self.ageTField.text,self.gender,self.address1TField.text,self.address2TField.text,self.zipCodeTField.text,self.stateTField.text,nil];
        
        //Check The Value what we passed
        NSLog(@"The data Details is =%@", userUpdate);
        
        //Convert the String to Data
        NSData *data1 = [userUpdate dataUsingEncoding:NSUTF8StringEncoding];
        
        //Apply the data to the body
        [request setHTTPBody:data1];
        
        //Create the response and Error
        NSError *err;
        NSURLResponse *response;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
        
        NSString *resSrt = [[NSString alloc]initWithData:responseData encoding:NSASCIIStringEncoding];
        
        //This is for Response
        NSLog(@"got response==%@", resSrt);
        if ([resSrt isEqualToString:@"yes"]){
            UIAlertController * alert = [UIAlertController
                                         alertControllerWithTitle:@"Success"
                                         message:@"Form has been submitted."
                                         preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* okButton = [UIAlertAction
                                       actionWithTitle:@"OK"
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction * action) {
                                           //Handle your yes please button action here
                                       }];
            [alert addAction:okButton];
            [self presentViewController:alert animated:YES completion:nil];
        } else {
            UIAlertController * alert = [UIAlertController
                                         alertControllerWithTitle:@"Error"
                                         message:@"Form couldn't been submitted. Please try again."
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
        
    } else {
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"Error"
                                     message:@"Exist the empty item."
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

- (IBAction)onClickedClearBtn:(id)sender {
    self.firstNameTField.text=@"";
    self.lastNameTField.text=@"";
    self.ageTField.text=@"";
    self.address1TField.text=@"";
    self.address2TField.text=@"";
    self.zipCodeTField.text=@"";
    self.stateTField.text=@"";
}

- (IBAction)onClickedGenderBtn:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    if (selectedSegment == 0) {
        //toggle the correct view to be visible
        self.gender=@"Male";
    }
    else{
        //toggle the correct view to be visible
        self.gender=@"Female";
    }
}
@end
