/*
*   -----------------------------------------------
*   Application:   test_RegPoint
*   -----------------------------------------------
*   Version:       test_RegPoint1.0.as
*                  test_RegPoint.fla
*   -----------------------------------------------
*   Latest update: March 16, 2004
*   -----------------------------------------------
*
*   Copyright © 2004, Richard Wright [wisolutions2002@shaw.ca]
*   Copyright © 2003, Robert Penner  [www.robertpenner.com] - original AS1 class
*
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
*   -----------------------------------------------
*
*   Functions:
*
*           1. drawGrid(spacer,stroke,col,alpha,fillCol,fillAlpha)
*           2. attachClassMovie(className,instanceName,depth,argv)
*           3. popClipObj()
*           4. init()
*
*   -----------------------------------------------
*   Updates may be available at:
*                    http://members.shaw.ca/flashprogramming/wisASLibrary/wis/
*   -----------------------------------------------
*/

import com.wis.math.geom.util.RegPoint;

//////////////////////////////
// Initialize
//////////////////////////////

var spacer:Number = 100;
var width:Number = 600;
var height:Number = 400;
var stroke:Number = 0;
var col:Number = 0xFFCC68;
var alpha:Number = 50;
var fillCol:Number = 0xFFFF00;
var fillAlpha:Number = 5;
var bTog:Boolean = true;

// --------------------------------------

// draw grid
drawGrid(spacer,width,height,stroke,col,alpha,fillCol,fillAlpha);

// --------------------------------------

// attach a RegPoint Class mc instance
var clip:RegPoint = this.attachClassMovie(com.wis.math.geom.util.RegPoint,"clip",this.getNextHighestDepth(),[true]);

// --------------------------------------

// draw clip
with (clip) {
	_x = 100;
	_y = 100;
	beginFill(0xFF0000,10);
	lineStyle(0);
	lineTo(100,0);
	lineTo(100,100);
	lineTo(0,100);
	lineTo(0,0);
	lineTo(50,50);
	lineTo(100,0);
	endFill();
}

// --------------------------------------

// populated with 'popClipObj' function
var clip_obj:Object = {};

//////////////////////////////
// Listeners
//////////////////////////////

// refresh_pb listener
var click_obj:Object = {};
click_obj.click = function(evt) {
    with (clip) {
		_pt._x = _xreg = xreg_ns.value;
        _pt._y = _yreg = yreg_ns.value;
        _x2 = Number(x2_ns.value)-_xreg;
        _y2 = Number(y2_ns.value)-_yreg;
        _xscale2 = xscale2_ns.value;
        _yscale2 = yscale2_ns.value;
        _rotation2 = rotation2_ns.value;
	}
}

refresh_pb.addEventListener("click",click_obj);

// --------------------------------------

// regPt_pb listener
var regPt_obj:Object = {};
regPt_obj.click = function(evt) {
    with (clip) {
		_pt._x = _xreg = xreg_ns.value;
        _pt._y = _yreg = yreg_ns.value;
	}
}

regPt_pb.addEventListener("click",regPt_obj);


// --------------------------------------

// togPt_pb listener
var togPt_obj:Object = {};
togPt_obj.click = function(evt) {
    bTog = !bTog;
    if (bTog) clip._pt._visible = true, togPt_pb.label = "Hide Point";
    else clip._pt._visible = false, togPt_pb.label = "Show Point";
}

togPt_pb.addEventListener("click",togPt_obj);

//////////////////////////////
// Functions
//////////////////////////////

// drawGrid
function drawGrid(spacer,width,height,stroke,col,alpha,fillCol,fillAlpha:Number):Void {
	
	var SW:Number = width;
    var SH:Number = height;
	var GS:Number = spacer;
	var j:Number;

    this.createEmptyMovieClip("grid",-100);

    with (this.grid) {
	    _x = 0;
	    _y = 0;
	    beginFill(fillCol,fillAlpha);
        lineStyle(stroke,col,alpha);
        lineTo(SW-1,0);
	    lineTo(SW-1,SH-1);
	    lineTo(0,SH-1);
        lineTo(0,0);
        for (j=1;j<SH/GS;j++) {
            moveTo(0,GS*j);
            lineTo(SW,GS*j);
	    }
	    for (j=1;j<SW/GS;j++) {
	        moveTo(GS*j,0);
	        lineTo(GS*j,SH);
	    }
	    endFill();
    }
}

// --------------------------------------

// attachClassMovie
function attachClassMovie(className:Function,instanceName:String,depth:Number,argv:Array):MovieClip {
    
    var mc:MovieClip = this.createEmptyMovieClip(instanceName,depth);

    // save class prototype, apply the constructor
    mc.__proto__ = className.prototype;
    className.apply(mc,argv);

    return mc;
}

// --------------------------------------

// popClipObj
popClipObj = function() {
    clip_obj = {
        xreg:xreg_ns.value,
        yreg:yreg_ns.value,
        x2:x2_ns.value,
        y2:y2_ns.value,
        xscale2:xscale2_ns.value,
        yscale2:yscale2_ns.value,
        rotation2:rotation2_ns.value
    };
};

// --------------------------------------

// init - sets _ns defaults
init = function() {
    clip._xreg = xreg_ns.value = 0;
    clip._yreg = yreg_ns.value = 0;
    clip._x2 = x2_ns.value = 100;
    clip._y2 = y2_ns.value = 100;
    clip._xscale2 = xscale2_ns.value = 200;
    clip._yscale2 = yscale2_ns.value = 100;
    clip._rotation2 = rotation2_ns.value = 0;
	popClipObj();
};

//////////////////////////////
// UI Functionality
//////////////////////////////

init();

this.onMouseMove = function() {
	xmouse2_ti.text = clip._xmouse2;
    ymouse2_ti.text = clip._ymouse2;
};

