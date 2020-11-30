//
//  AppDelegate.m
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/25.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
  [NSURLCache setSharedURLCache:[[NSURLCache alloc] initWithMemoryCapacity:60 * 1024 * 1024
                                                              diskCapacity:500 * 1024 * 1024
                                                                  diskPath:nil]];
  
  self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
  self.seachViewController = [[SeachViewController alloc] initWithNibName:nil bundle:nil];
  self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:self.seachViewController];
  [self.window makeKeyAndVisible];
  
  return YES;
}


@end
