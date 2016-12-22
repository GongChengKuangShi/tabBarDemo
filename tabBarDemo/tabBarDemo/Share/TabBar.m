//
//  TabBar.m
//  tabBarDemo
//
//  Created by Apple on 2016/12/22.
//  Copyright © 2016年 mgjr. All rights reserved.
//

#import "TabBar.h"
#import "TabBarBigButton.h"
#import "TabBarButton.h"

@interface TabBar ()

@property (weak, nonatomic) UIButton *selectButton;//选中按钮

@property (weak, nonatomic) TabBarBigButton *tabBarBigButton;

@end

@implementation TabBar

static NSInteger const TabBarTag = 12000;

- (void)setItems:(NSArray *)items {
    _items = items;
    
    //UITabBarItem保存按钮上的图片
    for (int i = 0; i < items.count; i++) {
        UITabBarItem *item = [items objectAtIndex:i];
        if (i == 2) {
            TabBarBigButton *bigButton = [TabBarBigButton buttonWithType:UIButtonTypeCustom];
            bigButton.tag = self.subviews.count + TabBarTag;
            
            [bigButton setImage:item.image forState:UIControlStateNormal];
            [bigButton setImage:item.selectedImage forState:UIControlStateSelected];
            bigButton.adjustsImageWhenHighlighted = NO;
            
            [bigButton setTitle:item.title forState:UIControlStateNormal];
            [bigButton setTitleColor:BXColor(113, 109, 104) forState:UIControlStateNormal];
            [bigButton setTitleColor:BXColor(51, 135, 255) forState:UIControlStateSelected];
            [bigButton addTarget:self action:@selector(clickBigButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:bigButton];
            self.tabBarBigButton = bigButton;
        } else {
            UIButton *button = [TabBarButton buttonWithType:UIButtonTypeCustom];
            button.tag = self.subviews.count + TabBarTag;
            [button setImage:item.image forState:UIControlStateNormal];
            [button setImage:item.selectedImage forState:UIControlStateSelected];
            button.adjustsImageWhenHighlighted = NO;
            
            [button setTitle:item.title forState:UIControlStateNormal];
            [button setTitleColor:BXColor(113, 109, 104) forState:UIControlStateNormal];
            [button setTitleColor:BXColor(51, 135, 255) forState:UIControlStateSelected];
            [button addTarget:self action:@selector(clickBigButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            
            if (self.subviews.count == 1) {
                [self clickBigButtonEvent:button];
            }
            
        }
    }
}


- (void)clickBigButtonEvent:(UIButton *)button {
    self.selectButton.selected = NO;
    button.selected = YES;
    self.selectButton = button;
    
    //通知rootViewController切换控制器
    if ([self.delegate respondsToSelector:@selector(tabBar:didClickButton:)]) {
        [self.delegate tabBar:self didClickButton:button.tag - TabBarTag];
    }
    
}

@end
