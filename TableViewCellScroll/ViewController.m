//
//  ViewController.m
//  TableViewCellScroll
//
//  Created by Suresh on 14/02/15.
//  Copyright (c) 2015 Kirusa. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *imageTableView;
@property (strong, nonatomic) NSArray *myImageNames;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageTableView.dataSource = self;
    self.imageTableView.delegate = self;
    self.myImageNames = [[ NSArray alloc] initWithObjects:@"image1.jpg",@"image2.jpg",@"image3.jpg",@"image4.jpg",@"image5.jpg", nil];
    [self.scrollView setContentSize:CGSizeZero];
//    self.scrollView = [[UIScrollView alloc] initWithFrame:[self.imageTableView frame]];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TableView datasource methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    __weak CustomTableViewCell *weakCell = cell;
    if(!cell) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//        UIScrollView *myScrollView = [[UIScrollView alloc] init];
//        [myScrollView setContentSize:CGSizeMake(320, 500)];
//        [cell.contentView addSubview:myScrollView];
    }
    NSString *imageName = [self.myImageNames objectAtIndex:[indexPath row]];
    [weakCell.myImageView setImage:[UIImage imageNamed:imageName]];
//    [cell.myImageView setImage:[UIImage imageNamed:imageName]];
    [cell updateScroll:0.0];
    return cell;
}


#pragma mark - TableView delegate methods

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150.0f;
}
#pragma mark - ScrollView delegate methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    int headerHeight = 64;
    int footerHeight = 49;
    
    int frameHeight = scrollView.frame.size.height;
    int visibleScrollHeight = frameHeight - headerHeight - footerHeight;
    int contentHeight = scrollView.contentSize.height;
    
    float scrollableHeight = (contentHeight - visibleScrollHeight);
    float currentPosition = (scrollView.contentOffset.y + headerHeight);
    float percentScrolled = currentPosition/scrollableHeight;
    NSLog(@"percent scrolled %f", percentScrolled);
    
    // bracket the values
    if (percentScrolled < 0) {
        percentScrolled = 0.0f;
    }
    else if (percentScrolled > 1.0f) {
        percentScrolled = 1.0f;
    }
    
    for (UITableViewCell *cell in self.imageTableView.visibleCells) {
        //NSIndexPath *cellIndexPath = [self.tableView indexPathForCell:cell];
        if ([cell isKindOfClass:[CustomTableViewCell class]]) {
            [(CustomTableViewCell *) cell updateScroll:percentScrolled];
        }
    }
    
}


@end
