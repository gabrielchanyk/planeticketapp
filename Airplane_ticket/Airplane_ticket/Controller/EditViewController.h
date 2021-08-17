//
//  EditViewController.h
//  Airplane_ticket
//
//  Created by user196869 on 6/24/21.
//

#import <UIKit/UIKit.h>
#import "Data.h"

NS_ASSUME_NONNULL_BEGIN

@protocol EditVCDelegate
-(void)EditVCChangehWith:(Data*)tickData;
@end

@interface EditViewController : UIViewController
@property(nonatomic)id<EditVCDelegate>editVCDelegate;
@property(nonatomic)Data *tickData;
@property(nonatomic)NSInteger row;
@end

NS_ASSUME_NONNULL_END
