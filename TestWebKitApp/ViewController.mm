//
//  ViewController.m
//  WebKitTestCaseTemplate
//
//  Created by Darryl Pogue on 2021-05-31.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    auto configuration = [[WKWebViewConfiguration alloc] init];
    auto webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 500) configuration:configuration];

    [webView loadRequest:[NSURLRequest requestWithURL:[NSBundle.mainBundle URLForResource:@"testcase" withExtension:@"html" subdirectory:@"TestWebKitApp.resources"]]];


    self.view = webView;
}


@end
