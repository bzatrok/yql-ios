//
//  ViewController.m
//  yql-ios
//
//  Created by Guilherme Chapiewski on 10/19/12.
//  Copyright (c) 2012 Guilherme Chapiewski. All rights reserved.
//

#import "ViewController.h"
#import "YQL.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize QueryTextView;
@synthesize ResultsTextView;
@synthesize yql;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	yql = [[YQL alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(IBAction)stockQueryClicked:(id)sender
{
    NSDictionary *results = [YQL stockQuery:QueryTextView.text];
    [self updateResults:results];
}

-(IBAction)yqlQueryClicked:(id)sender
{
    NSDictionary *results = [YQL query:QueryTextView.text];
    [self updateResults:results];
}

-(void) updateResults:(NSDictionary*)results
{
    ResultsTextView.text = [[results valueForKeyPath:@"query.results"] description];
}

@end
