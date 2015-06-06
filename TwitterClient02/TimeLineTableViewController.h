//
//  TimeLineTableViewController.h
//  TwitterClient02
//
//  Created by Fukazawa kota on 2015/05/27.
//  Copyright (c) 2015年 Kota Fukazawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import "timeLineCell.h"
#import "DetailViewController.h"

@interface TimeLineTableViewController : UITableViewController
@property (nonatomic, copy) NSString *identifier;

@end
