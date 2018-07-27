//
//  JustepX5
//
//  Created by 007slm(007slm@163.com)
//
//  Created by 007slm on 12-6-5.
//  Copyright (c) 2012年 Justep. All rights reserved.
// on 12-6-8.
//

#import <UIKit/UIKit.h>
#import "JustepAppPlugin.h" 



@interface JustepAppAccelerometer : JustepAppPlugin<UIAccelerometerDelegate> {
	bool _bIsRunning;
	
}

- (void)startWithDict:(NSMutableDictionary*)options;


- (void)stop;

@end


