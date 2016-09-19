//
//  ViewController.m
//  FastestRPM
//
//  Created by Cay Cornelius on 18/09/16.
//  Copyright © 2016 Cornelius.Media. All rights reserved.
//

#import "ViewController.h"

#define RADIANS(degrees) (((degrees) * M_PI) / 180.0)
#define MIN_DEGREES -225.0
#define MAX_DEGREES 50.0
#define RANGE_DEGREES (MAX_DEGREES - MIN_DEGREES)

#define LIMIT_VELOCITY 7500.0 // Points per second
#define LIMIT_VELOCITY_DELTA 10.0 // Points per second

#define RESET_DELAY 0.1 // Seconds
#define VELOCITY_DELAY 0.1 // Seconds

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Adding speedometer image
    
    UIImageView *speedometerImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    speedometerImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    speedometerImageView.image = [UIImage imageNamed:@"speedometer"];
    
    [self.view addSubview:speedometerImageView];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:speedometerImageView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:speedometerImageView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:speedometerImageView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:250]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:speedometerImageView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:250]];
    
    // Adding needle image
    
    UIImageView *needleImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    needleImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    needleImageView.image = [UIImage imageNamed:@"needle"];
    
    [self.view addSubview:needleImageView];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:needleImageView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:speedometerImageView
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:needleImageView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:speedometerImageView
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:needleImageView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:140]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:needleImageView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.0
                                                           constant:140]];
    
    needleImageView.layer.position = CGPointMake(speedometerImageView.bounds.size.width/2.0,
                                    speedometerImageView.bounds.size.height/2.0);
    
    needleImageView.layer.anchorPoint = CGPointMake(0.0, 0.5);

    [needleImageView setTransform:CGAffineTransformMakeRotation(RADIANS(MIN_DEGREES))];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
