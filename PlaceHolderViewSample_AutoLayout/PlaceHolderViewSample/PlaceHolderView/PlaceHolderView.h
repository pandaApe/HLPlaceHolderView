//
//  PlaceHolderView.h
//  PlaceHolderViewSample
//
//  Created by Wang HaiLong on 14/7/15.
//  Copyright (c) 2015 Hai Long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceHolderView : UIView{
    IBOutlet UIView *tapView;
    IBOutlet UIImageView *infoIcon;
    IBOutlet UILabel *msgTextLabel;
    IBOutlet UIActivityIndicatorView *indicatorView;
}

@property(strong,nonatomic)NSString *msgText;
@property(strong,nonatomic)UIImage *infoIconImg;
@property(assign,nonatomic)BOOL     inProcess;
//@property(assign,nonatomic)BOOL     hiden;

-(void)addPlaceholderTapTarget:(id)target andAction:(SEL)action;

@end
