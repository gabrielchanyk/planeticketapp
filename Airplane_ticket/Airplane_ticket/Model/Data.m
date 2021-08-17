//
//  Data.m
//  Airplane_ticket
//
//  Created by user196869 on 6/24/21.
//

#import "Data.h"
#import "Ticket.h"

@implementation Data
-(NSMutableArray*)ticketTypes
{
    if(_ticketTypes == nil)
    {
        _ticketTypes =  [[NSMutableArray alloc]initWithObjects: @"VIP", @"Business", @"Economy Adult", @"Economy Kid", @"Infant", nil];
    }
    return _ticketTypes;
}
-(NSMutableArray*)listOfTickets
{
    if(_listOfTickets == nil)
    {
        _listOfTickets =  [[NSMutableArray alloc]init];
    }
    return _listOfTickets;
}


-(bool)subtractAtIndex:(int)index andQnt:(int)qnt
{
    Ticket *tickInfo = [self.listOfTickets objectAtIndex:index];
    if (qnt <= tickInfo.qnt)
    {
        tickInfo.qnt = tickInfo.qnt - qnt;
        return true;
    }
    else
    {
        return false;
    }
}

-(void)addAtIndex:(int)index andQnt:(int)qnt
{
    Ticket *tickInfo = [self.listOfTickets objectAtIndex:index];
    tickInfo.qnt = tickInfo.qnt + qnt;
}

-(void)typeChangeAtIndex:(int)index andType:(NSString*)type
{
    Ticket *tickInfo = [self.listOfTickets objectAtIndex:index];
    tickInfo.type = type;
}


@end
