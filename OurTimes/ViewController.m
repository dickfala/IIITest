//
//  ViewController.m
//  OurTimes
//
//  Created by 洪坤展 on 2015/9/24.
//  Copyright © 2015年 Hong Kun Zhan. All rights reserved.
//

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
}

-(void)presentToStoryBoardWithName:(NSString*)name
                     segueName:(NSString*)segue{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    
    id targetVC = [storyboard instantiateViewControllerWithIdentifier:segue];
    
    [self presentViewController:targetVC animated:true completion:nil];
}

-(void)pushToStoryBoardWithName:(NSString*)name
                      segueName:(NSString*)segue{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    
    id targetVC = [storyboard instantiateViewControllerWithIdentifier:segue];
    
    [self.navigationController pushViewController:targetVC animated:true];
}


@end
