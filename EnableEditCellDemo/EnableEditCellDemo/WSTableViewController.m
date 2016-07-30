//
//  WSTableViewController.m
//  EnableEditCellDemo
//
//  Created by sw on 16/7/23.
//  Copyright © 2016年 sw. All rights reserved.
//

#import "WSTableViewController.h"
#import "WSEnableEditCell.h"

@interface WSTableViewController ()<WSEnableEditCellDelegate>
@property(nonatomic,strong) NSArray<NSString *> *contentTexts;
@end

@implementation WSTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([WSEnableEditCell class]) bundle:nil] forCellReuseIdentifier:@"enableEditCell"];
    
    // self-sizing
    self.tableView.estimatedRowHeight = 200.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.contentTexts.count;;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WSEnableEditCell *cell = [tableView dequeueReusableCellWithIdentifier:@"enableEditCell"];
    
    cell.delegate = self.view;
    [cell setContent:self.contentTexts[indexPath.row]];
    return cell;
}

- (NSArray *)visiableCells {

        
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"选中:%ld行",indexPath.row);
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

}

#pragma mark - getter
- (NSArray<NSString *> *)contentTexts {
    if (!_contentTexts) {
        _contentTexts = @[
                          @"1111111111111111111111111111111111111111111111111111111111111111111111",
                          @"22222222222222222222222222222222222222222222222222222222222222222222222",
                          @"33333333333333333333333333333333333333333333333333333333333333333333333",
                          @"444444444444444444444444444444444444444444444444444444444444444444444444",
                          @"555555555555555555555555555555555555555555555555555555555555555555555555",
                          @"666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666",
                          @"7777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777",
                          @"8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888",
                          @"99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999",
                          @"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
                          ];
    }
    return _contentTexts;
}

- (void)beginEditCellContent {
    self.tableView.scrollEnabled = NO;
}

- (void)endEditCellContent {
    self.tableView.scrollEnabled = YES;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
