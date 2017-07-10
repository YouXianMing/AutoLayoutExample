//
//  BaseCustomAutolayoutViewController.h
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/6.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowLoadingView.h"
#import "ControllerBaseViewConfig.h"

@interface BaseCustomAutolayoutViewController : UIViewController

extern NSString * const windowAreaViewId;
extern NSString * const loadingAreaViewId;
extern NSString * const titleViewId;
extern NSString * const contentViewId;
extern NSString * const backgroundViewId;

@property (nonatomic, strong) ShowLoadingView  *windowAreaView;
@property (nonatomic, strong) ShowLoadingView  *loadingAreaView; // constant = 64.f + 8.f
@property (nonatomic, strong) UIView           *titleView;       // constant = 64.f + 8.f
@property (nonatomic, strong) UIView           *contentView;     // constant = 64.f + 8.f
@property (nonatomic, strong) UIView           *backgroundView;

/**
 *  You can only use this method when the current controller is an UINavigationController's rootViewController.
 */
- (void)useInteractivePopGestureRecognizer;

/**
 *  You can use this property when this controller is pushed by an UINavigationController.
 */
@property (nonatomic)  BOOL  enableInteractivePopGestureRecognizer;

/**
 *  If this controller is managed by an UINavigationController, you can use this method to pop.
 *
 *  @param animated Animated or not.
 */
- (void)popViewControllerAnimated:(BOOL)animated;

/**
 *  If this controller is managed by an UINavigationController, you can use this method to pop to the rootViewController.
 *
 *  @param animated Animated or not.
 */
- (void)popToRootViewControllerAnimated:(BOOL)animated;

#pragma mark - Overwrite by subClass.

/**
 *  Overwrite to config subViews.
 *
 *  @param viewsConfig Configs.
 */
- (void)makeViewsConfig:(NSMutableDictionary <NSString *, ControllerBaseViewConfig *> *)viewsConfig;

/**
 *  Overwrite to setup titleView, contentView etc.
 */
- (void)setupSubViews;

@end
