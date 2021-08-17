//
//  CheckoutViewController.h
//  Airplane_ticket
//
//  Created by user196869 on 6/24/21.
//

#import <UIKit/UIKit.h>
#import "Data.h"

NS_ASSUME_NONNULL_BEGIN
@protocol CheckoutVCDelegate
-(void)CheckoutVCResethWith:(Data*)tickData;
@end

@interface CheckoutViewController : UIViewController
@property(nonatomic)id<CheckoutVCDelegate>checkoutVCDelegate;
@property(nonatomic)Data *tickData;
@end

NS_ASSUME_NONNULL_END
