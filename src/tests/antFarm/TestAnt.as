package tests.antFarm
{
	import com.farm.ants.Ant;
	import com.farm.ants.AntMotionStates;
	
	import flexunit.framework.Assert;
	
	public class TestAnt
	{		
		[Before]
		public function setUp():void
		{
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function testPoke():void
		{
			var ant : Ant = new Ant();
			ant.poke();
			Assert.assertEquals(1, ant.numOfPokes);
		}
		
		[Test]
		public function testPokesToMove():void
		{
			var ant : Ant = new Ant();
			ant.poke();
			Assert.assertTrue(ant.motionState != AntMotionStates.STILL);
		}
		
		[Test]
		public function testPokesIsWalking():void
		{
			var ant : Ant = new Ant();
			ant.poke();
			Assert.assertTrue(ant.motionState == AntMotionStates.WALKING);
		}
		
		[Test]
		public function testPokesIsRunning():void
		{
			var ant : Ant = new Ant();
			ant.poke();
			ant.poke();
			Assert.assertTrue(ant.motionState == AntMotionStates.RUNNING);
		}
		
		[Test]
		public function testPokesIsDead():void
		{
			var ant : Ant = new Ant();
			ant.poke();
			ant.poke();
			ant.poke();
			ant.poke();
			Assert.assertFalse(ant.isAlive);
			Assert.assertTrue(ant.motionState == AntMotionStates.STILL);
		}
	}
}