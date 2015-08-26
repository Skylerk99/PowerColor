#import "libcolorpicker.h" 

NSDictionary *pref = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.skylerk99.powercolor.plist"];

static BOOL enable = YES;
static BOOL custom = NO;


//New hook as of 8.1?
%hook UIStatusBarNewUIForegroundStyleAttributes
-(id) _batteryColorForCapacity:(double)arg1 lowCapacity:(double)arg2 charging:(bool)arg3
{
[[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
UIDevice *myDevice = [UIDevice currentDevice];
CGFloat currentLevel = (CGFloat)[myDevice batteryLevel] * 100;    
if (enable)
    {
        if (!custom)
        {
            if( currentLevel >= 95)
            {
                return[UIColor colorWithRed:0.29 green:0.82 blue:0.35 alpha:1.0];
            }
            
            else if( currentLevel >= 90)
            {
                return[UIColor colorWithRed:0.29 green:0.84 blue:0.29 alpha:1.0];
            }
            
            else if( currentLevel >= 85)
            {
                return[UIColor colorWithRed:0.34 green:0.85 blue:0.28 alpha:1.0];
            }
            
            else if( currentLevel >= 80)
            {
                return[UIColor colorWithRed:0.40 green:0.867 blue:0.271 alpha:1.0];
            }
            
            else if( currentLevel >= 75)
            {
                return[UIColor colorWithRed:0.463 green:0.878 blue:0.263 alpha:1.0];
            }
            
            else if( currentLevel >= 70)
            {
                return[UIColor colorWithRed:0.529 green:0.89 blue:0.255 alpha:1.0];
            }
            
            else if( currentLevel >= 65)
            {
                return[UIColor colorWithRed:0.60 green:0.906 blue:0.247 alpha:1.0];
            }
            
            else if( currentLevel >= 60)
            {
                return[UIColor colorWithRed:0.675 green:0.918 blue:0.239 alpha:1.0];
            }
            
            else if( currentLevel >= 55)
            {
                return[UIColor colorWithRed:0.753 green:0.933 blue:0.227 alpha:1.0];
            }
            
            else if( currentLevel >= 50)
            {
                return[UIColor colorWithRed:0.839 green:0.945 blue:0.22 alpha:1.0];
            }
            
            else if( currentLevel >= 45)
            {
                return[UIColor colorWithRed:0.929 green:0.957 blue:0.212 alpha:1.0];
            }
            
            else if( currentLevel >= 40)
            {
                return[UIColor colorWithRed:0.973 green:0.922 blue:0.20 alpha:1.0];
            }
            
            else if( currentLevel >= 35)
            {
                return[UIColor colorWithRed:0.945 green:0.776 blue:0.192 alpha:1.0];
            }
            
            else if( currentLevel >= 30)
            {
                return[UIColor colorWithRed:1.00 green:0.773 blue:0.18 alpha:1.0];
            }
            
            else if( currentLevel >= 25)
            {
                return[UIColor colorWithRed:0.98 green:0.667 blue:0.188 alpha:1.0];
            }
            
            else if( currentLevel >= 20)
            {
                return[UIColor colorWithRed:0.965 green:0.569 blue:0.196 alpha:1.0];
            }
            
            else if( currentLevel >= 15)
            {
                return[UIColor colorWithRed:0.945 green:0.478 blue:0.204 alpha:1.0];
            }
            
            else if( currentLevel >= 10)
            {
                return[UIColor colorWithRed:0.929 green:0.392 blue:0.212 alpha:1.0];
            }
            
            else if( currentLevel >= 5)
            {
                return[UIColor colorWithRed:0.91 green:0.314 blue:0.22 alpha:1.0];
            }
            
            else if( currentLevel >= 1.0)
            {
                return[UIColor colorWithRed:0.894 green:0.235 blue:0.224 alpha:1.0];
            }
            else
            {
               return %orig;
            }
        }
        else if (custom) 
	{
            if( currentLevel >= 95)
            {
                return LCPParseColorString([pref objectForKey:@"color1"], @"#4AD159");
            }
            
            else if( currentLevel >= 90)
            {
                return LCPParseColorString([pref objectForKey:@"color2"], @"#4AD64A");
            }
            
            else if( currentLevel >= 85)
            {
                return LCPParseColorString([pref objectForKey:@"color3"], @"#57D947");
            }
            
            else if( currentLevel >= 80)
            {
                return LCPParseColorString([pref objectForKey:@"color4"], @"#66DD45");
            }
            
            else if( currentLevel >= 75)
            {
                return LCPParseColorString([pref objectForKey:@"color5"], @"#76E043");
            }
            
            else if( currentLevel >= 70)
            {
                return LCPParseColorString([pref objectForKey:@"color6"], @"#87E341");
            }
            
            else if( currentLevel >= 65)
            {
                return LCPParseColorString([pref objectForKey:@"color7"], @"#99E73F");
            }
            
            else if( currentLevel >= 60)
            {
                return LCPParseColorString([pref objectForKey:@"color8"], @"#ACEA3D");
            }
            
            else if( currentLevel >= 55)
            {
                return LCPParseColorString([pref objectForKey:@"color9"], @"#C0EE3A");
            }
            
            else if( currentLevel >= 50)
            {
                return LCPParseColorString([pref objectForKey:@"color10"], @"#D6F138");
            }
            
            else if( currentLevel >= 45)
            {
                return LCPParseColorString([pref objectForKey:@"color11"], @"#EDF436");
            }
            
            else if( currentLevel >= 40)
            {
                return LCPParseColorString([pref objectForKey:@"color12"], @"#F8EB33");
            }
            
            else if( currentLevel >= 35)
            {
                return LCPParseColorString([pref objectForKey:@"color13"], @"#F1C631");
            }
            
            else if( currentLevel >= 30)
            {
                return LCPParseColorString([pref objectForKey:@"color14"], @"#FFC52E");
            }
            
            else if( currentLevel >= 25)
            {
                return LCPParseColorString([pref objectForKey:@"color15"], @"#FAAD30");
            }
            
            else if( currentLevel >= 20)
            {
                return LCPParseColorString([pref objectForKey:@"color16"], @"#F69132");
            }
            
            else if( currentLevel >= 15)
            {
                return LCPParseColorString([pref objectForKey:@"color17"], @"#F17A34");
            }
            
            else if( currentLevel >= 10)
            {
                return LCPParseColorString([pref objectForKey:@"color18"], @"#ED6436");
            }
            
            else if( currentLevel >= 5)
            {
                return LCPParseColorString([pref objectForKey:@"color19"], @"#E85038");
            }
            
            else if( currentLevel >= 1.0)
            {
                return LCPParseColorString([pref objectForKey:@"color19"], @"#E43C39");
            }
            else
            {
               return %orig;
            }
               return %orig;

        }
               return %orig;

    }
               return %orig;
   
}
%end

//Old hook pre 8.1?
%hook UIStatusBarForegroundStyleAttributes
-(id) _batteryColorForCapacity:(float)arg1 lowCapacity:(float)arg2 charging:(bool)arg3
{
[[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
UIDevice *myDevice = [UIDevice currentDevice];
CGFloat currentLevel = (CGFloat)[myDevice batteryLevel] * 100;
    if (enable)
    {
        if (!custom)
        {
            if( currentLevel >= 95)
            {
                return[UIColor colorWithRed:0.29 green:0.82 blue:0.35 alpha:1.0];
            }
            
            else if( currentLevel >= 90)
            {
                return[UIColor colorWithRed:0.29 green:0.84 blue:0.29 alpha:1.0];
            }
            
            else if( currentLevel >= 85)
            {
                return[UIColor colorWithRed:0.34 green:0.85 blue:0.28 alpha:1.0];
            }
            
            else if( currentLevel >= 80)
            {
                return[UIColor colorWithRed:0.40 green:0.867 blue:0.271 alpha:1.0];
            }
            
            else if( currentLevel >= 75)
            {
                return[UIColor colorWithRed:0.463 green:0.878 blue:0.263 alpha:1.0];
            }
            
            else if( currentLevel >= 70)
            {
                return[UIColor colorWithRed:0.529 green:0.89 blue:0.255 alpha:1.0];
            }
            
            else if( currentLevel >= 65)
            {
                return[UIColor colorWithRed:0.60 green:0.906 blue:0.247 alpha:1.0];
            }
            
            else if( currentLevel >= 60)
            {
                return[UIColor colorWithRed:0.675 green:0.918 blue:0.239 alpha:1.0];
            }
            
            else if( currentLevel >= 55)
            {
                return[UIColor colorWithRed:0.753 green:0.933 blue:0.227 alpha:1.0];
            }
            
            else if( currentLevel >= 50)
            {
                return[UIColor colorWithRed:0.839 green:0.945 blue:0.22 alpha:1.0];
            }
            
            else if( currentLevel >= 45)
            {
                return[UIColor colorWithRed:0.929 green:0.957 blue:0.212 alpha:1.0];
            }
            
            else if( currentLevel >= 40)
            {
                return[UIColor colorWithRed:0.973 green:0.922 blue:0.20 alpha:1.0];
            }
            
            else if( currentLevel >= 35)
            {
                return[UIColor colorWithRed:0.945 green:0.776 blue:0.192 alpha:1.0];
            }
            
            else if( currentLevel >= 30)
            {
                return[UIColor colorWithRed:1.00 green:0.773 blue:0.18 alpha:1.0];
            }
            
            else if( currentLevel >= 25)
            {
                return[UIColor colorWithRed:0.98 green:0.667 blue:0.188 alpha:1.0];
            }
            
            else if( currentLevel >= 20)
            {
                return[UIColor colorWithRed:0.965 green:0.569 blue:0.196 alpha:1.0];
            }
            
            else if( currentLevel >= 15)
            {
                return[UIColor colorWithRed:0.945 green:0.478 blue:0.204 alpha:1.0];
            }
            
            else if( currentLevel >= 10)
            {
                return[UIColor colorWithRed:0.929 green:0.392 blue:0.212 alpha:1.0];
            }
            
            else if( currentLevel >= 5)
            {
                return[UIColor colorWithRed:0.91 green:0.314 blue:0.22 alpha:1.0];
            }
            
            else if( currentLevel >= 1.0)
            {
                return[UIColor colorWithRed:0.894 green:0.235 blue:0.224 alpha:1.0];
            }
            else
            {
               return %orig;
            }
        }
        else if (custom) 
	{
            if( currentLevel >= 95)
            {
                return LCPParseColorString([pref objectForKey:@"color1"], @"#4AD159");
            }
            
            else if( currentLevel >= 90)
            {
                return LCPParseColorString([pref objectForKey:@"color2"], @"#4AD64A");
            }
            
            else if( currentLevel >= 85)
            {
                return LCPParseColorString([pref objectForKey:@"color3"], @"#57D947");
            }
            
            else if( currentLevel >= 80)
            {
                return LCPParseColorString([pref objectForKey:@"color4"], @"#66DD45");
            }
            
            else if( currentLevel >= 75)
            {
                return LCPParseColorString([pref objectForKey:@"color5"], @"#76E043");
            }
            
            else if( currentLevel >= 70)
            {
                return LCPParseColorString([pref objectForKey:@"color6"], @"#87E341");
            }
            
            else if( currentLevel >= 65)
            {
                return LCPParseColorString([pref objectForKey:@"color7"], @"#99E73F");
            }
            
            else if( currentLevel >= 60)
            {
                return LCPParseColorString([pref objectForKey:@"color8"], @"#ACEA3D");
            }
            
            else if( currentLevel >= 55)
            {
                return LCPParseColorString([pref objectForKey:@"color9"], @"#C0EE3A");
            }
            
            else if( currentLevel >= 50)
            {
                return LCPParseColorString([pref objectForKey:@"color10"], @"#D6F138");
            }
            
            else if( currentLevel >= 45)
            {
                return LCPParseColorString([pref objectForKey:@"color11"], @"#EDF436");
            }
            
            else if( currentLevel >= 40)
            {
                return LCPParseColorString([pref objectForKey:@"color12"], @"#F8EB33");
            }
            
            else if( currentLevel >= 35)
            {
                return LCPParseColorString([pref objectForKey:@"color13"], @"#F1C631");
            }
            
            else if( currentLevel >= 30)
            {
                return LCPParseColorString([pref objectForKey:@"color14"], @"#FFC52E");
            }
            
            else if( currentLevel >= 25)
            {
                return LCPParseColorString([pref objectForKey:@"color15"], @"#FAAD30");
            }
            
            else if( currentLevel >= 20)
            {
                return LCPParseColorString([pref objectForKey:@"color16"], @"#F69132");
            }
            
            else if( currentLevel >= 15)
            {
                return LCPParseColorString([pref objectForKey:@"color17"], @"#F17A34");
            }
            
            else if( currentLevel >= 10)
            {
                return LCPParseColorString([pref objectForKey:@"color18"], @"#ED6436");
            }
            
            else if( currentLevel >= 5)
            {
                return LCPParseColorString([pref objectForKey:@"color19"], @"#E85038");
            }
            
            else if( currentLevel >= 1.0)
            {
                return LCPParseColorString([pref objectForKey:@"color19"], @"#E43C39");
            }
            else
            {
               return %orig;
            }
               return %orig;

        }
               return %orig;

    }
               return %orig;
   
}




%end
static void loadPrefs()
{
        NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.skylerk99.powercolor.plist"];
    if(prefs)
    {
        custom = [prefs objectForKey:@"custom"] ? [[prefs objectForKey:@"custom"] boolValue] : custom;
        enable = [prefs objectForKey:@"enable"] ? [[prefs objectForKey:@"enable"] boolValue] : enable;

    }
    [prefs release];
}

%ctor
{

    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.skylerk99.powercolor.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    loadPrefs();

}