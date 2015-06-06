//
//  timeLineCell.h
//  TwitterClient02
//
//  Created by Fukazawa kota on 2015/05/27.
//  Copyright (c) 2015年 Kota Fukazawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface timeLineCell : UITableViewCell

@property (nonatomic, strong) UILabel *tweetTextLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *profileImageView;
@property (nonatomic) CGFloat tweetTextLabelHeight;
@property UIImage *Image;


@end
