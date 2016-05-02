// Copyright 2009-2011 Facebook
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "RCUIGlobalCommon.h"
#import "RCUIGlobalStyle.h"
#import "RCUITableViewHeaderDragRefreshView.h"
#import <QuartzCore/QuartzCore.h>

@interface RCUITableViewHeaderDragRefreshView ()

@property (nonatomic, retain) NSDate  *lastUpdatedDate;
@property (nonatomic, retain) UILabel *lastUpdatedLabel;
@property (nonatomic, retain) UILabel *statusLabel;
@property (nonatomic, retain) UIImageView *arrowImage;
@property (nonatomic, retain) UIActivityIndicatorView *activityView;

@end

@implementation RCUITableViewHeaderDragRefreshView
@synthesize lastUpdatedDate = _lastUpdatedDate;
@synthesize lastUpdatedLabel = _lastUpdatedLabel;
@synthesize statusLabel = _statusLabel;
@synthesize arrowImage = _arrowImage;
@synthesize activityView = _activityView;

- (id) initWithFrame: (CGRect)frame;
{
    self = [super initWithFrame: frame];
    
    if (self != nil)
    {
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        /* updated label */
        self.lastUpdatedLabel = [[[UILabel alloc] initWithFrame: CGRectMake (0.0f, frame.size.height - 30.0f, frame.size.width, 20.0f)] autorelease];
        self.lastUpdatedLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin;
        self.lastUpdatedLabel.font             = RCUIRegularSystemFont(12.0f);
        self.lastUpdatedLabel.textColor        = RGBCOLOR (109, 128, 153);
        self.lastUpdatedLabel.shadowColor      = [[UIColor whiteColor] colorWithAlphaComponent: 0.9];
        self.lastUpdatedLabel.shadowOffset     = CGSizeMake (0.0f, 1.0f);
        self.lastUpdatedLabel.backgroundColor  = [UIColor clearColor];
        self.lastUpdatedLabel.textAlignment    = NSTextAlignmentCenter;
        [self addSubview: self.lastUpdatedLabel];
        
        /* status label */
        self.statusLabel = [[[UILabel alloc] initWithFrame: CGRectMake (0.0f, frame.size.height - 48.0f, frame.size.width, 20.0f)] autorelease];
        self.statusLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin;
        self.statusLabel.font             = RCUIMediumSystemFont(14.0f);
        self.statusLabel.textColor        = RGBCOLOR (109, 128, 153);
        self.statusLabel.shadowColor      = [[UIColor whiteColor] colorWithAlphaComponent: 0.9];
        self.statusLabel.shadowOffset     = CGSizeMake (0.0f, 1.0f);
        self.statusLabel.backgroundColor  = [UIColor clearColor];
        self.statusLabel.textAlignment    = NSTextAlignmentCenter;
        [self setStatus: RCUITableHeaderDragRefreshPullToReload];
        [self addSubview: self.statusLabel];
        
        /* arrow image */
        UIImage *arrowImage = [UIImage imageNamed: @"blueArrow.png"];
        self.arrowImage = [[[UIImageView alloc] initWithFrame: CGRectMake (25.0f, frame.size.height - 60.0f,
                                                arrowImage.size.width, arrowImage.size.height)] autorelease];
        self.arrowImage.image = arrowImage;
        [self.arrowImage layer].transform = CATransform3DMakeRotation (M_PI, 0.0f, 0.0f, 1.0f);
        [self addSubview: self.arrowImage];
        
        /* activity indicator */
        self.activityView = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleGray] autorelease];
        self.activityView.frame = CGRectMake (30.0f, frame.size.height - 38.0f, 20.0f, 20.0f);
        self.activityView.hidesWhenStopped = YES;
        [self addSubview: self.activityView];
    }
    
    return self;
}

- (void) setCurrentDate;
{
    [self setUpdateDate: [NSDate date]];
}

- (void) setUpdateDate: (NSDate *)date;
{
    if (date != nil)
    {
        if (self.lastUpdatedDate != date)
        {
            self.lastUpdatedDate = date;
        }
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle: NSDateFormatterShortStyle];
        [formatter setTimeStyle: NSDateFormatterShortStyle];
        self.lastUpdatedLabel.text = [NSString stringWithFormat: @"Last updated: %@", [formatter stringFromDate: self.lastUpdatedDate]];
        [formatter release];
    }
    else
    {
        self.lastUpdatedDate = nil;
        self.lastUpdatedLabel.text = @"Last updated: never";
    }
}

- (void) showActivity: (BOOL)shouldShow animated: (BOOL)animated;
{
    if (shouldShow)
    {
        [self.activityView startAnimating];
    }
    else
    {
        [self.activityView stopAnimating];
    }
    
    [UIView beginAnimations: nil context: NULL];
    [UIView setAnimationDuration: (animated ? ttkDefaultFastTransitionDuration : 0.0)];
    self.arrowImage.alpha = (shouldShow ? 0.0 : 1.0);
    [UIView commitAnimations];
}

- (void) setImageFlipped: (BOOL)flipped;
{
    [UIView beginAnimations: nil context: NULL];
    [UIView setAnimationDuration: ttkDefaultFastTransitionDuration];
    [self.arrowImage layer].transform = (flipped ?
                                         CATransform3DMakeRotation (M_PI * 2, 0.0f, 0.0f, 1.0f) :
                                         CATransform3DMakeRotation (M_PI, 0.0f, 0.0f, 1.0f));
    [UIView commitAnimations];
}

- (void) setStatus: (RCUITableHeaderDragRefreshStatus)status;
{
    switch (status)
    {
    case RCUITableHeaderDragRefreshLoading:
        {
            [self showActivity: YES animated: YES];
            [self setImageFlipped: NO];
            self.statusLabel.text = @"Updating...";
        }
        break;
            
    case RCUITableHeaderDragRefreshPullToReload:
        {
            [self showActivity: NO animated: NO];
            [self setImageFlipped: NO];
            self.statusLabel.text = @"Pull down to update...";
        }
        break;
            
    case RCUITableHeaderDragRefreshReleaseToReload:
        {
            [self showActivity: NO animated: NO];
            [self setImageFlipped: YES];
            self.statusLabel.text = @"Release to update...";
        }
        break;
            
    default:
        break;
    }
}

- (void) dealloc;
{
    self.lastUpdatedDate = nil;
    self.lastUpdatedLabel = nil;
    self.statusLabel = nil;
    self.arrowImage = nil;
    self.activityView = nil;
    [super dealloc];
}

@end
