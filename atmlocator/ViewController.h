//
//  ViewController.h
//  atmlocator
//
//  Created by Feby Varghese on 7/18/12.
//  Copyright (c) 2012 febycv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "pagetwo.h"
#import "nsxmlparser.h"
#import "Reachability.h"

@interface ViewController : UIViewController
{
    nsxmlparser *xmlParser;
}

-(NSString *)stringFromStatus:(NetworkStatus) status;

@end
