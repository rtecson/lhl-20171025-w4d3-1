//
//  DetailViewController.h
//  W4D3-CoreData-starter
//
//  Created by Daniel Mathews on 2017-08-16.
//  Copyright © 2017 Daniel Mathews. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "W4D3_CoreData_starter+CoreDataModel.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Event *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

