//
//  ViewController.h
//  NoCollectionView
//
//  Created by Nguyen Phi Hung on 10/5/14.
//  Copyright (c) 2014 NguyenPhiHung. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Flickr, FlickrPhoto;





@interface ViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UIToolbar *toolBar;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *shareButton;
@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, strong) NSMutableDictionary *searchResults;
@property (nonatomic, strong) NSMutableArray *searches;
@property (nonatomic, strong) Flickr *flickr;

- (IBAction)shareButtonDidChoose:(id)sender;


@end

