//
//  Factory.m
//  Pirate Adventure
//
//  Created by Thum Wei Wah on 07/12/2016.
//  Copyright © 2016 Thum Wei Wah. All rights reserved.
//

#import "Factory.h"
#import "Tile.h"
#import <UIKit/UIKit.h>
@implementation Factory
-(NSArray *)tiles
{
    Tile *tile1=[[Tile alloc]init];
    tile1.story=@"Captain, we need a fearless leader such as yourself to undertake a vayage. You just stop the evil pirate Boss. Would you like a blunted sword to get started?";
    tile1.backgroundImage=[UIImage imageNamed:@"PirateStart.jpg"];
    Weapon *bluntedSword=[[Weapon alloc]init];
    bluntedSword.name=@"Blunted Sword";
    bluntedSword.damage=12;
    tile1.weapon=bluntedSword;
    tile1.actionButtonName=@"Take the sword";
    
    Tile *tile2=[[Tile alloc]init];
    tile2.backgroundImage=[UIImage imageNamed:@"PirateBlacksmith.png"];
    tile2.story=@"You hava came across an armory. Would you like to upgrade your armor to steel armor?";
    Armor *steelArmor=[[Armor alloc]init];
    steelArmor.name=@"Steel Armor";
    steelArmor.health=8;
    tile2.armor=steelArmor;
    tile2.actionButtonName=@"Take Armor";
    
    Tile *tile3=[[Tile alloc]init];
    tile3.backgroundImage=[UIImage imageNamed:@"PirateFriendlyDock.png"];
    tile3.story=@"A mysterious dock appears on the horizon. Should we stop and ask for direction?";
    tile3.healthEffect=12;
    tile3.actionButtonName=@"Stop at the dock";
    
    NSMutableArray *firstColumn=[[NSMutableArray alloc]init];
    [firstColumn addObject:tile1];
    [firstColumn addObject:tile2];
    [firstColumn addObject:tile3];
    
    Tile *tile4=[[Tile alloc]init];
    tile4.story=@"You have found a parrot. This can be used in your armor slot. Parrots are a great defender and are fiercely loyal to thier captain!";
    tile4.backgroundImage=[UIImage imageNamed:@"PirateParrot.jpg"];
    Armor *parrotArmor=[[Armor alloc]init];
    parrotArmor.health=20;
    parrotArmor.name=@"Parrot";
    tile4.armor=parrotArmor;
    tile4.actionButtonName=@"Adopt Parrot";
    
    Tile *tile5=[[Tile alloc]init];
    tile5.story=@"You have stumbled upon a cache of pirate weapons. Would you like to upgrade to a pistol?";
    tile5.backgroundImage=[UIImage imageNamed:@"PirateWeapon.png"];
    Weapon *pistolWeapon=[[Weapon alloc]init];
    pistolWeapon.name=@"Pistol";
    pistolWeapon.damage=17;
    tile5.weapon=pistolWeapon;
    tile5.actionButtonName=@"Use pistol";
    
    Tile *tile6=[[Tile alloc]init];
    tile6.story=@"You have been captured by the pirate and are ordered to walk to the plank.";
    tile6.backgroundImage=[UIImage imageNamed:@"PiratePlank.jpg"];
    tile6.healthEffect=-22;
    tile6.actionButtonName=@"Show no fear";
    
    NSMutableArray *secondColumn=[[NSMutableArray alloc]init];
    [secondColumn addObject:tile4];
    [secondColumn addObject:tile5];
    [secondColumn addObject:tile6];
    
    Tile *tile7=[[Tile alloc]init];
    tile7.story=@"You have sighted a pirate battle off the coast. Should we intervene?";
    tile7.backgroundImage=[UIImage imageNamed:@"PirateShipBattle.jpg"];
    Tile *tile8=[[Tile alloc]init];
    tile7.healthEffect=8;
    tile7.actionButtonName=@"Fight those scum";
    
    tile8.story=@"The legend of the deep. The mighty Octopus appears.";
    tile8.backgroundImage=[UIImage imageNamed:@"PirateOctopusAttack.png"];
    tile8.healthEffect=-46;
    tile8.actionButtonName=@"Abandon ship";
    
    
    Tile *tile9=[[Tile alloc]init];
    tile9.story=@"You have stumbled upon a hidden pirate treasure!";
    tile9.backgroundImage=[UIImage imageNamed:@"PirateTresure.png"];
    tile9.healthEffect=20;
    tile9.actionButtonName=@"Take Treasure";
    
    NSMutableArray *thirdColumn=[[NSMutableArray alloc]init];
    [thirdColumn addObject:tile7];
    [thirdColumn addObject:tile8];
    [thirdColumn addObject:tile9];
    
    Tile *tile10=[[Tile alloc]init];
    tile10.story=@"A group of pirate attemps to aboard your ship?";
    tile10.backgroundImage=[UIImage imageNamed:@"PirateAttack.jpg"];
    tile10.healthEffect=-15;
    tile10.actionButtonName=@"Repel the invader";
    
    Tile *tile11=[[Tile alloc]init];
    tile11.story=@"In the deep of the sea many thing ;ove and many thins can be found. Will the fortune bring help or ruins?";
    tile11.backgroundImage=[UIImage imageNamed:@"PirateTreasure2.jpg"];
    tile11.healthEffect=-7;
    tile11.actionButtonName=@"Swim Deeper";
    
    Tile *tile12=[[Tile alloc]init];
    tile12.story=@"You finnally face off with the fearsome pirate boss!?";
    tile12.backgroundImage=[UIImage imageNamed:@"PirateBoss.png"];
    tile12.healthEffect=-15;
    tile12.actionButtonName=@"Fight";
    
    
    NSMutableArray *fourthColumn=[[NSMutableArray alloc]init];
    [fourthColumn addObject:tile10];
    [fourthColumn addObject:tile11];
    [fourthColumn addObject:tile12];
    
    NSArray *tiles=[[NSArray alloc]initWithObjects:firstColumn,secondColumn,thirdColumn,fourthColumn, nil];
    return tiles;
}

-(Character *)character{
    
    Character *character=[[Character alloc]init];
    character.health=100;
    Armor *armor=[[Armor alloc]init];
    armor.name=@"Cloack";
    armor.health=5;
    character.armor=armor;
    
    Weapon *weapon=[[Weapon alloc]init];
    weapon.name=@"Fists";
    weapon.damage=10;
    character.weapon=weapon;
    return character;
}

-(Boss *)boss{
    Boss *boss=[[Boss alloc]init];
    boss.health=80;
    return boss;
}
@end
