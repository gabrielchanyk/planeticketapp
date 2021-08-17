//
//  Ticket.h
//  Airplane_ticket
//
//  Created by user196869 on 6/24/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Ticket : NSObject
@property(nonatomic)NSString *type;
@property(nonatomic)int qnt;
@property(nonatomic)NSString *cmt;
@property(nonatomic)NSString *vuch;
- (instancetype)initWith: (NSString*)type andQnt:(int)qnt andCmt:(NSString*)cmt andVuch:(NSString*)vuch;
@end

NS_ASSUME_NONNULL_END
