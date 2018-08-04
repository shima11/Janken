//
//  ViewController.h
//  janken
//
//  Created by shima jinsei on 2013/11/02.
//  Copyright (c) 2013年 shima jinsei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController
{
    IBOutlet UILabel *enemy;
    IBOutlet UILabel *my;
    IBOutlet UILabel *janken;
    IBOutlet UILabel *hantei;
    
    IBOutlet UIButton *jack;
    IBOutlet UIButton *queen;
    IBOutlet UIButton *king;
    IBOutlet UIButton *again;
    
    IBOutlet UIImageView *mykekka;
    IBOutlet UIImageView *enemykekka;
    
    IBOutlet UIImageView *jack_image;
    IBOutlet UIImageView *queen_image;
    IBOutlet UIImageView *king_image;
    
    UIImage *small_jack;
    UIImage *small_queen;
    UIImage *small_king;
    
    AVAudioPlayer *bgm;
    AVAudioPlayer *click;
}

- (IBAction)jack_pressed:(id)sender;
- (IBAction)queen_pressed:(id)sender;
- (IBAction)king_pressed:(id)sender;
- (IBAction)again_pressed:(id)sender;

- (void) hiliwake : () value;

@end
