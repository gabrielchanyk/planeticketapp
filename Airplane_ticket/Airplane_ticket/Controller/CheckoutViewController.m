//
//  CheckoutViewController.m
//  Airplane_ticket
//
//  Created by user196869 on 6/24/21.
//

#import "CheckoutViewController.h"
#import "Ticket.h"
#import "TicketTableViewCell.h"
#import "EditViewController.h"

@interface CheckoutViewController ()<UITableViewDelegate,UITableViewDataSource, EditVCDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tickTV;

@end

@implementation CheckoutViewController
-(void)EditVCChangehWith:(Data*)tickData
{
    self.tickData = tickData;
    [self.tickTV reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)done_pressed:(UIButton *)sender {
    //set alert
    UIAlertController *login = [UIAlertController alertControllerWithTitle:@"Thank You!"
                                   message:@"Enjoy Your Trip!"
                                   preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
       handler:^(UIAlertAction * action) {
        //add clear delegate to send back to restart app
        [self.tickData.listOfTickets removeAllObjects];
        [self.checkoutVCDelegate CheckoutVCResethWith:self.tickData];
        //go back to main view controller
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
    [login addAction:ok];
    [self presentViewController:login animated:YES completion:nil];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tickData.listOfTickets.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //print infor to tableview
    TicketTableViewCell *tickCell =[tableView dequeueReusableCellWithIdentifier:@"tickCell"];
    Ticket *tickInfo = [self.tickData.listOfTickets objectAtIndex:indexPath.row];
    tickCell.lblType.text = tickInfo.type;
    tickCell.lblQnt.text = [NSString stringWithFormat:@"%d",tickInfo.qnt];
    tickCell.lblCmt.text = tickInfo.cmt;
    tickCell.lblVuch.text = tickInfo.vuch;
    return tickCell;
}

//set editing for tableview
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return true;
}

//set swiping to delete item in table view
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tickData.listOfTickets removeObjectAtIndex:indexPath.row];
    [tableView reloadData];
}

//setting row height for custom cell
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    EditViewController *EditVC = (EditViewController*)[segue destinationViewController];
    EditVC.row = [self.tickTV indexPathForSelectedRow].row;
    EditVC.tickData = self.tickData;
    EditVC.editVCDelegate = self;
}


@end
