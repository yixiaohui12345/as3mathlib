/*
*   -----------------------------------------------------
*   Class:         com.wis.math.alg.Vector.as
*   -----------------------------------------------------
*   Version:       1.2
*   -----------------------------------------------------
*   Latest update: March 6, 2004
*   -----------------------------------------------------
*
*   Copyright © 2003, Richard Wright   [wisolutions2002@shaw.ca]
*   Copyright © 2003, John Haggerty    [http://www.slimeland.com/]
*   Copyright © 2002, Brandon Williams [brandon@plotdev.com]
*
*
*   All rights reserved
*
*   Redistribution and use in source and binary forms, with or without
*   modification, are permitted provided that the following conditions are met:
*
*       - Redistributions of source code must retain the above copyright notice,
*         this list of conditions and the following disclaimer.
*
*       - Redistributions in binary form must reproduce the above copyright
*         notice, this list of conditions and the following disclaimer in the
*         documentation and/or other materials provided with the distribution.
*
*       - Neither the name of this software nor the names of its contributors
*         may be used to endorse or promote products derived from this software
*         without specific prior written permission.
*
*   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
*   ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
*   WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
*   DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
*   ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
*   (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GODS OR SERVICES;
*   LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
*   ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
*   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
*   SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*   ------------------------------------------------------
*
*   Functions:
*
*       Vector(x,y,z) or (x,y)
*
*           1.  toString()
*           2.  resetComponents(vx,vy,vz)
*           3.  copyComponents(V)
*           4.  incrementX(incX)
*           5.  incrementY(incY)
*           6.  incrementZ(incZ)
*           7.  incrementComponents(incX,incY,incZ)
*           8.  adds(V)
*           9.  returnAddition(V)
*           10. subtract(V)
*           11. returnSubtraction(V)
*           12  scalar(s)
*           13. returnScalar(s)
*           14. scalarComponent(V)
*           15. divide(s)
*           16. returnDivide(s)
*           17. dotProduct(V)
*           18. crossProduct(V)
*           19. norm()
*           20. unitVector()
*           21. normalize()
*           22. swap(V)
*           23. angleVector(V)
*           24. areaPara(V)
*           25. areaTriangle(A,B)
*           26. volumePara3d(A,B)
*           27. perp()
*           28. fromPointVals(x1,x2,y1,y2,z1,z2)
*           29. equal(V)
*           30. sameDirection(V)
*           31. greater(V)
*           32. greaterEqual(V)
*           33. less(V)
*           34. lessEqual(V)
*           35. round3(x)
*           36. transform(trans,dontTranslate)
*           37. transformed(trans,dontTranslate)
*           38. normalizer(vec) - static
*           39. neg(v)
*           40. inv()
*           41. len()
*           42. lengthSquared()
*           43. adder(v1,v2) - static
*           44. scaler(v1,s) - static
*           45. compare(v1,v2) - static
*           46. mult(v1,v2) - static
*           47. dot(v1,v2) - static
*           48. cross(v1,v2) - static
*           49. copy()
*           50. identity vectors - constants
*
*   ------------------------------------------------------
*   Updates may be available at:
*                    http://members.shaw.ca/flashprogramming/wisASLibrary/wis/
*   -----------------------------------------------------
*   NOTE: I've swayed from using '$' as a class-based variable identifier
*         for this class due to the increase of UI-defined class variables ..
*         Point, Vector, Col, and ColMC classes are all affected by this.
*
*         Also, there are method duplications to support calls from other 
*         classes which can referenced through ClassInstanceName.method()
*         or the static Vector.method().
*/

import com.wis.math.geom.util.Transformation;

   // Transformation class variables reference:
   // var $vx,$vy,$vz,$c:Vector;
   // var $identity:Boolean;
   // var $inverse:Transformation;

class com.wis.math.alg.Vector {

    var x,y,z:Number;
    
    var $b3:Boolean;
	
    // constructor
    function Vector(vx,vy,vz:Number) {
	    x = vx;
	    y = vy;
	    z = vz;
		if (vz!=undefined) $b3 = true;
		else $b3 = false;
    }

// ------------------------------------------------------------

    // 1. toString
    function toString():String {
    
	    var s:String;
	    
	    if ($b3) s = ("Vector = ["+x+","+y+","+z +"]");
	    else s = ("Vector = ["+x+","+y+"]");
	    
	    return s;
    }

// ------------------------------------------------------------

    // 2. resetComponents
    function resetComponents(vx,vy,vz:Number):Void {
	    x = vx;
	    y = vy;
	    if ($b3) z = vz;
    }

// ------------------------------------------------------------

    // 3. copyComponents
    function copyComponents(V:Vector):Void {
	    x = V.x;
	    y = V.y;
	    if ($b3) z = V.z;
    }

// ------------------------------------------------------------

    // 4. incrementX
    function incrementX(incX:Number):Void {
	    x += incX;
    }

// ------------------------------------------------------------

    // 5. incrementY
    function incrementY(incY:Number):Void {
	    y += incY;
    }

// ------------------------------------------------------------

    // 6. incrementZ
    function incrementZ(incZ:Number):Void {
	    if ($b3) z += incZ;
    }

// ------------------------------------------------------------

    // 7. incrementComponents
    function incrementComponents(incX,incY,incZ:Number):Void {
	    x += incX;
	    y += incY;
	    if ($b3) z += incZ;
    }

// ------------------------------------------------------------

    // 8. adds
    function adds(V:Vector):Vector {
	    x += V.x;
	    y += V.y;
	    if ($b3) z += V.z;
	    
	    return this;
    }

// ------------------------------------------------------------

    // 9. returnAddition
    function returnAddition(V:Vector):Vector {
        
        var v:Vector;
        
	    if ($b3) v = new Vector((x+V.x),(y+V.y),(z+V.z));
	    else v = new Vector((x+V.x),(y+V.y));
	    
	    return v;
    }

// ------------------------------------------------------------

    // 10. subtract
    function subtract(V:Vector):Vector {
	    x -= V.x;
	    y -= V.y;
	    if ($b3) z -= V.z;
	    
	    return this;
    }

// ------------------------------------------------------------

    // 11. returnSubtraction
    function returnSubtraction(V:Vector):Vector {
    
        var v:Vector;
        
	    if ($b3) v = new Vector((x-V.x),(y-V.y),(z-V.z));
	    else v = new Vector((x-V.x),(y-V.y));
	    
	    return v;
    }
    
// ------------------------------------------------------------

    // 12. scalar
    function scalar(s:Number):Void {
	    x *= s;
	    y *= s;
	    if ($b3) z *= s;
    }

// ------------------------------------------------------------

    // 13. returnScalar
    function returnScalar(s:Number):Vector {
    
        var v:Vector;
        
        if ($b3) v = new Vector(x*s,y*s,z*s);
        else v = new Vector(x*s,y*s);
        
        return v;
    }
    
// ------------------------------------------------------------

    // 14. scalarComponent - scalar component in the direction of 'V' 
    function scalarComponent(V:Vector):Number {
    
	    var a:Vector;
	    
	    if ($b3) a = new Vector(x,y,z);
	    else a = new Vector(x,y);
	    a.unitVector(V);

	    return this.dotProduct(a);
    }

// ------------------------------------------------------------

    // 15. divide
    function divide(s:Number):Vector {
        x /= s;
        y /= s;
        if ($b3) z /= s; 
        
        return this;
    }

// ------------------------------------------------------------

    // 16. returnDivide
    function returnDivide(s:Number):Vector {
    
        var v:Vector;
        
        if ($b3) v = new Vector(x/s,y/s,z/s);
        else v = new Vector(x/s,y/s);
        
        return v;
    }
    
// ------------------------------------------------------------

    // 17. dotProduct
    function dotProduct(V:Vector):Number {
    
        var n:Number;
        
	    if ($b3) n = (x*V.x)+(y*V.y)+(z*V.z);
	    else n = (x*V.x)+(y*V.y);
	    
	    return n;
    }

// ------------------------------------------------------------

    // 18. crossProduct
    function crossProduct(V:Vector):Vector {

	    var cross:Vector;
	    
	    if ($b3) {
	        cross = new Vector(0.0,0.0,0.0);
			cross.x = (y*V.z)-(z*V.y);
			cross.y = (z*V.x)-(x*V.z);
	        cross.z = (x*V.y)-(y*V.x);
	    } else {
	        // ref: http://mathquest.com/discuss/sci.math/a/m/415647/415659
	        cross = new Vector(0.0,0.0,0.0);
			cross.x = 0; //(y*V.z)-(z*V.y) = ((y*0)-(0*V.y) = 0
			cross.y = 0; //(z*V.x)-(x*V.z) = (0*V.x)-(x*0) = 0
	        cross.z = (x*V.y)-(y*V.x);
        }
        
	    return cross;
    }

// ------------------------------------------------------------

    // 19. norm
    function norm():Number {
    
        var n:Number;
        
	    if ($b3) n = Math.sqrt((x*x)+(y*y)+(z*z));
	    else n = Math.sqrt((x*x)+(y*y));
	    
	    return n;
    }

// ------------------------------------------------------------

    // 20. unitVector
    function unitVector():Vector {

	    var unit:Vector;
	    var norm = this.norm();
	    
	    if ($b3) unit = new Vector(x,y,z);
	    else unit = new Vector(x,y);	
	    unit.x /= norm;
	    unit.y /= norm;
	    if ($b3) unit.z /= norm;

	    return unit;
    }

// ------------------------------------------------------------

    // 21. normalize
    function normalize():Void {
    
	    var norm = this.norm();
	
	    x /= norm;
	    y /= norm;
	    if ($b3) z /= norm;
    }

// ------------------------------------------------------------

    // 22. swap
    function swap(V:Vector):Void {
    
	    var tempX,tempY,tempZ:Number;

	    tempX = x;
	    tempY = y;
	    if ($b3) tempZ = z;

	    x = V.x;
	    y = V.y;
	    if ($b3) z = V.z;

	    V.x = tempX;
	    V.y = tempY;
	    if ($b3) V.z = tempZ;
    }

// ------------------------------------------------------------

    // 23. angleVector
    function angleVector(V:Vector):Number {
    
	    return this.dotProduct(V)/(this.norm()*V.norm());
    }

// ------------------------------------------------------------

    // 24. areaPara
    function areaPara(V:Vector):Number {
    
	    var temp:Vector;
	    
	    if ($b3) temp = new Vector(x,y,z);
	    else temp = new Vector(x,y);
	    temp.crossProduct(V);
	    
	    return temp.norm();
    }

// ------------------------------------------------------------

    // 25. areaTriangle
    function areaTriangle(A,B:Vector):Number {

	    var v,w:Vector;
	    
	    if ($b3) {
	        v = new Vector(x,y,z);
	        w = new Vector(x,y,z);
	    } else {
	        v = new Vector(x,y);
	        w = new Vector(x,y);	    
	    }

	    v = this.subtract(A);
	    w = this.subtract(B);

	    return (.5*v.areaPara(w));
    }

// ------------------------------------------------------------

    // 26. volumePara3D
    function volumePara3d(A,B:Vector):Number {

	    var temp:Vector = new Vector(x,y,z);

	    temp = A.crossProduct(B);
	    
	    return Math.abs(A.dotProduct(temp));
    }

// ------------------------------------------------------------

    // 27. perp
    function perp():Vector {
    
        var v:Vector;
        
        if ($b3) v = new Vector(-y,x,z);
        else v = new Vector(-y,x);
        
        return v;
    }

// ------------------------------------------------------------

    // 28. fromPointVals - originally used Point input, but importing the 
    // Point class conflicted with cross import of Vector class within the 
    // Point class .. input params are listed in axis pairs rather than in
    // point pairs to support both 2D and 3D
    function fromPointVals(x1,x2,y1,y2,z1,z2:Number):Vector {
    
        var v:Vector;
        
        if (z1) v = new Vector(x2-x1,y2-y1,z2-z1);
        else v = new Vector(x2-x1,y2-y1);
        
        return v;
    }

// ------------------------------------------------------------

    // 29. equal
    function equal(V:Vector):Boolean {
    
        var b:Boolean;
        
	    if ($b3) b = (round3(x)==round3(V.x)) && (round3(y)==round3(V.y)) && (round3(z)==round3(V.z));
	    else b = (round3(x)==round3(V.x)) && (round3(y)==round3(V.y));
	    
	    return b;
    }

// ------------------------------------------------------------

    // 30. sameDirection
    function sameDirection(V:Vector):Boolean {
	
	    var a,b:Vector; 
	    
	    if ($b3) {
	        a = new Vector(x,y,z);
	        b = new Vector(x,y,z);
	    } else {
	        a = new Vector(x,y);
	        b = new Vector(x,y);	    
	    }

	    a.unitVector(this);
	    b.unitVector(V);

	    return a.equal(b);
    }

// ------------------------------------------------------------

    // 31. greater
    function greater(V:Vector):Boolean {
    
        var b:Boolean;
        
	    if ($b3) b = (round3(x)>round3(V.x)) && (round3(y)>round3(V.y)) && (round3(z)>round3(V.z));
	    else b = (round3(x)>round3(V.x)) && (round3(y)>round3(V.y));
	    
	    return b;
    }

// ------------------------------------------------------------

    // 32. greaterEqual 
    function greaterEqual(V:Vector):Boolean {
    
        var b:Boolean;
        
	    if ($b3) b = (round3(x)>=round3(V.x)) && (round3(y)>=round3(V.y)) && (round3(z)>=round3(V.z));
	    else b = (round3(x)>=round3(V.x)) && (round3(y)>=round3(V.y));
	    
	    return b;
    }

// ------------------------------------------------------------

    // 33. less 
    function less(V:Vector):Boolean {
    
        var b:Boolean;
        
	    if ($b3) b = (round3(x)<round3(V.x)) && (round3(y)<round3(V.y)) && (round3(z)<round3(V.z));
	    else b = (round3(x)<round3(V.x)) && (round3(y)<round3(V.y));
	    
	    return b;
    }

// ------------------------------------------------------------

    // 34. lessEqual
    function lessEqual(V:Vector):Boolean {
    
        var b:Boolean;
        
	    if ($b3) b = (round3(x)<=round3(V.x)) && (round3(y)<=round3(V.y)) && (round3(z)<=round3(V.z));
	    else b = (round3(x)<=round3(V.x)) && (round3(y)<=round3(V.y));
	    
	    return b;
    }

// ------------------------------------------------------------

    // 35. round3
    function round3(n:Number):Number {
    
	    return Math.round(n*1000)/1000;
    }

// ------------------------------------------------------------

    // 36. transform
    function transform(trans:Transformation,dontTranslate:Boolean):Void {
    
    	var newx,newy,newz:Number;
    	
    	if (dontTranslate) {
    		newx = Vector.dot(trans.$vx,this);
    		newy = Vector.dot(trans.$vy,this);
    		newz = Vector.dot(trans.$vz,this);
    	} else {
    		newx = Vector.dot(trans.$vx,this)+trans.$c.x;
    		newy = Vector.dot(trans.$vy,this)+trans.$c.y;
    		newz = Vector.dot(trans.$vz,this)+trans.$c.z;
    	}
    	x = newx;
    	y = newy;
    	z = newz;
    }
    
// ------------------------------------------------------------

    // 37. transformed
    function transformed(trans:Transformation,dontTranslate:Boolean):Vector {
    	if (dontTranslate) {
    	
    		return new Vector(
    			Vector.dot(trans.$vx,this),
    			Vector.dot(trans.$vy,this),
    			Vector.dot(trans.$vz,this)
    		);
    	}
    	else {
    	
    		return new Vector(
    			Vector.dot(trans.$vx,this)+trans.$c.x,
    			Vector.dot(trans.$vy,this)+trans.$c.y,
    			Vector.dot(trans.$vz,this)+trans.$c.z
    		);
    	}
    }


// ------------------------------------------------------------

    // 38. normalizer
    static function normalizer(vec:Vector):Vector {
    
        var l:Number = 1/vec.len(); 
        
        return new Vector(vec.x*l,vec.y*l,vec.z*l);
    }
    
// ------------------------------------------------------------
    
    // 39. neg
    static function neg(v:Vector):Vector {
    
        return new Vector(-v.x,-v.y,-v.z);
    }

// ------------------------------------------------------------

    // 40. inv
    function inv() {
    
        return new Vector(1/x,1/y,1/z);
    }
    
// ------------------------------------------------------------

    // 41. len
    function len() {
    
        return Math.sqrt(x*x+y*y+z*z);
    }
    
// ------------------------------------------------------------

    // 42. lengthSquared
    function lengthSquared() {
    
        return x*x+y*y+z*z;
    }
    
// ------------------------------------------------------------

    // 43. adder
    static function adder(v1,v2:Vector):Vector {
    
    	return new Vector(v1.x+v2.x,v1.y+v2.y,v1.z+v2.z);
    }
    
// ------------------------------------------------------------

    // 44. scaler
    static function scaler(v1:Vector,s:Number):Vector {
    
    	return new Vector(v1.x*s,v1.y*s,v1.z*s);
    }

// ------------------------------------------------------------

    // 45. compare
    static function compare(v1,v2:Vector):Boolean {
    
    	return (v1.x==v2.x && v1.y==v2.y && v1.z==v2.z);
    }

// ------------------------------------------------------------

    // 46. mult
    static function mult(v1,v2:Vector):Vector {
    
    	return new Vector(v1.x*v2.x,v1.y*v2.y,v1.z*v2.z);
    }
    
// ------------------------------------------------------------

    // 47. dot
    static function dot(v1,v2:Vector):Number {
    
    	return v1.x*v2.x+v1.y*v2.y+v1.z*v2.z;
    }

// ------------------------------------------------------------

    // 48. cross
    static function cross(v1,v2:Vector):Vector {
    
    	return new Vector(
    	    v1.y*v2.z-v1.z*v2.y, 
    	    v1.z*v2.x-v1.x*v2.z, 
    	    v1.x*v2.y-v1.y*v2.x
    	);
    }
    
// ------------------------------------------------------------

    // 49. copy
    function copy() {
    
    	return new Vector(x,y,z);
    }
    
// ------------------------------------------------------------

    // 50. identity vectors
	static var XX:Vector = new Vector(1,0,0);
	static var YY:Vector = new Vector(0,1,0);
	static var ZZ:Vector = new Vector(0,0,1);
    static var OO:Vector = new Vector(0,0,0);
    
}

