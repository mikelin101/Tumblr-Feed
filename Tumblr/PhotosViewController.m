//
//  ViewController.m
//  Tumblr
//
//  Created by  Michael Lin on 1/25/17.
//  Copyright © 2017 codepath. All rights reserved.
//

#import "ImageCell.h"
#import "PhotosViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface PhotosViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *photoTableView;

@property (strong, nonatomic) NSArray *posts;

@end

@implementation PhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.photoTableView.dataSource = self;
    
    NSString *apiKey = @"Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV";
    NSString *urlString =
    [@"https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=" stringByAppendingString:apiKey];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    NSURLSession *session =
    [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]
                                  delegate:nil
                             delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:^(NSData * _Nullable data,
                                                                NSURLResponse * _Nullable response,
                                                                NSError * _Nullable error) {
                                                if (!error) {
                                                    NSError *jsonError = nil;
                                                    NSDictionary *responseDictionary =
                                                    [NSJSONSerialization JSONObjectWithData:data
                                                                                    options:kNilOptions
                                                                                      error:&jsonError];
                                                    NSLog(@"Response: %@", responseDictionary);
                                                    
                                                    self.posts = responseDictionary[@"response"][@"posts"];
                                                    [self.photoTableView reloadData];
                                                } else {
                                                    NSLog(@"An error occurred: %@", error.description);
                                                }
                                            }];
    
    self.photoTableView.rowHeight = 320;
    [task resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell"];    
    [cell.image setImageWithURL:[NSURL URLWithString:self.posts[indexPath.row][@"photos"][0][@"original_size"][@"url"]]];
    
    return cell;
}

@end
