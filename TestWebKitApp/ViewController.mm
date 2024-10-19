//
//  ViewController.m
//  WebKitTestCaseTemplate
//
//  Created by Darryl Pogue on 2021-05-31.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *statusBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    auto configuration = [[WKWebViewConfiguration alloc] init];
    auto webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 500) configuration:configuration];
    webView.scrollView.delegate = self;
    if (@available(iOS 16.4, *)) {
        webView.inspectable = YES;
    }

    [webView loadRequest:[NSURLRequest requestWithURL:[NSBundle.mainBundle URLForResource:@"testcase" withExtension:@"html" subdirectory:@"TestWebKitApp.resources"]]];

    [webView addObserver:self forKeyPath:@"themeColor" options:NSKeyValueObservingOptionInitial context:nil];

    self.view = webView;

    self.statusBar = [[UIView alloc] init];
    self.statusBar.translatesAutoresizingMaskIntoConstraints = NO;

    [self.view addSubview:self.statusBar];

    [self.statusBar.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.statusBar.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.statusBar.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    [self.statusBar.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (@available(iOS 15.0, *)) {
        if (self.statusBar) {
            self.statusBar.backgroundColor = ((WKWebView *)self.view).themeColor;
        }
    }
}

- (void)scrollViewDidChangeAdjustedContentInset:(UIScrollView *)scrollView
{
    self.statusBar.hidden = (scrollView.contentInsetAdjustmentBehavior == UIScrollViewContentInsetAdjustmentNever);
}

@end
