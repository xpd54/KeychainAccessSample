//
//  KeychainAccess.h
//  KeychainAccessSample
//
//  Created by Ravi Prakash on 17/11/14.
//  Copyright (c) 2014 helpshift. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeychainAccess : NSObject
- (void)setValue:(id)data forKey:(NSString*)key;

- (id)getValueForKey:(NSString*)key;

- (void)deleteValueForKey:(NSString *)key;
@end
