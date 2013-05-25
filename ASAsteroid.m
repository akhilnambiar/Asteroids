//
//  ASAsteroid.m
//  Asteroids
//
//  Created by Akhil Nambiar on 1/11/13.
//
//

#import "ASAsteroid.h"
#import "ASShip.h"
#import "ASBullet.h"

@implementation ASAsteroid


//You need to figure out how to store a global variable while initializing
//just make it a property utilize that property

-(id) initLarge
{
    //(arc4random() % 5) + 1
    //smallerAsteroid.xVelocity = self.xVelocity + (rand() % 7) - 3;
    //smallerAsteroid.yVelocity = self.yVelocity + (rand() % 7) - 3;
    [super initWithImage:[NSImage imageNamed:@"asteroidLarge"]];
    self.xVelocity = (rand() % 7) - 3;
    self.yVelocity = (rand() % 7) - 3;
    self.rotation = 0;
    self.xRand=2.;
    self.yRand=2.;
    ASAsteroid *asteroid1 = [[ASAsteroid alloc] initMedium];
    ASAsteroid *asteroid2 = [[ASAsteroid alloc] initMedium];
    smallerAsteroids = [[NSArray alloc] initWithObjects: asteroid1, asteroid2, nil];
    [asteroid1 autorelease];
    [asteroid2 autorelease];
    return self;
}
-(id) initMedium
{
    [super initWithImage:[NSImage imageNamed:@"asteroidMedium"]];
    ASAsteroid *asteroid3 = [[ASAsteroid alloc] initSmall];
    ASAsteroid *asteroid4 = [[ASAsteroid alloc] initSmall];
    ASAsteroid *asteroid5 = [[ASAsteroid alloc] initSmall];
    smallerAsteroids = [[NSArray alloc] initWithObjects: asteroid3, asteroid4, asteroid5, nil];
    [asteroid3 autorelease];
    [asteroid4 autorelease];
    [asteroid5 autorelease];
           return self;
}
-(id) initSmall
{
    [super initWithImage:[NSImage imageNamed:@"asteroidSmall"]];
    smallerAsteroids = [[NSArray alloc] init];
    return self;
}
-(void)dealloc
{
    [smallerAsteroids release];
    [super dealloc];
}
- (float)x { return frame.origin.x+frame.size.width*self.xRand; }
- (float)y { return frame.origin.y+frame.size.height*self.yRand; }
- (void)setX:(float)x { frame.origin.x = x-frame.size.width*self.xRand; }
- (void)setY:(float)y { frame.origin.y = y-frame.size.height*self.yRand; }


-(void) update
{
    for (ASDrawable *drawable in self.view.drawables)
    {
        if ([drawable isKindOfClass: [ASShip class]] && [drawable collidesWith: self])
             {
                 if (![drawable shield])
                 {
                     [drawable die];
                 }
             }
    }
    for (ASDrawable *drawable in self.view.drawables)
    {
        if ([drawable isKindOfClass: [ASBullet class]] && [drawable collidesWith: self])
        {
            for (ASAsteroid *smallerAsteroid in smallerAsteroids)
            {
                smallerAsteroid.xVelocity = (rand() % 7) - 3;
                smallerAsteroid.yVelocity = (rand() % 7) - 3;
                smallerAsteroid.rotation = self.rotation;
                smallerAsteroid.x = self.x;
                smallerAsteroid.y = self.y;
                [self.view addDrawable: smallerAsteroid];
            }
            [self die];
        }
    }
}
    
@end