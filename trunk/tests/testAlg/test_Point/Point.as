/*
*   --------------------------------------------------
*   Class:         com.wis.math.alg.Point.as
*   --------------------------------------------------
*   Version:       1.1
*   --------------------------------------------------
*   Latest update: November 5, 2003
*   --------------------------------------------------
*   Dependency:    com.wis.math.alg.Vector.as
*   --------------------------------------------------
*
*   Copyright © 2003, Richard Wright     [wisolutions2002@shaw.ca]
*   Copyright © 2000-2002, Kevin Lindsey [http://www.kevlindev.com/]
*
*
*   All rights reserved.
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
*   (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
*   LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
*   ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
*   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
*   SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*   -----------------------------------------------------------
*   Functions:
*
*       Point(px,py,pz,pcx,pcy,MC,pSize,D)
*
*             1.  adds(that)
*             2.  addEquals(that)
*             3.  scalarAdd(s)
*             4.  scalarAddEquals(s)
*             5.  subtract(that)
*             6.  subtractEquals(that)
*             7.  scalarSubtract(s)
*             8.  scalarSubtractEquals(s)
*             9.  multiply(s)
*             10. multiplyEquals(s)
*             11. divide(s)
*             12. divideEquals(s)
*          - comparison methods
*             13. equals(that)
*             14. lessThan(that)
*             15. lessThanEq(that)
*             16. greaterThan(that)
*             17. greaterThanEq(that)
*          - utility methods
*             18. lerp(that,t)
*             19. distanceFrom(that)
*             20. min(that)
*             21. max(that)
*             22. toString()
*         - get/set methods
*             23. setXYZ(x,y,z)
*             24. setFromPoint(that)
*             25. swap(that)
*         - 3d-centric methods
*             26. recenter(pcx,pcy)
*             27. resize(pSize)
*             28. translate(tx,ty,tz)
*             29. scale(sx,sy,sz)
*             30. rotateXMatrix(a)
*             31. rotateYMatrix(a)
*             32. rotateZMatrix(a)
*             33. axisMatrix(axis,a)
*             34. rotate(mat)
*             35. perspective()
*             36. render()
*             37. setDepth()
*             38. lineD1(p,v,s)
*             39. angle(a,b,c)
*
*   ------------------------------------------------------
*   Updates may be available at:
*                    http://members.shaw.ca/flashprogramming/wisASLibrary/wis/
*   -----------------------------------------------------
*/

import com.wis.math.alg.Vector;

class com.wis.math.alg.Point {

    var x,y,z,xCtr,yCtr,size,perSize,D,xp,yp:Number;
    var b3:Boolean;
    var clip:MovieClip;
    var M:Array;
    
    // constructor
    function Point(px:Number,py:Number,pz:Number,pcx:Number,pcy:Number,MC:MovieClip,pSize:Number,pD:Number) {
        //trace ("Point Class loaded");
        x = px;
        y = py;
        z = pz;
        xCtr = pcx;		    // x-position on 2d screen
    	yCtr = pcy;		    // y-position on 2d screen
    	clip = MC;			// path to movie clip which will represent 'Point'
    	size = pSize;		// size of point at origin
    	perSize = pSize;	// size of point with perspective
    	D = pD;	            // used for perspective -- distance from your eye to the screen
        if (pz) b3 = true;
		else b3 = false;
    }

// ------------------------------------------------------------

    // 1. adds
    function adds(that:Point):Point {
    
        var p:Point;
        
        if (b3) p = new Point(x+that.x,y+that.y,z+that.z);
        else p = new Point(x+that.x,y+that.y);
        
        return p;
    }

// ------------------------------------------------------------

    // 2. addEquals
    function addEquals(that:Point):Point {
        x += that.x;
        y += that.y;
        if (b3) z += that.z;
        
        return this;
    }

// ------------------------------------------------------------

    // 3. scalarAdd
    function scalarAdd(s:Number):Point {
    
        var p:Point;
        
        if (b3) p = new Point(x+s,y+s,z+s);
        else p = new Point(x+s,y+s);
        
        return p;
    }

// ------------------------------------------------------------

    // 4. scalarAddEquals
    function scalarAddEquals(s:Number):Point {
        x += s;
        y += s;
        if (b3) z += s;
        
        return this;
    }

// ------------------------------------------------------------

    // 5. subtract
    function subtract(that:Point):Point {
    
        var p:Point;
        
        if (b3) p = new Point(x-that.x,y-that.y,z-that.z);
        else p = new Point(x-that.x,y-that.y);
        
        return p;
    }

// ------------------------------------------------------------

    // 6. subtractEquals
    function subtractEquals(that:Point):Point {
        x -= that.x;
        y -= that.y;
        if (b3) z -= that.z;
        
        return this;
    }

// ------------------------------------------------------------

    // 7. scalarSubtract
    function scalarSubtract(s:Number):Point {
    
        var p:Point;
        
        if (b3) p = new Point(x-s,y-s,z-s);
        else p = new Point(x-s,y-s);
        
        return p;
    }

// ------------------------------------------------------------

    // 8. scalarSubtractEquals
    function scalarSubtractEquals(s:Number):Point {
        x -= s;
        y -= s;
        if (b3) z -= s;
        
        return this;
    }

// ------------------------------------------------------------

    // 9. multiply
    function multiply(s:Number):Point {
    
        var p:Point;
        
        if (b3) p = new Point(this.x*s,this.y*s,this.z*s);
        else p = new Point(this.x*s,this.y*s);
        
        return p;
    }

// ------------------------------------------------------------

    // 10. multiplyEquals
    function multiplyEquals(s:Number):Point {
        x *= s;
        y *= s;
        if (b3) z *= s;
        
        return this;
    }

// ------------------------------------------------------------

    // 11. divide
    function divide(s:Number):Point {
    
        var p:Point;
        
        if (b3)  p = new Point(x/s,y/s,z/s);
        else p = new Point(x/s,y/s);
        
        return p;
    }

// ------------------------------------------------------------

    // 12. divideEquals
    function divideEquals(s:Number):Point {
        x /= s;
        y /= s;
        if (b3) z /= s;
        
        return this;
    }

    //////////////////////////////////
    // Comparison Methods
    //////////////////////////////////

    // 13. equals - equal
    function equals(that:Point):Boolean {
    
        var b:Boolean;
        
        if (b3) b = (x==that.x && y==that.y && z==that.z);
        else b = (x==that.x && y==that.y);
        
        return b;
    }

// ------------------------------------------------------------

    // 14. lessThan - less than
    function lessThan(that:Point):Boolean {
    
        var b:Boolean;
        
        if (b3) b = (x<that.x && y<that.y && z<that.z);
        else b = (x<that.x && y<that.y);
        
        return b;
    }

// ------------------------------------------------------------

    // 15. lessThanEq - less than or equal
    function lessThanEq(that:Point):Boolean {
    
        var b:Boolean;
        
        if (b3) b = (x<=that.x && y<=that.y && z<=that.z);
        else b = (x<=that.x && y<=that.y);
        
        return b;
    }

// ------------------------------------------------------------

    // 16. greaterThan - greater than
    function greaterThan(that:Point):Boolean {
    
        var b:Boolean;
        
        if (b3) b = (x>that.x && y>that.y && z>that.z);
        else b = (x>that.x && y>that.y);
        
        return b;
    }

// ------------------------------------------------------------

    // 17. greaterThanEq - greater than or equal
    function greaterThanEq(that:Point):Boolean {
    
        var b:Boolean;
        
        if (b3) b = (x>=that.x && y >=that.y && z>=that.z);
        else b = (x>=that.x && y >=that.y);
        
        return b;
    }

    //////////////////////////////////
    // Utilility Methods
    //////////////////////////////////

    // 18. lerp
    function lerp(that:Point,t:Number):Point {
    
        var p:Point;
        
        if (b3) p = new Point(x+(that.x-x)*t,y+(that.y-y)*t,z+(that.z-z)*t);
        else p = new Point(x+(that.x-x)*t,y+(that.y-y)*t);
        
        return p;
    }

// ------------------------------------------------------------

    // 19. distanceFrom
    function distanceFrom(that:Point):Number {
    
        var dx:Number = x-that.x;
        var dy:Number = y-that.y;
        
        if (b3) {        
            var dz = z-that.z;            
            return Math.sqrt(dx*dx+dy*dy+dz*dz);
        } else {
            return Math.sqrt(dx*dx+dy*dy);
        }
    }

// ------------------------------------------------------------

    // 20. min
    function min(that:Point):Point {
    
        var p:Point;
        
        if (b3) p = new Point(Math.min(x,that.x),Math.min(y,that.y),Math.min(z,that.z));
        else p = new Point(Math.min(x,that.x),Math.min(y,that.y));
        
        return p;
    }

// ------------------------------------------------------------

    // 21. max
    function max(that:Point):Point {
    
        var p:Point;
        
        if (b3) p = new Point(Math.max(x,that.x),Math.max(y,that.y),Math.max(z,that.z));
        else p = new Point(Math.max(x,that.x),Math.max(y,that.y));
        
        return p;
    }

// ------------------------------------------------------------

    // 22. toString
    function toString():String {
    
        var s:String;
        
        if (b3) s = x+","+y+","+z;
        else s = x+","+y;
        
        return s;
    }

    ///////////////////////////////////////////////////////
    // Get/Set Methods
    ///////////////////////////////////////////////////////

    // 23. setXYZ
    function setXYZ(px:Number,py:Number,pz:Number):Void {
        x = px;
        y = py;
        if (b3) z = pz;
    }

// ------------------------------------------------------------

    // 24. setFromPoint
    function setFromPoint(that:Point):Void {
        x = that.x;
        y = that.y;
        if (b3) z = that.z;
    }

// ------------------------------------------------------------

    // 25. swap
    function swap(that:Point):Void {
    
        var tx:Number = x;
        var ty:Number = y;
        var tz:Number = z;
        
        x = that.x;
        y = that.y;
        if (b3) z = that.z;
        that.x = tx;
        that.y = ty;
        if (b3) that.z = tz;
    }

// ------------------------------------------------------------

    // 26. recenter
    function recenter(pcx:Number,pcy:Number):Void {
    	xCtr = pcx;
    	yCtr = pcy;
    }

// ------------------------------------------------------------

    // 27. resize
    function resize(pSize:Number):Void {
    	size = pSize;
    }

// ------------------------------------------------------------

    // 28. translate
    function translate(tx:Number,ty:Number,tz:Number):Void {
    	x += tx;
    	y += ty;
    	if (b3) z += tz;
    }

// ------------------------------------------------------------

    // 29. scale
    function scale(sx:Number,sy:Number,sz:Number):Void {
    	x *= sx;
    	y *= sy;
    	if (b3) z *= sz;
    }

// ------------------------------------------------------------

    // 30. rotateXMatrix
    function rotateXMatrix(a:Number):Void {
    
    	M = new Array(3);

    	M[0] = new Array(1,0,0);
    	M[1] = new Array(0,Math.cos(a),-Math.sin(a));
    	M[2] = new Array(0,Math.sin(a),Math.cos(a));
    }

// ------------------------------------------------------------

    // 31. rotateYMatrix
    function rotateYMatrix(a:Number):Void {
    
    	M = new Array(3);

    	M[0] = new Array(Math.cos(a),0,-Math.sin(a));
    	M[1] = new Array(0,1,0);
    	M[2] = new Array(Math.sin(a),0,Math.cos(a));
    }

// ------------------------------------------------------------

    // 32. rotateZMatrix
    function rotateZMatrix(a:Number):Void {
    
    	M = new Array(3);

    	M[0] = new Array(Math.cos(a),-Math.sin(a),0);
    	M[1] = new Array(Math.sin(a),Math.cos(a),0);
    	M[2] = new Array(0,0,1);
    }

// ------------------------------------------------------------

    // 33. axisMatrix
    function axisMatrix(axis:Vector,a:Number):Void {
    
    	var s,c,t,a:Number;
    	var ax:Vector = new Vector(axis.x,axis.y,axis.z);

    	ax.unitVector();

    	a *= -1;  // negate angle

    	s = Math.sin(a);
    	c = Math.cos(a);
    	t = 1-c;

    	M = new Array(3);
    	M[0] = new Array(3);
    	M[1] = new Array(3);
    	M[2] = new Array(3);

    	M[0][0] = t*ax.x*ax.x+c;
    	M[0][1] = t*ax.x*ax.y+s*ax.z;
    	M[0][2] = t*ax.x*ax.z-ax.x*ax.y;

    	M[1][0] = t*ax.x*ax.y-s*ax.z;
    	M[1][1] = t*ax.y*ax.y+c;
    	M[1][2] = t*ax.y*ax.z+s*ax.z;

    	M[2][0] = t*ax.x*ax.z+s*ax.y;
    	M[2][1] = t*ax.y*ax.z-s*ax.x;
    	M[2][2] = t*ax.z*ax.z+c;
    }

// ------------------------------------------------------------

    // 34. rotate
    function rotate(mat:Array):Void {
    
    	var rx,ry,rz:Number;

    	rx = x*mat[0][0]+y*mat[0][1]+z*mat[0][2];
    	ry = x*mat[1][0]+y*mat[1][1]+z*mat[1][2];
    	rz = x*mat[2][0]+y*mat[2][1]+z*mat[2][2];

    	x = rx;
    	y = ry;
    	z = rz;
    }

// ------------------------------------------------------------

    // 35. perspective
    function perspective():Void {
    
    	var per:Number;

    	per = D/(z+D);
    	xp = x*per;
    	yp = y*per;
    	perSize = size*per;
    }

// ------------------------------------------------------------

    // 36. render
    function render():Void {
        perspective();
    	clip._x = xCtr+xp;
    	clip._y = yCtr-yp;
    	clip._xscale = clip._yscale = perSize;
    	this.setDepth();
    }

// ------------------------------------------------------------

    // 37. setDepth
    function setDepth():Void {
    	clip.swapDepths(-1*z);
    }

// ------------------------------------------------------------

    // 38. lineD1
    function lineD1(p1:Point,p2:Point,V:Vector):Number {
    
    	var temp,vec:Vector;

    	if (b3) {
    	    temp = new Vector(this.x,this.y,this.z);
    	    vec = new Vector(p1.x-p2.x,p1.y-p2.y,p1.z-p2.z);
    	} else {
    	    temp = new Vector(this.x,this.y);
    	    vec = new Vector(p1.x-p2.x,p1.y-p2.y);    	
    	}
    	temp = V.crossProduct(vec);
    	
    	return (temp.norm()/V.norm());
    }

// ------------------------------------------------------------

    // 39. angle
    function angle(p1:Point,p2:Point,p3:Point):Number {
    
        var v,w:Vector;
    	
    	if (b3) {
    	    v = new Vector(p1.x-p2.x,p1.y-p2.y,p1.z-p2.z);
    	    w = new Vector(p3.x-p2.x,p3.y-p2.y,p3.z-p2.z);
    	} else {
    	    v = new Vector(p1.x-p2.x,p1.y-p2.y);
    	    w = new Vector(p3.x-p2.x,p3.y-p2.y);    	
    	}

    	return (v.angleVector(w));
    }

}

