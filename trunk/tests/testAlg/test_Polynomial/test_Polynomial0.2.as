/*
*   ----------------------------------------------------
*   Application:   test_Polynomial
*   ----------------------------------------------------
*   Version:       test_Polynomial0.2.as
*                  test_Polynomial.fla
*   ----------------------------------------------------
*   Latest update: November 5, 2003
*   ----------------------------------------------------
*   Dependency:    com.wis.math.alg.Polynomial.as
*   ----------------------------------------------------
*
*   Copyright © 2003, Richard Wright [wisolutions2002@shaw.ca]
*
*
*   All rights reserved.
*
*   Redistribution and use in source and binary forms, with or without
*   modification, are permitted provided that the following conditions are met:
*
*      - Redistributions of source code must retain the above copyright notice,
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
*   -----------------------------------------------------
*
*   Functions:
*
*       1. init(e)
*       2. makeGraph(poly)
*       3. createAxis()
*       4. createLabel(msg)
*       5. createMark(id,x,y)
*       6. plotPoly(poly,parent)
*       7. plotRoots(poly,parent)
*
*   -----------------------------------------------------
*   Updates may be available at:
*                    http://members.shaw.ca/flashprogramming/wisASLibrary/wis/
*   -----------------------------------------------------
*/

import com.wis.math.alg.Polynomial;

//////////////////////////////////////////////
// Initialize
//////////////////////////////////////////////

var cenX:Number = 300;
var cenY:Number = 300;
var depth:Number = 0;
var minX:Number = -1.125;
var maxX:Number = 1.125;
var xScale:Number = 75;
var yScale:Number = 25;
var yInc:Number = 0;
var steps:Number = 10;
var rootLen:Number = 0;
var GX:Number = 300;
var GY:Number = 75;

var title_arr:Array = ["Linear\n\n\n    monic term = x - 1","Quadratic\n\n\n    monic term = x - 0.25","Cubic\n\n\n    monic term = x + 0.25","Quartic\n\n\n    monic term = x + 1"];

this.createEmptyMovieClip("holder",depth);

with (holder) {
    _x = cenX;
    _y = cenY+40;
    lineStyle();
    moveTo(-300,-300);
    lineTo(300,-300);
    lineTo(300,300);
    lineTo(-300,300);
    lineTo(-300,-300);
}

//////////////////////////////////////////////
// Functions
//////////////////////////////////////////////

// 1. init
MovieClip.prototype.init = function():Void  {
    var mono1:Polynomial = new Polynomial(1,-1);
    var mono2:Polynomial = new Polynomial(1,-0.25);
    var mono3:Polynomial = new Polynomial(1,0.25);
    var mono4:Polynomial = new Polynomial(1,1);
    var poly1:Polynomial = mono1;
    var poly2:Polynomial = poly1.multiply(mono2);
    var poly3:Polynomial = poly2.multiply(mono3);
    var poly4:Polynomial = poly3.multiply(mono4);
    this.makeGraph(poly1,yInc);
    this.makeGraph(poly2,++yInc);
    this.makeGraph(poly3,++yInc);
    this.makeGraph(poly4,++yInc);
    
    // test single graph: x²+2x-3
    //var poly1:Polynomial = new Polynomial(1,2,-3);
    //this.makeGraph(poly1,yInc);
};

// -----------------------------------------------------------------

// 2. makeGraph
MovieClip.prototype.makeGraph = function(poly:Polynomial,yInc:Number):Void  {
    ++depth;
    trace("*********************************");
    trace ("poly:"+poly+", yInc:"+yInc+", depth:"+depth);
    var g:MovieClip = this.createEmptyMovieClip("g"+depth,depth);
    with (g) {
        _x = 0;
        _y = -225+yInc*GY*2;
        lineStyle();
        moveTo(-GX,-GY);
        lineTo(GX,-GY);
        lineTo(GX,GY);
        lineTo(-GX,GY);
        lineTo(-GX,-GY);
        plotPoly(poly,g);
        plotRoots(poly,g);
        createAxis(yInc);
        createLabel(poly,title_arr[rootLen-1]);
    }
};

// -----------------------------------------------------------------

// 3. createAxis
MovieClip.prototype.createAxis = function(yInc:Number):Void  {
    this.createEmptyMovieClip("line",++depth);
    with (this["line"]) {
        _x = 0;
        _y = 0;
        lineStyle(0);
        moveTo(minX*xScale*1.125,0);
        lineTo(maxX*xScale*1.125,0);
    }
};

// -----------------------------------------------------------------

// 4. createLabel
MovieClip.prototype.createLabel = function(poly:Polynomial,title:String):Void  {
    this.createTextField("poly_txt",++depth,maxX*xScale*1.125+10,this.line._y-10,0,0);
    with (this.poly_txt) {
        autoSize = "left";
		selectable = false;
        text = poly;
    }
    var bounds = this.getBounds();
    this.createTextField("title_txt",++depth,bounds.xMin+10,bounds.yMin+20,0,0);
	with (this.title_txt) {
	    autoSize = "left";
		selectable = false;
		multiline = true;
	    text = title;
    }
};

// -----------------------------------------------------------------

// 5. createMark
MovieClip.prototype.createMark = function(id:String,x:Number,y:Number):Void  {
    ++depth;
    this.createEmptyMovieClip(id+depth,depth);
    if (id=="point") col = 0x0000FF;
    if (id=="root") col = 0xFF0000;
    with (this[id+depth]) {
	    lineStyle(0,col);
	    beginFill(col);
	    moveTo(-1,-1);
	    lineTo(1,-1);
	    lineTo(1,1);
	    lineTo(-1,1);
	    lineTo(-1,-1);
	    endFill();
	    _x = x*xScale;
	    _y = y*yScale;
	}
};

// -----------------------------------------------------------------

// 6. plotPoly
MovieClip.prototype.plotPoly = function(poly:Polynomial,parent:MovieClip):Void  {
    var j:Number;
    for (j=0;j<=steps;j++) {
        var x:Number = minX+j*(maxX-minX)/steps;
        parent.createMark("point",x,poly.eval(x));
    }
};

// -----------------------------------------------------------------

// 7. plotRoots
MovieClip.prototype.plotRoots = function(poly:Polynomial,parent:MovieClip):Void {
    var roots:Array = poly.getRoots();
    var j:Number;
    rootLen = roots.length;
    trace("plotRoots ... roots:"+roots);
    for (j=0;j<roots.length;j++) {
        var root = roots[j];
        trace(j+" root:"+root+", poly.eval(root):"+poly.eval(root));
        parent.createMark("root",root,poly.eval(root));
    }
};

//////////////////////////////////////////////
// UI Functionality
//////////////////////////////////////////////

holder.init();

trace ("#### Polynomial Properties ####");
for (arguments in Polynomial) {
    trace (arguments+":"+Polynomial[arguments]);
}

// ----------------------------------------------------------------- EOF

