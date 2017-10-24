//
//  DetailViewController.h
//  W4D3-CoreData-starter
//
//  Created by Roland Tecson on 2017-10-24.
//  Copyright © 2017 Roland Tecson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "w4d3-demo+CoreDataModel.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Meal *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

