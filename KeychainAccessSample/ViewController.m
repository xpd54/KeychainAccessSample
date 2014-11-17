//
//  ViewController.m
//  KeychainAccessSample
//
//  Created by Ravi Prakash on 17/11/14.
//  Copyright (c) 2014 helpshift. All rights reserved.
//

#import "ViewController.h"
#import "KeychainAccess.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    KeychainAccess *keychainAccess = [[KeychainAccess alloc] init];
    NSDictionary *helpData = @{@"test":@"First",
                              @"test2":@"Second"};
    
    [keychainAccess setValue:helpData forKey:@"help"];
    
    // data from keychain
    NSLog(@"%@",[keychainAccess getValueForKey:@"help"]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
