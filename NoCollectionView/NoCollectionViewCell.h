//
//  NoCollectionViewCell.h
//  NoCollectionView
//
//  Created by Nguyen Phi Hung on 10/7/14.
//  Copyright (c) 2014 NguyenPhiHung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@class FlickrPhoto;

@interface NoCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UIImageView *imageCell;
@property (nonatomic, strong) FlickrPhoto *photo;

@end
