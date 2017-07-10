//
//  ShowLoadingView.h
//  BaseStructrue
//
//  Created by YouXianMing on 2017/5/15.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowLoadingView : UIView

/**
 count >= 1 则 userInteractionEnabled = YES, 否则, userInteractionEnabled = NO
 */
@property (nonatomic, readonly) NSInteger count;

/**
 push 一次导致 count++
 */
- (void)push;

/**
 pop 一次导致 count--
 */
- (void)pop;

@end
