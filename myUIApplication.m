//
//  myUIApplication.m
//  TwitterClient02
//
//  Created by Fukazawa kota on 2015/06/01.
//  Copyright (c) 2015年 Kota Fukazawa. All rights reserved.
//

#import "myUIApplication.h"

@implementation myUIApplication



- (BOOL)openURL:(NSURL *)url
{
    if (!url) {
        return NO;
    }
    
    self.myOpenUrl = url;
    AppDelegate *appDelegate = (AppDelegate *)[self delegate];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:[NSBundle mainBundle]];
    webViewController *webViewController = [storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
    webViewController.openUrl = self.myOpenUrl;
    webViewController.title = @"Web View";
    [appDelegate.navigationController pushViewController:webViewController animated:YES];
    self.myOpenUrl = nil;
    return YES;
}

@end

