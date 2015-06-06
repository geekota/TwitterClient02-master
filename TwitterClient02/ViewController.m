//
//  ViewController.m
//  TwitterClient02
//
//  Created by Fukazawa kota on 2015/05/27.
//  Copyright (c) 2015年 Kota Fukazawa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *accountDisplayLabel;
@property (weak, nonatomic) IBOutlet UIButton *tweetActionButton;

@property (nonatomic, strong) ACAccountStore *accountStore;
@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSArray *twitterAccounts;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    self.accountStore = [[ACAccountStore alloc] init];//ACAccountクラスをアカウント取得のために使用。
    ACAccountType *twitterType =
    [self.accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    [self.accountStore requestAccessToAccountsWithType:twitterType
    options:NULL
    completion:^(BOOL granted, NSError *error) {
        
        if (granted) {
        
    self.twitterAccounts = [self.accountStore accountsWithAccountType:twitterType];
        
        
        if (self.twitterAccounts.count > 0) {
            
            NSLog(@"`%@" ,self.twitterAccounts);
    ACAccount *account = self.twitterAccounts[0];
            
            
    self.identifier = account.identifier;
            
    dispatch_async(dispatch_get_main_queue(), ^{
    self.accountDisplayLabel.text = account.username;
                                                    });
      } else {
    
          dispatch_async(dispatch_get_main_queue(), ^{
    self.accountDisplayLabel.text = @"アカウントなし";
                                                     });
    }
            
    } else {
    NSLog(@"Account Error: %@", [error localizedDescription]);
    
        dispatch_async(dispatch_get_main_queue(), ^{
    self.accountDisplayLabel.text = @"アカウント認証エラー";
                                });
                                }
                                }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tweetButton:(id)sender {
    
    SLComposeViewController *controller
    =[SLComposeViewController
      composeViewControllerForServiceType:SLServiceTypeTwitter ];
    [self presentViewController:controller
                       animated:YES completion:NULL];//シンプルなツイート画面の表示コード
    

}

- (IBAction)setAccountAction:(id)sender {
    
    UIActionSheet *sheet = [[UIActionSheet alloc] init];
    sheet.delegate = self;
    
    sheet.title = @"選択してください。";
    for (ACAccount *account in self.twitterAccounts) {
        [sheet addButtonWithTitle:account.username];
    }
    [sheet addButtonWithTitle:@"キャンセル"];
    sheet.cancelButtonIndex = self.twitterAccounts.count;
    sheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.twitterAccounts.count > 0) {
        if (buttonIndex != self.twitterAccounts.count) {
            ACAccount *account = self.twitterAccounts[buttonIndex];
            self.identifier = account.identifier;
            self.accountDisplayLabel.text = account.username;
            NSLog(@"Account set! %@", account.username);
        }
        else {
            NSLog(@"cancel!");
        }
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"TimeLineSegue"]) {
        
        TimeLineTableViewController *timeLineTableViewController = segue.destinationViewController;
        if ([timeLineTableViewController isKindOfClass:[TimeLineTableViewController class]]) {
            timeLineTableViewController.identifier = self.identifier;
        }
   // } else if ([segue.identifier isEqualToString:@"TweetSegue"]) {
        //TweetSheetViewController *tweetSheetViewController = segue.destinationViewController;
        //if ([tweetSheetViewController isKindOfClass:[tweetSheetViewController class]]) {
           // tweetSheetViewController.identifier = self.identifier;
      //  }
    }
}


    
    
    @end
