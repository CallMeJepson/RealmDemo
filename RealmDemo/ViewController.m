//
//  ViewController.m
//  RealmDemo
//
//  Created by SunShine on 16/8/2.
//  Copyright © 2016年 JP. All rights reserved.
//

#import "ViewController.h"
#import "SpeciesModel.h"

@interface ViewController ()
@property (nonatomic, strong) SpeciesModel *model;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _model = [[SpeciesModel alloc] init];
    
    NSArray *paths1=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory
                                                        , NSUserDomainMask
                                                        , YES);
    NSString *documentsDirect=[paths1 objectAtIndex:0];
    NSLog(@"%@", documentsDirect);
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)addDataClickBtn:(id)sender {
    [_model addData];
}

- (IBAction)deleteDataClickBtn:(id)sender {
    [_model deleteData];
}

- (IBAction)modifyDataClickBtn:(id)sender {
    [_model modifyData];
}

- (IBAction)selectDataClickBtn:(id)sender {
    [_model selectData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
