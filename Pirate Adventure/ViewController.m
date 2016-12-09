//
//  ViewController.m
//  Pirate Adventure
//
//  Created by Thum Wei Wah on 07/12/2016.
//  Copyright © 2016 Thum Wei Wah. All rights reserved.
//

#import "ViewController.h"
#import "Factory.h"
#import "Tile.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Factory *factory=[[Factory alloc]init];
    self.tiles=[factory tiles];
    self.character=[factory character];
    self.boss=[factory boss];
    self.currentPoint=CGPointMake(0, 0); //change coordinate at here
    NSLog(@"%f %f",self.currentPoint.x,self.currentPoint.y);
    [self updateCharacterStatsForArmor:nil withWeapons:nil withHealthEffect:0];
    [self updateTile];
    [self updateButtons];
//    NSArray *tiles=[factory tiles];
//    NSLog(@"%@",tiles);
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - helper methods

- (void)updateTile{
    Tile *tileModel =[[self.tiles objectAtIndex:self.currentPoint.x]objectAtIndex:self.currentPoint.y ];
    self.storyLabel.text=tileModel.story;
    self.backgroundImageView.image=tileModel.backgroundImage;
    self.healthLabel.text=[NSString stringWithFormat:@"%i",self.character.health];
    self.damageLabel.text=[NSString stringWithFormat:@"%i",self.character.damage];
    self.armorLabel.text=self.character.armor.name;
    self.weaponLabel.text=self.character.weapon.name;
    [self.actionButton setTitle:tileModel.actionButtonName forState:UIControlStateNormal];
}

- (BOOL)tileExitstsAtPoint:(CGPoint)point
{
    if(point.y>=0 && point.x >=0 && point.x<[self.tiles count] && point.y<[[self.tiles objectAtIndex:point.x]count]){
        return NO;
    }else{
        return YES;
    }
}

-(void)updateCharacterStatsForArmor:(Armor *)armor withWeapons:(Weapon *)weapon withHealthEffect:(int)healthEffect{
    if (armor !=nil) {
        self.character.health=self.character.health-self.character.armor.health+armor.health;
        self.character.armor=armor;
    }else if (weapon !=nil){
        self.character.damage=self.character.damage-self.character.weapon.damage+weapon.damage;
        self.character.weapon=weapon;
    }else if (healthEffect != 0){
        self.character.health=self.character.health+healthEffect;
    }else
    {self.character.health=self.character.health+self.character.armor.health;
        self.character.damage=self.character.damage+self.character.weapon.damage;
    }
    }

-(void)updateButtons{
    self.westButton.hidden=[self tileExitstsAtPoint:CGPointMake(self.currentPoint.x-1, self.currentPoint.y)];
    self.eastButton.hidden=[self tileExitstsAtPoint:CGPointMake(self.currentPoint.x+1, self.currentPoint.y)];
    self.northButton.hidden=[self tileExitstsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y+1)];
    self.southButton.hidden=[self tileExitstsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y-1)];

}



#pragma mark-IBAction

- (IBAction)actionButtonPressed:(UIButton *)sender {
    Tile *tile=[[self.tiles objectAtIndex:self.currentPoint.x]objectAtIndex:self.currentPoint.y];
    if(tile.healthEffect==-15){
        self.boss.health=self.boss.health-self.character.damage;
    }
    
    [self updateCharacterStatsForArmor:tile.armor withWeapons:tile.weapon withHealthEffect:tile.healthEffect];
    if(self.character.health<=0){
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Death Message" message:@"You have died please restart" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil ];
        [alertView show];
    } else if (self.boss.health<=0){
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Victory Message" message:@"You have defeated the evil pirate boss!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil ];
        [alertView show];
    }
    [self updateTile];
}

- (IBAction)resetButton:(UIButton *)sender {
    self.character=nil;
    self.boss=nil;
    [self viewDidLoad];
}

- (IBAction)northButtonPressed:(UIButton *)sender {
    self.currentPoint=CGPointMake(self.currentPoint.x, self.currentPoint.y+1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)eastButtonPressed:(UIButton *)sender {
    self.currentPoint=CGPointMake(self.currentPoint.x+1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)southButtonPressed:(UIButton *)sender {
    self.currentPoint=CGPointMake(self.currentPoint.x, self.currentPoint.y-1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)westButtonPressed:(UIButton *)sender {
    self.currentPoint=CGPointMake(self.currentPoint.x-1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}


@end
