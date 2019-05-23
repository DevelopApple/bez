#import "Bezon_prefsheader.h"

@implementation BezonListController
+ (NSString *)hb_specifierPlist {
directoryContent = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Library/Application Support/Bezon/CustomSounds/" error:NULL];
    return @"Bezon";
    
}

//share button
-(void)loadView {
    [super loadView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(shareTapped)];
}

//tint color to use for toggles and buttons 
+ (UIColor *)hb_tintColor {
    return [UIColor colorWithRed:44.0/255.0 green:46.0/255.0 blue:48.0/255.0 alpha:1.0];
}

- (void)shareTapped {
   
    NSString *shareText = @"Change your Charge sound with #Bezon by @Developapple! Download on the";
	
    NSArray * itemsToShare = @[shareText];
    
	
	UIActivityViewController *controller = [[UIActivityViewController alloc]initWithActivityItems:itemsToShare applicationActivities:nil];
    
    // and present it
    [self presentActivityController:controller];
}

- (void)presentActivityController:(UIActivityViewController *)controller {
    
    // for iPad: make the presentation a Popover
    controller.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:controller animated:YES completion:nil];
    
    UIPopoverPresentationController *popController = [controller popoverPresentationController];
    popController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popController.barButtonItem = self.navigationItem.rightBarButtonItem;
 
}


- (void)previewAndSet:(id)value forSpecifier:(id)specifier{
    // Sample sound and set
    AudioServicesDisposeSystemSoundID(selectedSound);
    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:[NSString stringWithFormat:@"/Library/Application Support/Bezon/CustomSounds/%@",value]],&selectedSound);
    AudioServicesPlaySystemSound(selectedSound);
    
    [super setPreferenceValue:value specifier:specifier];
}

// List our directory content
- (NSArray *)getValues:(id)target{
	NSMutableArray *listing = [NSMutableArray arrayWithObjects:@"None",nil];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"pathExtension != ''"];
    for (NSURL *fileURL in [directoryContent filteredArrayUsingPredicate:predicate]) {
	[listing addObject:fileURL];
    }
    return listing;
}

-(void)respring {
    NSTask *task = [[[NSTask alloc] init] autorelease];
    [task setLaunchPath:@"/usr/bin/killall"];
    [task setArguments:[NSArray arrayWithObjects:@"backboardd", nil]];
    [task launch];
    
}

@end

// vim:ft=objc
