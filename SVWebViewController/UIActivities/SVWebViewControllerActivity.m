//
//  SVWebViewControllerActivity.m
//  SVWeb
//
//  Created by Sam Vermette on 11/11/2013.
//
//

#import "SVWebViewControllerActivity.h"

@implementation SVWebViewControllerActivity

- (NSString *)activityType {
	return NSStringFromClass([self class]);
}

- (UIImage *)activityImage {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        UIImage *image = [UIImage imageNamed:[self.activityType stringByAppendingString:@"-iPad"]];
        // If if framework with swift
        if (!image) {
            NSString *resourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"Frameworks/SVWebViewController.framework/%@-iPad@2x.png", self.activityType]];
            image = [UIImage imageWithContentsOfFile:resourcePath];
        }
        return image;
    } else {
        UIImage *image = [UIImage imageNamed:self.activityType];
        // If if framework with swift
        if (!image) {
            NSString *resourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"Frameworks/SVWebViewController.framework/%@@2x.png", self.activityType]];
            image = [UIImage imageWithContentsOfFile:resourcePath];
        }
        return image;
    }
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
	for (id activityItem in activityItems) {
		if ([activityItem isKindOfClass:[NSURL class]]) {
			self.URLToOpen = activityItem;
		}
	}
}

@end
