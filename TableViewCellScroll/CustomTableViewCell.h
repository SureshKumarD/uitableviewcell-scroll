//
//  CustomTableViewCell.h
//  TableViewCellScroll
//
//  Created by Suresh on 14/02/15.
//  Copyright (c) 2015 Kirusa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
- (void)updateScroll:(float) percent;
@end
