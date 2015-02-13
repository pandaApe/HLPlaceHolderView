//
//  PlaceHolderView.h
//  PlaceHolderView
//
//  Created by Wang Hai Long on 28/1/15.
//  Copyright (c) 2015 Wang Hai Long. All rights reserved.
//

#import <UIKit/UIKit.h>


/*!
 @class         PlaceholderView
 @discussion    When you're working on a new app, sometimes it's easier to start with dummy views and slowly replace them as you implement their functionality. Rather than use a simple UIView for this, PlaceholderView gives you a better looking placeholder view that shows its dimensions and an optional title.
 */
@interface PlaceholderView:UIView

@property(strong,nonatomic) NSString *messageText;

@property(assign,nonatomic) BOOL isInProcess;

/*!
 @function      initWithFrame:
 @param         frame :The frame rectangle for the view, measured in points. The origin of the frame is relative to the superview in which you plan to add it.
 @discussion    initializes and returns a newly allocated view object with the specified frame rectangle.
 @return        self
 */
-(instancetype)initWithFrame:(CGRect)frame;

/*!
 @function      setPlceholderImage: withImageSize: andMessage:
 @param         image :error information image.
 @param         imageSize :image size.
 @param         messageText :information text string.
 @discussion    initializes the placeholder image and information text string.
 @return        void
 */
-(void)setPlaceholderImage:(UIImage*)image withImageSize:(CGSize)imageSize andMessage:(NSString*)messageText;

/*!
 @function      addPlaceholderTapTarget: andAction:
 @param         target :An object that is the recipient of action messages sent by the receiver when it recognizes a gesture. nil is not a valid value.
 @param         action :A selector that identifies the method implemented by the target to handle the gesture recognized by the receiver. The action selector must conform to the signature described in the class overview. NULL is not a valid value.
 @discussion    Initializes an allocated gesture-recognizer object with a target and an action selector.
 This method is the designated initializer. After creating the gesture recognizer, you may associate other target-action pairs with it by calling.
 @return        void
 */
-(void)addPlaceholderTapTarget:(id)target andAction:(SEL)action;


@end
