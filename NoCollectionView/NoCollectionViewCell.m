//
//  NoCollectionViewCell.m
//  NoCollectionView
//
//  Created by Nguyen Phi Hung on 10/7/14.
//  Copyright (c) 2014 NguyenPhiHung. All rights reserved.
//

#import "NoCollectionViewCell.h"
#import "FlickrPhoto.h"

@implementation NoCollectionViewCell

-(void) setPhoto:(FlickrPhoto *)photo
{
    if (_photo != photo) {
        _photo = photo;
    }
    self.imageCell.image = photo.thumbnail;
}

@end
