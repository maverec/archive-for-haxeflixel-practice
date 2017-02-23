package;

import flash.Lib;
import flash.system.System;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxMath;
import flixel.util.FlxPoint;
import flixel.util.FlxRandom;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxTimer;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
        private var fruit : Fruit;
        private var snakeHead : Snake;
        private var snakeBody : FlxSpriteGroup;
        private var hud : HUD;
        
        private var headPositions : Array< FlxPoint >;
        private var movementInterval : Float = 8;
        /**
         * Function that is called up when to state is created to set it up. 
         */
        override public function create():Void
        {
                super.create();
		
		FlxG.mouse.visible = false;
                
                // getting the center of the screen and storing them in variables for easy reference later
                var screenMidX : Int = Math.floor( FlxG.width / 2 );
                var screenMidY : Int = Math.floor( FlxG.height / 2 );
                
                // creating the head object for the snake
                snakeHead = new Snake( screenMidX - Variables.BLOCK_SIZE * 2, screenMidY );
                snakeHead.facing = FlxObject.LEFT;
		offestSprite( snakeHead );
                
                // storing the head positions per frame to make sure the segment positions trail correctly behind the head
                headPositions = [ FlxPoint.get( snakeHead.x, snakeHead.y ) ];
                
                // creating a new group to hold all the body segments that exist and any future ones created
                snakeBody = new FlxSpriteGroup();
                add( snakeBody );
                
                // adding 3 body segments at game start
                for ( i in 0 ... 3 ) {
                        addSegment();
                        // function call to make sure the body segments follow the head
                        moveSnake();
                }
                
                // adding the head to the screen last, to make sure it's on top of the rest of the body
                add( snakeHead );
                
                // creating a fruit and adding to the screen for the snake to 'eat'
                // only one is needed since only one will be on screen at a time
                // a call to the randomFruitPosition() function is made to randomize the position of the fruit
                fruit = new Fruit();
                randomFruitPosition();
                offestSprite( fruit );
                add( fruit );

                // 
                hud = new HUD();
                add( hud );
                
                // calling the ( user-defined ) movement timer function
                // allows movement for the snake
                resetTimer();
        }
        
        /**
         * Function that is called when this state is destroyed - you might want to 
         * consider setting all objects this state uses to null to help garbage collection.
         */
        override public function destroy():Void
        {
                super.destroy();
        }

        /**
         * Function that is called once every frame.
         */
        override public function update():Void
        {
                super.update();
                
                // only continue if the snake is still alive
                if ( !snakeHead.alive ) {
                        if ( FlxG.keys.anyJustReleased( [ "SPACE", "R" ] ) ) {
                                FlxG.resetState();
                        }
                }
                
                // checking for when the snake overlaps the fruit sprite
                FlxG.overlap( snakeHead, fruit, collectFruit );
                
                // if the head hits the body, game over
                FlxG.overlap( snakeHead, snakeBody, bodyCollision );
                
                // close the game window whem the ESC button is pressed
                // quick way to close the game while testing
                if ( FlxG.keys.pressed.ESCAPE ) {
                        System.exit( 0 );
                }
                
                moveLogic();
        }
        
        // USER-DEFINED FUNCTIONS
        
	private function offestSprite( Sprite : FlxSprite ) : Void {
                // to put a 2px gap between each tile
		Sprite.offset.set( 1, 1 );
		Sprite.centerOffsets();
	}
                
        private function collectFruit( Object1 : FlxObject, Object2 : FlxObject ) : Void {
                // update the score, as a reward for the player                
                hud.updateScore( 10 );
                
                randomFruitPosition();
                
                // add a new body segment as a reward
                addSegment();
                
                // TODO: sound effect here
                
                // increase the speed of the snake after each fruit pick-up
                if ( movementInterval >= Variables.MIN_INTERVAL ) {
                        movementInterval -= 0.25;
                }
        } 
        
        private function randomFruitPosition( ?Object1 : FlxObject, ?Object2 : FlxObject ) : Void {
                // calculate a random place to put the fruit down
                fruit.x = FlxRandom.intRanged( 0, Math.floor( FlxG.width / 8 ) - 1 ) * 8;
                fruit.y = FlxRandom.intRanged( 0, Math.floor( FlxG.height / 8 ) - 1 ) * 8;
                
                // checking to make sure that if any fruit coordinates overlaps or are the same as the snake, to run this function again
                FlxG.overlap( fruit, snakeBody, randomFruitPosition );
        }
        
        private function bodyCollision( Object1 : FlxObject, Object2 : FlxObject ) : Void {
                // TEST:
                hud.updateLives( 1 );
                hud.checkLives( snakeHead );
                resetPosition( snakeHead );
                // TODO: sound here
        }
        
        // TEST:
        private function resetPosition( object1 : FlxObject ) : Void {
                object1.x  = ( Math.round( Math.floor( FlxG.width / 2 ) ) ) - Variables.BLOCK_SIZE * 2;
                object1.y  = ( Math.round( Math.floor( FlxG.height / 2 ) ) ) - Variables.BLOCK_SIZE * 2;
        }
	
        private function addSegment() : Void {
                // first part : a new body segment will be spawned off-screen
                // second part : the new body segment will be attached to the end of the snake body in the next moveSnake() function call
                var segment : FlxSprite = new FlxSprite( -20, -20 );
                segment.makeGraphic( Variables.BLOCK_SIZE - 2, Variables.BLOCK_SIZE - 2, FlxColor.GREEN );
                snakeBody.add( segment );
        }
        
        private function resetTimer( ?Timer : FlxTimer ) : Void {
                // stop the movement cycle if the snake is dead
                if ( !snakeHead.alive && Timer != null ) {
                        Timer.destroy();
                        return;
                }
                
                // creating a timer that automatically moves the snake a certain amount per frame
                new FlxTimer( movementInterval / FlxG.updateFramerate, resetTimer );
                moveSnake();
        }
        
        private function moveSnake() : Void {
                headPositions.unshift( FlxPoint.get( snakeHead.x, snakeHead.y ) );
                
                if ( headPositions.length >= snakeBody.members.length ) {
                        headPositions.pop();
                }
                
                // update the position of the head
                switch ( snakeHead.facing ) {
                        case FlxObject.LEFT:
                                snakeHead.x -= Variables.BLOCK_SIZE;
                        case FlxObject.RIGHT:
                                snakeHead.x += Variables.BLOCK_SIZE;
                        case FlxObject.UP:
                                snakeHead.y -= Variables.BLOCK_SIZE;
                        case FlxObject.DOWN:
                                snakeHead.y += Variables.BLOCK_SIZE;
                }
                
                FlxSpriteUtil.screenWrap( snakeHead );
                
                for ( i in 0 ... headPositions.length ) {
                        var segment : FlxObject = cast snakeBody.members[ i ];
                        
                        if ( segment != null ) {
                                segment.setPosition( headPositions[ i ].x, headPositions[ i ].y );
                        }
                }
        }
        
        private function moveLogic() : Void {
                // keyboard logic to allow the player to move the snake around by pressing either the WASD or ARROW keys
                // we will also make it so it is not possible to move in the opposite direction, to make sure the player doesn't die quickly from pressing the wrong key
                if (FlxG.keys.anyPressed(["UP", "W"]) && snakeHead.facing != FlxObject.DOWN) {
                        snakeHead.facing = FlxObject.UP;
                }
                else if (FlxG.keys.anyPressed(["DOWN", "S"]) && snakeHead.facing != FlxObject.UP) {
                        snakeHead.facing = FlxObject.DOWN;
                }
                else if (FlxG.keys.anyPressed(["LEFT", "A"]) && snakeHead.facing != FlxObject.RIGHT) {
                        snakeHead.facing = FlxObject.LEFT;
                }
                else if (FlxG.keys.anyPressed(["RIGHT", "D"]) && snakeHead.facing != FlxObject.LEFT) {
                        snakeHead.facing = FlxObject.RIGHT;
                }
        }
}