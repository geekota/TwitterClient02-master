//
//  DetailViewController.h
//  TwitterClient02
//
//  Created by Fukazawa kota on 2015/05/31.
//  Copyright (c) 2015年 Kota Fukazawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface DetailViewController : UIViewController

@property UIImage *image;
@property NSString *text;
@property NSString *name;

@property NSString *identifier;
@property NSString *idStr;
@property NSString *httpErrorMessage;


@end
