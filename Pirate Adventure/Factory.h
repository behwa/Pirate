//
//  Factory.h
//  Pirate Adventure
//
//  Created by Thum Wei Wah on 07/12/2016.
//  Copyright © 2016 Thum Wei Wah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Character.h"
#import "Boss.h"
@interface Factory : NSObject
-(NSArray *)tiles;  //self
-(Character *)character; //from character
-(Boss *)boss;
@end
