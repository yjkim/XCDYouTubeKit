//
// VCRAppDelegate.m
//
// Copyright (c) 2012 Dustin Barker
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "VCRAppDelegate.h"

#import "VCRViewController.h"
#import "VCR.h"

@implementation VCRAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [VCR start];
    NSString *cassettePath = [[NSBundle mainBundle] pathForResource:@"cassette" ofType:@"json"];
    [VCR loadCassetteWithContentsOfURL:[NSURL fileURLWithPath:cassettePath]];
    
    VCRCassetteViewController *cassetteViewController = [[VCRCassetteViewController alloc] init];
    cassetteViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    cassetteViewController.cassette = [VCR cassette];
    
    self.viewController = [[VCRViewController alloc] initWithNibName:@"VCRViewController" bundle:nil];
    self.viewController.cassetteViewController = cassetteViewController;
    
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];

    return YES;
}

@end
