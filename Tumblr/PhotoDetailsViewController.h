//
//  PhotoDetailsViewController.h
//  Tumblr
//
//  Created by  Michael Lin on 1/25/17.
//  Copyright © 2017 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) NSURL *photoUrl;

@end
