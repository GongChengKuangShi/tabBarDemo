//
//  TabBar.h
//  tabBarDemo
//
//  Created by Apple on 2016/12/22.
//  Copyright © 2016年 mgjr. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TabBar;
@protocol TabBarDelegate <NSObject>

@optional
- (void)tabBar:(TabBar *)tabBar didClickButton:(NSInteger)index;

@end

@interface TabBar : UIView

@property (strong, nonatomic) NSArray *items;

@property (weak, nonatomic) id<TabBarDelegate> delegate;

@end
