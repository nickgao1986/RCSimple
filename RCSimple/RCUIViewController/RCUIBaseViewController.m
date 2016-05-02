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

#import "RCUIBaseViewController.h"
#import "RCUIGlobalCommon.h"

@interface RCUIBaseViewController ()

@property (nonatomic, assign) BOOL isViewAppearing;

- (void) keyboardWillShow: (NSNotification *)notification;
- (void) keyboardDidShow: (NSNotification *)notification;
- (void) keyboardWillHide: (NSNotification *)notification;
- (void) keyboardDidHide: (NSNotification *)notification;

@end

@implementation RCUIBaseViewController
@synthesize autoresizesForKeyboard = _autoresizesForKeyboard;
@synthesize isViewAppearing = _isViewAppearing;

- (id) initWithNibName: (NSString *)nibNameOrNil bundle: (NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
	
    if (self)
	{}
	
    return self;
}

- (id) init
{
	self = [self initWithNibName: nil bundle: nil];
	
	if (self)
	{}
	
	return self;
}

- (void) resizeForKeyboard: (NSNotification *)notification appearing: (BOOL)appearing;
{
	CGRect keyboardStart;
	[[notification.userInfo objectForKey: UIKeyboardFrameBeginUserInfoKey] getValue: &keyboardStart];
    
	CGRect keyboardEnd;
	[[notification.userInfo objectForKey: UIKeyboardFrameEndUserInfoKey] getValue: &keyboardEnd];
    
	BOOL animated = !FLOAT_EQUAL (keyboardStart.origin.y, keyboardEnd.origin.y);
    if (animated)
    {
        [UIView beginAnimations: nil context: nil];
        [UIView setAnimationDuration: ttkDefaultTransitionDuration];
    }
    
    if (appearing)
    {
        [self keyboardWillAppear: animated withBounds: keyboardStart];
    }
    else
    {
        [self keyboardDidDisappear: animated withBounds: keyboardEnd];
    }
    
    if (animated)
    {
        [UIView commitAnimations];
    }
}

- (void) viewWillAppear: (BOOL)animated;
{
    [super viewWillAppear: animated];
    self.isViewAppearing = YES;
}

- (void) viewDidAppear: (BOOL)animated;
{
    [super viewDidAppear: animated];
    self.isViewAppearing = YES;
}

- (void) viewDidDisappear: (BOOL)animated;
{
    [super viewDidDisappear: animated];
    self.isViewAppearing = NO;
}

- (void) keyboardWillShow: (NSNotification *)notification;
{
    if (self.isViewAppearing)
    {
        [self resizeForKeyboard: notification appearing: YES];
    }
}

- (void) keyboardDidShow: (NSNotification *)notification;
{
    CGRect frameStart;
    [[notification.userInfo objectForKey: UIKeyboardFrameBeginUserInfoKey] getValue: &frameStart];
    CGRect keyboardBounds = CGRectMake (0, 0, frameStart.size.width, frameStart.size.height);
    
    [self keyboardDidAppear: YES withBounds: keyboardBounds];
}

- (void) keyboardWillHide: (NSNotification *)notification;
{
    CGRect frameEnd;
    [[notification.userInfo objectForKey: UIKeyboardFrameEndUserInfoKey] getValue: &frameEnd];
    CGRect keyboardBounds = CGRectMake (0, 0, frameEnd.size.width, frameEnd.size.height);
    
    [self keyboardWillDisappear: YES withBounds: keyboardBounds];
}

- (void) keyboardDidHide: (NSNotification *)notification;
{
    if (self.isViewAppearing)
    {
        [self resizeForKeyboard: notification appearing: NO];
    }
}

- (void) keyboardWillAppear: (BOOL)animated withBounds: (CGRect)bounds;
{}

- (void) keyboardWillDisappear: (BOOL)animated withBounds: (CGRect)bounds;
{}

- (void) keyboardDidAppear: (BOOL)animated withBounds: (CGRect)bounds;
{}

- (void) keyboardDidDisappear: (BOOL)animated withBounds: (CGRect)bounds;
{}

- (void) setAutoresizesForKeyboard: (BOOL)autoresizesForKeyboard;
{
    if (_autoresizesForKeyboard != autoresizesForKeyboard)
	{
		_autoresizesForKeyboard = autoresizesForKeyboard;
		
		if (_autoresizesForKeyboard)
		{
			[[NSNotificationCenter defaultCenter] addObserver: self
													 selector: @selector (keyboardWillShow:)
														 name: UIKeyboardWillShowNotification
													   object: nil];
			
			[[NSNotificationCenter defaultCenter] addObserver: self
													 selector: @selector (keyboardWillHide:)
														 name: UIKeyboardWillHideNotification
													   object: nil];
			
			[[NSNotificationCenter defaultCenter] addObserver: self
													 selector: @selector (keyboardDidShow:)
														 name: UIKeyboardDidShowNotification
													   object: nil];
			[[NSNotificationCenter defaultCenter] addObserver: self
													 selector: @selector (keyboardDidHide:)
														 name: UIKeyboardDidHideNotification
													   object: nil];
		}
		else
		{
			[[NSNotificationCenter defaultCenter] removeObserver: self
															name: UIKeyboardWillShowNotification
														  object: nil];
			[[NSNotificationCenter defaultCenter] removeObserver: self
															name: UIKeyboardWillHideNotification
														  object: nil];
			[[NSNotificationCenter defaultCenter] removeObserver: self
															name: UIKeyboardDidShowNotification
														  object: nil];
			[[NSNotificationCenter defaultCenter] removeObserver: self
															name: UIKeyboardDidHideNotification
														  object: nil];
		}
	}
}

- (void) dealloc;
{
    self.autoresizesForKeyboard = NO;
    [super dealloc];
}

@end
