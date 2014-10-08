//
//  NoCRVHeader.h
//  NoCollectionView
//
//  Created by Nguyen Phi Hung on 10/8/14.
//  Copyright (c) 2014 NguyenPhiHung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoCRVHeader : UICollectionReusableView

@property(nonatomic, weak) IBOutlet UILabel *searchLabel;

-(void) setSearchText: (NSString*)searchText;
@end
