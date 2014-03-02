//
//  RITViewController.m
//  21AnimationsTestHW01
//
//  Created by Pronin Alexander on 02.03.14.
//  Copyright (c) 2014 Pronin Alexander. All rights reserved.
//

#import "RITViewController.h"

@interface RITViewController ()

@end

@implementation RITViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self moveView:self.views];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helper methosd

- (UIColor*) randomColor {
    
    CGFloat r = (CGFloat)(arc4random() % 256) / 255;
    CGFloat g = (CGFloat)(arc4random() % 256) / 255;
    CGFloat b = (CGFloat)(arc4random() % 256) / 255;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}

- (void) moveView:(NSArray*) views {
    
    NSUInteger i = 0;
    NSUInteger animationOption = 0;
    
    for (UIView* view in views) {
        
        // define one of the animation options
        switch (i % 4) {
            
            case 0:
                animationOption = UIViewAnimationOptionCurveEaseInOut;
                break;
                
            case 1:
                animationOption = UIViewAnimationOptionCurveEaseIn;
                break;
                
            case 2:
                animationOption = UIViewAnimationOptionCurveEaseOut;
                break;
                
            case 3:
                animationOption = UIViewAnimationOptionCurveLinear;
                break;
        }
        
        i++;
        
        CGFloat translationDistance = CGRectGetWidth(self.view.bounds) - view.center.x - CGRectGetWidth(view.frame) / 2;
        
        [UIView animateWithDuration:5.f
                              delay:0
                            options:animationOption | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                         animations:^{
                             
                             view.backgroundColor = [self randomColor];
                             
                             CGAffineTransform translation = CGAffineTransformMakeTranslation(translationDistance, 0);
                             view.transform = translation;
                         }
                         completion:^(BOOL finished) {
                             
                         }];
   }
}

@end
