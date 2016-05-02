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

#import "RCUIModelViewController.h"

@implementation RCUIModelViewController
@synthesize model = _model;
@synthesize modelError = _modelError;

- (id) initWithNibName: (NSString *)nibNameOrNil bundle: (NSBundle *)nibBundleOrNil;
{
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    
    if (self != nil)
    {
        _flags.isViewInvalid = YES;
    }
    
    return self;
}

- (id) init;
{
    self = [self initWithNibName: nil bundle: nil];
    
    if (self != nil)
    {}
    
    return self;
}

- (void) viewDidLoad;
{
    [super viewDidLoad];
}

- (void) resetViewStates;
{
    if (_flags.isShowingLoading)
    {
        [self showLoading: NO];
        _flags.isShowingLoading = NO;
    }
    
    if (_flags.isShowingModel)
    {
        [self showModel: NO];
        _flags.isShowingModel = NO;
    }
    
    if (_flags.isShowingError)
    {
        [self showError: NO];
        _flags.isShowingError = NO;
    }
    
    if (_flags.isShowingEmpty)
    {
        [self showEmpty: NO];
        _flags.isShowingEmpty = NO;
    }
}

- (void) updateViewStates;
{
    if (_flags.isModelDidRefreshInvalid)
    {
        [self didRefreshModel];
        _flags.isModelDidRefreshInvalid = NO;
    }
    
    if (_flags.isModelWillLoadInvalid)
    {
        [self willLoadModel];
        _flags.isModelWillLoadInvalid = NO;
    }
    
    if (_flags.isModelDidLoadInvalid)
    {
        [self didLoadModel: _flags.isModelDidLoadFirstTimeInvalid];
        _flags.isModelDidLoadInvalid = NO;
        _flags.isModelDidLoadFirstTimeInvalid = NO;
        _flags.isShowingModel = NO;
    }
    
    BOOL showModel = NO;
    BOOL showLoading = NO;
    BOOL showError = NO;
    BOOL showEmpty = NO;
    
    if (_model.isLoaded || ![self shouldLoad])
    {
        if ([self canShowModel])
        {
            showModel = !_flags.isShowingModel;
            _flags.isShowingModel = YES;
        }
        else
        {
            if (_flags.isShowingModel)
            {
                [self showModel: NO];
                _flags.isShowingModel = NO;
            }
        }
    }
    else
    {
        if (_flags.isShowingModel)
        {
            [self showModel: NO];
            _flags.isShowingModel = NO;
        }
    }
    
    if (_model.isLoading)
    {
        showLoading = !_flags.isShowingLoading;
        _flags.isShowingLoading = YES;
    }
    else
    {
        if (_flags.isShowingLoading)
        {
            [self showLoading: NO];
            _flags.isShowingLoading = NO;
        }
    }
    
    if (self.modelError != nil)
    {
        showError = !_flags.isShowingError;
        _flags.isShowingError = YES;
    }
    else
    {
        if (_flags.isShowingError)
        {
            [self showError: NO];
            _flags.isShowingError = NO;
        }
    }
    
    if (!_flags.isShowingLoading && !_flags.isShowingModel && !_flags.isShowingError)
    {
        showEmpty = !_flags.isShowingEmpty;
        _flags.isShowingEmpty = YES;
    }
    else
    {
        if (_flags.isShowingEmpty)
        {
            [self showEmpty: NO];
            _flags.isShowingEmpty = NO;
        }
    }
    
    if (showModel)
    {
        [self showModel: YES];
        [self didShowModel: _flags.isModelDidShowFirstTimeInvalid];
        _flags.isModelDidShowFirstTimeInvalid = NO;
    }
    
    if (showEmpty)
    {
        [self showEmpty: YES];
    }
    
    if (showError)
    {
        [self showError: YES];
    }
    
    if (showLoading)
    {
        [self showLoading: YES];
    }
}

- (void) generatedInterstitialModel;
{
    self.model = [[[RCUIModel alloc] init] autorelease];
}

- (void) viewWillAppear: (BOOL)animated;
{
    _isViewAppearing = YES;
    [self updateView];
    [super viewWillAppear: animated];
}

- (void) modelDidStartLoad: (id<RCUIModel>)model;
{
    if (model == self.model)
    {
        _flags.isModelWillLoadInvalid = YES;
        _flags.isModelDidLoadFirstTimeInvalid = YES;
        [self invalidateView];
    }
}

- (void) modelDidFinishLoad: (id<RCUIModel>)model;
{
    if (model == _model)
    {
        self.modelError = nil;
        _flags.isModelDidLoadInvalid = YES;
        [self invalidateView];
    }
}

- (void) model: (id<RCUIModel>)model didFailLoadWithError: (NSError *)error;
{
    if (model == _model)
    {
        self.modelError = error;
    }
}

- (void) modelDidCancelLoad: (id<RCUIModel>)model;
{
    if (model == _model)
    {
        [self invalidateView];
    }
}

- (void) modelDidChange: (id<RCUIModel>)model;
{
    if (model == _model)
    {
        [self refresh];
    }
}

- (void) model: (id<RCUIModel>)model didUpdateObject: (id)object atIndexPath: (NSIndexPath *)indexPath;
{}

- (void) model: (id<RCUIModel>)model didInsertObject: (id)object atIndexPath: (NSIndexPath *)indexPath;
{}

- (void) model: (id<RCUIModel>)model didDeleteObject: (id)object atIndexPath: (NSIndexPath *)indexPath;
{}

- (void) modelDidBeginUpdates: (id<RCUIModel>)model;
{
    if (model == _model)
    {
        [self beginUpdates];
    }
}

- (void) modelDidEndUpdates: (id<RCUIModel>)model;
{
    if (model == _model)
    {
        [self endUpdates];
    }
}

- (id<RCUIModel>) model;
{
    if (_model == nil)
    {
        [self generatedModel];
        
        if (_model == nil)
        {
            [self generatedInterstitialModel];
        }
    }
    
    return _model;
}

- (void) setModel: (id<RCUIModel>)model;
{
    if (_model != model)
    {
        [_model.delegates removeObject: self];
        [_model release];
        _model = [model retain];
        [_model.delegates addObject: self];
        self.modelError = nil;
        
        if (_model != nil)
        {
            _flags.isModelWillLoadInvalid = NO;
            _flags.isModelDidLoadInvalid = NO;
            _flags.isModelDidLoadFirstTimeInvalid = NO;
            _flags.isModelDidShowFirstTimeInvalid = YES;
        }
        
        [self refresh];
    }
}

- (void) setModelError: (NSError *)modelError;
{
    if (modelError != _modelError)
    {
        [_modelError release];
        _modelError = [modelError retain];
        [self invalidateView];
    }
}

- (BOOL) isModelCreated;
{
    return !!_model;
}

- (void) generatedModel;
{}

- (void) invalidateModel;
{
    BOOL wasModelCreated = self.isModelCreated;
    [self resetViewStates];
    [_model.delegates removeObject: self];
    [_model release];
    _model = nil;
    
    if (wasModelCreated)
    {
        [self model];
    }
}

- (BOOL) shouldLoad;
{
    return !self.model.isLoaded;
}

- (BOOL) shouldReload;
{
    return self.modelError == nil && self.model.isOutdated;
}

- (BOOL) shouldLoadMore;
{
    return NO;
}

- (BOOL) canShowModel;
{
    return YES;
}

- (void) reload;
{
    _flags.isViewInvalid = YES;
    [self.model load: RCUIModelCachePolicyNetwork more: NO];
}

- (void) reloadIfNeeded;
{
    if ([self shouldReload] && !self.model.isLoading)
    {
        [self reload];
    }
}

- (void) refresh;
{
    _flags.isViewInvalid = YES;
    _flags.isModelDidRefreshInvalid = YES;
    
    BOOL loading = self.model.isLoading;
    BOOL loaded = self.model.isLoaded;
    
    if (!loading && !loaded && [self shouldLoad])
    {
        [self.model load: RCUIModelCachePolicyDefault more: NO];
    }
    else if (!loading && loaded && [self shouldReload])
    {
        [self.model load: RCUIModelCachePolicyNetwork more: NO];
    }
    else if (!loading && [self shouldLoadMore])
    {
        [self.model load: RCUIModelCachePolicyDefault more: YES];
    }
    else
    {
        _flags.isModelDidLoadInvalid = YES;
        
        if (_isViewAppearing)
        {
            [self updateView];
        }
    }
}

- (void) beginUpdates;
{
    _flags.isViewSuspended = YES;
}

- (void) endUpdates;
{
    _flags.isViewSuspended = NO;
    [self updateView];
}

- (void) invalidateView;
{
    _flags.isViewInvalid = YES;
    
    if (_isViewAppearing)
    {
        [self updateView];
    }
}

- (void) updateView;
{
    if (_flags.isViewInvalid && !_flags.isViewSuspended && !_flags.isUpdatingView)
    {
        _flags.isUpdatingView = YES;
        
        [self model];
        [self view];
        [self updateViewStates];
        
        _flags.isViewInvalid = NO;
        _flags.isUpdatingView = NO;
        
        [self reloadIfNeeded];
    }
}

- (void) didRefreshModel;
{}
- (void) willLoadModel;
{}
- (void) didLoadModel: (BOOL)firstTime;
{}
- (void) didShowModel: (BOOL)firstTime;
{}
- (void) showModel: (BOOL)show;
{}
- (void) showLoading: (BOOL)show;
{}
- (void) showEmpty: (BOOL)show;
{}
- (void) showError: (BOOL)show;
{}

- (void) didReceiveMemoryWarning;
{
    [super didReceiveMemoryWarning];
}

- (void) dealloc;
{
    [_model.delegates removeObject: self];
    [_model release];
    _model = nil;
    self.modelError = nil;
    
    [super dealloc];
}

@end
