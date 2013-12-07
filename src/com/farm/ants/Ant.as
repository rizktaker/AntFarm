package com.farm.ants
{
	public class Ant
	{
		public var isAlive:Boolean;
		public var motionState : String;
		public var name : String;
		public var numOfPokes:uint;
		public var maxNumOfPokes:uint;
		public function Ant()
		{
			numOfPokes = 0;
			var minNum:uint=0, maxNum:uint=10;
			maxNumOfPokes = 3;//Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum;
			isAlive = true;
			motionState = AntMotionStates.STILL;
		}
		
		public function poke():void
		{
			numOfPokes++;
			if(!isAlive) { return; }
			switch(motionState)
			{
				case AntMotionStates.STILL:
					motionState = AntMotionStates.WALKING;
					break;
				case AntMotionStates.WALKING:
					motionState = AntMotionStates.RUNNING;
					break;
				case AntMotionStates.RUNNING:
					if(numOfPokes > maxNumOfPokes)
					{
						die();
					}
					break;
			}
		}
		
		protected function die():void
		{
			isAlive = false;
			motionState = AntMotionStates.STILL;
		}
	}
}