//
//  Tile.h
//  Pirate Adventure
//
//  Created by Thum Wei Wah on 07/12/2016.
//  Copyright © 2016 Thum Wei Wah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Weapon.h"
#import "Armor.h"
@interface Tile : NSObject
@property (strong,nonatomic) NSString *story;
@property (strong,nonatomic) UIImage *backgroundImage;
@property (strong,nonatomic) NSString *actionButtonName;

@property (strong,nonatomic) Weapon *weapon;
@property (strong,nonatomic) Armor *armor;
@property (nonatomic) int healthEffect;
@end
