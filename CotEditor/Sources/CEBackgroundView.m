/*
 
 CEBackgroundView.m
 
 CotEditor
 http://coteditor.com
 
 Created by 1024jp on 2015-01-09.
 
 ------------------------------------------------------------------------------
 
 © 2015-2016 1024jp
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 
 */

#import "CEBackgroundView.h"


@implementation CEBackgroundView

#pragma mark Superclass Methods

// ------------------------------------------------------
/// draw inside
- (void)drawRect:(NSRect)dirtyRect
// ------------------------------------------------------
{
    [NSGraphicsContext saveGraphicsState];
    
    NSRect frame = [self frame];
    
    // draw background
    [[self fillColor] setFill];
    [NSBezierPath fillRect:dirtyRect];
    
    // draw border
    [[NSColor tertiaryLabelColor] setStroke];
    if ([self drawsTopBorder]) {
        [NSBezierPath strokeLineFromPoint:NSMakePoint(NSMinX(dirtyRect), NSMaxY(frame) - 0.5)
                                  toPoint:NSMakePoint(NSMaxX(dirtyRect), NSMaxY(frame) - 0.5)];
    }
    if ([self drawsBottomBorder]) {
        [NSBezierPath strokeLineFromPoint:NSMakePoint(NSMinX(dirtyRect), 0.5)
                                  toPoint:NSMakePoint(NSMaxX(dirtyRect), 0.5)];
    }
    
    [NSGraphicsContext restoreGraphicsState];
}


// ------------------------------------------------------
/// whether it's opaque view
- (BOOL)isOpaque
// ------------------------------------------------------
{
    return YES;
}

@end