//
//  ViewController.m
//  atmlocator
//
//  Created by Feby Varghese on 7/18/12.
//  Copyright (c) 2012 febycv. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//Reachable Conditions
-(NSString *)stringFromStatus:(NetworkStatus)status
{
    NSString *string;
    switch (status)
    {
        case NotReachable: string = @"No Network Found";
            break;
            
        case ReachableViaWiFi: string = @"Reachable via WiFi";
            break;
            
        case ReachableViaWWAN: string = @"Reachable via WWAN";
            break;
            
        default: string = @"Unknown";
            break;
    }
    return string;
}

- (void)viewDidLoad
{
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus status = [reach currentReachabilityStatus];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error !!!!" message:[self stringFromStatus:status] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    switch (status)
    {
        case NotReachable: [alert show];
            break;
            
        default:
            xmlParser = [[nsxmlparser alloc] loadXMLByURL:@"https://maps.googleapis.com/maps/api/place/search/xml?location=8.487464551632215,76.95282608270645&radius=15000&types=atm&sensor=false&key=AIzaSyBfTm8JWtX_lKBH_0A4SBwU1afJwLOpfPM"];
            break;
    }
    self.title = @"ATM";

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[xmlParser tweets] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier]autorelease];
    }
    
    pagetwo *currentTweet = [[xmlParser tweets] objectAtIndex:indexPath.row];
    cell.textLabel.text=[currentTweet name];
    cell.detailTextLabel.text= [currentTweet vicinity];
    
    NSURL *url=[NSURL URLWithString:[currentTweet image]];
    NSData *data=([NSData dataWithContentsOfURL:url]);
    UIImage *img =[[UIImage alloc]initWithData:data];
    
    cell.imageView.image=img;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)dealloc
{
    [xmlParser release];
    [super dealloc];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
