//
//  ViewController.m
//  Airplane_ticket
//
//  Created by user196869 on 6/24/21.
//

#import "ViewController.h"
#import "Data.h"
#import "Ticket.h"
#import "CheckoutViewController.h"

@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource, CheckoutVCDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtTickNum;//outlet for textbox
@property (weak, nonatomic) IBOutlet UITextView *txtViewTickInfo;
@property (weak, nonatomic) IBOutlet UITextField *txtCmt;
@property (weak, nonatomic) IBOutlet UITextField *txtVuch;
@property (nonatomic)Data *ticketData; //holds ticket data for title and history
@property (nonatomic)NSString  *selectedType; //holds selected type by pickerview
@property (nonatomic)int selectedRow; //holds row of pickerview

@end

@implementation ViewController
//use delegate to clear when done button pressed
-(void)CheckoutVCResethWith:(Data*)tickData
{
    //self.ticketData = tickData;
    self.txtTickNum.text = nil;
    self.txtViewTickInfo.text = nil;
    self.txtCmt.text = nil;
    self.txtVuch.text = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.txtTickNum.keyboardType = UIKeyboardTypeNumberPad;
    self.txtTickNum.clearButtonMode = true;
    self.selectedType = [self.ticketData.ticketTypes objectAtIndex:0];
}
//lazy load ticketData object
-(Data*)ticketData{
    if (_ticketData == nil)
    {
        _ticketData = [[Data alloc]init];
    }
    return _ticketData;
}
- (IBAction)addTick_Pressed:(UIButton *)sender {
    if (self.txtTickNum.text != nil) //check that textbox is not empty
    {
        NSString *qntValue = self.txtTickNum.text;
        if (qntValue.integerValue != 0)
        {
            //add ticket info to array
            Ticket *choice = [[Ticket alloc]initWith:self.selectedType andQnt:(int)qntValue.integerValue andCmt:self.txtCmt.text andVuch:self.txtVuch.text];
            [self.ticketData.listOfTickets addObject:choice];
        }
    }
    NSString *txtVPrint = @"";
    for (int i = 0; i < self.ticketData.listOfTickets.count; i++)
    {
        Ticket *printTick = [self.ticketData.listOfTickets objectAtIndex:i];
        NSString *printTickInfo = [NSString stringWithFormat:@"%d %@ \n",printTick.qnt,printTick.type];
        txtVPrint = [txtVPrint stringByAppendingString:printTickInfo];
        self.txtViewTickInfo.text = txtVPrint;
    }
    self.txtTickNum.text = nil;
    self.txtCmt.text = nil;
    self.txtVuch.text = nil;
    
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
    return self.ticketData.ticketTypes.count;
}
//print ticket info onto pickerview
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *ticketTitle = [self.ticketData.ticketTypes objectAtIndex:row];
    return ticketTitle;
}
//selected row in pickerview
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.selectedType = [self.ticketData.ticketTypes objectAtIndex:row];
    self.selectedRow = (int)row;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    CheckoutViewController *CheckoutVC = (CheckoutViewController*)[segue destinationViewController];
    CheckoutVC.tickData = self.ticketData;
    CheckoutVC.checkoutVCDelegate = self;
}
@end
