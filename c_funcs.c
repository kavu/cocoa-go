#include "header.h"

extern NSTextField *label;

void SetLabelText(const char* str){
    @autoreleasepool {
        NSString* text = [NSString stringWithUTF8String:str];
        [label setStringValue: text];
    }
}


