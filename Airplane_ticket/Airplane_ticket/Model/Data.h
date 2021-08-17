//
//  Data.h
//  Airplane_ticket
//
//  Created by user196869 on 6/24/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Data : NSObject
@property(nonatomic)NSMutableArray *ticketTypes;
@property(nonatomic)NSMutableArray *listOfTickets;
-(bool)subtractAtIndex:(int)index andQnt:(int)qnt;
-(void)addAtIndex:(int)index andQnt:(int)qnt;
-(void)typeChangeAtIndex:(int)index andType:(NSString*)type;
@end

NS_ASSUME_NONNULL_END
