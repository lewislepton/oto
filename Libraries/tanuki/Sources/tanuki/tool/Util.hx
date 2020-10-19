package tanuki.tool;

/*
	@uthor lewis lepton 2018
	lewislepton.com
*/

import kha.math.Vector2;

class Util {
	public static inline var PI = 3.141592653589793;
	public static inline var EPSILON = 0.0000001;

	/**
		converts degrees to radians
	**/
	public static inline function degToRad(value:Float):Float {
		return value * Math.PI / 180;
	}

	/**
		converts radians to degrees
	**/
	public static inline function radToDeg(value:Float):Float {
		return value * 180 / Math.PI;
	}

	/**
		calculates the distance between 2 points
	**/
	public static inline function distance(a:Vector2, b:Vector2){
		return Math.sqrt(Math.pow(a.x - b.x, 2) + Math.pow(a.y - b.y, 2));
	}

	/**
		random floating number that only goes between 0 & set int value
	**/
	public static inline function randomFloat(value:Float):Float {
		return Math.floor(Math.random() * value);
	}
	
	/**
		random ranged floating number that only goes between the min & max values set
	**/
	public static inline function randomRangeFloat(min:Float, max:Float):Float {
		return Math.random() * (1 + max - min) + min;
	}
	
	/**
		random interger number that only goes between 0 & set int value
	**/
	public static inline function randomInt(value:Int):Int {
		return Math.floor(Math.random() * value);
	}

	/**
		random ranged interger number that only goes between the min & max values set
	**/
	public static inline function randomRangeInt(min:Int, max:Int):Int {
		return Math.floor(Math.random() * (1 + max - min)) + min;
	}

	/**
		randomise bool
	**/
	public static inline function bool():Bool {
		return Math.random() > 0.5;
	}

	/**
		scales one floating point min & max value to another min & max value

		example:
		input min[0] max[128] | output min[0.9] max[23.6]
	**/
	public static inline function scale(value:Float, minIn:Float, maxIn:Float, minOut:Float, maxOut:Float):Float {
		return minOut + (maxOut - minOut) * ((value - minIn) / (maxIn - minIn));
	}

	public static inline function lerp(value:Float, min:Float, max:Float):Float {
		// return min + (max - min) * value;
		return min + value * (max - min);
	}

	public static inline function constrain(value:Float, min:Float, max:Float):Float {
    return (value < min) ? min : ((value > max) ? max : value);
  }

	public static inline function min(a:Float, b:Float):Float {
		return (a < b) ? a : b;
	}

	public static inline function max(a:Float, b:Float):Float {
		return (a > b) ? a : b;
	}

	public static inline function pythagoras(x:Float, y:Float):Float {
		return Math.sqrt(x * x + y * y);
	}

	public static function cosineRule(a:Float, b:Float, c:Float):Float {
		var angle:Float = (b * b + c * c - a * a) / (2 * b * c);
		return Math.cos(angle);
	}

	public static function implementBound(value:Float, min:Float, max:Float):Float {
		return Math.min(Math.max(min, value), max);
	}
}