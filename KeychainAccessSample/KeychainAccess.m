//
//  KeychainAccess.m
//  KeychainAccessSample
//
//  Created by Ravi Prakash on 17/11/14.
//  Copyright (c) 2014 helpshift. All rights reserved.
//

#import "KeychainAccess.h"

@implementation KeychainAccess
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)key {
    NSMutableDictionary *querry =  [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (__bridge id)kSecClassGenericPassword, (__bridge id)kSecClass,
            key, (__bridge id)kSecAttrAccount,
            @"com.helpshift.test",(__bridge id)kSecAttrService,
            nil];
    
    return  querry;
}

- (void)setValue:(id)data forKey:(NSString*)key {
    NSMutableDictionary *keychainQuery = [KeychainAccess getKeychainQuery:key];
    SecItemDelete((__bridge CFDictionaryRef)keychainQuery);
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(__bridge id)kSecValueData];
    SecItemAdd((__bridge CFDictionaryRef)keychainQuery, NULL);
}

- (id)getValueForKey:(NSString *)key {
    id value = nil;
    NSMutableDictionary *keychainQuery = [KeychainAccess getKeychainQuery:key];
    //uncomment to see keychainQuery
    //NSLog(@"%@",keychainQuery);
    CFDataRef keyData = NULL;
    [keychainQuery setObject:(__bridge id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
    [keychainQuery setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    if (SecItemCopyMatching((__bridge CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
            value = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
    }
    return value;
}

- (void)deleteValueForKey:(NSString *)key {
    NSMutableDictionary *keychainQuery = [KeychainAccess getKeychainQuery:key];
    SecItemDelete((__bridge CFDictionaryRef)keychainQuery);
}


@end
