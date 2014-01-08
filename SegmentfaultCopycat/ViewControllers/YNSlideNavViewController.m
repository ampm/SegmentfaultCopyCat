//
// Created by hijack on 1/7/14.
// Copyright (c) 2014 ___zzxhdzj___. All rights reserved.
//

#import "YNSlideNavViewController.h"


@interface YNSlideNavViewController () <UITableViewDataSource, UITableViewDelegate>
@property(nonatomic,strong) NSMutableSet *loadedRootViewControllers;
@end

@implementation YNSlideNavViewController

#pragma - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.items objectAtIndex:section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"UMSlideNavigationControllerSlideViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }

    cell.textLabel.text = [NSString stringWithFormat:@"%@", [(UIViewController *) self.items[indexPath.section][indexPath.row] title]];

    return cell;
}
#pragma mark
- (void)viewDidLoad {
    [super viewDidLoad];
    self.slideView.dataSource = self;
    self.slideView.delegate = self;
    self.slideView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.slideView.backgroundColor = RGBCOLOR(51, 51, 51);

    if(nil == self.loadedRootViewControllers ){
        self.loadedRootViewControllers = [[NSMutableSet alloc] initWithObjects:self.items[self.currentIndex.section][self.currentIndex.row],nil];
    }

}

@end