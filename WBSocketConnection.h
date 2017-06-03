//
//  WBSocketConnection.h
//  WBSocketDemo
//
//  Created by qinian-mac on 2017/2/18.
//  Copyright © 2017年 qinian-macf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBSocketConfig.h"

@protocol WBSocketConnectionDelegate <NSObject>

- (void)didDisconnectWithError:(NSError *)error;

- (void)didConnectToHost:(NSString *)host port:(uint16_t)port;

- (void)didReceiveData:(NSData *)data tag:(long)tag;

@end

@interface WBSocketConnection : NSObject

@property (weak, nonatomic) id<WBSocketConnectionDelegate> delegate;

- (void)connectWithHost:(NSString *)hostName port:(int)port;
- (void)disconnect;

- (BOOL)isConnected;
- (void)readDataWithTimeout:(NSTimeInterval)timeout tag:(long)tag;
- (void)writeData:(NSData *)data timeout:(NSTimeInterval)timeout tag:(long)tag;

@end
