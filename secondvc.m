//
//  secondvc.m
//  AirplaneTicketApp
//
//  Created by User on 2021-02-26.
//  Copyright © 2021 Seneca. All rights reserved.
//

#import "secondvc.h"

@interface secondvc () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic)UITableViewCell *mytblecell;
@end

@implementation secondvc
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _names.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    cell.textLabel.text =[_names objectAtIndex:indexPath.row];
    
    cell.detailTextLabel.text=[_quantity objectAtIndex:indexPath.row];
    
    return cell;
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(editingStyle==UITableViewCellEditingStyleDelete){
        [self.names removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
       
    }
    
}
- (IBAction)donebttn:(UIButton *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Thank You!" message:@"Enjoy Your Trip" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){NSLog(@"Ticket bought");[self performSegueWithIdentifier:@"maincntrl" sender:nil];}];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];

    //giving alert and doing segue here to go to my first view
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
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
