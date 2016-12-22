//
//  TabBarBigButton.m
//  tabBarDemo
//
//  Created by Apple on 2016/12/22.
//  Copyright © 2016年 mgjr. All rights reserved.
//

#import "TabBarBigButton.h"

@interface TabBarBigButton ()
@property (weak, nonatomic) UIView *bigView;
@end

@implementation TabBarBigButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setButtonUI];
    }
    return self;
}

- (void)setButtonUI {
    self.titleLabel.font = [UIFont systemFontOfSize:10];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.imageView.contentMode = UIViewContentModeCenter;
    
    UIView *bigView = [[UIView alloc] init];
    bigView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tab_iconIrregular"]];
    [self insertSubview:bigView atIndex:0];
    self.bigView = bigView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.x = 0;
    self.titleLabel.width = self.width;
    self.titleLabel.height = 16;
    self.titleLabel.y = self.height - self.titleLabel.height;
    
    self.imageView.width = self.currentImage.size.width;
    self.imageView.height = self.currentImage.size.height;
    self.imageView.x = (self.width - self.imageView.width)/2;
    self.imageView.y = self.titleLabel.y - self.imageView.height + 2;
    
    self.bigView.width = 49;
    self.bigView.height = self.height;
    self.bigView.x = (self.width - self.bigView.width)/2;
    self.bigView.y = 0;
}

@end
