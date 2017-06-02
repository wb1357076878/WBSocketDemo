//
//  ViewController.m
//  WBSocketDemo
//
//  Created by qinian-mac on 2017/2/18.
//  Copyright © 2017年 qinian-macf. All rights reserved.
//

#import "ViewController.h"
#import "WBSocketConnection.h"

@interface ViewController ()<WBSocketConnectionDelegate>
{
    NSString *_serverHost;
    int _serverPort;
    WBSocketConnection *_connection;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _serverHost = @"www.baidu.com";
    _serverPort = 80;
    [self openConnection];
}

#pragma mark - WBSocketConnection method

- (void)openConnection {
    [self closeConnection];
    _connection = [[WBSocketConnection alloc] init];
    _connection.delegate = self;
    [_connection connectWithHost:_serverHost port:_serverPort];
}

- (void)closeConnection {
    if (_connection) {
        _connection.delegate = nil;
        [_connection disconnect];
        _connection = nil;
    }
}

#pragma mark - WBSocketConnectionDelegate method

- (void)didDisconnectWithError:(NSError *)error {
    WBSocketLog(@"didDisconnectWithError...");
}

- (void)didConnectToHost:(NSString *)host port:(uint16_t)port {
    WBSocketLog(@"didConnectToHost...");
}

- (void)didReceiveData:(NSData *)data tag:(long)tag {
    WBSocketLog(@"didReceiveData...");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
