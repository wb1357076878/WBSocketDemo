//
//  WBSocketConfig.h
//  WBSocketDemo
//
//  Created by qinian-mac on 2017/2/18.
//  Copyright © 2017年 qinian-macf. All rights reserved.
//

#ifndef WBSocketConfig_h
#define WBSocketConfig_h

#ifdef DEBUG
#define WBSocketDebug
#endif

#ifdef WBSocketDebug
#define WBSocketLog(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define WBSocketLog(format, ...)
#endif

#endif /* WBSocketConfig_h */
