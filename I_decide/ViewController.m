//
//  ViewController.m
//  I_decide
//
//  Created by Shreya Bhattacharya on 30/01/23.
//

#import "ViewController.h"

@interface ViewController (){
    UILabel* decisionText;
    NSMutableArray* answers;
    BOOL questionShowing;
    int answerIndex;
    int lastAnswerIndex;
}
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) IBOutlet UILabel *decisionText;

@end

@implementation ViewController

@synthesize decisionText=decisionText;
-(int)generateRandomNumberWithLower:(int)lowerIndex andUpper:(int)upperIndex {
  return lowerIndex + arc4random() % (upperIndex - lowerIndex);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    questionShowing=true;
     answerIndex=0;
    answers = [NSMutableArray arrayWithObjects:@"Go for run", @"Drink water", @"Go for walk", @"Have lunch", @"Call a friend", @"Take a nap", @"Ask siri",@"Make your choice", nil];
}
 

- (IBAction)buttonPressed:(id)sender {
    NSLog(@"Button was pressed!");
    if (questionShowing){
        int count=(int)[answers count];
        BOOL newAnswer=false;
        answerIndex = [self generateRandomNumberWithLower:0 andUpper: count];
        newAnswer=answerIndex!= lastAnswerIndex;
    
    lastAnswerIndex=answerIndex;
    decisionText.text=answers[answerIndex];
}
    else {
        decisionText.text=@"What should I do?";
    }
    questionShowing=!questionShowing;
//    decisionText.text=@"Go for it";
   
//    int count = (int)[answers count];    // answers is the NSMutableArray*
//     int answerIndex = [self generateRandomNumberWithLower:0 andUpper: count];
//    decisionText.text =answers[answerIndex];
}
//- (void)dealloc {
// [decisionText release];
// [super de];
// }
@end
