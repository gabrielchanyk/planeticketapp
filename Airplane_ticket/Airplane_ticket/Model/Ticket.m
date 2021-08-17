//
//  Ticket.m
//  Airplane_ticket
//
//  Created by user196869 on 6/24/21.
//

#import "Ticket.h"

@implementation Ticket
- (instancetype)initWith: (NSString*)type andQnt:(int)qnt andCmt:(NSString*)cmt andVuch:(NSString*)vuch
{
    self = [super init];
    if(self)
    {
        self.type = type;
        self.qnt = qnt;
        self.cmt = cmt;
        self.vuch = vuch;
    }
    return self;
}
@end
