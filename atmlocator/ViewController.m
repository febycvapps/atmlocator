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

@synthesize slidervalue;


-(IBAction) sliderlabel:(id)sender
{
    //self.slidervalue.text = [[NSString alloc]initWithFormat:@"%d", (int)slider.value ] ;
    slidervalue.text = [[NSString alloc] initWithFormat:@"%1.2f",slider.value];
}

- (void)viewDidLoad
{
    xmlParser = [[nsxmlparser alloc] loadXMLByURL:@"https://maps.googleapis.com/maps/api/place/search/xml?location=8.487464551632215,76.95282608270645&radius=15000&types=atm&sensor=false&key=AIzaSyBfTm8JWtX_lKBH_0A4SBwU1afJwLOpfPM"];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"ATM";
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
