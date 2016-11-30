//
//  ViewController.m
//  HUD-Guidance-Demo
//
//  Created by HTC on 2016/11/30.
//  Copyright © 2016年 iHTCboy. All rights reserved.
//

#import "ViewController.h"
// import headerfile
#import "HUDUtil.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray * titlesArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titlesArray = @[@"UIAlertView", @"JGProgressHUD", @"MBProgressHUD", @"Toast"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titlesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"HUDDemoCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = self.titlesArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    HUDUtil * hud = [HUDUtil sharedHUDUtil];
    switch (indexPath.row) {
        case 0:
            [hud showAlertViewWithTitle:@"AlertView" mesg:@"hello hud!" cancelTitle:@"cancel" confirmTitle:@"ok" tag:100];
            hud.clickedAlertViewBlock = ^(_Nullable id hudView, NSInteger clickedIndex, NSInteger tag){
                if (tag == 100) {
                    switch (clickedIndex) {
                        case 0:
                            NSLog(@"clicked Cancel");
                            break;
                        case 1:
                            NSLog(@"clicked OK");
                            break;
                        default:
                            break;
                    }
                }
            };
            break;
        case 1:
            [hud showTextMBHUDWithText:@"loading MBHUD" delay:2 inView:self.view];
            break;
        case 2:
            [hud showTextJGHUDWithText:@"loading JGHUD" delay:2 inView:self.view];
            break;
        case 3:
            [self.view makeToast:@"show Toast" duration:2 position:CSToastPositionCenter];
            break;
        default:
            break;
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
