//
//  CustomTableViewCell.m
//  TableViewCellScroll
//
//  Created by Suresh on 14/02/15.
//  Copyright (c) 2015 Kirusa. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        self.imageScrollView.clipsToBounds = true;
        self.imageScrollView.userInteractionEnabled = false;
//        [self.contentView setFrame:CGRectMake(0, -50, 320, 200)];
//        [self.imageScrollView setContentSize:CGSizeMake(320, 500)];
//        [self.imageScrollView setFrame:CGRectMake(0, 0, 320, 222)];
        
//        self.myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 222)];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateScroll:(float) percent{
    
    float scrollImageViewHeight = self.myImageView.frame.size.height;
    float scrollViewHeight = self.imageScrollView.frame.size.height;
    
    float y = (1 - percent) * (scrollImageViewHeight - scrollViewHeight);
    
    CGPoint targetPos = CGPointMake(0, y);
    NSLog(@"targetPos %@",NSStringFromCGPoint(targetPos));
    [self.imageScrollView setContentOffset:targetPos animated:NO];
}

@end
