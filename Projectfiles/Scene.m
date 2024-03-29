//
//  LevelSelect.m
//  bullet hell-o
//
//  Created by Kevin Frans on 7/3/13.
//
//

#import "Scene.h"
#import "HelloWorldLayer.h"
#import "Title.h"
#import "LevelSelect.h"
//#import "Level2.h"

@implementation Scene

-(id) init
{
    if ((self = [super init]))
    {
        [[NSUserDefaults standardUserDefaults]setInteger:4 forKey:@"boss"];
        
        
        //[[NSUserDefaults standardUserDefaults] setInteger:4 forKey:@"boss"];
        
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"iphone5"]) //iphone 5
        {
            glClearColor(255, 255, 255, 255);
            [self unscheduleAllSelectors];
            
            // have everything stop
            CCNode* node;
            CCARRAY_FOREACH([self children], node)
            {
                [node pauseSchedulerAndActions];
            }
            
            CCSprite* bluebg = [CCSprite spriteWithFile:@"darkbluefill.png"];
            bluebg.position = [CCDirector sharedDirector].screenCenter;
            [self addChild:bluebg];
            
            
            // add the labels shown during game over
            CGSize screenSize = [[CCDirector sharedDirector] winSize];
            
            /// CCLabelTTF* gameOver = [CCLabelTTF labelWithString:@"Endless Mode" fontName:@"Arial" fontSize:40];
            //gameOver.position = CGPointMake(160, 300);
            //[self addChild:gameOver z:100 tag:100];
            
            CCLabelTTF* bosstag = [CCLabelTTF labelWithString:@"Boss Bash" fontName:@"Bend2SquaresBRK" fontSize:40];
            bosstag.position = CGPointMake(160, 440);
            //[self addChild:bosstag z:100 tag:100];
            
            CCTintTo* tint = [CCTintTo actionWithDuration:0.1 red:0 green:0 blue:255];
            //[gameOver runAction:tint];
            CCTintTo* tint2 = [CCTintTo actionWithDuration:0.1 red:0 green:0 blue:255];
            [bosstag runAction:tint2];
            /*// game over label runs 3 different actions at the same time to create the combined effect
             // 1) color tinting
             CCTintTo* tint1 = [CCTintTo actionWithDuration:2 red:255 green:0 blue:0];
             CCTintTo* tint2 = [CCTintTo actionWithDuration:2 red:255 green:255 blue:0];
             CCTintTo* tint3 = [CCTintTo actionWithDuration:2 red:0 green:255 blue:0];
             CCTintTo* tint4 = [CCTintTo actionWithDuration:2 red:0 green:255 blue:255];
             CCTintTo* tint5 = [CCTintTo actionWithDuration:2 red:0 green:0 blue:255];
             CCTintTo* tint6 = [CCTintTo actionWithDuration:2 red:255 green:0 blue:255];
             CCSequence* tintSequence = [CCSequence actions:tint1, tint2, tint3, tint4, tint5, tint6, nil];
             CCRepeatForever* repeatTint = [CCRepeatForever actionWithAction:tintSequence];
             [gameOver runAction:repeatTint];
             
             // 2) rotation with ease
             CCRotateTo* rotate1 = [CCRotateTo actionWithDuration:2 angle:3];
             CCEaseBounceInOut* bounce1 = [CCEaseBounceInOut actionWithAction:rotate1];
             CCRotateTo* rotate2 = [CCRotateTo actionWithDuration:2 angle:-3];
             CCEaseBounceInOut* bounce2 = [CCEaseBounceInOut actionWithAction:rotate2];
             CCSequence* rotateSequence = [CCSequence actions:bounce1, bounce2, nil];
             CCRepeatForever* repeatBounce = [CCRepeatForever actionWithAction:rotateSequence];
             [gameOver runAction:repeatBounce];
             d
             // 3) jumping
             CCJumpBy* jump = [CCJumpBy actionWithDuration:3 position:CGPointZero height:screenSize.height / 3 jumps:1];
             CCRepeatForever* repeatJump = [CCRepeatForever actionWithAction:jump];
             [gameOver runAction:repeatJump];*/
            CCSprite* background = [CCSprite spriteWithFile:@"boss-bash.png"];
            background.position = ccp(160,328);
            [self addChild:background];
            
            CCMenuItemFont *playAgain = [CCMenuItemFont itemFromString: @"back" target:self selector:@selector(unPause)];
            CCMenuItemFont *restart = [CCMenuItemFont itemFromString: @"Endless Mode" target:self selector:@selector(level1)];
            CCMenuItemFont *quit = [CCMenuItemFont itemFromString: @"Scene Selection" target:self selector:@selector(level2)];
            CCMenuItemFont *obama = [CCMenuItemFont itemFromString: @"Level 3" target:self selector:@selector(obama)];
            //   [gameOver setFontName:@"Bend2SquaresBRK"];
            /*[restart setFontName:@"Arial"];
             [quit setFontName:@"Arial"];
             [obama setFontName:@"Arial"];
             CCMenu *gameOverMenu = [CCMenu menuWithItems:restart, quit, playAgain, nil];
             [gameOverMenu alignItemsVertically];
             gameOverMenu.position = ccp(screenSize.width/2, screenSize.height/2 - 80);
             gameOverMenu.color = ccc3(0, 0, 0);
             [self addChild:gameOverMenu];*/
            
            if([[NSUserDefaults standardUserDefaults]integerForKey:@"boss"] == 0)
            {
                //            CCLabelTTF *highscore = [CCMenuItemImage itemFromNormalImage:@"locked.png" selectedImage:@"locked.png" target:self selector:@selector(locked)];
                //            highscore.position = ccp(80, 290);
                //            CCMenu *starMenu = [CCMenu menuWithItems:highscore, nil];
                //            starMenu.position = CGPointZero;
                //            [self addChild:starMenu];
                //
                //            CCLabelTTF *boss = [CCMenuItemImage itemFromNormalImage:@"locked.png" selectedImage:@"locked.png" target:self selector:@selector(locked)];
                //            boss.position = ccp(240, 290);
                //            CCMenu *moreMenu = [CCMenu menuWithItems:boss, nil];
                //            moreMenu.position = CGPointZero;
                //            [self addChild:moreMenu];
                //
                //            CCLabelTTF *back = [CCMenuItemImage itemFromNormalImage:@"locked.png" selectedImage:@"locked.png" target:self selector:@selector(locked)];
                //            back.position = ccp(80, 160);
                //            //back.scale = 0.5;
                //            CCMenu *backmenu = [CCMenu menuWithItems:back, nil];
                //            backmenu.position = CGPointZero;
                //            [self addChild:backmenu];
                //
                //            CCLabelTTF *back2 = [CCMenuItemImage itemFromNormalImage:@"locked.png" selectedImage:@"locked.png" target:self selector:@selector(locked)];
                //            back2.position = ccp(240, 160);
                //            //back2.scale = 0.5;
                //            CCMenu *backmenu2 = [CCMenu menuWithItems:back2, nil];
                //            backmenu2.position = CGPointZero;
                //            [self addChild:backmenu2];
            }
            
            if([[NSUserDefaults standardUserDefaults]integerForKey:@"boss"] == 1)
            {
                CCLabelTTF *highscore = [CCMenuItemImage itemFromNormalImage:@"bigblue.png" selectedImage:@"bigblue.png" target:self selector:@selector(level1)];
                highscore.position = ccp(80, 378);
                CCMenu *starMenu = [CCMenu menuWithItems:highscore, nil];
                starMenu.position = CGPointZero;
                [self addChild:starMenu];
                
                //            CCLabelTTF *boss = [CCMenuItemImage itemFromNormalImage:@"locked.png" selectedImage:@"locked.png" target:self selector:@selector(locked)];
                //            boss.position = ccp(240, 390);
                //            CCMenu *moreMenu = [CCMenu menuWithItems:boss, nil];
                //            moreMenu.position = CGPointZero;
                //            [self addChild:moreMenu];
                //
                //            CCLabelTTF *back = [CCMenuItemImage itemFromNormalImage:@"locked.png" selectedImage:@"locked.png" target:self selector:@selector(locked)];
                //            back.position = ccp(80, 160);
                //            //back.scale = 0.5;
                //            CCMenu *backmenu = [CCMenu menuWithItems:back, nil];
                //            backmenu.position = CGPointZero;
                //            [self addChild:backmenu];
                //
                //            CCLabelTTF *back2 = [CCMenuItemImage itemFromNormalImage:@"locked.png" selectedImage:@"locked.png" target:self selector:@selector(locked)];
                //            back2.position = ccp(240, 160);
                //            //back2.scale = 0.5;
                //            CCMenu *backmenu2 = [CCMenu menuWithItems:back2, nil];
                //            backmenu2.position = CGPointZero;
                //            [self addChild:backmenu2];
            }
            
            if([[NSUserDefaults standardUserDefaults]integerForKey:@"boss"] == 2)
            {
                CCLabelTTF *highscore = [CCMenuItemImage itemFromNormalImage:@"bigblue.png" selectedImage:@"bigblue.png" target:self selector:@selector(level1)];
                highscore.position = ccp(80, 378);
                CCMenu *starMenu = [CCMenu menuWithItems:highscore, nil];
                starMenu.position = CGPointZero;
                [self addChild:starMenu];
                
                CCLabelTTF *boss = [CCMenuItemImage itemFromNormalImage:@"alienblue.png" selectedImage:@"alienblue.png" target:self selector:@selector(level2)];
                boss.position = ccp(240, 378);
                CCMenu *moreMenu = [CCMenu menuWithItems:boss, nil];
                moreMenu.position = CGPointZero;
                [self addChild:moreMenu];
                
                //            CCLabelTTF *back = [CCMenuItemImage itemFromNormalImage:@"locked.png" selectedImage:@"locked.png" target:self selector:@selector(locked)];
                //            back.position = ccp(80, 160);
                //            //back.scale = 0.5;
                //            CCMenu *backmenu = [CCMenu menuWithItems:back, nil];
                //            backmenu.position = CGPointZero;
                //            [self addChild:backmenu];
                //
                //            CCLabelTTF *back2 = [CCMenuItemImage itemFromNormalImage:@"locked.png" selectedImage:@"locked.png" target:self selector:@selector(locked)];
                //            back2.position = ccp(240, 160);
                //            //back2.scale = 0.5;
                //            CCMenu *backmenu2 = [CCMenu menuWithItems:back2, nil];
                //            backmenu2.position = CGPointZero;
                //            [self addChild:backmenu2];
            }
            
            if([[NSUserDefaults standardUserDefaults]integerForKey:@"boss"] == 3)
            {
                CCLabelTTF *highscore = [CCMenuItemImage itemFromNormalImage:@"bigblue.png" selectedImage:@"bigblue.png" target:self selector:@selector(level1)];
                highscore.position = ccp(80, 378);
                CCMenu *starMenu = [CCMenu menuWithItems:highscore, nil];
                starMenu.position = CGPointZero;
                [self addChild:starMenu];
                
                CCLabelTTF *boss = [CCMenuItemImage itemFromNormalImage:@"alienblue.png" selectedImage:@"alienblue.png" target:self selector:@selector(level2)];
                boss.position = ccp(240, 378);
                CCMenu *moreMenu = [CCMenu menuWithItems:boss, nil];
                moreMenu.position = CGPointZero;
                [self addChild:moreMenu];
                
                CCLabelTTF *back = [CCMenuItemImage itemFromNormalImage:@"blubama.png" selectedImage:@"blubama.png" target:self selector:@selector(obama)];
                back.position = ccp(80, 248);
                //back.scale = 0.5;
                CCMenu *backmenu = [CCMenu menuWithItems:back, nil];
                backmenu.position = CGPointZero;
                [self addChild:backmenu];
                
                //            CCLabelTTF *back2 = [CCMenuItemImage itemFromNormalImage:@"locked.png" selectedImage:@"locked.png" target:self selector:@selector(locked)];
                //            back2.position = ccp(240, 160);
                //            //back2.scale = 0.5;
                //            CCMenu *backmenu2 = [CCMenu menuWithItems:back2, nil];
                //            backmenu2.position = CGPointZero;
                //            [self addChild:backmenu2];
            }
            
            if([[NSUserDefaults standardUserDefaults]integerForKey:@"boss"] >= 4)
            {
                CCLabelTTF *highscore = [CCMenuItemImage itemFromNormalImage:@"bigblue.png" selectedImage:@"bigblue.png" target:self selector:@selector(level1)];
                highscore.position = ccp(80, 378);
                CCMenu *starMenu = [CCMenu menuWithItems:highscore, nil];
                starMenu.position = CGPointZero;
                [self addChild:starMenu];
                
                CCLabelTTF *boss = [CCMenuItemImage itemFromNormalImage:@"alienblue.png" selectedImage:@"alienblue.png" target:self selector:@selector(level2)];
                boss.position = ccp(240, 378);
                CCMenu *moreMenu = [CCMenu menuWithItems:boss, nil];
                moreMenu.position = CGPointZero;
                [self addChild:moreMenu];
                
                CCLabelTTF *back = [CCMenuItemImage itemFromNormalImage:@"blubama.png" selectedImage:@"blubama.png" target:self selector:@selector(obama)];
                back.position = ccp(80, 248);
                //back.scale = 0.5;
                CCMenu *backmenu = [CCMenu menuWithItems:back, nil];
                backmenu.position = CGPointZero;
                [self addChild:backmenu];
                
                CCLabelTTF *back2 = [CCMenuItemImage itemFromNormalImage:@"blueblossom.png" selectedImage:@"blueblossom.png" target:self selector:@selector(rose)];
                back2.position = ccp(240, 248);
                //back2.scale = 0.5;
                CCMenu *backmenu2 = [CCMenu menuWithItems:back2, nil];
                backmenu2.position = CGPointZero;
                [self addChild:backmenu2];
            }
            
            
            
            
            [self scheduleUpdate];
            
        }
        else
        {
            
            glClearColor(255, 255, 255, 255);
            [self unscheduleAllSelectors];
            
            // have everything stop
            CCNode* node;
            CCARRAY_FOREACH([self children], node)
            {
                [node pauseSchedulerAndActions];
            }
            
            
            // add the labels shown during game over
            CGSize screenSize = [[CCDirector sharedDirector] winSize];
            
            /// CCLabelTTF* gameOver = [CCLabelTTF labelWithString:@"Endless Mode" fontName:@"Arial" fontSize:40];
            //gameOver.position = CGPointMake(160, 300);
            //[self addChild:gameOver z:100 tag:100];
            
            CCLabelTTF* bosstag = [CCLabelTTF labelWithString:@"Boss Bash" fontName:@"Bend2SquaresBRK" fontSize:40];
            bosstag.position = CGPointMake(160, 440);
            //[self addChild:bosstag z:100 tag:100];
            
            CCTintTo* tint = [CCTintTo actionWithDuration:0.1 red:0 green:0 blue:255];
            //[gameOver runAction:tint];
            CCTintTo* tint2 = [CCTintTo actionWithDuration:0.1 red:0 green:0 blue:255];
            [bosstag runAction:tint2];
            /*// game over label runs 3 different actions at the same time to create the combined effect
             // 1) color tinting
             CCTintTo* tint1 = [CCTintTo actionWithDuration:2 red:255 green:0 blue:0];
             CCTintTo* tint2 = [CCTintTo actionWithDuration:2 red:255 green:255 blue:0];
             CCTintTo* tint3 = [CCTintTo actionWithDuration:2 red:0 green:255 blue:0];
             CCTintTo* tint4 = [CCTintTo actionWithDuration:2 red:0 green:255 blue:255];
             CCTintTo* tint5 = [CCTintTo actionWithDuration:2 red:0 green:0 blue:255];
             CCTintTo* tint6 = [CCTintTo actionWithDuration:2 red:255 green:0 blue:255];
             CCSequence* tintSequence = [CCSequence actions:tint1, tint2, tint3, tint4, tint5, tint6, nil];
             CCRepeatForever* repeatTint = [CCRepeatForever actionWithAction:tintSequence];
             [gameOver runAction:repeatTint];
             
             // 2) rotation with ease
             CCRotateTo* rotate1 = [CCRotateTo actionWithDuration:2 angle:3];
             CCEaseBounceInOut* bounce1 = [CCEaseBounceInOut actionWithAction:rotate1];
             CCRotateTo* rotate2 = [CCRotateTo actionWithDuration:2 angle:-3];
             CCEaseBounceInOut* bounce2 = [CCEaseBounceInOut actionWithAction:rotate2];
             CCSequence* rotateSequence = [CCSequence actions:bounce1, bounce2, nil];
             CCRepeatForever* repeatBounce = [CCRepeatForever actionWithAction:rotateSequence];
             [gameOver runAction:repeatBounce];
             d
             // 3) jumping
             CCJumpBy* jump = [CCJumpBy actionWithDuration:3 position:CGPointZero height:screenSize.height / 3 jumps:1];
             CCRepeatForever* repeatJump = [CCRepeatForever actionWithAction:jump];
             [gameOver runAction:repeatJump];*/
            CCSprite* background = [CCSprite spriteWithFile:@"boss-bash.png"];
            background.position = ccp(160,240);
            [self addChild:background];
            
            CCMenuItemFont *playAgain = [CCMenuItemFont itemFromString: @"back" target:self selector:@selector(unPause)];
            CCMenuItemFont *restart = [CCMenuItemFont itemFromString: @"Endless Mode" target:self selector:@selector(level1)];
            CCMenuItemFont *quit = [CCMenuItemFont itemFromString: @"Scene Selection" target:self selector:@selector(level2)];
            CCMenuItemFont *obama = [CCMenuItemFont itemFromString: @"Level 3" target:self selector:@selector(obama)];
            //   [gameOver setFontName:@"Bend2SquaresBRK"];
            /*[restart setFontName:@"Arial"];
             [quit setFontName:@"Arial"];
             [obama setFontName:@"Arial"];
             CCMenu *gameOverMenu = [CCMenu menuWithItems:restart, quit, playAgain, nil];
             [gameOverMenu alignItemsVertically];
             gameOverMenu.position = ccp(screenSize.width/2, screenSize.height/2 - 80);
             gameOverMenu.color = ccc3(0, 0, 0);
             [self addChild:gameOverMenu];*/
            
            if([[NSUserDefaults standardUserDefaults]integerForKey:@"boss"] == 0)
            {
                //            CCLabelTTF *highscore = [CCMenuItemImage itemFromNormalImage:@"locked.png" selectedImage:@"locked.png" target:self selector:@selector(locked)];
                //            highscore.position = ccp(80, 290);
                //            CCMenu *starMenu = [CCMenu menuWithItems:highscore, nil];
                //            starMenu.position = CGPointZero;
                //            [self addChild:starMenu];
                //
                //            CCLabelTTF *boss = [CCMenuItemImage itemFromNormalImage:@"locked.png" selectedImage:@"locked.png" target:self selector:@selector(locked)];
                //            boss.position = ccp(240, 290);
                //            CCMenu *moreMenu = [CCMenu menuWithItems:boss, nil];
                //            moreMenu.position = CGPointZero;
                //            [self addChild:moreMenu];
                //
                //            CCLabelTTF *back = [CCMenuItemImage itemFromNormalImage:@"locked.png" selectedImage:@"locked.png" target:self selector:@selector(locked)];
                //            back.position = ccp(80, 160);
                //            //back.scale = 0.5;
                //            CCMenu *backmenu = [CCMenu menuWithItems:back, nil];
                //            backmenu.position = CGPointZero;
                //            [self addChild:backmenu];
                //
                //            CCLabelTTF *back2 = [CCMenuItemImage itemFromNormalImage:@"locked.png" selectedImage:@"locked.png" target:self selector:@selector(locked)];
                //            back2.position = ccp(240, 160);
                //            //back2.scale = 0.5;
                //            CCMenu *backmenu2 = [CCMenu menuWithItems:back2, nil];
                //            backmenu2.position = CGPointZero;
                //            [self addChild:backmenu2];
            }
            
            if([[NSUserDefaults standardUserDefaults]integerForKey:@"boss"] == 1)
            {
                CCLabelTTF *highscore = [CCMenuItemImage itemFromNormalImage:@"bigblue.png" selectedImage:@"bigblue.png" target:self selector:@selector(level1)];
                highscore.position = ccp(80, 290);
                CCMenu *starMenu = [CCMenu menuWithItems:highscore, nil];
                starMenu.position = CGPointZero;
                [self addChild:starMenu];
                
                //            CCLabelTTF *boss = [CCMenuItemImage itemFromNormalImage:@"locked.png" selectedImage:@"locked.png" target:self selector:@selector(locked)];
                //            boss.position = ccp(240, 390);
                //            CCMenu *moreMenu = [CCMenu menuWithItems:boss, nil];
                //            moreMenu.position = CGPointZero;
                //            [self addChild:moreMenu];
                //
                //            CCLabelTTF *back = [CCMenuItemImage itemFromNormalImage:@"locked.png" selectedImage:@"locked.png" target:self selector:@selector(locked)];
                //            back.position = ccp(80, 160);
                //            //back.scale = 0.5;
                //            CCMenu *backmenu = [CCMenu menuWithItems:back, nil];
                //            backmenu.position = CGPointZero;
                //            [self addChild:backmenu];
                //
                //            CCLabelTTF *back2 = [CCMenuItemImage itemFromNormalImage:@"locked.png" selectedImage:@"locked.png" target:self selector:@selector(locked)];
                //            back2.position = ccp(240, 160);
                //            //back2.scale = 0.5;
                //            CCMenu *backmenu2 = [CCMenu menuWithItems:back2, nil];
                //            backmenu2.position = CGPointZero;
                //            [self addChild:backmenu2];
            }
            
            if([[NSUserDefaults standardUserDefaults]integerForKey:@"boss"] == 2)
            {
                CCLabelTTF *highscore = [CCMenuItemImage itemFromNormalImage:@"bigblue.png" selectedImage:@"bigblue.png" target:self selector:@selector(level1)];
                highscore.position = ccp(80, 290);
                CCMenu *starMenu = [CCMenu menuWithItems:highscore, nil];
                starMenu.position = CGPointZero;
                [self addChild:starMenu];
                
                CCLabelTTF *boss = [CCMenuItemImage itemFromNormalImage:@"alienblue.png" selectedImage:@"alienblue.png" target:self selector:@selector(level2)];
                boss.position = ccp(240, 290);
                CCMenu *moreMenu = [CCMenu menuWithItems:boss, nil];
                moreMenu.position = CGPointZero;
                [self addChild:moreMenu];
                
                //            CCLabelTTF *back = [CCMenuItemImage itemFromNormalImage:@"locked.png" selectedImage:@"locked.png" target:self selector:@selector(locked)];
                //            back.position = ccp(80, 160);
                //            //back.scale = 0.5;
                //            CCMenu *backmenu = [CCMenu menuWithItems:back, nil];
                //            backmenu.position = CGPointZero;
                //            [self addChild:backmenu];
                //
                //            CCLabelTTF *back2 = [CCMenuItemImage itemFromNormalImage:@"locked.png" selectedImage:@"locked.png" target:self selector:@selector(locked)];
                //            back2.position = ccp(240, 160);
                //            //back2.scale = 0.5;
                //            CCMenu *backmenu2 = [CCMenu menuWithItems:back2, nil];
                //            backmenu2.position = CGPointZero;
                //            [self addChild:backmenu2];
            }
            
            if([[NSUserDefaults standardUserDefaults]integerForKey:@"boss"] == 3)
            {
                CCLabelTTF *highscore = [CCMenuItemImage itemFromNormalImage:@"bigblue.png" selectedImage:@"bigblue.png" target:self selector:@selector(level1)];
                highscore.position = ccp(80, 290);
                CCMenu *starMenu = [CCMenu menuWithItems:highscore, nil];
                starMenu.position = CGPointZero;
                [self addChild:starMenu];
                
                CCLabelTTF *boss = [CCMenuItemImage itemFromNormalImage:@"alienblue.png" selectedImage:@"alienblue.png" target:self selector:@selector(level2)];
                boss.position = ccp(240, 290);
                CCMenu *moreMenu = [CCMenu menuWithItems:boss, nil];
                moreMenu.position = CGPointZero;
                [self addChild:moreMenu];
                
                CCLabelTTF *back = [CCMenuItemImage itemFromNormalImage:@"blubama.png" selectedImage:@"blubama.png" target:self selector:@selector(obama)];
                back.position = ccp(80, 160);
                //back.scale = 0.5;
                CCMenu *backmenu = [CCMenu menuWithItems:back, nil];
                backmenu.position = CGPointZero;
                [self addChild:backmenu];
                
                //            CCLabelTTF *back2 = [CCMenuItemImage itemFromNormalImage:@"locked.png" selectedImage:@"locked.png" target:self selector:@selector(locked)];
                //            back2.position = ccp(240, 160);
                //            //back2.scale = 0.5;
                //            CCMenu *backmenu2 = [CCMenu menuWithItems:back2, nil];
                //            backmenu2.position = CGPointZero;
                //            [self addChild:backmenu2];
            }
            
            if([[NSUserDefaults standardUserDefaults]integerForKey:@"boss"] >= 4)
            {
                CCLabelTTF *highscore = [CCMenuItemImage itemFromNormalImage:@"bigblue.png" selectedImage:@"bigblue.png" target:self selector:@selector(level1)];
                highscore.position = ccp(80, 290);
                CCMenu *starMenu = [CCMenu menuWithItems:highscore, nil];
                starMenu.position = CGPointZero;
                [self addChild:starMenu];
                
                CCLabelTTF *boss = [CCMenuItemImage itemFromNormalImage:@"alienblue.png" selectedImage:@"alienblue.png" target:self selector:@selector(level2)];
                boss.position = ccp(240, 290);
                CCMenu *moreMenu = [CCMenu menuWithItems:boss, nil];
                moreMenu.position = CGPointZero;
                [self addChild:moreMenu];
                
                CCLabelTTF *back = [CCMenuItemImage itemFromNormalImage:@"blubama.png" selectedImage:@"blubama.png" target:self selector:@selector(obama)];
                back.position = ccp(80, 160);
                //back.scale = 0.5;
                CCMenu *backmenu = [CCMenu menuWithItems:back, nil];
                backmenu.position = CGPointZero;
                [self addChild:backmenu];
                
                CCLabelTTF *back2 = [CCMenuItemImage itemFromNormalImage:@"blueblossom.png" selectedImage:@"blueblossom.png" target:self selector:@selector(rose)];
                back2.position = ccp(240, 160);
                //back2.scale = 0.5;
                CCMenu *backmenu2 = [CCMenu menuWithItems:back2, nil];
                backmenu2.position = CGPointZero;
                [self addChild:backmenu2];
            }
            
            
            
            
            [self scheduleUpdate];

        }
        
    }
    return self;
}


-(void) update:(ccTime)delta
{
    
    if ([KKInput sharedInput].anyTouchBeganThisFrame)
    {
        KKInput* input = [KKInput sharedInput];
        CGPoint pos = [input locationOfAnyTouchInPhase:KKTouchPhaseAny];
        
        NSLog(@"%f  %f",pos.x,pos.y);
        
        
        if([[NSUserDefaults standardUserDefaults] boolForKey:@"iphone5"] == true)
        {
        
            if(pos.y < 568 && pos.y > 518 && pos.x < 40)
            {
                [self unPause];
            }
        }
        else
        {
            if(pos.y < 480 && pos.y > 430 && pos.x < 40)
            {
                [self unPause];
            }
        }
    }
}


-(void) level2
{
    NSNumber *leveldata = [NSNumber numberWithInteger:2];
    [[NSUserDefaults standardUserDefaults] setObject:leveldata forKey:@"leveldata"];
    
    [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"endless"];
    
    //NSLog([NSString stringWithFormat:@"%d", level]);
    //NSLog(@"d");
    
    [[CCDirector sharedDirector] replaceScene:
     [CCTransitionCrossFade transitionWithDuration:0.5f scene:[HelloWorldLayer node]]];
    
    
}

-(void) level1
{
    NSNumber *leveldata = [NSNumber numberWithInteger:1];
    [[NSUserDefaults standardUserDefaults] setObject:leveldata forKey:@"leveldata"];
    [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"endless"];
    
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:0.5f scene:[HelloWorldLayer node]]];
    
    
}

-(void) obama
{
    NSNumber *leveldata = [NSNumber numberWithInteger:3];
    [[NSUserDefaults standardUserDefaults] setObject:leveldata forKey:@"leveldata"];
    [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"endless"];
    
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:0.5f scene:[HelloWorldLayer node]]];
    
    
}

-(void) rose
{
    NSNumber *leveldata = [NSNumber numberWithInteger:4];
    [[NSUserDefaults standardUserDefaults] setObject:leveldata forKey:@"leveldata"];
    [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"endless"];
    
    [[CCDirector sharedDirector] replaceScene:[CCTransitionCrossFade transitionWithDuration:0.5f scene:[HelloWorldLayer node]]];
    
    
}

-(void) locked
{
    if([[NSUserDefaults standardUserDefaults]boolForKey:@"cheater"] == false)
    {
        [MGWU showMessage:@"Achievement Get!      That level is locked!" withImage:nil];
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"cheater"];
    }
    
    
}

-(void) unPause
{
    //    [[CCDirector sharedDirector] popSceneWithTransition:
    //       [CCTransitionCrossFade transitionWithDuration:0.5f scene:[HelloWorldLayer node]]];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionSlideInL transitionWithDuration:0.5f scene:[LevelSelect node]]];
}


@end
