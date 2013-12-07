package tests.antFarm
{
	import com.farm.AntFarmController;
	import com.farm.ants.Ant;
	
	import flexunit.framework.Assert;
	
	public class TestAntFarmController
	{	
		public var controller : AntFarmController;
		
		[Before]
		public function setUp():void
		{
			controller = new AntFarmController();
			
			controller.addAnt(new Ant());
			controller.addAnt(new Ant());
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
		public function testAddAnt():void
		{
			Assert.assertEquals(2, controller.numOfAnts);
		}
		
		[Test]
		public function testCheckAntsForMovement():void
		{
			controller.checkAntsForMovement();
			Assert.assertEquals(2, controller.numOfAnts);
			Assert.assertEquals(2, controller.numAntsAlive);
		}
		
		[Test]
		public function testIsMoving():void
		{
			controller.checkAntsForMovement();
			Assert.assertEquals(2, controller.numOfAnts);
			Assert.assertTrue(controller.firstAnt is Ant);
			Assert.assertTrue(controller.isMoving(controller.firstAnt as Ant)); 
		}
		
		[Test]
		public function testDeadAnts():void
		{
			controller.checkAntsForMovement();
			controller.checkAntsForMovement();
			controller.checkAntsForMovement();
			controller.checkAntsForMovement();
			Assert.assertEquals(2, controller.numOfAnts);
			Assert.assertTrue(controller.firstAnt is Ant);
			Assert.assertEquals(2, controller.numAntsDead);
			Assert.assertFalse(controller.isMoving(controller.firstAnt as Ant)); 
		}
	}
}