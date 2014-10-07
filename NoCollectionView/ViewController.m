//
//  ViewController.m
//  NoCollectionView
//
//  Created by Nguyen Phi Hung on 10/5/14.
//  Copyright (c) 2014 NguyenPhiHung. All rights reserved.
//

#import "ViewController.h"
#import "Flickr.h"
#import "FlickrPhoto.h"

#define kFlickrAPIKey = @"6593783efea8e7f6dfc6b70bc03d2afb"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Init Flick object
    
    self.searchResults = [@{} mutableCopy];
    self.searches = [@{} mutableCopy];
    self.flickr = [[Flickr alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- My custom code
- (IBAction)shareButtonDidChoose:(id)sender
{
    //do something
}


#pragma mark- UITextfieldDelegate methobs
- (BOOL) textFieldShouldReturn: (UITextField *)textField
{
    [self.flickr searchFlickrForTerm:textField.text
    completionBlock:^ (NSString *searchTerm,NSArray *results, NSError *error)
    {
        if(results && [results count] > 0) {
            if(![self.searches containsObject:searchTerm]) {
                NSLog(@"Found %d photos matching %@", [results count],searchTerm);
                [self.searches insertObject:searchTerm atIndex:0];
                self.searchResults[searchTerm] = results; }
            // 3
            dispatch_async(dispatch_get_main_queue(), ^{
                // Placeholder: reload collectionview data
            });
        } else { // 1
            NSLog(@"Error searching Flickr: %@", error.localizedDescription);
        }
    }];
    
    [textField resignFirstResponder];
    return YES;
}

@end


