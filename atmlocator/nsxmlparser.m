//
//  nsxmlparser.m
//  atmlocator
//
//  Created by Feby Varghese on 7/18/12.
//  Copyright (c) 2012 febycv. All rights reserved.
//

#import "nsxmlparser.h"

@implementation nsxmlparser
@synthesize tweets;

-(id) loadXMLByURL:(NSString *)urlString
{
    tweets          = [[NSMutableArray alloc] init];
    
    NSURL *url      = [NSURL URLWithString:urlString];
    
    
    NSData  *data   = [[NSData alloc] initWithContentsOfURL:url];
    
    parser          = [[NSXMLParser alloc] initWithData:data];
    
    parser.delegate = self;
    
    [parser parse];
    
    return self;
}

- (void) dealloc
{
    [parser release];
    [super dealloc];
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementname isEqualToString:@"result"])
    {
        currentTweet = [pagetwo alloc];
    }
    
}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementname isEqualToString:@"name"])
    {
        currentTweet.name = currentNodeContent;
    }
    if ([elementname isEqualToString:@"vicinity"])
    {
        currentTweet.vicinity = currentNodeContent;
    }
    if ([elementname isEqualToString:@"icon"])
    {
        currentTweet.image=currentNodeContent;
    }
    
    if ([elementname isEqualToString:@"result" ])
    {
        [tweets addObject:currentTweet];
        
        [currentTweet release];
        
        currentTweet = nil;
        
        [currentNodeContent release];
        
        currentNodeContent = nil;
    }
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    currentNodeContent = (NSMutableString *) [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


@end
