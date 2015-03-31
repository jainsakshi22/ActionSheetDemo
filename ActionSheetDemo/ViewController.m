//
//  ViewController.m
//  ActionSheetDemo
//
//  Created by LetsGoMo Labs on 3/24/15.
//  Copyright (c) 2015 LetsGoMo Labs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)showNormalActionSheet:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"What do you want to do with the file?"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:@"Delete it"
                                                    otherButtonTitles:@"Copy", @"Move", @"Duplicate", nil];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        [actionSheet showFromRect:[(UIButton *)sender frame] inView:self.view animated:YES];
    }
    else
    {
        [actionSheet showInView:self.view];
    }
    actionSheet.tag = 100;
}

- (IBAction)showDeleteConfirmation:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Really delete the selected contact?"
                                                             delegate:self
                                                    cancelButtonTitle:@"No, I changed my mind"
                                               destructiveButtonTitle:@"Yes, delete it"
                                                    otherButtonTitles:nil];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        [actionSheet showFromRect:[(UIButton *)sender frame] inView:self.view animated:YES];
    }
    else
    {
    [actionSheet showInView:self.view];
    }
    
    actionSheet.tag = 200;
}

- (IBAction)showColorsActionSheet:(id)sender
{
    //App crashes because of no Cancel button.
    NSString *cancelTitle = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? @"Cancel" : nil;
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Pick a color:"
                                                             delegate:self
                                                    cancelButtonTitle:cancelTitle
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Red", @"Green", @"Blue", @"Orange", @"Purple", nil];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        [actionSheet showFromRect:[(UIButton *)sender frame] inView:self.view animated:YES];
    }
    else
    {
    [actionSheet showInView:self.view];
    }
    
    actionSheet.tag = 300;
}

#pragma mark - UIActionSheetDelegate methods

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 100)
    {
        NSLog(@"The Normal Action Sheet");
    }
    else if (actionSheet.tag == 200)
    {
        NSLog(@"The Delete confirmation action sheet.");
    }
    else
    {
        NSLog(@"The Color selection action sheet.");
    }
    
    NSLog(@"Index = %ld - Title = %@", (long)buttonIndex, [actionSheet buttonTitleAtIndex:buttonIndex]);
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 300) {
        NSLog(@"From didDismissWithButtonIndex - Selected Color: %@", [actionSheet buttonTitleAtIndex:buttonIndex]);
    }
}

-(void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (actionSheet.tag == 300) {
        NSLog(@"From willDismissWithButtonIndex - Selected Color: %@", [actionSheet buttonTitleAtIndex:buttonIndex]);
    }
}


@end
