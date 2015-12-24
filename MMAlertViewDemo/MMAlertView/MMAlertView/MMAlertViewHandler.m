//
//  MMAlertViewHandler.m
//  MMAlertView
//
//  Created by Waqas Sultan on 12/09/2015.
//  Copyright (c) 2015 Waqas Sultan. All rights reserved.
//

#import "MMAlertViewHandler.h"
#import "MMAlertView.h"
@interface MMAlertViewHandler()
@property (nonatomic, strong) MMAlertView *alertView;
@property (nonatomic) MMAlertType alertType;
@end
@implementation MMAlertViewHandler
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message alertType:(MMAlertType)alertType {
    
    if (self = [super init]) {
        
        _alertType = alertType;
        
        switch (alertType) {
            case MMAlertTypeOne: {
                _alertView = [MMAlertView viewWithTitle:title message:message nibName:@"Alert"];
                
                _alertView.onDissmissPress =^{
                    [[self.alertView superview] removeFromSuperview];
                    [self.alertView removeFromSuperview];
                    self.alertView = nil;
                };
            }
                break;
            case MMAlertTypeTwo:
            {
                _alertView = [MMAlertView viewWithTitle:title message:message nibName:@"AlertDouble"];
                
                _alertView.onDissmissPress =^{
                    [[self.alertView superview] removeFromSuperview];
                    [self.alertView removeFromSuperview];
                    self.alertView = nil;
                };
                _alertView.onOKPress = ^ {
                    [[self.alertView superview] removeFromSuperview];
                    [self.alertView removeFromSuperview];
                    self.alertView = nil;
                    [self.delegate performAction];
                 
                };
            }
                break;
            default:
                break;
        }
        
    }
    
    return self;
}
#pragma clang diagnostic pop

- (void) show {
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    UIView *view = self.alertView;
    UIView *transparentView = [self transparentView];
    
    [transparentView addSubview:view];
    transparentView.center = window.center;
    view.center = transparentView.center;
    
    [window addSubview:transparentView];
}

-(void)showAlertView {
    [self show];
}

- (UIView *) transparentView {
    return [[UIView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.frame];
}

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message alertType:(MMAlertType)alertType {
    MMAlertViewHandler *alert = [[self alloc] initWithTitle:title message:message alertType:alertType];
    [alert show];
}

@end
