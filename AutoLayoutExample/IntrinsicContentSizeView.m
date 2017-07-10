//
//  IntrinsicContentSizeView.m
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/10.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "IntrinsicContentSizeView.h"
#import "Masonry.h"

static const CGSize itemSize = {20, 12};

@implementation IntrinsicContentSizeView

#pragma mark - Setter method.

- (void)setItemCount:(NSInteger)itemCount {
    
    _itemCount = itemCount;
    
    // 删除所有的subView
    while (self.subviews.count) {
        
        [self.subviews.lastObject removeFromSuperview];
    }
    
    // 添加view
    for (int i = 0; i < _itemCount; i++) {
        
        UIView *view         = [[UIView alloc] initWithFrame:CGRectMake(0, 0, itemSize.width, itemSize.height)];
        view.backgroundColor = [UIColor colorWithHue:((13 + i * 17) % 255) / 255. saturation:1 brightness:1 alpha:1.0];
        
        // 不支持约束,所有的布局在-layoutSubviews中用setFrame的方式
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:view];
        
        // 显示的文本
        UILabel *label      = [UILabel new];
        label.font          = [UIFont systemFontOfSize:10.f];
        label.text          = [NSString stringWithFormat:@"%d", i + 1];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor     = [UIColor whiteColor];
        [view addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(itemSize.width, itemSize.height));
        }];
    }
    
    // 通知布局系统让固有的内容尺寸失效,接下来系统会从intrinsicContentSize方法中读取新的固有的尺寸
    [self invalidateIntrinsicContentSize];
}

- (void)setPreferredMaxLayoutWidth:(CGFloat)width {
    
    // 如果设定的最大宽度与自己的最大宽度相等,则不做任何操作
    if (self.preferredMaxLayoutWidth == width) {
        
        return;
    }
    
    _preferredMaxLayoutWidth = width;
    
    // 通知布局系统让固有的内容尺寸失效,接下来系统会从intrinsicContentSize方法中读取新的固有的尺寸
    [self invalidateIntrinsicContentSize];
}

#pragma mark - Private method.

/**
 根据给定的总宽度,计算每一个子view的frame的尺寸

 @param layoutWidth 给定的宽度
 @param block 每一个子view的frame值
 */
- (void)enumerateItemRectsForLayoutWidth:(CGFloat)layoutWidth usingBlock:(void (^)(CGRect itemRect))block {
    
    CGFloat x = 0;
    CGFloat y = 0;
    
    for (NSUInteger i = 0; i < self.itemCount; i++) {
        
        if (x + itemSize.width > layoutWidth) {
            
            y += itemSize.height;
            x  = 0;
        }
        
        block(CGRectMake(x, y, itemSize.width, itemSize.height));
        
        x += itemSize.width;
    }
}

#pragma mark - Overwrite system method.

- (CGSize)intrinsicContentSize {
    
    if (self.itemCount == 0) {
        
        return CGSizeZero;
    }
    
    __block CGRect totalRect = CGRectNull;
    [self enumerateItemRectsForLayoutWidth:self.preferredMaxLayoutWidth usingBlock:^(CGRect itemRect) {
        
        // 获取融合的rect值
        totalRect = CGRectUnion(itemRect, totalRect);
    }];
    
    return totalRect.size;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    NSEnumerator *subviewEnumerator = [self.subviews objectEnumerator];
    [self enumerateItemRectsForLayoutWidth:self.preferredMaxLayoutWidth usingBlock:^(CGRect itemRect) {
        
        // 给每一个子view设定尺寸
        [[subviewEnumerator nextObject] setFrame:itemRect];
    }];
}

@end
