//
//  MMAlertView.m
//  MMAlertView
//
//  Created by Waqas Sultan on 12/09/2015.
//  Copyright (c) 2015 Waqas Sultan. All rights reserved.
//

#import "MMAlertView.h"

@interface MMAlertView()
@property (nonatomic, strong) NSString *titleStr;
@property (nonatomic, strong) NSString *message;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UITextView *text;
@end

@implementation MMAlertView

- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    CGSize shadowOffset = CGSizeMake(1.0, 1.0);
    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    self.layer.shadowRadius = 2.0;
    self.layer.shadowOffset = shadowOffset;
    self.layer.shadowOpacity = 1.0;
    self.layer.borderWidth = 2;
    self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
}
+ (instancetype)viewWithTitle:(NSString *)title message:(NSString *)message nibName:(NSString *)name {
    MMAlertView *view = [[[NSBundle mainBundle] loadNibNamed:name owner:self options:nil]                         firstObject];
    view.titleStr = title;
    view.message = message;
    view.text.text = message;
    view.title.text = title;
    [view.text setEditable:NO];
    return view;
}
- (IBAction)cancelButton:(id)sender {
    if (self.onDissmissPress) {
        self.onDissmissPress();
    }
}
- (IBAction)okButton:(id)sender {
    if (self.onOKPress) {
        self.onOKPress();
    }
}

- (IBAction)dismissButton:(id)sender {
    if (self.onDissmissPress) {
        self.onDissmissPress();
    }
}

@end
