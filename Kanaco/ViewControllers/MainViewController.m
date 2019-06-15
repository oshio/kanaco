//
//  ViewController.m
//  Kanaco
//
//  Created by yayoi on 2019/06/12.
//  Copyright © 2019 Y.Grace. All rights reserved.
//

#import "MainViewController.h"
#import "MainViewController+ShowAlert.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UITextView *inputTextView;
@property (weak, nonatomic) IBOutlet UITextView *outputTextView;
@property (weak, nonatomic) IBOutlet UIButton *resultCopyButton;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.inputTextView.text = nil;
    self.resultCopyButton.hidden = YES;
}

#pragma mark - Action

- (IBAction)convert:(id)sender
{
    NSString *inputString = self.inputTextView.text;
    NSString *inputStringWithoutSpace = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    if(inputString == nil || inputStringWithoutSpace.length == 0){
        [self showAutoDismissAlertWithTitle:@"" message:@"なにか もじを いれてね！"];
        return;
    }
    
    [self.inputTextView resignFirstResponder];

    KanaConverter *converter = [[KanaConverter alloc] initWithDelegate:self];
    [converter requestWithInputString:inputString];
}

- (IBAction)copyResultToClipboard:(id)sender
{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    [pasteboard setString:self.outputTextView.text];
    
    [self showAutoDismissAlertWithTitle:@"" message:@"コピーしたよ！"];
}

#pragma mark - KanaConverterDelegate

- (void)didReceiveOutputString:(NSString *)outputString
{    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.outputTextView.text = outputString;
        self.resultCopyButton.hidden = NO;
    });
}

- (void)didReceiveError:(NSError *)error
{
    [self showAutoDismissAlertWithTitle:@"つうしん しっぱい" message:@"あとで もういちど ためしてね"];
}

#pragma mark - UITextViewDelegate

- (void)textViewDidChange:(UITextView *)textView
{
    //入力エリアの文字を消したら結果表示エリアも元に戻す
    if(textView.text == nil || textView.text.length == 0){
        self.outputTextView.text = @"ここに ひらがなが でてくるよ";
        self.resultCopyButton.hidden = YES;
    }
}

@end
