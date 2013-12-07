package com.farm
{
	import com.farm.ants.Ant;
	import com.farm.ants.AntMotionStates;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class AntFarmController
	{
		protected var _view : DisplayObjectContainer;
		
		protected var ants : Vector.<Ant>;
		
		public var numAntsAlive:uint;
		public var numAntsDead:uint;
		
		protected var timeGoingBy : Timer;
		
		public function get numOfAnts():uint
		{
			return ants.length;
		}
		
		public function get firstAnt():Ant
		{
			return ants[0] as Ant;
		}
		
		public function AntFarmController(view:DisplayObjectContainer=null)
		{
			_view = view;
			init();
		}
		
		protected function init():void
		{
			numAntsAlive = 0;
			numAntsDead = 0;
			ants = new Vector.<Ant>();
//			timeGoingBy = new Timer(1000);
//			timeGoingBy.addEventListener(TimerEvent.TIMER, onTime);
//			timeGoingBy.start();
		}
		
		protected function onTime(e:Event):void
		{
			checkAntsForMovement();
		}
		
		public function addAnt(ant:Ant):void
		{
			ants.push(ant);
		}
		
		public function checkAntsForMovement():void
		{
			ants.forEach(function(ant:Ant, ...args):void
				{
					ant.poke();
					
					if(ant.isAlive)
					{
						numAntsAlive++;
					}
					else
					{
						numAntsDead++
					}
				});
		}
		
		public function isMoving(ant:Ant):Boolean
		{
			return ant.motionState != AntMotionStates.STILL;
		}
		
	}
}