//
//  MMAlertViewHandler.h
//  MMAlertView
//
//  Created by Waqas Sultan on 12/09/2015.
//  Copyright (c) 2015 Waqas Sultan. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, MMAlertType) {
    MMAlertTypeOne,
    MMAlertTypeTwo,
};
@protocol MMAlertViewDelegate <NSObject>

-(void)performAction;

@end
@interface MMAlertViewHandler : NSObject

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message alertType:(MMAlertType)alertType;
+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message alertType:(MMAlertType)alertType;
@property (nonatomic,strong) id<MMAlertViewDelegate> delegate;
- (void)showAlertView;

@end
