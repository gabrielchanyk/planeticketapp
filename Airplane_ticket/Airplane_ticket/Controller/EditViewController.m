//
//  EditViewController.m
//  Airplane_ticket
//
//  Created by user196869 on 6/24/21.
//

#import "EditViewController.h"
#import "Ticket.h"

@interface EditViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *lblType;
@property (weak, nonatomic) IBOutlet UILabel *lblQnt;
@property (nonatomic)Ticket *selectedTick; //holds selected ticket info by tableview
@property (weak, nonatomic) IBOutlet UILabel *lblNotice;
@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.selectedTick = [self.tickData.listOfTickets objectAtIndex:self.row];
    self.lblType.text = self.selectedTick.type;
    self.lblQnt.text = [NSString stringWithFormat:@"%d",self.selectedTick.qnt];
}
- (IBAction)minus_pressed:(UIButton *)sender {
    self.lblNotice.text = nil;
    //can use bool for error handling
    bool minus = [self.tickData subtractAtIndex:(int)self.row andQnt:1];
    if (!minus)
    {
        self.lblNotice.text = @"Cannot go below 0";
    }
    self.lblQnt.text = [NSString stringWithFormat:@"%d",self.selectedTick.qnt];
}
- (IBAction)plus_pressed:(UIButton *)sender {
    self.lblNotice.text = nil;
    [self.tickData addAtIndex:(int)self.row andQnt:1];
    self.lblQnt.text = [NSString stringWithFormat:@"%d",self.selectedTick.qnt];
}
- (IBAction)save_Pressed:(UIButton *)sender {
    //use delegate to save changes/ send back to table view
    [self.editVCDelegate EditVCChangehWith:self.tickData];
}
- (IBAction)back_pressed:(UIButton *)sender {
    //send back to previous view
    [self dismissViewControllerAnimated:NO completion:nil];
}
//Pickerview
//#of component
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

//# of rows
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.tickData.ticketTypes.count;
}
//print ticket info onto pickerview
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *ticketTitle = [self.tickData.ticketTypes objectAtIndex:row];
    return ticketTitle;
}
//selected row in pickerview
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.lblNotice.text = nil;
    [self.tickData typeChangeAtIndex:(int)self.row andType:[self.tickData.ticketTypes objectAtIndex:(int)row]];
    self.lblType.text = self.selectedTick.type;
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
