//
//  TabBarButton.m
//  tabBarDemo
//
//  Created by Apple on 2016/12/22.
//  Copyright © 2016年 mgjr. All rights reserved.
//

#import "TabBarButton.h"

@implementation TabBarButton


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.contentMode = UIViewContentModeCenter;//设置图片的内容模式
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.x = 0;
    self.titleLabel.width = self.width;
    self.titleLabel.height = 20;
    self.titleLabel.y = self.height - self.titleLabel.height;
    
    self.imageView.width = self.currentImage.size.width;
    self.imageView.height = self.currentImage.size.height;
    self.imageView.x = (self.width - self.imageView.width)/2;
    self.imageView.y = self.titleLabel.y - self.titleLabel.height - 4;
}

@end
