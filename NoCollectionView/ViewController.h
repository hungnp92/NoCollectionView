//
//  ViewController.h
//  NoCollectionView
//
//  Created by Nguyen Phi Hung on 10/5/14.
//  Copyright (c) 2014 NguyenPhiHung. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Flickr, FlickrPhoto,NoCollectionViewCell, NoCRVHeader;

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIToolbar *toolBar;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *shareButton;
@property (nonatomic, weak) IBOutlet UITextField *textField;

//UICollectionView
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
//Flickr properties
@property (nonatomic, strong) NSMutableDictionary *searchResults;
@property (nonatomic, strong) NSMutableArray *searches;
@property (nonatomic, strong) Flickr *flickr;


- (IBAction)shareButtonTapped:(id)sender;


@end

