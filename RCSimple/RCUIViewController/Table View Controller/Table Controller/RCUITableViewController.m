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

#import "RCUITableViewController.h"
#import "RCUITableViewListDataSource.h"
#import "RCUITableViewDelegate.h"
#import "RCUITableViewVarHeightDelegate.h"
#import "RCUIErrorView.h"
#import "RCUILoadingView.h"
#import "RCUIGlobalCommon.h"
#import "RCUIGlobalRect.h"
#import "RCUIGlobalStyle.h"
#import "UIView+RCUICategory.h"
#import "UITableView+RCUICategory.h"

@interface RCUITableViewController ()

@property (nonatomic, assign) UIInterfaceOrientation lastInterfaceOrientation;

@end

@implementation RCUITableViewController
@synthesize tableView = _tableView;
@synthesize tableOverlayView = _tableOverlayView;
@synthesize loadingView = _loadingView;
@synthesize errorView = _errorView;
@synthesize emptyView = _emptyView;
@synthesize dataSource = _dataSource;
@synthesize tableViewStyle = _tableViewStyle;
@synthesize variableHeightRows = _variableHeightRows;
@synthesize allowScrollToBottom = _allowScrollToBottom;
@synthesize lastInterfaceOrientation = _lastInterfaceOrientation;

+ (Class) tableViewClass;
{
    return [UITableView class];
}

- (id) initWithNibName: (NSString *)nibNameOrNil bundle: (NSBundle *)nibBundleOrNil;
{
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    
    if (self != nil)
    {
        self.lastInterfaceOrientation = self.interfaceOrientation;
        _tableViewStyle = UITableViewStylePlain;
    }
    
    return self;
}

- (id) initWithStyle: (UITableViewStyle)style;
{
    self = [self initWithNibName: nil bundle: nil];
    
    if (self != nil)
    {
        _tableViewStyle = style;
    }
    
    return self;
}

- (void) createInterstitialModel;
{
    self.dataSource = [[[RCUITableViewInterstitialDataSource alloc] init] autorelease];
}

- (NSString *) defaultTitleForLoading;
{
    return @"Loading...";
}

- (void) updateTableViewDelegate;
{
    if (_tableView.delegate == nil)
    {
        [_tableDelegate release];
        _tableDelegate = [[self generatedDelegate] retain];
        
        _tableView.delegate = nil;
        _tableView.delegate = _tableDelegate;
    }
}

- (void) addToOverlayView: (UIView *)view;
{
    if (self.tableOverlayView == nil)
    {
        CGRect frame = [self rectForOverlayView];
        self.tableOverlayView = [[[UIView alloc] initWithFrame: frame] autorelease];
        self.tableOverlayView.autoresizesSubviews = YES;
        self.tableOverlayView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.tableOverlayView.backgroundColor = [UIColor clearColor];
        NSInteger tableIndex = [_tableView.superview.subviews indexOfObject: _tableView];
        if (tableIndex != NSNotFound)
        {
            [_tableView.superview addSubview: self.tableOverlayView];
        }
    }
    
    view.frame = self.tableOverlayView.bounds;
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.tableOverlayView addSubview: view];
}

- (void) resetOverlayView;
{
    if (self.tableOverlayView && !self.tableOverlayView.subviews.count)
    {
        [self.tableOverlayView removeFromSuperview];
        self.tableOverlayView = nil;
    }
}

- (void) addSubviewOverTableView: (UIView *)view;
{
    NSInteger tableIndex = [_tableView.superview.subviews indexOfObject: _tableView];
    
    if (NSNotFound != tableIndex)
    {
        [_tableView.superview addSubview: view];
    }
}

- (void) layoutOverlayView;
{
    if (self.tableOverlayView)
    {
        self.tableOverlayView.frame = [self rectForOverlayView];
    }
}

- (void) loadView;
{
    [super loadView];
    [self tableView];
    
    if ([self.tableView respondsToSelector: @selector (sectionIndexColor)])
    {
        self.tableView.sectionIndexColor = RGBCOLOR (106, 115, 125);
    }
    
    if ([self.tableView respondsToSelector: @selector (sectionIndexBackgroundColor)])
    {
        self.tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    }
    
    if ([self.tableView respondsToSelector: @selector(separatorInset)])
    {
        self.tableView.separatorInset = UIEdgeInsetsZero;
    }
}

- (void) viewWillAppear: (BOOL)animated;
{
    [super viewWillAppear: animated];
    
    if (self.lastInterfaceOrientation != self.interfaceOrientation)
    {
        self.lastInterfaceOrientation = self.interfaceOrientation;
        [_tableView reloadData];
    }
}

- (void) viewDidAppear: (BOOL)animated;
{
    [super viewDidAppear: animated];
    
    if (_flags.isShowingModel)
    {
        [_tableView flashScrollIndicators];
    }
}

- (void) setEditing: (BOOL)editing animated: (BOOL)animated;
{
    [super setEditing: editing animated: animated];
    [self.tableView setEditing: editing animated: animated];
}

- (void) keyboardDidAppear: (BOOL)animated withBounds: (CGRect)bounds;
{
	[super keyboardDidAppear: animated withBounds: bounds];
	
	self.tableView.frame = RCUIRectContract (self.tableView.frame, 0, bounds.size.height);
	
    [self.tableView scrollFirstResponderIntoView];
	[self layoutOverlayView];
}

- (void) keyboardWillDisappear: (BOOL)animated withBounds: (CGRect)bounds;
{
    [super keyboardWillDisappear: animated withBounds: bounds];

    if (_tableView)
    {
        CGRect previousFrame = self.tableView.frame;
        self.tableView.frame = RCUIRectContract (self.tableView.frame, 0, -bounds.size.height);
        if (self.tableView.height > self.view.bounds.size.height)
        {
            self.tableView.frame = previousFrame;
        }
    }
}

- (void) keyboardDidDisappear: (BOOL)animated withBounds: (CGRect)bounds;
{
    [super keyboardDidDisappear: animated withBounds: bounds];
    [self layoutOverlayView];
}

- (void) beginUpdates;
{
    [super beginUpdates];
    [_tableView beginUpdates];
}

- (void) endUpdates;
{
    [super endUpdates];
    [_tableView endUpdates];
}

- (BOOL) canShowModel;
{
    if ([_dataSource respondsToSelector: @selector(numberOfSectionsInTableView:)])
    {
        NSInteger numberOfSections = [_dataSource numberOfSectionsInTableView: _tableView];
        if (!numberOfSections)
        {
            return NO;
        }
        else if (numberOfSections == 1)
        {
            NSInteger numberOfRows = [_dataSource tableView: _tableView numberOfRowsInSection: 0];
            return numberOfRows > 0;
        }
        else
        {
            return YES;
        }
    }
    else
    {
        NSInteger numberOfRows = [_dataSource tableView: _tableView numberOfRowsInSection: 0];
        return numberOfRows > 0;
    }
}

- (void) didLoadModel: (BOOL)firstTime;
{
    [super didLoadModel: firstTime];
    [_dataSource tableViewDidLoadModel: _tableView];
}

- (void) didShowModel: (BOOL)firstTime;
{
    [super didShowModel: firstTime];
    if (![self isViewAppearing] &&  firstTime)
    {
        [_tableView flashScrollIndicators];
    }
    
    if ([self isViewAppearing] && firstTime)
    {
        if (self.allowScrollToBottom)
        {
            [_tableView scrollRectToVisible: _tableView.tableFooterView.frame animated: NO];
        }
    }
}

- (void) showModel: (BOOL)show;
{
    if (show)
    {
        [self updateTableViewDelegate];
        _tableView.dataSource  = _dataSource;
    }
    else
    {
        _tableView.dataSource = nil;
    }
    
    [_tableView reloadData];
}

- (void) showLoading: (BOOL)show;
{
    if (show)
    {
        if (!self.model.isLoaded || ![self canShowModel])
        {
            NSString *title = self.dataSource ? [_dataSource titleForLoading: NO] : [self defaultTitleForLoading];
            if (title.length)
            {
                RCUILoadingView *loadingView = [[[RCUILoadingView alloc] initWithFrame: CGRectZero text: title] autorelease];
                loadingView.backgroundColor = _tableView.backgroundColor;
                self.loadingView = loadingView;
            }
        }
    }
    else
    {
        self.loadingView = nil;
    }
}

- (void) showError: (BOOL)show;
{
    if (show)
    {
        if (!self.model.isLoaded || ![self canShowModel])
        {
            NSString *title = [_dataSource titleForError: self.modelError];
            NSString *subtitle = [_dataSource subtitleForError: self.modelError];
            UIImage  *image = [_dataSource imageForError: self.modelError];
            
            if (title.length || subtitle.length || image)
            {
                RCUIErrorView *errorView = [[[RCUIErrorView alloc] initWithTitle: title subtitle: subtitle image: image] autorelease];
                if ([_dataSource reloadButtonForEmpty])
                {
                    [errorView addReloadButton];
                    [errorView.reloadButton addTarget: self
                                               action: @selector(reload)
                                     forControlEvents: UIControlEventTouchUpInside];
                }
                
                errorView.backgroundColor = _tableView.backgroundColor;
                self.emptyView = errorView;
            }
            else
            {
                self.errorView = nil;
            }
            
            _tableView.dataSource = nil;
            [_tableView reloadData];
        }
    }
    else
    {
        self.errorView = nil;
    }
}

- (void) showEmpty: (BOOL)show;
{
    if (show)
    {
        NSString *title = [_dataSource titleForEmpty];
        NSString *subtitle = [_dataSource subtitleForEmpty];
        UIImage *image = [_dataSource imageForEmpty];
        
        if (title.length || subtitle.length || image)
        {
            RCUIErrorView *emptyView = [[[RCUIErrorView alloc] initWithTitle: title subtitle: subtitle image: image] autorelease];
            emptyView.backgroundColor = _tableView.backgroundColor;
            self.emptyView = emptyView;
        }
        else
        {
            self.emptyView = nil;
        }
        _tableView.dataSource = nil;
        [_tableView reloadData];
    }
    else
    {
        self.emptyView = nil;
    }
}

- (void) pushSwipeUtilityButtonsState
{
    [self pushSwipeUtilityButtonsStateForTableView:self.tableView];
}

- (void) popSwipeUtilityButtonsState
{
    [self popSwipeUtilityButtonsStateForTableView:self.tableView];
}

- (void) invalidateModel;
{
    [super invalidateModel];
    _tableView.delegate = nil;
    [self updateTableViewDelegate];
}

- (id<UITableViewDelegate>) generatedDelegate;
{
    if (self.variableHeightRows)
    {
        return [[[RCUITableViewVarHeightDelegate alloc] initWithController: self] autorelease];
    }
    else
    {
        return [[[RCUITableViewDelegate alloc] initWithController: self] autorelease];
    }
}

- (UITableView *) tableView;
{
    if (nil == _tableView)
    {
        _tableView = [[[self.class tableViewClass] alloc] initWithFrame: self.view.bounds style: self.tableViewStyle];
        _tableView.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _tableView.contentMode = UIViewContentModeScaleToFill;
        [_tableView disableMarginsFollowReadableWidth];
        
        if ([_tableView respondsToSelector: @selector (setBackgroundView:)])
        {
            _tableView.backgroundView = nil;
        }
         
        if (self.tableViewStyle == UITableViewStyleGrouped)
        {
            _tableView.sectionHeaderHeight = 10.f;
            _tableView.sectionFooterHeight = 10.f;
        }
        
        [self.view addSubview: _tableView];
    }
    
    return _tableView;
}

- (void) setTableView: (UITableView *)tableView;
{
    if (tableView != _tableView)
    {
        [_tableView release];
        _tableView = [tableView retain];
        if (!_tableView)
        {
            self.tableOverlayView = nil;
        }
    }
}

- (void) setDataSource: (id<RCUITableViewDataSource>)dataSource;
{
    if (dataSource != _dataSource)
    {
        [_dataSource release];
        _dataSource = [dataSource retain];
        _tableView.dataSource = nil;
        self.model = dataSource.model;
    }
}

- (void) setVariableHeightRows: (BOOL)variableHeightRows;
{
    if (variableHeightRows != _variableHeightRows)
    {
        _variableHeightRows = variableHeightRows;
        _tableView.delegate = nil;
    }
}

- (void) setLoadingView: (UIView *)view;
{
    if (view != _loadingView)
    {
        if (_loadingView)
        {
            [_loadingView removeFromSuperview];
            [_loadingView release];
            _loadingView = nil;
        }
        
        _loadingView = [view retain];
        
        if (_loadingView)
        {
            [self addToOverlayView: _loadingView];
        }
        else
        {
            [self resetOverlayView];
        }
    }
}

- (void) setErrorView: (UIView *)view;
{
    if (view != _errorView)
    {
        if (_errorView)
        {
            [_errorView removeFromSuperview];
            [_errorView release];
            _errorView = nil;
        }
        
        _errorView = [view retain];
        
        if (_errorView)
        {
            [self addToOverlayView: _errorView];
        }
        else
        {
            [self resetOverlayView];
        }
    }
}

- (void) setEmptyView: (UIView *)view;
{
    if (view != _emptyView)
    {
        if (_emptyView)
        {
            [_emptyView removeFromSuperview];
            [_emptyView release];
            _emptyView = nil;
        }
        
        _emptyView = [view retain];
        
        if (_emptyView)
        {
            [self addToOverlayView: _emptyView];
        }
        else
        {
            [self resetOverlayView];
        }
    }
}

- (void) model: (id<RCUIModel>)model didUpdateObject: (id)object atIndexPath: (NSIndexPath *)indexPath;
{
    if (model == _model)
    {
        if (_flags.isShowingModel)
        {
            if ([_dataSource respondsToSelector: @selector (tableView:willUpdateObject:atIndexPath:)])
            {
                NSIndexPath *newIndexPath = [_dataSource tableView: _tableView willUpdateObject: object
                                                       atIndexPath: indexPath];
                if (newIndexPath)
                {
                    if (newIndexPath.length == 1)
                    {
                        NSInteger sectionIndex = [newIndexPath indexAtPosition: 0];
                        [_tableView reloadSections: [NSIndexSet indexSetWithIndex: sectionIndex]
                                  withRowAnimation: UITableViewRowAnimationFade];
                    }
                    else if (newIndexPath.length == 2)
                    {
                        [_tableView reloadRowsAtIndexPaths: [NSArray arrayWithObject: newIndexPath]
                                          withRowAnimation: UITableViewRowAnimationFade];
                    }
                    
                    [self invalidateView];
                }
                else
                {
                    [_tableView reloadData];
                }
            }
        }
        else
        {
            [self refresh];
        }
    }
}

- (void) model: (id<RCUIModel>)model didInsertObject: (id)object atIndexPath: (NSIndexPath *)indexPath;
{
    if (model == _model)
    {
        if (_flags.isShowingModel)
        {
            if ([_dataSource respondsToSelector: @selector (tableView:willInsertObject:atIndexPath:)])
            {
                NSIndexPath *newIndexPath = [_dataSource tableView: _tableView willInsertObject: object
                                                       atIndexPath: indexPath];
                if (newIndexPath)
                {
                    if (newIndexPath.length == 1)
                    {
                        NSInteger sectionIndex = [newIndexPath indexAtPosition: 0];
                        [_tableView insertSections: [NSIndexSet indexSetWithIndex: sectionIndex]
                                  withRowAnimation: UITableViewRowAnimationFade];
                    }
                    else if (newIndexPath.length == 2)
                    {
                        [_tableView insertRowsAtIndexPaths: [NSArray arrayWithObject: newIndexPath]
                                          withRowAnimation: UITableViewRowAnimationFade];
                    }
                    [self invalidateView];
                }
                else
                {
                    [_tableView reloadData];
                }
            }
        }
        else
        {
            [self refresh];
        }
    }
}

- (void) model: (id<RCUIModel>)model didDeleteObject: (id)object atIndexPath: (NSIndexPath *)indexPath;
{
    if (model == _model)
    {
        if (_flags.isShowingModel)
        {
            if ([_dataSource respondsToSelector: @selector (tableView:willRemoveObject:atIndexPath:)])
            {
                NSIndexPath *newIndexPath = [_dataSource tableView: _tableView willRemoveObject: object
                                                       atIndexPath: indexPath];
                if (newIndexPath)
                {
                    if (newIndexPath.length == 1)
                    {
                        NSInteger sectionIndex = [newIndexPath indexAtPosition: 0];
                        [_tableView deleteSections: [NSIndexSet indexSetWithIndex: sectionIndex]
                                  withRowAnimation: UITableViewRowAnimationFade];
                    }
                    else if (newIndexPath.length == 2)
                    {
                        [_tableView deleteRowsAtIndexPaths: [NSArray arrayWithObject: newIndexPath]
                                          withRowAnimation: UITableViewRowAnimationFade];
                    }
                    [self invalidateView];
                }
                else
                {
                    [_tableView reloadData];
                }
            }
        }
        else
        {
            [self refresh];
        }
    }
}

- (void) didBeginDragging;
{}

- (void) didEndDragging;
{}

- (void) didPerformAction: (SEL)action object: (id)object atIndexPath: (NSIndexPath *)indexPath;
{}

- (void) didSelectObject: (id)object atIndexPath: (NSIndexPath *)indexPath;
{}

- (void) didDeselectObject: (id)object atIndexPath: (NSIndexPath *)indexPath;
{}

- (void) didSelectAccessory: (id)object atIndexPath: (NSIndexPath *)indexPath;
{}

- (void) didBeginEditingObject: (id)object atIndexPath: (NSIndexPath *)indexPath;
{}

- (void) didEndEditingObject: (id)object atIndexPath: (NSIndexPath *)indexPath;
{}

- (CGRect) rectForOverlayView;
{
    return [_tableView frame];
}

- (void) didRotateFromInterfaceOrientation: (UIInterfaceOrientation)fromInterfaceOrientation;
{
    self.lastInterfaceOrientation = self.interfaceOrientation;
}

- (void) dealloc;
{
    if (_tableView != nil)
    {
        [_tableView setTableHeaderView: nil];
        [_tableView setTableFooterView: nil];
        _tableView.delegate = nil;
        _tableView.dataSource = nil;
    }
    
    [_tableDelegate release];
    _tableDelegate = nil;
    
    [_dataSource release];
    _dataSource = nil;

    [_tableView release];
    _tableView = nil;
    
    [_tableOverlayView removeFromSuperview];
    [_tableOverlayView release];
    _tableOverlayView = nil;
    
    [_loadingView removeFromSuperview];
    [_loadingView release];
    _loadingView = nil;
    
    [_errorView removeFromSuperview];
    [_errorView release];
    _errorView = nil;
    
    [_emptyView removeFromSuperview];
    [_emptyView release];
    _emptyView = nil;
    
    [super dealloc];
}

@end
