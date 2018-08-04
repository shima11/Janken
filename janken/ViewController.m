//
//  ViewController.m
//  janken
//
//  Created by shima jinsei on 2013/11/02.
//  Copyright (c) 2013年 shima jinsei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *bgmPath = [[NSBundle mainBundle] pathForResource:@"bgm"ofType:@"mp3"];
    NSURL *bgmUrl = [NSURL fileURLWithPath:bgmPath];
    bgm = [[AVAudioPlayer alloc] initWithContentsOfURL:bgmUrl error:nil];
    [bgm setNumberOfLoops : 0];
    bgm.volume = 0.2;
    [bgm play];
    
    jack_image = [[UIImageView alloc] initWithFrame:CGRectMake(39, 657 , 200, 300)];
    jack_image.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"jack.jpg"]];
    [self.view addSubview:jack_image];
    queen_image = [[UIImageView alloc] initWithFrame:CGRectMake(299, 657 , 200, 300)];
    queen_image.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"queen.jpg"]];
    [self.view addSubview:queen_image];
    king_image = [[UIImageView alloc] initWithFrame:CGRectMake(543, 657 , 200, 300)];
    king_image.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"king.jpg"]];
    [self.view addSubview:king_image];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

int keizoku = 0;
int mycard = 0;
int onemore = 0;
int viewcount = 0;

- (IBAction)jack:(id)sender {
    //click sound
    NSString *bgmPath = [[NSBundle mainBundle] pathForResource:@"click"ofType:@"mp3"];
    NSURL *bgmUrl = [NSURL fileURLWithPath:bgmPath];
    click = [[AVAudioPlayer alloc] initWithContentsOfURL:bgmUrl error:nil];
    [click setNumberOfLoops : 0];
    [click play];
    //jack animation
    viewcount++;
    if(viewcount == 1){
        [self.view bringSubviewToFront:jack_image];
        [UIImageView animateWithDuration:1.0 animations:^{
            CGRect frame = jack_image.frame;
            frame.origin.x = mykekka.frame.origin.x - 50;
            frame.origin.y = mykekka.frame.origin.y - 75;
            jack_image.frame = frame;
            CGAffineTransform scale = CGAffineTransformMakeScale(0.5, 0.5);
            [jack_image setTransform:scale];
        }];
    }
    mycard = 0;
    if (keizoku == 1 && onemore == 0) {
        janken.text = @"あいこで・・・ショッ！";
    }
    if(keizoku == 0 && onemore == 0){
        janken.text = @"じゃんけん・・・ポンッ！";
    }
    srand(time(nil));
    NSInteger random;
    random = rand()%3;
    if(random == 0 && onemore == 0){
        enemykekka.image = [UIImage imageNamed:@"small_jack.jpg"];
        hantei.text = @"引き分け";
        janken.text = @"あいこで・・・";
        keizoku = 1;
        viewcount = 0;
    }
    if(random == 1 && onemore == 0){
        enemykekka.image = [UIImage imageNamed:@"small_queen.jpg"];
        hantei.text = @"勝ち";
        keizoku = 0;
        onemore = 1;
    }
    if(random == 2 && onemore == 0){
        enemykekka.image = [UIImage imageNamed:@"small_king.jpg"];
        hantei.text = @"負け";
        keizoku = 0;
        onemore = 1;
    }
}

- (IBAction)queen:(id)sender {
    NSString *bgmPath = [[NSBundle mainBundle] pathForResource:@"click"ofType:@"mp3"];
    NSURL *bgmUrl = [NSURL fileURLWithPath:bgmPath];
    click = [[AVAudioPlayer alloc] initWithContentsOfURL:bgmUrl error:nil];
    [click setNumberOfLoops : 0];
    [click play];
    viewcount++;
    if(viewcount == 1){
        [self.view bringSubviewToFront:queen_image];
        [UIImageView animateWithDuration:1.0 animations:^{
            CGRect frame = queen_image.frame;
            frame.origin.x = mykekka.frame.origin.x - 50;
            frame.origin.y = mykekka.frame.origin.y - 75;
            queen_image.frame = frame;
            CGAffineTransform scale = CGAffineTransformMakeScale(0.5, 0.5);
            [queen_image setTransform:scale];
        }];
    }
    mycard = 1;
    if (keizoku == 1 && onemore == 0) {
        janken.text = @"あいこで・・・ショッ！";
    }
    if(keizoku == 0 && onemore == 0){
        janken.text = @"じゃんけん・・・ポンッ！";
    }
    srand(time(nil));
    NSInteger random;
    random = rand()%3;
    if(random == 0 && onemore == 0){
        enemykekka.image = [UIImage imageNamed:@"small_jack.jpg"];
        hantei.text = @"負け";
        keizoku = 0;
        onemore = 1;
    }
    if(random == 1 && onemore == 0){
        enemykekka.image = [UIImage imageNamed:@"small_queen.jpg"];
        hantei.text = @"引き分け";
        janken.text = @"あいこで・・・";
        keizoku = 1;
        viewcount = 0;
    }
    if(random == 2 && onemore == 0){
        enemykekka.image = [UIImage imageNamed:@"small_king.jpg"];
        hantei.text = @"勝ち";
        keizoku = 0;
        onemore = 1;
    }
}

- (IBAction)king:(id)sender {
    NSString *bgmPath = [[NSBundle mainBundle] pathForResource:@"click"ofType:@"mp3"];
    NSURL *bgmUrl = [NSURL fileURLWithPath:bgmPath];
    click = [[AVAudioPlayer alloc] initWithContentsOfURL:bgmUrl error:nil];
    [click setNumberOfLoops : 0];
    [click play];
    viewcount++;
    if(viewcount == 1){
        [self.view bringSubviewToFront:king_image];
        [UIImageView animateWithDuration:1.0 animations:^{
            CGRect frame = king_image.frame;
            frame.origin.x = mykekka.frame.origin.x - 50;
            frame.origin.y = mykekka.frame.origin.y - 75;
            king_image.frame = frame;
            CGAffineTransform scale = CGAffineTransformMakeScale(0.5, 0.5);
            [king_image setTransform:scale];
        }];
    }
    mycard = 2;
    if (keizoku == 1 && onemore == 0) {
        janken.text = @"あいこで・・・ショッ！";
    }
    if(keizoku == 0 && onemore == 0){
        janken.text = @"じゃんけん・・・ポンッ！";
    }
    srand(time(nil));
    NSInteger random;
    random = rand()%3;
    if(random == 0 && onemore == 0){
        enemykekka.image = [UIImage imageNamed:@"small_jack.jpg"];
        hantei.text = @"勝ち";
        keizoku = 0;
        onemore = 1;
    }
    if(random == 1 && onemore == 0){
        enemykekka.image = [UIImage imageNamed:@"small_queen.jpg"];
        hantei.text = @"負け";
        keizoku = 0;
        onemore = 1;
    }
    if(random == 2 && onemore == 0){
        enemykekka.image = [UIImage imageNamed:@"small_king.jpg"];
        hantei.text = @"引き分け";
        janken.text = @"あいこで・・・";
        keizoku = 1;
        viewcount = 0;
    }
}

- (IBAction)again:(id)sender {
    mykekka.image = [UIImage imageNamed:@""];
    enemykekka.image = [UIImage imageNamed:@""];
    janken.text = @"じゃんけん・・・";
    hantei.text = @"";
    onemore = 0;
    NSString *bgmPath = [[NSBundle mainBundle] pathForResource:@"click"ofType:@"mp3"];
    NSURL *bgmUrl = [NSURL fileURLWithPath:bgmPath];
    click = [[AVAudioPlayer alloc] initWithContentsOfURL:bgmUrl error:nil];
    [click setNumberOfLoops : 0];
    [click play];
    
    viewcount = 0;
    
    jack_image.hidden = NO;
    queen_image.hidden = NO;
    king_image.hidden = NO;
    
    [UIImageView animateWithDuration:1.0 animations:^{
        CGAffineTransform scale = CGAffineTransformMakeScale(1.0, 1.0);
        [jack_image setTransform:scale];
    }];
    [UIImageView animateWithDuration:1.0 animations:^{
        CGRect frame = jack_image.frame;
        frame.origin.x = 39;
        frame.origin.y = 657;
        jack_image.frame = frame;
    }];
    [UIImageView animateWithDuration:1.0 animations:^{
        CGAffineTransform scale = CGAffineTransformMakeScale(1.0, 1.0);
        [queen_image setTransform:scale];
    }];

    [UIImageView animateWithDuration:1.0 animations:^{
        CGRect frame = queen_image.frame;
        frame.origin.x = 299;
        frame.origin.y = 657;
        queen_image.frame = frame;
    }];
    [UIImageView animateWithDuration:1.0 animations:^{
        CGAffineTransform scale = CGAffineTransformMakeScale(1.0, 1.0);
        [king_image setTransform:scale];
    }];
    [UIImageView animateWithDuration:1.0 animations:^{
        CGRect frame = king_image.frame;
        frame.origin.x = 543;
        frame.origin.y = 657;
        king_image.frame = frame;
        CGAffineTransform scale = CGAffineTransformMakeScale(1.0 , 1.0);
        [king_image setTransform:scale];
    }];
    
    mycard = 0;

 /*    mykekka.image = [UIImage imageNamed:@""];
    enemykekka.image = [UIImage imageNamed:@""];
    NSString *bgmPath = [[NSBundle mainBundle] pathForResource:@"bgm"ofType:@"mp3"];
    NSURL *bgmUrl = [NSURL fileURLWithPath:bgmPath];
    bgm = [[AVAudioPlayer alloc] initWithContentsOfURL:bgmUrl error:nil];
    [bgm setNumberOfLoops : 0];
    bgm.volume = 0.2;
    [bgm play];
*/
 }

@end



