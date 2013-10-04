#include "header.h"

extern NSTextField *label;

void RunApp() {
    @autoreleasepool {
        NSArray* objects = [[NSArray new] autorelease];

        [NSApplication sharedApplication];

        [[NSBundle mainBundle] loadNibNamed:@"app" owner:NSApp topLevelObjects:&objects];

        [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];
        [NSApp activateIgnoringOtherApps:YES];

        [NSApp run];
    }
}

void SetLabelText(const char* str){
    @autoreleasepool {
        NSString* text = [NSString stringWithUTF8String:str];
        [label setStringValue: text];
    }
}


