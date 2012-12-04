//
//  AppDelegate.m
//  DivClouds
//
//  Created by LI Haiyun on 11/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "YISplashScreen.h"
#import "YISplashScreen+Migration.h" // optional
#import "YISplashScreenAnimation.h"

#define SHOWS_MIGRATION_ALERT   0   // 0 or 1
#define ANIMATION_TYPE          2   // 0-3

@implementation AppDelegate

@synthesize window = _window;
@synthesize isLogin;
@synthesize userName;

#pragma mark -

#pragma mark UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    //initial default values
    isLogin=@"FALSE";
    
    // show splash
    [YISplashScreen show];
    //hidden splash after 3seconds
    [self performSelector:@selector(hidden) withObject:nil afterDelay:0.5];
    
    return YES;
}
-(void) hidden{
    
#if SHOWS_MIGRATION_ALERT
    void (^migrationBlock)(void) = ^{
        
        //
        // NOTE: add CoreData migration logic here
        //
        sleep(1);
        
    };
#else
    void (^migrationBlock)(void) = nil;
#endif
    
    [YISplashScreen waitForMigration:migrationBlock completion:^{
        
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
        
#if ANIMATION_TYPE == 0
        
        // simple fade out
        [YISplashScreen hide];
        
#elif ANIMATION_TYPE == 1
        
        // manual
        [YISplashScreen hideWithAnimations:^(CALayer* splashLayer, CALayer* rootLayer) {
            
            [CATransaction begin];
            [CATransaction setAnimationDuration:0.7];
            [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
            
            splashLayer.position = CGPointMake(splashLayer.position.x, splashLayer.position.y-splashLayer.bounds.size.height);
            
            [CATransaction commit];
        }];
        
#elif ANIMATION_TYPE == 2
        
        // page curl
        [YISplashScreen hideWithAnimations:[YISplashScreenAnimation pageCurlAnimation]];
        
#else
        
        // cube
        [YISplashScreen hideWithAnimations:[YISplashScreenAnimation cubeAnimation]];
        
#endif
        
    }];
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
