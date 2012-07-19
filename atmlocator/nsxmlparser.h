//
//  nsxmlparser.h
//  atmlocator
//
//  Created by Feby Varghese on 7/18/12.
//  Copyright (c) 2012 febycv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "pagetwo.h"

@interface nsxmlparser : NSObject <NSXMLParserDelegate>
{
    NSMutableString *currentNodeContent;
    NSMutableArray  *tweets;
    NSXMLParser     *parser;
    pagetwo      *currentTweet;
}
@property (readonly, retain) NSMutableArray *tweets;

-(id) loadXMLByURL:(NSString *)urlString;


@end
