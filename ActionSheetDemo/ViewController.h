//
//  ViewController.h
//  ActionSheetDemo
//
//  Created by LetsGoMo Labs on 3/24/15.
//  Copyright (c) 2015 LetsGoMo Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIActionSheetDelegate>

- (IBAction)showNormalActionSheet:(id)sender;
- (IBAction)showDeleteConfirmation:(id)sender;
- (IBAction)showColorsActionSheet:(id)sender;


@end

