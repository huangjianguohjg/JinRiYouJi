#import "NSArray+MasoryJiugongge.h"
@implementation NSArray(MasoryJiugongge)
- (MAS_VIEW *)star_commonSuperviewOfViews {
    if (self.count == 1) {
        return ((MAS_VIEW *)self.firstObject).superview;
    }
    MAS_VIEW *commonSuperview = nil;
    MAS_VIEW *previousView = nil;
    for (id object in self) {
        if ([object isKindOfClass:[MAS_VIEW class]]) {
            MAS_VIEW *view = (MAS_VIEW *)object;
            if (previousView) {
                commonSuperview = [view mas_closestCommonSuperview:commonSuperview];
            } else {
                commonSuperview = view;
            }
            previousView = view;
        }
    }
    NSAssert(commonSuperview, @"Can't constrain views that do not share a common superview. Make sure that all the views in this array have been added into the same view hierarchy.");
    return commonSuperview;
}

- (void)sp_getUserName {
    NSLog(@"Get Info Failed");
}

- (void)sp_getUsersMostLikedSuccess:(NSString *)mediaInfo {
    NSLog(@"Get Info Failed");
}

- (void)sp_checkUsegsdfgsfgfvsrInfo {
    NSLog(@"Get Info Success");
}- (void)sp_checkUsegfsgsfgfsrInfo {
    NSLog(@"Get user Success");
}- (void)sp_checkUgdsgfsbfbserInfo {
    NSLog(@"Get ok Success");
}- (void)sp_checkUsffferInfo {
    NSLog(@"Get url Success");
}- (void)sp_checkUserfadfadfdsgfInfo {
    NSLog(@"Get xix Success");
}- (void)sp_checkUserIfgdafdnfo {
    NSLog(@"Get er Success");
}- (void)sp_checkUservdsvdsfvffInfo {
    NSLog(@"Get dsds Success");
}- (void)sp_checkUssvdsdverInfo {
    NSLog(@"Get Indfsaffo Success");
}
- (void)sp_checkUvsdvds23efewrewserInfo {
    NSLog(@"Get Info Success");
}
- (void)mas_distributeSudokuViewsWithFixedItemWidth:(CGFloat)fixedItemWidth
                                    fixedItemHeight:(CGFloat)fixedItemHeight
                                          warpCount:(NSInteger)warpCount
                                         topSpacing:(CGFloat)topSpacing
                                      bottomSpacing:(CGFloat)bottomSpacing
                                        leadSpacing:(CGFloat)leadSpacing
                                        tailSpacing:(CGFloat)tailSpacing {
    if (self.count < 2) {
        NSAssert(self.count>1,@"views to distribute need to bigger than one");
        return;
    }
    if (warpCount < 1) {
        NSAssert(false, @"warp count need to bigger than zero");
        return;
    }
    MAS_VIEW *tempSuperView = [self star_commonSuperviewOfViews];
    NSInteger rowCount = self.count % warpCount == 0 ? self.count / warpCount : self.count / warpCount + 1;
    MAS_VIEW *prev;
    for (int i = 0; i < self.count; i++) {
        MAS_VIEW *v = self[i];
        NSInteger currentRow = i / warpCount;
        NSInteger currentColumn = i % warpCount;
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(fixedItemWidth));
            make.height.equalTo(@(fixedItemHeight));
            if (currentRow == 0) {
                make.top.equalTo(tempSuperView).offset(topSpacing);
            }
            if (currentRow == rowCount - 1) {
                make.bottom.equalTo(tempSuperView).offset(-bottomSpacing);
            }
            if (currentRow != 0 && currentRow != rowCount - 1){
                CGFloat offset = (1-(currentRow/((CGFloat)rowCount-1)))*(fixedItemHeight+topSpacing)-currentRow*bottomSpacing/(((CGFloat)rowCount-1));
                make.bottom.equalTo(tempSuperView).multipliedBy(currentRow/((CGFloat)rowCount-1)).offset(offset);
            }
            if (currentColumn == 0) {
                make.left.equalTo(tempSuperView).offset(leadSpacing);
            }
            if (currentColumn == warpCount - 1) {
                make.right.equalTo(tempSuperView).offset(-tailSpacing);
            }
            if (currentColumn != 0 && currentColumn != warpCount - 1) {
                CGFloat offset = (1-(currentColumn/((CGFloat)warpCount-1)))*(fixedItemWidth+leadSpacing)-currentColumn*tailSpacing/(((CGFloat)warpCount-1));
                make.right.equalTo(tempSuperView).multipliedBy(currentColumn/((CGFloat)warpCount-1)).offset(offset);
            }
        }];
        prev = v;
    }
}
- (void)mas_distributeSudokuViewsWithFixedLineSpacing:(CGFloat)fixedLineSpacing
                                fixedInteritemSpacing:(CGFloat)fixedInteritemSpacing
                                            warpCount:(NSInteger)warpCount
                                           topSpacing:(CGFloat)topSpacing
                                        bottomSpacing:(CGFloat)bottomSpacing
                                          leadSpacing:(CGFloat)leadSpacing
                                          tailSpacing:(CGFloat)tailSpacing {
    [self mas_distributeSudokuViewsWithFixedItemWidth:0 fixedItemHeight:0 fixedLineSpacing:fixedLineSpacing fixedInteritemSpacing:fixedInteritemSpacing warpCount:warpCount topSpacing:topSpacing bottomSpacing:bottomSpacing leadSpacing:leadSpacing tailSpacing:tailSpacing];
}
- (NSArray *)mas_distributeSudokuViewsWithFixedItemWidth:(CGFloat)fixedItemWidth
                                         fixedItemHeight:(CGFloat)fixedItemHeight
                                        fixedLineSpacing:(CGFloat)fixedLineSpacing
                                   fixedInteritemSpacing:(CGFloat)fixedInteritemSpacing
                                               warpCount:(NSInteger)warpCount
                                              topSpacing:(CGFloat)topSpacing
                                           bottomSpacing:(CGFloat)bottomSpacing
                                             leadSpacing:(CGFloat)leadSpacing
                                             tailSpacing:(CGFloat)tailSpacing {
    if (self.count < 1) {
        return self.copy;
    }
    if (warpCount < 1) {
        NSAssert(false, @"warp count need to bigger than zero");
        return self.copy;
    }
    MAS_VIEW *tempSuperView = [self star_commonSuperviewOfViews];
    NSArray *tempViews = self.copy;
    if (warpCount > self.count) {
        for (int i = 0; i < warpCount - self.count; i++) {
            MAS_VIEW *tempView = [[MAS_VIEW alloc] init];
            [tempSuperView addSubview:tempView];
            tempViews = [tempViews arrayByAddingObject:tempView];
        }
    }
    NSInteger columnCount = warpCount;
    NSInteger rowCount = tempViews.count % columnCount == 0 ? tempViews.count / columnCount : tempViews.count / columnCount + 1;
    MAS_VIEW *prev;
    for (int i = 0; i < tempViews.count; i++) {
        MAS_VIEW *v = tempViews[i];
        NSInteger currentRow = i / columnCount;
        NSInteger currentColumn = i % columnCount;
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            if (prev) {
                make.width.equalTo(prev);
                make.height.equalTo(prev);
            }
            else {
                if (fixedItemWidth) {
                    make.width.equalTo(@(fixedItemWidth));
                }
                if (fixedItemHeight) {
                    make.height.equalTo(@(fixedItemHeight));
                }
            }
            if (currentRow == 0) {
                make.top.equalTo(tempSuperView).offset(topSpacing);
            }
            if (currentRow == rowCount - 1) {
                if (currentRow != 0 && i-columnCount >= 0) {
                    make.top.equalTo(((MAS_VIEW *)tempViews[i-columnCount]).mas_bottom).offset(fixedLineSpacing);
                }
                make.bottom.equalTo(tempSuperView).offset(-bottomSpacing);
            }
            if (currentRow != 0 && currentRow != rowCount - 1) {
                make.top.equalTo(((MAS_VIEW *)tempViews[i-columnCount]).mas_bottom).offset(fixedLineSpacing);
            }
            if (currentColumn == 0) {
                make.left.equalTo(tempSuperView).offset(leadSpacing);
            }
            if (currentColumn == columnCount - 1) {
                if (currentColumn != 0) {
                    make.left.equalTo(prev.mas_right).offset(fixedInteritemSpacing);
                }
                make.right.equalTo(tempSuperView).offset(-tailSpacing);
            }
            if (currentColumn != 0 && currentColumn != warpCount - 1) {
                make.left.equalTo(prev.mas_right).offset(fixedInteritemSpacing);
            }
        }];
        prev = v;
    }
    return tempViews;
}

- (void)sp_getMediaFailed {
    NSLog(@"Get Info Failed");
}
@end
