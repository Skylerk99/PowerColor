#import <Preferences/Preferences.h>
#define powercolorPath @"/User/Library/Preferences/com.skylerk99.powercolor.plist"
#import <libcolorpicker.h>

@interface powercolorListController: PSListController {
}
@end

@implementation powercolorListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"powercolor" target:self] retain];
        UIBarButtonItem *previewButton([[UIBarButtonItem alloc] initWithTitle:@"Respring" style:UIBarButtonItemStyleDone target:self action:@selector(kill:)]);
        previewButton.tag = 1;
        [[self navigationItem] setRightBarButtonItem:previewButton];
        [previewButton release];
    }
    return _specifiers;
    
    
}


- (void)kill:(id)sender {
    system("cd /var/mobile/Library/Caches/com.apple.UIStatusBar; rm -R -f images; rm -f version; killall -9 SpringBoard");  //clears status bar cache + respring.

}


-(id) readPreferenceValue:(PSSpecifier*)specifier {
    NSDictionary *powercolorSettings = [NSDictionary dictionaryWithContentsOfFile:powercolorPath];
    if (!powercolorSettings[specifier.properties[@"key"]]) {
        return specifier.properties[@"default"];
    }
    return powercolorSettings[specifier.properties[@"key"]];
}

-(void) setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier {
    NSMutableDictionary *defaults = [NSMutableDictionary dictionary];
    [defaults addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:powercolorPath]];
    [defaults setObject:value forKey:specifier.properties[@"key"]];
    [defaults writeToFile:powercolorPath atomically:YES];
    //  NSDictionary *powercolorSettings = [NSDictionary dictionaryWithContentsOfFile:powercolorPath];
    CFStringRef toPost = (CFStringRef)specifier.properties[@"PostNotification"];
    if(toPost) CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), toPost, NULL, NULL, YES);
}

-(void)donate {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=2ZWUNWDPR6RDE&lc=US&item_name=&item_number=Skylerk99&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donateCC_LG%2egif%3aNonHosted"]];
}

- (void)viewWillAppear:(BOOL)animated {
    [self reload];
}

@end


@interface ResetPCListController: PSListController {
}
@end

@implementation ResetPCListController
- (id)specifiers {
    if(_specifiers == nil) {
        _specifiers = [[self loadSpecifiersFromPlistName:@"ResetPC" target:self] retain];
        
        UIBarButtonItem *previewButton([[UIBarButtonItem alloc] initWithTitle:@"Respring" style:UIBarButtonItemStyleDone target:self action:@selector(kill:)]);
        previewButton.tag = 1;
        [[self navigationItem] setRightBarButtonItem:previewButton];
        [previewButton release];
    }
    return _specifiers;
}

- (void)reset {
    [[NSFileManager defaultManager] removeItemAtURL: [NSURL fileURLWithPath: powercolorPath] error: nil];
    [self reload];
    CFNotificationCenterRef r = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(r, (CFStringRef)@"com.skylerk99.powercolor/prefsChanged", NULL, NULL, true);
}

- (void)viewWillAppear:(BOOL)animated {
    [self reload];
}

- (void)kill:(id)sender {
    system("cd /var/mobile/Library/Caches/com.apple.UIStatusBar; rm -R -f images; rm -f version; killall -9 SpringBoard");
}

@end

@interface AdvancedPCListController: PSListController {
}
@end

@implementation AdvancedPCListController
- (id)specifiers {
    if(_specifiers == nil) {
        _specifiers = [[self loadSpecifiersFromPlistName:@"AdvancedPC" target:self] retain];
        
        UIBarButtonItem *previewButton([[UIBarButtonItem alloc] initWithTitle:@"Respring" style:UIBarButtonItemStyleDone target:self action:@selector(kill:)]);
        previewButton.tag = 1;
        [[self navigationItem] setRightBarButtonItem:previewButton];
        [previewButton release];
    }
    return _specifiers;
}

- (void)kill:(id)sender {
    system("cd /var/mobile/Library/Caches/com.apple.UIStatusBar; rm -R -f images; rm -f version; killall -9 SpringBoard");
}


- (void)viewWillAppear:(BOOL)animated {
    [self reload];
}

-(id) readPreferenceValue:(PSSpecifier*)specifier {
    NSDictionary *powercolorSettings = [NSDictionary dictionaryWithContentsOfFile:powercolorPath];
    if (!powercolorSettings[specifier.properties[@"key"]]) {
        return specifier.properties[@"default"];
    }
    return powercolorSettings[specifier.properties[@"key"]];
}

-(void) setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier {
    NSMutableDictionary *defaults = [NSMutableDictionary dictionary];
    [defaults addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:powercolorPath]];
    [defaults setObject:value forKey:specifier.properties[@"key"]];
    [defaults writeToFile:powercolorPath atomically:YES];
    //  NSDictionary *powercolorSettings = [NSDictionary dictionaryWithContentsOfFile:powercolorPath];
    CFStringRef toPost = (CFStringRef)specifier.properties[@"PostNotification"];
    if(toPost) CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), toPost, NULL, NULL, YES);
}



@end



// vim:ft=objc
