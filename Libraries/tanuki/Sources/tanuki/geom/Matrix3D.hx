package tanuki.geom;

/*
 * Copyright (c) 2017 Kenton Hamaluik
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at:
 *     http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/

import kha.math.Matrix3;

import tanuki.tool.Util;
import tanuki.math.Vector3D;
/**
  A 4x4 matrix
 */
abstract Matrix3D(Matrix3) from Matrix3 to Matrix3  {
    public inline function new(
            _r0c0:Float = 0, _r0c1:Float = 0, _r0c2:Float = 0,
            _r1c0:Float = 0, _r1c1:Float = 0, _r1c2:Float = 0,
            _r2c0:Float = 0, _r2c1:Float = 0, _r2c2:Float = 0
        ) {
        this = new Matrix3(
            _r0c0, _r0c1, _r0c2,
            _r1c0, _r1c1, _r1c2,
            _r2c0, _r2c1, _r2c2
        );
    }

    /**
      Accessor for the element in row 0 and column 0
     */
    public var r0c0(get, set):Float;
    private inline function get_r0c0():Float return this._00;
    private inline function set_r0c0(v:Float):Float return this._00 = v;

    /**
      Accessor for the element in row 1 and column 0
     */
    public var r1c0(get, set):Float;
    private inline function get_r1c0():Float return this._01;
    private inline function set_r1c0(v:Float):Float return this._01 = v;

    /**
      Accessor for the element in row 2 and column 0
     */
    public var r2c0(get, set):Float;
    private inline function get_r2c0():Float return this._02;
    private inline function set_r2c0(v:Float):Float return this._02 = v;

    /**
      Accessor for the element in row 0 and column 1
     */
    public var r0c1(get, set):Float;
    private inline function get_r0c1():Float return this._10;
    private inline function set_r0c1(v:Float):Float return this._10 = v;

    /**
      Accessor for the element in row 1 and column 1
     */
    public var r1c1(get, set):Float;
    private inline function get_r1c1():Float return this._11;
    private inline function set_r1c1(v:Float):Float return this._11 = v;

    /**
      Accessor for the element in row 2 and column 1
     */
    public var r2c1(get, set):Float;
    private inline function get_r2c1():Float return this._12;
    private inline function set_r2c1(v:Float):Float return this._12 = v;

    /**
      Accessor for the element in row 0 and column 2
     */
    public var r0c2(get, set):Float;
    private inline function get_r0c2():Float return this._20;
    private inline function set_r0c2(v:Float):Float return this._20 = v;

    /**
      Accessor for the element in row 1 and column 2
     */
    public var r1c2(get, set):Float;
    private inline function get_r1c2():Float return this._21;
    private inline function set_r1c2(v:Float):Float return this._21 = v;

    /**
      Accessor for the element in row 2 and column 2
     */
    public var r2c2(get, set):Float;
    private inline function get_r2c2():Float return this._22;
    private inline function set_r2c2(v:Float):Float return this._22 = v;

    /**
      Read an element using a column-major index
      @param key the index to use
      @return Float
     */
    @:arrayAccess
    public inline function get(key:Int):Float {
        return switch(key) {
            case  0: r0c0;
            case  1: r1c0;
            case  2: r2c0;
            case  3: r0c1;
            case  4: r1c1;
            case  5: r2c1;
            case  6: r0c2;
            case  7: r1c2;
            case  8: r2c2;
            case _: throw 'Index ${key} out of bounds (0-8)!';
        };
    }

    /**
      Write to an element using a column-major index
      @param key the index to use
      @param value the value to set
      @return Float
     */
    @:arrayAccess
    public inline function set(key:Int, value:Float):Float {
        return switch(key) {
            case  0: r0c0 = value;
            case  1: r1c0 = value;
            case  2: r2c0 = value;
            case  3: r0c1 = value;
            case  4: r1c1 = value;
            case  5: r2c1 = value;
            case  6: r0c2 = value;
            case  7: r1c2 = value;
            case  8: r2c2 = value;
            case _: throw 'Index ${key} out of bounds (0-8)!';
        };
    }

    /**
      Tests if two matrices are equal on an element-by-element basis
      @param m the other matrix to check
      @return Bool
     */
    public inline function equals(b:Matrix3D):Bool {
        return !(
               Math.abs(r0c0 - b.r0c0) >= Util.EPSILON
            || Math.abs(r0c1 - b.r0c1) >= Util.EPSILON
            || Math.abs(r0c2 - b.r0c2) >= Util.EPSILON
            || Math.abs(r1c0 - b.r1c0) >= Util.EPSILON
            || Math.abs(r1c1 - b.r1c1) >= Util.EPSILON
            || Math.abs(r1c2 - b.r1c2) >= Util.EPSILON
            || Math.abs(r2c0 - b.r2c0) >= Util.EPSILON
            || Math.abs(r2c1 - b.r2c1) >= Util.EPSILON
            || Math.abs(r2c2 - b.r2c2) >= Util.EPSILON
        );
    }

    /**
      Gets a string representation of the matrix
      @return String
     */
    public inline function toString():String {
        return
            '[${r0c0}, ${r0c1}, ${r0c2}]\n' +
            '[${r1c0}, ${r1c1}, ${r1c2}]\n' +
            '[${r2c0}, ${r2c1}, ${r2c2}]\n';
    }

    /**
      Fill `dest` with an identity matrix
      @param dest the matrix to fill out
      @return Matrix3D
     */
    public inline static function identity(dest:Matrix3D):Matrix3D {
        dest.r0c0 = 1;
        dest.r0c1 = 0;
        dest.r0c2 = 0;

        dest.r1c0 = 0;
        dest.r1c1 = 1;
        dest.r1c2 = 0;
        
        dest.r2c0 = 0;
        dest.r2c1 = 0;
        dest.r2c2 = 1;

        return dest;
    }

    /**
      Copies one matrix into another
      @param src The matrix to copy from
      @param dest The matrix to copy into
      @return Matrix3D
     */
    public inline static function copy(src:Matrix3D, dest:Matrix3D):Matrix3D {
        dest.r0c0 = src.r0c0;
        dest.r0c1 = src.r0c1;
        dest.r0c2 = src.r0c2;
        
        dest.r1c0 = src.r1c0;
        dest.r1c1 = src.r1c1;
        dest.r1c2 = src.r1c2;
        
        dest.r2c0 = src.r2c0;
        dest.r2c1 = src.r2c1;
        dest.r2c2 = src.r2c2;

        return dest;
    }

    /**
      Transposes a matrix
      @param src The matrix to transpose
      @param dest The destination matrix. Call with `src == dest` to modify `src` in place
      @return Matrix3D
     */
    public inline static function transpose(src:Matrix3D, dest:Matrix3D):Matrix3D {
        var src_r1c0 = src.r1c0;
        var src_r2c0 = src.r2c0;
        var src_r2c1 = src.r2c1;

        dest.r0c0 = src.r0c0;
        dest.r1c0 = src.r0c1;
        dest.r2c0 = src.r0c2;

        dest.r0c1 = src_r1c0;
        dest.r1c1 = src.r1c1;
        dest.r2c1 = src.r1c2;

        dest.r0c2 = src_r2c0;
        dest.r1c2 = src_r2c1;
        dest.r2c2 = src.r2c2;

        return dest;
    }

    inline static function cofactor(a:Float, b:Float, c:Float, d:Float):Float {
        return a * d - b * c;
    }

    /**
      Calculates the determinant of the matrix
      @param src The matrix to calculate the determinant of
      @return Float
     */
    public inline static function determinant(src:Matrix3D):Float {
        var c00 = cofactor(src.r1c1, src.r1c2, src.r2c1, src.r2c2);
        var c01 = cofactor(src.r0c1, src.r0c2, src.r2c1, src.r2c2);
        var c02 = cofactor(src.r0c1, src.r0c2, src.r1c1, src.r1c2);
        return src.r0c0 * c00 - src.r1c0 * c01 + src.r2c0 * c02;
    }

    /**
      Inverts the `src` matrix, storing the result in `dest`. If `src == dest`, modifies `src` in place.
      @param src The source matrix
      @param dest The matrix to store the result in
      @return Matrix3D
     */
    public inline static function invert(src:Matrix3D, dest:Matrix3D):Matrix3D {
        var c00 = cofactor(src.r1c1, src.r1c2, src.r2c1, src.r2c2);
        var c01 = cofactor(src.r0c1, src.r0c2, src.r2c1, src.r2c2);
        var c02 = cofactor(src.r0c1, src.r0c2, src.r1c1, src.r1c2);

        var det:Float = src.r0c0 * c00 - src.r1c0 * c01 + src.r2c0 * c02;
        if (Math.abs(det) < Util.EPSILON) {
            throw "determinant is too small";
        }
        
        var c10 = cofactor(src.r1c0, src.r1c2, src.r2c0, src.r2c2);
        var c11 = cofactor(src.r0c0, src.r0c2, src.r2c0, src.r2c2);
        var c12 = cofactor(src.r0c0, src.r0c2, src.r1c0, src.r1c2);

        var c20 = cofactor(src.r1c0, src.r1c1, src.r2c0, src.r2c1);
        var c21 = cofactor(src.r0c0, src.r0c1, src.r2c0, src.r2c1);
        var c22 = cofactor(src.r0c0, src.r0c1, src.r1c0, src.r1c1);

        var invdet:Float = 1.0 / det;

        dest.r0c0 = c00 * invdet;
        dest.r1c0 = -c01 * invdet;
        dest.r2c0 = c02 * invdet;
        dest.r0c1 = -c10 * invdet;
        dest.r1c1 = c11 * invdet;
        dest.r2c1 = -c12 * invdet;
        dest.r0c2 = c20 * invdet;
        dest.r1c2 = -c21 * invdet;
        dest.r2c2 = c22 * invdet;
        return dest;
    }

    /**
      Multiplies two matrices together, storing the result in `dest`. Caches `a` and `b` so `a == dest` and `b == dest` are valid.
      @param a The left-hand matrix
      @param b The right-hand matrix
      @param dest The matrix to store the result in
      @return Matrix3D
     */
    public inline static function multMat(a:Matrix3D, b:Matrix3D, dest:Matrix3D):Matrix3D {
        // cache what we need to do the calculations
        var _a:Matrix3D;
        var _b:Matrix3D;
        if(dest == a) {
            _a = Matrix3D.copy(a, new Matrix3D());
            _b = b;
        }
        else if(dest == b) {
            _a = a;
            _b = Matrix3D.copy(b, new Matrix3D());
        }
        else {
            _a = a;
            _b = b;
        }

        dest.r0c0 = _a.r0c0*_b.r0c0 + _a.r0c1*_b.r1c0 + _a.r0c2*_b.r2c0;
        dest.r0c1 = _a.r0c0*_b.r0c1 + _a.r0c1*_b.r1c1 + _a.r0c2*_b.r2c1;
        dest.r0c2 = _a.r0c0*_b.r0c2 + _a.r0c1*_b.r1c2 + _a.r0c2*_b.r2c2;

        dest.r1c0 = _a.r1c0*_b.r0c0 + _a.r1c1*_b.r1c0 + _a.r1c2*_b.r2c0;
        dest.r1c1 = _a.r1c0*_b.r0c1 + _a.r1c1*_b.r1c1 + _a.r1c2*_b.r2c1;
        dest.r1c2 = _a.r1c0*_b.r0c2 + _a.r1c1*_b.r1c2 + _a.r1c2*_b.r2c2;

        dest.r2c0 = _a.r2c0*_b.r0c0 + _a.r2c1*_b.r1c0 + _a.r2c2*_b.r2c0;
        dest.r2c1 = _a.r2c0*_b.r0c1 + _a.r2c1*_b.r1c1 + _a.r2c2*_b.r2c1;
        dest.r2c2 = _a.r2c0*_b.r0c2 + _a.r2c1*_b.r1c2 + _a.r2c2*_b.r2c2;
        
        return dest;
    }

    /**
      Shortcut operator for `multMat(a, b, new Matrix3D())`
      @param a 
      @param b 
      @return Matrix3D
     */
    @:op(A * B)
    inline static function multMatOp(a:Matrix3D, b:Matrix3D):Matrix3D {
        return multMat(a, b, new Matrix3D());
    }

    /**
      Multiplies a vector `v` by a matrix `m`, storing the result in `dest`. Caches so `v == dest` is valid.
      @param m The transforming matrix
      @param v The vector to multiply with
      @param dest The resulting vector
      @return Vec4
     */
    public inline static function multVec(m:Matrix3D, v:Vector3D, dest:Vector3D):Vector3D {
        var x:Float = v.x, y:Float = v.y, z:Float = v.z;
        dest.x = m.r0c0*x + m.r0c1*y + m.r0c2*z;
        dest.y = m.r1c0*x + m.r1c1*y + m.r1c2*z;
        dest.z = m.r2c0*x + m.r2c1*y + m.r2c2*z;
        return dest;
    }

    /**
      Shortcut for `multVec(m, v, new Vec4())`
      @param m 
      @param v 
      @return Vec4
     */
    @:op(A * B)
    inline static function multVecOp(m:Matrix3D, v:Vector3D):Vector3D {
        return multVec(m, v, new Vector3D());
    }

    /**
      Construct a Matrix3D from an array of floats in column-major order
      @param arr an array with 16 elements
      @return Matrix3D
     */
    @:from
    public inline static function fromFloatArray(arr:Array<Float>):Matrix3D {
        return new Matrix3D(
            arr[0], arr[3], arr[6],
            arr[1], arr[4], arr[7],
            arr[2], arr[5], arr[8]
        );
    }

    /**
      Cast the matrix in an array of floats, in column-major order
      @return Array<Float>
     */
    @:to
    public inline function toFloatArray():Array<Float> {
        return [
            r0c0, r1c0, r2c0,
            r0c1, r1c1, r2c1,
            r0c2, r1c2, r2c2
        ];
    }
}