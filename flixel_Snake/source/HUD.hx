package ;

// import calls
	import flixel.FlxObject;
	import flixel.group.FlxSpriteGroup;
	import flixel.text.FlxText;

class HUD extends FlxSpriteGroup
{
	private var scoreText : FlxText;
	private var livesText : FlxText;
	
	private var score : Int = 0;
	private var lives : Int = 3;
	
	// TEST:
	private var numDivide : Int = 1;
	
	public function new() {
		super();
		
		scoreText = new FlxText( 0, 0, 200, "Score: " + score );
		add( scoreText );
		
		livesText = new FlxText( 0, 12, 200, "Lives: " + lives );
		add( livesText );
	}
	
	// USER DEFINED FUNCTIONS
	
	public function updateScore( num : Int ) : Void {
		score += num;
		
		// TEST: 
		if ( lives > 0 && score / numDivide == 100 ) {
			numDivide += 1;
			lives += 1;
			updateLivesText( "Lives: " + lives );
		}

		updateScoreText( "Score: " + score );
	}
	
	public function updateScoreText( NewText : String ) : Void {
		scoreText.text = NewText;
	}
	
	public function checkLives( object : FlxObject ) : Void {
		if ( lives <= 0 ) {
			object.alive = false;
		}
	}
	
	public function updateLives( life : Int ) : Void {
		lives -= life;
		updateLivesText( "Lives: " + lives );
		
		// TEST:
		if ( lives <= 0 ) {
			updateScoreText( "Game Over" );
			updateLivesText( "Press Space to Restart!" );
		}
	}
	
	public function updateLivesText( NewText : String ) : Void {
		livesText.text = NewText;
	}
}