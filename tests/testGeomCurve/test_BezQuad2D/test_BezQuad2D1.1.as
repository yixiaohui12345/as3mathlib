/*
*   -----------------------------------------------
*   Application:   test_BezQuad
*   -----------------------------------------------
*   Version:       test_BezQuad1.1.as
*                  test_BezQuad.fla
*   -----------------------------------------------
*   Latest update: November 9, 2003
*   -----------------------------------------------
*
*   Copyright © 2003, Richard Wright [wisolutions2002@shaw.ca]
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
*           1.  reDraw()
*           2.  drawLine(pt1,pt2,stroke,col,alpha)
*           3.  drawBez(pt1,pt2,pt3,t1,t2,stroke,col,alpha)
*
*   -----------------------------------------------
*   Updates may be available at:
*                    http://members.shaw.ca/flashprogramming/wisASLibrary/wis/
*   -----------------------------------------------
*/

import com.wis.math.geom.curve.BezQuad;
import com.wis.math.alg.Point;

///////////////////////////////////////
// initialize
///////////////////////////////////////

var tan_obj:Object = {};
var dir_obj:Object = {};
var sym_obj:Object = {};
var seg_obj:Object = {};
var proj_obj:Object = {};
var latRect_obj:Object = {};
var bBez:Boolean = true;
var bBezSeg:Boolean = true;
var bSym:Boolean = true;
var bTan:Boolean = true;
var bProj:Boolean = true;
var bBezProj:Boolean = true;
var bLatRect:Boolean = true;
var bDir:Boolean = true;
var bFoc:Boolean = true;
var bVert:Boolean = true;
var p1:Point;
var p2:Point;
var p3:Point;

var bez:Array = [];
bez[0] = new BezQuad();
bez[1] = new BezQuad();

this.createEmptyMovieClip("bez0",98);
this.createEmptyMovieClip("bez1",99);

focus.swapDepths(100),vertex.swapDepths(101),dot1.swapDepths(102),dot2.swapDepths(103),dot3.swapDepths(104);


///////////////////////////////////////
// functions
///////////////////////////////////////

// reDraw
reDraw = function() {

    bez0.clear();
    bez1.clear();
    
    vertex._visible = false;
    focus._visible = false;

    p1 = new Point(dot1._x,dot1._y);
    p2 = new Point(dot2._x,dot2._y);
    p3 = new Point(dot3._x,dot3._y);

    // draw bez curves
	if (bBez) bez0.drawBez(p1,p2,p3,-2,2,2,0xff0000,100);
    if (bBezSeg) bez1.drawBez(p1,p2,p3,0,1,3,0xffffff,100);

    // create objects
    if (bTan && (bBezSeg || bBez)) tan_obj = bez[0].drawTangents(p1,p2,p3);
    if (bSym && (bBezSeg || bBez)) sym_obj = bez[1].symmetryAxis(p1,p2,p3,400);
	if (bProj && (bBezSeg || bBez)) proj_obj = bez[1].projection(p1,p2,p3);
	if (bLatRect && (bBezSeg || bBez)) latRect_obj = bez[1].latusRectum(p1,p2,p3);
	if (bDir && (bBezSeg || bBez)) dir_obj = bez[1].directrix(p1,p2,p3,400);
	if (bBezSeg) bez[1].arcLength(p1,p2,p3);
	if (bBezSeg) bez[1].bezArea(p1,p2,p3);
   	bez[1].vertex(p1,p2,p3);
	bez[1].focalLength(p1,p2,p3);
	bez[1].focus(p1,p2,p3);
	vertex._x = bez[1].$vx;
	vertex._y = bez[1].$vy;
	focus._x = bez[1].$fx;
	focus._y = bez[1].$fy;
	
    // populate textfields		
	arc_txt.text = "Bez Arc Length = "+(Math.floor(100*bez[1].$arc))/100;
	area_txt.text = "Bez Area = "+(Math.floor(100*bez[1].$area))/100;
	projection1_txt.text = "Projection Anchor1 = "+proj_obj.proj1;
	projection2_txt.text = "Projection Vertex1 = "+proj_obj.proj2;
	projection3_txt.text = "Projection Anchor2 = "+proj_obj.proj3;
    projection4_txt.text = "Projection Vertex2 = "+proj_obj.proj4;
    ratio1_txt.text = "Projection Ratio1 = "+proj_obj.ratio1;
    ratio2_txt.text = "Projection Ratio2 = "+proj_obj.ratio2;
    latusRectum_txt.text = "Bez Latus Rectum = "+latRect_obj.latusRectum;
    semiLatusRectum_txt.text = "Bez Semi Latus Rectum = "+latRect_obj.semiLatusRectum;
    angle1_txt.text = "Angle1 = "+tan_obj.ang1;
    angle2_txt.text = "Angle2 = "+tan_obj.ang2;
    
    // bezier projection    
    if (bBezProj && bBezSeg) bez1.drawLine(proj_obj.pa,proj_obj.$p1,2,0x6600ff,100);
    if (bBezProj && bBezSeg) bez1.drawLine(proj_obj.pa,proj_obj.pv,2,0x6600ff,100);
    if (bBezProj && bBezSeg) bez1.drawLine(proj_obj.pb,proj_obj.$p3,2,0x6600ff,100);
    if (bBezProj && bBezSeg) bez1.drawLine(proj_obj.pb,proj_obj.pv,2,0x6600ff,100);

    // symmetry axis    
    if (bSym && (bBezSeg || bBez)) bez1.drawLine(sym_obj.$sym1,sym_obj.$sym2,2,0xff9900,100);

    // latusRectum
    if (bLatRect && (bBezSeg || bBez)) bez1.drawLine(latRect_obj.la,latRect_obj.lb,2,0x00ffff,100);

    // directrix
    if (bDir && (bBezSeg || bBez)) bez1.drawLine(dir_obj.$dir1,dir_obj.$dir2,2,0xffff00,100);

    // drawTangents
    if (bTan && (bBezSeg || bBez)) bez1.drawLine(p1,p2,2,0x00ff00,100);
    if (bTan && (bBezSeg || bBez)) bez1.drawLine(p2,p3,2,0x00ff00,100);
    if (bTan && (bBezSeg || bBez)) bez1.drawLine(tan_obj.$bi1,tan_obj.$bi2,2,0x00ff00,100);

    // control projection
    if (bProj && (bBezSeg || bBez)) bez1.drawLine(p2,tan_obj.$bi3,2,0xff00ff,100);

    // vertex and focus points
    if (bVert && (bBezSeg || bBez)) vertex._visible = true;
    if (bFoc && (bBezSeg || bBez)) focus._visible = true;
    
};

// ---------------------------------------------------------

// drawLine
MovieClip.prototype.drawLine = function(pt1:Point,pt2:Point,stroke:Number,col:Number,alpha:Number) {
    this.lineStyle(stroke,col,alpha);
    this.moveTo(pt1.x,pt1.y);
    this.lineTo(pt2.x,pt2.y);
};

// ---------------------------------------------------------

// drawBez
MovieClip.prototype.drawBez = function(pt1:Point,pt2:Point,pt3:Point,t1:Number,t2:Number,stroke:Number,col:Number,alpha:Number) {

    var s:Number = Number(this._name.substr(-1));

    seg_obj = bez[s].segment(pt1,pt2,pt3,t1,t2);
    this.lineStyle(stroke,col,alpha);
    this.moveTo(seg_obj.$b1.x,seg_obj.$b1.y);
    this.curveTo(seg_obj.$b2.x,seg_obj.$b2.y,seg_obj.$b3.x,seg_obj.$b3.y);
};

///////////////////////////////////////
// button functionality
///////////////////////////////////////

//bez_btn
bez_btn.onPress = function() {
    if (bBez) {
        bez_txt.text = "off";
        bBez = false;
    } else {
        bez_txt.text = "on";
        bBez = true;
    }
    reDraw();
};

// ---------------------------------------------------------

//bezSeg_btn
bezSeg_btn.onPress = function() {
    if (bBezSeg) {
        bezSeg_txt.text = "off";
        bBezSeg = false;
    } else {
        bezSeg_txt.text = "on";
        bBezSeg = true;
    }
    reDraw();
};

// ---------------------------------------------------------

//sym_btn
sym_btn.onPress = function() {
    if (bSym) {
        sym_txt.text = "off";
        bSym = false;
    } else {
        sym_txt.text = "on";
        bSym = true;
    }
    reDraw();
};

// ---------------------------------------------------------

//tan_btn
tan_btn.onPress = function() {
    if (bTan) {
        tan_txt.text = "off";
        bTan = false;
    } else {
        tan_txt.text = "on";
        bTan = true;
    }
    reDraw();
};

// ---------------------------------------------------------

//proj_btn
proj_btn.onPress = function() {
    if (bProj) {
        proj_txt.text = "off";
        bProj = false;
    } else {
        proj_txt.text = "on";
        bProj = true;
    }
    reDraw();
};

// ---------------------------------------------------------

//bezProj_btn
bezProj_btn.onPress = function() {
    if (bBezProj) {
        bezProj_txt.text = "off";
        bBezProj = false;
    } else {
        bezProj_txt.text = "on";
        bBezProj = true;
    }
    reDraw();
};

// ---------------------------------------------------------

//latRect_btn
latRect_btn.onPress = function() {
    if (bLatRect) {
        latRect_txt.text = "off";
        bLatRect = false;
    } else {
        latRect_txt.text = "on";
        bLatRect = true;
    }
    reDraw();
};

// ---------------------------------------------------------

//dir_btn
dir_btn.onPress = function() {
    if (bDir) {
        dir_txt.text = "off";
        bDir = false;
    } else {
        dir_txt.text = "on";
        bDir = true;
    }
    reDraw();
};

// ---------------------------------------------------------

//foc_btn
foc_btn.onPress = function() {
    if (bFoc) {
        foc_txt.text = "off";
        bFoc = false;
    } else {
        foc_txt.text = "on";
        bFoc = true;
    }
    reDraw();
};

// ---------------------------------------------------------

//vert_btn
vert_btn.onPress = function() {
    if (bVert) {
        vert_txt.text = "off";
        bVert = false;
    } else {
        vert_txt.text = "on";
        bVert = true;
    }
    reDraw();
};

// ---------------------------------------------------------

// dot*.dot_btn drag
dot1.dot_btn.onPress = function() {
   bInit = true;
   startDrag("dot1");
   init_txt.text = bInit;
};
dot2.dot_btn.onPress = function() {
   bInit = true;
   startDrag("dot2");
   init_txt.text = bInit;
};
dot3.dot_btn.onPress = function() {
   bInit = true;
   startDrag("dot3");
   init_txt.text = bInit;
};

// ---------------------------------------------------------

// onEnterFrame
this.onEnterFrame = function() {
    if (bInit) {
        reDraw();
    }
};

// ---------------------------------------------------------

// onMouseUp
this.onMouseUp = function() {
    bInit = false;
    init_txt.text = bInit;
    stopDrag();
};

///////////////////////////////////////
// UI functionality
///////////////////////////////////////
for (var j=1;j<=3;j++) {
    this["dot"+j].title_txt.text = this["dot"+j]._name;
}

bez_txt.text = bezSeg_txt.text = sym_txt.text = "on";
tan_txt.text = proj_txt.text = bezProj_txt.text = "on";
latRect_txt.text = dir_txt.text = foc_txt.text = vert_txt.text = "on";
bInit = init_txt.text = false;

reDraw();

// ----------------------------------------------------------------------------- EOF

