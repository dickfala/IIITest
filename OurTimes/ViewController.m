//
//  ViewController.m
//  OurTimes
//
//  Created by 洪坤展 on 2015/9/24.
//  Copyright © 2015年 Hong Kun Zhan. All rights reserved.
//  git source 

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calenderButton:(id)sender {
}

- (IBAction)noteButton:(id)sender {
}

- (IBAction)mapButton:(id)sender {
    
    [self presentToStoryBoardWithName:@"Map" VCName:@"MapViewController"];
}

-(void)presentToStoryBoardWithName:(NSString*)name
                     VCName:(NSString*)VCName{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    
    id targetVC = [storyboard instantiateViewControllerWithIdentifier:VCName];
    
    [self presentViewController:targetVC animated:true completion:nil];
}

-(void)pushToStoryBoardWithName:(NSString*)name
                      VCName:(NSString*)VCName{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    
    id targetVC = [storyboard instantiateViewControllerWithIdentifier:VCName];
    
    [self.navigationController pushViewController:targetVC animated:true];
}


@end
