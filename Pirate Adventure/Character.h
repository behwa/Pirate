//
//  Character.h
//  Pirate Adventure
//
//  Created by Thum Wei Wah on 08/12/2016.
//  Copyright © 2016 Thum Wei Wah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Armor.h"
#import "Weapon.h"
@interface Character : NSObject
@property(strong,nonatomic) Armor *armor;
@property(strong,nonatomic) Weapon *weapon;
@property(nonatomic) int damage;
@property(nonatomic) int health;
@end
