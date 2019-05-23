//Bezon Created by Yakir Hazan (@DebelopAppler) 
//Bezon is a tweak that allows users to choose a charge sound with ease!
//This is the main header file for thet tweak!

//Headers
#import <AudioToolbox/AudioServices.h>
#import <AVFoundation/AVAudioPlayer.h>
#import <AVFoundation/AVAudioSession.h>
#import <AudioToolbox/AudioToolbox.h>
#import <UIKit/UIKit.h>
#import <Cephei/HBPreferences.h>

//Prefs
HBPreferences *preferences;

//Enable stuff :P
BOOL kEnabled;
BOOL kVibrateEnabled;
NSString *kCustom;

//interfaces 
@interface SBUIController : NSObject {
	
}
+(id)sharedInstance;
-(BOOL)isOnAC;
@end