//
//  PlaceHolderView.m
//  PlaceHolderViewSample
//
//  Created by Wang HaiLong on 14/7/15.
//  Copyright (c) 2015 Hai Long. All rights reserved.
//

#import "PlaceHolderView.h"

@implementation PlaceHolderView{
    UIGestureRecognizer *tapGesture;
}

-(id)initWithCoder:(NSCoder *)aDecoder{




    return  [super initWithCoder:aDecoder];
}

-(instancetype)init{

    if(self = [super init]){
        [self setUp];
    }
    return self;
}

-(void)setUp{
    tapView.userInteractionEnabled = YES;

    //    tapView addGestureRecognizer:i
}

-(void)setInfoIconImg:(UIImage *)infoIconImg{
    _infoIconImg = infoIconImg;
    infoIcon.image = _infoIconImg;
}

-(void)setInProcess:(BOOL)inProcess{
    _inProcess = inProcess;
    indicatorView.backgroundColor = [UIColor redColor];
    if (inProcess) {
        
        [indicatorView startAnimating];
        tapView.hidden = YES;
    }else{
        
        [indicatorView stopAnimating];
        tapView.hidden = NO;
    }
}

-(void)setMsgText:(NSString *)msgText{
    _msgText = msgText;
    msgTextLabel.text = _msgText;
}

-(void)addPlaceholderTapTarget:(id)target andAction:(SEL)action{
    if (tapGesture)
        [tapView removeGestureRecognizer:tapGesture];

    tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
}

@end
