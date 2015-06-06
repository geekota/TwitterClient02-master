//
//  timeLineCell.m
//  TwitterClient02
//
//  Created by Fukazawa kota on 2015/05/27.
//  Copyright (c) 2015年 Kota Fukazawa. All rights reserved.
//

#import "timeLineCell.h"

@implementation timeLineCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        //SharedDataManager *sharedManager = [SharedDataManager sharedManager];
        
        
        _tweetTextLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        //_tweetTextLabel.font = sharedManager.tweetTextLabelFont;
        _tweetTextLabel.textColor = [UIColor blackColor];
        _tweetTextLabel.numberOfLines = 0;
        [self.contentView addSubview:_tweetTextLabel];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        //_nameLabel.font = sharedManager.nameLabelFont;
        _nameLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_nameLabel];
        
        _profileImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_profileImageView];
    }
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    
    self.profileImageView.frame
    = CGRectMake(5,5,48,48);
    self.tweetTextLabel.frame
    = CGRectMake(58,5,257, self.tweetTextLabelHeight);
    self.nameLabel.frame
    = CGRectMake(58,self.tweetTextLabelHeight+15,257,12);
    
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
