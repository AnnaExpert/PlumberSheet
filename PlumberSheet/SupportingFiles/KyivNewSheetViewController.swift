//
//  http://iashchuk.com
//  NewSheetViewController.swift
//  PlumberSheet - Work sheet app for in-house plumber engineers
//
//  Created by Alexander Iashchuk on 7/11/17.
//  Copyright © 2017 Alexander Iashchuk (iAlexander). All rights reserved.
//

import UIKit

class NewSheetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation
     if #available(<#platform name#> <#version#>, *) {
     <#API available statements#>
     } else {
     <#fallback statements#>
     }func <#name#>(<#parameters#>) -> <#return type#> {
     <#function body#>
     }
     // In a storyboard-based application, you will o@interface <#class name#> : <#superclass#>
     deinit {
     <#statements#>
     }defer {
     <#deferred statements#>
     }import <#module#>init(<#parameters#>) {
     <#statements#>
     }protocol <#name#> {
     <#requirements#>
     }required init(<#parameters#>) {
     <#statements#>
     }
     @endften want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
     }- (instancetype)initWithCoder:(NSCoder *)coder
     {NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
     NSEntityDescription *entity = [NSEntityDescription entityForName:@"<#Entity name#>" inManagedObjectContext:<#context#>];
     [fetchRequest setEntity:entity];
     // Specify criteria for filtering which objects to fetch
     NSPredicate *predicate = [NSPredicate predicateWithFormat:@"<#format string#>", <#arguments#>];
     [fetchRequest setPredicate:predicate];
     // Specify how the fetched objects should be sorted
     NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"<#key#>"
     ascending:YES];
     [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
     
     NSError *error = nil;
     NSArray *fetchedObjects = [<#context#> executeFetchRequest:fetchRequest error:&error];
     if (fetchedObjects == nil) {
     <#Error handling code#>
     }
     self = [super initWithCoder:coder];
     if (self) {
     <#statements#>
     }let <#property name#>: <#type name#> = {
     <#statements#>
     return <#value#>
     }()- (instancetype)initWithFrame:(NSRect)frame
     {
     self = [super initWithFrame:frame];
     if (self) {
     <#statements#>
     }
     return self;
     }
     return self;
     }struct <#name#> {
     <#fields#>
     }typealias <#type name#> = <#type expression#>
    */

}
