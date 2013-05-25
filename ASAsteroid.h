//
//  ASAsteroid.h
//  Asteroids
//
//  Created by Akhil Nambiar on 1/11/13.
//
//

#import "ASDrawable.h"

@interface ASAsteroid : ASDrawable
{
    NSArray *smallerAsteroids;
}
@property(nonatomic) float xRand;
@property(nonatomic) float yRand;

-(void)update;
-(void)dealloc;
-(id)initMedium;
-(id)initSmall;
-(id)initLarge;
@end
