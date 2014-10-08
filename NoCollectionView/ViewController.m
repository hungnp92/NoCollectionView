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
#import "NoCollectionViewCell.h"
#import "NoCRVHeader.h"
#import "NoPhotoViewController.h"



@interface ViewController () <UITextFieldDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic) BOOL isSharing;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Init Flick object
    self.flickr = [[Flickr alloc] init];
    self.searchResults = [@{} mutableCopy];
    self.searches = [@[] mutableCopy];
   // [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"FlickrCell"];
    
//    self.collectionView.delegate = self;
//    self.collectionView.dataSource = self;
    // Do any additional setup after loading the view, typically from a nib.
//    _isSharing = NO;
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- My custom code
- (IBAction)shareButtonTapped:(id)sender
{
    //do something
}


#pragma mark- UITextfieldDelegate methobs
- (BOOL) textFieldShouldReturn: (UITextField *)textField
{
    [self.flickr searchFlickrForTerm:textField.text completionBlock:^(NSString *searchTerm, NSArray *results, NSError *error) {
        if(results && [results count] > 0) {
            // 2
            if(![self.searches containsObject:searchTerm]) {
                NSLog(@"Found %d photos matching %@", [results count],searchTerm);
                [self.searches insertObject:searchTerm atIndex:0];
                self.searchResults[searchTerm] = results; }
            // 3
            dispatch_async(dispatch_get_main_queue(), ^{
                // Placeholder: reload collectionview data
                [_collectionView reloadData];
            });
        } else { // 1
            NSLog(@"Error searching Flickr: %@", error.localizedDescription);
        } }];
    [textField resignFirstResponder];
    return YES;
}

#pragma mark- UICollectionView protocol methobs
-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSString *searchTerm = self.searches[section];
    return [self.searchResults[searchTerm] count];
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.searches count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NoCollectionViewCell *cell = (NoCollectionViewCell*) [collectionView dequeueReusableCellWithReuseIdentifier:@"FlickrCell" forIndexPath:indexPath];
    NSString *searchTerm = self.searches[indexPath.section];
    cell.photo = self.searchResults[searchTerm][indexPath.row];
    return cell;
}

-(UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    NoCRVHeader *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"PhotoHeader" forIndexPath:indexPath];
    NSString *searchTerm = _searches[indexPath.section];
    [headerView setSearchText: searchTerm];
    return headerView;
}

#pragma mark- UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (!_isSharing) {
        NSString *seachTerm = self.searches[indexPath.section];
        FlickrPhoto *photo = _searchResults[seachTerm][indexPath.row];
        [self performSegueWithIdentifier:@"ShowFlickrPhoto" sender:photo];
        [self.collectionView deselectItemAtIndexPath:indexPath animated:YES];
    } else {
        //
    }
    
    
}
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark- Segue
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ShowFlickrPhoto"])
    {
        NoPhotoViewController *flickrPhotoViewController = segue.destinationViewController;
        flickrPhotoViewController.flickrPhoto = sender;
    }
    
}


#pragma mark- UICollectionViewDelegateFlowLayout
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *searchTerm = self.searches[indexPath.section];
    FlickrPhoto *flickrPhoto = self.searchResults[searchTerm][indexPath.row];
    CGSize retval = flickrPhoto.thumbnail.size.width > 0 ? flickrPhoto.thumbnail.size: CGSizeMake(100, 100);
    retval.height += 5;
    retval.width +=5;
    return retval;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(50, 20, 50, 20);
}

@end


