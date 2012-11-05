//
//  ViewController.m
//  One-dimensionalCode
//
//  Created by bobo on 12-11-5.
//  Copyright (c) 2012年 ykse. All rights reserved.
//

#import "ViewController.h"
#import "UIImage-NKDBarcode.h"
#import "NKDCode128Barcode.h"

@interface ViewController ()
@property (retain, nonatomic) IBOutlet UITextField *barcodeTextField;
@property (retain, nonatomic) IBOutlet UITableView *barcodeMethod;
@property (retain, nonatomic) IBOutlet UIImageView *barcodeImageView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_barcodeTextField release];
    [_barcodeMethod release];
    [_barcodeImageView release];
    [super dealloc];
}
- (IBAction)onCreateBarCodeImage:(id)sender
{
    if (!self.barcodeTextField.text || [self.barcodeTextField.text isEqualToString:@""]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"错误" message:@"编码字符不为空" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
        [alertView show];
        return ;
    }
    NKDCode128Barcode *barcode = [[NKDCode128Barcode alloc] initWithContent:self.barcodeTextField.text printsCaption:YES];
    UIImage *image = [UIImage imageFromBarcode:barcode];
    self.barcodeImageView.image = image;
}
@end
