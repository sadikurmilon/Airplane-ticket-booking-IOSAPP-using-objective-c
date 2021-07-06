//
//  ViewController.m
//  AirplaneTicketApp
//
//  Created by User on 2021-02-25.
//  Copyright © 2021 Seneca. All rights reserved.
//

#import "ViewController.h"
#import "Mydatas.h"
#import "secondvc.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource,UITextViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *inpttxtfld;
@property (nonatomic) Mydatas *mydata;
@property(nonatomic)BOOL data;
@property (weak, nonatomic) IBOutlet UITextView *outputtxtfld;


@end

@implementation ViewController
-(Mydatas *)mydata{ //lazy loading all my object here
    
    if(_mydata.items == nil){
        
        _mydata = [[Mydatas  alloc]init];
        
    }
    return _mydata;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //transferring data when the segue is abbout to happen
    secondvc *secndvc =(secondvc*)[segue destinationViewController];
    secndvc.names=self.mydata.namestotrnsfer;
    secndvc.quantity=self.mydata.quantitytotrnsfer;
   
}
- (IBAction)checkoutbttn:(UIButton *)sender {
    //checking if the input is not given
    if(([_inpttxtfld.text length] ==0)||([_storenames length] == 0)||([self.outputtxtfld.text length]==0)){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Empty!" message:@"You have to provide both information and click add more ticket then go to check" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){NSLog(@"run-time error");}];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    else{
        [self performSegueWithIdentifier:@"secnd" sender:nil];
    }
    
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    //returning components value
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.mydata.items.count; //returning rows by counting my model array
}
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component{
    
    
    return self.mydata.items[row];//sending titile for rows
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    self.storenames =self.mydata.items[row];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES; //checking if user clicked return in keyboard to close keyboard
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];//checking if user touches screen then close keyboard
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)addbttn:(UIButton *)sender { //checking if the information is provided or not
    if(([_inpttxtfld.text length] ==0)||([_storenames length] == 0)){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Empty!" message:@"You have to provide both information to add" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){NSLog(@"run-time error");}];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    else{
        NSString *strng = [NSString stringWithFormat:@"%@ quantity is %@\n",self.storenames,self.inpttxtfld.text];
        self.outputtxtfld.text=[self.outputtxtfld.text stringByAppendingString:strng];//adding data to my textview by appending string
        [self.mydata.quantitytotrnsfer addObject:_inpttxtfld.text];//adding object to my model object
        [self.mydata.namestotrnsfer addObject:_storenames];
    }
    
    
    
    
}


@end
