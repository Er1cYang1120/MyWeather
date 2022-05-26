//
//  AppDelegate.m
//  Weather
//
//  Created by mao on 2022/5/22.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    WeatherViewController *weatherVC = [WeatherViewController new];
    UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:weatherVC];
    self.window.rootViewController = naVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
