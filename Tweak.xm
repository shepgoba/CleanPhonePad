//CleanPhonePad 1.0 (shepgoba)
#import <substrate.h>
#define PREFERENCES @"/var/mobile/Library/Preferences/com.shepgoba.cleanphonepadprefs.plist"

static BOOL enabled;
static double radiusNumButtons;
static double radiusCallButton;
static BOOL prefsLoaded = NO;
@interface PHHandsetDialerNumberPadButton : UIControl
@property (retain) UIView * circleView; 
@end

@implementation PHHandsetDialerNumberPadButton
@synthesize circleView=_circleView;
@end

@interface PHAbstractDialerView : UIView
@property (nonatomic,retain) UIControl * callButton;   
@end

@implementation PHAbstractDialerView
@synthesize callButton=_callButton;
@end

static void initPrefs() //big thanks to noisyflake for preference loading
{

	NSString *pathToPrefs = @"/User/Library/Preferences/com.shepgoba.cleanphonepadprefs.plist";
	NSString *pathDefault = @"/Library/PreferenceBundles/cleanphonepadprefs.bundle/defaults.plist";
	NSFileManager *fileManager = [NSFileManager defaultManager];
	
	if (![fileManager fileExistsAtPath:path]) {
		[fileManager copyItemAtPath:pathDefault toPath:pathToPrefs error:nil];
	}
}

static void loadPrefs()
{
	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PREFERENCES];

	if (prefs) {
		enabled = ( [prefs objectForKey:@"enabled"] ? [[prefs objectForKey:@"enabled"] boolValue] : YES );
		radiusNumButtons = ( [prefs objectForKey:@"radiusNumButtons"] ? [[prefs objectForKey:@"radiusNumButtons"] doubleValue] : 0 );
		radiusCallButton = ( [prefs objectForKey:@"radiusCallButton"] ? [[prefs objectForKey:@"radiusCallButton"] doubleValue] : 0 );
		prefsLoaded = YES;
	}
	[prefs release];
}

%hook TPDialerNumberPad
	-(void) _layoutGrid
	{
		%orig;
		if (enabled)
		{
			for (PHHandsetDialerNumberPadButton *button in [self subviews])
			{
				button.circleView.layer.cornerRadius = radiusNumButtons;
			}
		}
	}
%end 

@interface PHHandsetDialerView : PHAbstractDialerView
@end
@interface PHBottomBarButton : UIButton
@end
%hook PHHandsetDialerView
	-(void) updateContraintsForStatusBar
	{
		%orig;
		if (enabled)
		{
			for (PHBottomBarButton *button in [self subviews])
			{
				button.layer.cornerRadius = radiusCallButton;
			}
		}
	}
%end

%ctor {
	initPrefs();
	loadPrefs();
}
