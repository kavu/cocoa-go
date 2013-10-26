#include "header.h"

NSTextField *label;

@interface DoButton : NSButtonCell
    - (IBAction)performClick:(id)sender;
@end

@implementation DoButton
    - (IBAction)performClick:(id)sender {
        NSWindow *window = [NSApp mainWindow];
        if (!label) {
            label = [[NSTextField new] autorelease];
            [label setFrame:CGRectMake(100,100,40,40)];

            [label setBezeled:NO];
            [label setDrawsBackground:NO];
            [label setEditable:NO];
            [label setSelectable:NO];
            [label setStringValue:@"Hi Label"];
            [window.contentView addSubview:label];
        } else {
            [label setStringValue:@"Hi Label"];
        }
        go_Test();
    }
@end
