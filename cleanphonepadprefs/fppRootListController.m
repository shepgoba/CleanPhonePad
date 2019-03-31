#include "fppRootListController.h"

@implementation fppRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

- (void) openTwitter
{
	[[UIApplication sharedApplication] 
	openURL:[NSURL URLWithString:@"https://twitter.com/shepgoba"]
	options:@{}
	completionHandler:nil];

}
@end
