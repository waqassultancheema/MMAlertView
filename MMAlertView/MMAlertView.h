//
//  MMAlertView.h
//  MMAlertView
//
//  Created by Waqas Sultan on 12/09/2015.
//  Copyright (c) 2015 Waqas Sultan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMAlertView : UIView
@property (nonatomic, copy) void (^ onDissmissPress) (void);
@property (nonatomic, copy) void (^ onOKPress) (void);
+ (instancetype)viewWithTitle:(NSString *)title message:(NSString *)message nibName:(NSString *)name;
@end
