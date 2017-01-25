//
//  PhotoDetailsViewController.m
//  Tumblr
//
//  Created by  Michael Lin on 1/25/17.
//  Copyright © 2017 codepath. All rights reserved.
//

#import "PhotoDetailsViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@implementation PhotoDetailsViewController

- (void)viewDidLoad {
    [self.imageView setImageWithURL:self.photoUrl];
}

@end