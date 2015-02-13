//
//  PlaceHolderView.m
//  PlaceHolderView
//
//  Created by Wang Hai Long on 28/1/15.
//  Copyright (c) 2015 Wang Hai Long. All rights reserved.
//

#import "PlaceholderView.h"

#define MessageLabelLineNumber  10
#define MessageLabelTextFont    [UIFont systemFontOfSize:18]
#define MessageTextColor        [UIColor redColor]

@interface PlaceholderView ()

@property(weak, nonatomic) id target;
@property(assign, nonatomic) SEL action;
@property(strong, nonatomic) UIImageView *iconImageView;
@property(strong, nonatomic) UILabel *messageLabel;
@property(strong, nonatomic) UIView *tapView;

@property(strong, nonatomic) UIGestureRecognizer *tapGestureRecognizer;
@property(strong, nonatomic) UIActivityIndicatorView *activityView;

@end

@implementation PlaceholderView

- (PlaceholderView*)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.hidden = YES;
    }
    return self;
}

-(void)setPlaceholderImage:(UIImage*)image withImageSize:(CGSize)imageSize andMessage:(NSString*)messageText{

    CGFloat msgLabelHeight = [self stringHeightWith:MessageLabelTextFont andLabelWidth:self.frame.size.width*2/3 andString:messageText];

    self.tapView = [[UIView alloc]initWithFrame: CGRectMake(0, 0, self.frame.size.width*2/3, msgLabelHeight + imageSize.height)];
    self.tapView.alpha = 1;

    self.iconImageView = [[UIImageView alloc] initWithImage:image];
    self.iconImageView.frame = CGRectMake((self.tapView.frame.size.width - imageSize.width)/2, 0, imageSize.width, imageSize.height);

    [self.tapView addSubview:self.iconImageView];

    self.messageLabel = [[UILabel alloc]init];
    self.messageLabel.numberOfLines = MessageLabelLineNumber;
    self.messageLabel.font = MessageLabelTextFont;
    self.messageLabel.text = messageText;
    self.messageLabel.textAlignment = NSTextAlignmentCenter;
    self.messageLabel.textColor = MessageTextColor;

    self.messageLabel.frame = CGRectMake(0, imageSize.height, self.frame.size.width*2/3, msgLabelHeight);

    [self.tapView addSubview:self.messageLabel];

    self.tapView.center = CGPointMake(self.frame.size.width/2,self.frame.size.height/2 - self.tapView.frame.size.height/4);

    self.activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.activityView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    self.activityView.hidesWhenStopped  = YES;

    [self addSubview:self.tapView];
    [self addSubview:self.activityView];
}

-(void)addPlaceholderTapTarget:(id)target andAction:(SEL)action{

    if (!self.messageLabel) {
        [NSException raise:@"placeholderViewException" format:@"The placeholder view is nil. You should call the setPlaceholderImage:andMessage: first to init the placeholder view. "];
    }

    if (!target) {
        [NSException raise:@"placeholderViewException" format:@"The target is nil."];
    }

    if (self.tapGestureRecognizer) {
        [self.tapView removeGestureRecognizer:self.tapGestureRecognizer];
    }

    self.tapView.userInteractionEnabled = YES;
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapViewAction)];
    [self.tapView addGestureRecognizer:self.tapGestureRecognizer];

    self.target = target;
    self.action = action;
}


-(void)setMessageText:(NSString *)messageText{
    if (!_messageLabel) {
        [NSException raise:@"placeholderViewException" format:@"The placeholder view is nil. You should call the setPlaceholderImage:andMessage: first to init the placeholder view. "];
    }
    _messageText = messageText;
    _messageLabel.text = messageText;
}

-(void)tapViewAction{

    self.tapView.hidden = YES;

    [self.activityView startAnimating];

    if (self.target && [self.target respondsToSelector:self.action]) {
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.target performSelector:self.action  withObject:nil];
    }
}

-(CGFloat)stringHeightWith:(UIFont*)font andLabelWidth:(CGFloat)labelWidth andString:(NSString*)string
{
    CGSize size = CGSizeMake(labelWidth,1000);

    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];

    style.lineBreakMode = NSLineBreakByWordWrapping;

    CGRect rect = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:    @{NSFontAttributeName:font,NSParagraphStyleAttributeName:style} context:nil];

    return  rect.size.height;
}

-(void)setHidden:(BOOL)hidden{

    if (hidden) {
        [self.activityView stopAnimating];
        self.tapView.hidden = NO;
    }
    [super setHidden:hidden];
}

-(void)setIsInProcess:(BOOL)isInProcess{

    _isInProcess = isInProcess;

    self.tapView.hidden = _isInProcess;
    self.hidden = !_isInProcess;
    if (_isInProcess) {

        [self.activityView startAnimating];

    }else{

        [self.activityView stopAnimating];
    }
}

@end
