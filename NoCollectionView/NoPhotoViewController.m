//
//  NoPhotoViewController.m
//  NoCollectionView
//
//  Created by Nguyen Phi Hung on 10/8/14.
//  Copyright (c) 2014 NguyenPhiHung. All rights reserved.
//

#import "NoPhotoViewController.h"
#import "Flickr.h"
#import "FlickrPhoto.h"

@interface NoPhotoViewController ()
@property(weak) IBOutlet UIImageView *imageView;

-(IBAction)done:(id)sender;
@end

@implementation NoPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self.imageView reloadInputViews];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)done:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{}];
}

-(void)viewDidAppear:(BOOL)animated
{
    if(self.flickrPhoto.largeImage) {
        self.imageView.image = self.flickrPhoto.largeImage;
        NSLog(@"Load large image");
    } else {
        // 2
        self.imageView.image = self.flickrPhoto.thumbnail;
        // 3
        [Flickr loadImageForPhoto:self.flickrPhoto thumbnail:NO completionBlock:^(UIImage *photoImage, NSError *error) {
            if(!error) { // 4
                dispatch_async(dispatch_get_main_queue(), ^{ self.imageView.image =
                    self.flickrPhoto.largeImage;
                });
                NSLog(@"Download large image");
            }
        }];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
