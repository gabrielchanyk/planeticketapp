//
//  TicketTableViewCell.h
//  Airplane_ticket
//
//  Created by user196869 on 6/24/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TicketTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblType;
@property (weak, nonatomic) IBOutlet UILabel *lblQnt;
@property (weak, nonatomic) IBOutlet UILabel *lblVuch;
@property (weak, nonatomic) IBOutlet UILabel *lblCmt;
@end

NS_ASSUME_NONNULL_END
