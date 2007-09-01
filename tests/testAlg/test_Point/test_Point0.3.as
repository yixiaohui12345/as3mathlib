/*
*   -----------------------------------------------------
*   Application:   test_Point
*   -----------------------------------------------------
*   Version:       test_Point0.3.as
*                  test_Point.fla
*   -----------------------------------------------------
*   Latest update: November 5, 2003
*   -----------------------------------------------------
*   Dependency:    com.wis.math.alg.Vector.as
*   --------------------------------------------------
*
*   Copyright © 2003, Richard Wright     [wisolutions2002@shaw.ca]
*   Copyright © 2000-2002, Kevin Lindsey [http://www.kevlindev.com/]
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
*   (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
*   LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
*   ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
*   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
*   SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*   ------------------------------------------------------
*
*   Functions:
*
*       1. reDraw()
*
*    -----------------------------------------------------
*   Updates may be available at:
*                    http://members.shaw.ca/flashprogramming/wisASLibrary/wis/
*   ------------------------------------------------------
*/

import com.wis.math.alg.Point;
import com.wis.math.alg.Vector;

this.lineStyle();
this.moveTo(0,0);
this.lineTo(600,0);
this.lineTo(600,750);
this.lineTo(0,750);
this.lineTo(0,0);

reDraw_btn.onRelease = function() {
	reDraw();
};

var x,y,z,s,t,a,px,py,pz,pcx,pcy,tx,ty,tz,sx,sy,sz,pSize,pD:Number;    
var mat:Array = [[],[],[]];    
var v,axis:Vector;
var p1,p2,p3,p4,p5,that,pt1:Point;

reDraw = function() {

    x = Number(x_txt.text);
    y = Number(y_txt.text);
    z = Number(z_txt.text);
    s = Number(s_txt.text);
    t = Number(t_txt.text);
    a = Number(a_txt.text);
    px = Number(px_txt.text);
    py = Number(py_txt.text);
    pz = Number(pz_txt.text);
    pcx = Number(pcx_txt.text);
    pcy = Number(pcy_txt.text);
    tx = Number(tx_txt.text);
    ty = Number(ty_txt.text);
    tz = Number(tz_txt.text);
    sx = Number(sx_txt.text);
    sy = Number(sy_txt.text);
    sz = Number(sz_txt.text);
    pSize = Number(pSize_txt.text);
    pD = Number(pD_txt.text);
    
    var mat_temp = mat_txt.text.split(",");
    var v_temp = v_txt.text.split(",");
    var axis_temp = axis_txt.text.split(",");
    var p1_temp = p1_txt.text.split(",");
    var p2_temp = p2_txt.text.split(",");
    var p3_temp = p3_txt.text.split(",");
    var p4_temp = p4_txt.text.split(",");
    var p5_temp = p5_txt.text.split(",");
    
    for (var j=0;j<3;j++) {
        for (var k=0;k<3;k++) {
            mat[j][k] = Number(mat_temp[(j*3)+k]);
        }
    }
    
    v = new Vector(Number(v_temp[0]),Number(v_temp[1]),Number(v_temp[2]));
    axis = new Vector(Number(axis_temp[0]),Number(axis_temp[1]),Number(axis_temp[2]));
    p1 = new Point(Number(p1_temp[0]),Number(p1_temp[1]),Number(p1_temp[2]));
    p2 = new Point(Number(p2_temp[0]),Number(p2_temp[1]),Number(p2_temp[2]));
    p3 = new Point(Number(p3_temp[0]),Number(p3_temp[1]),Number(p3_temp[2]));
    p4 = new Point(Number(p4_temp[0]),Number(p4_temp[1]),Number(p4_temp[2]));
    p5 = new Point(Number(p5_temp[0]),Number(p5_temp[1]),Number(p5_temp[2]));
    that = new Point(x,y,z);
    pt1 = new Point(px,py,pz,pcx,pcy,MC,pSize,pD);

	input_str = " 1.  adds(that): <FONT color='#0000FF'>"+pt1.adds(that)+"</FONT>\n";
	input_str += " 2.  addEquals(that): <FONT color='#0000FF'>"+pt1.addEquals(that)+"</FONT>\n";
	input_str += " 3.  scalarAdd(s): <FONT color='#0000FF'>"+pt1.scalarAdd(s)+"</FONT>\n";
	input_str += " 4.  scalarAddEquals(s): <FONT color='#0000FF'>"+pt1.scalarAddEquals(s)+"</FONT>\n";
	input_str += " 5.  subtract(that): <FONT color='#0000FF'>"+pt1.subtract(that)+"</FONT>\n";
	input_str += " 6.  subtractEquals(that): <FONT color='#0000FF'>"+pt1.subtractEquals(that)+"</FONT>\n";
	input_str += " 7.  scalarSubtract(s): <FONT color='#0000FF'>"+pt1.scalarSubtract(s)+"</FONT>\n";
	input_str += " 8.  scalarSubtractEquals(s): <FONT color='#0000FF'>"+pt1.scalarSubtractEquals(s)+"</FONT>\n";
	input_str += " 9.  multiply(s): <FONT color='#0000FF'>"+pt1.multiply(s)+"</FONT>\n";
	input_str += " 10. multiplyEquals(s): <FONT color='#0000FF'>"+pt1.multiplyEquals(s)+"</FONT>\n";
	input_str += " 11. divide(s): <FONT color='#0000FF'>"+pt1.divide(s)+"</FONT>\n";
	input_str += " 12. divideEquals(s): <FONT color='#0000FF'>"+pt1.divideEquals(s)+"</FONT>\n";
    // - comparison methods
	input_str += " 13. equals(that): <FONT color='#0000FF'>"+pt1.equals(that)+"</FONT>\n";
	input_str += " 14. lessThan(that): <FONT color='#0000FF'>"+pt1.lessThan(that)+"</FONT>\n";
	input_str += " 15. lessThanEq(that): <FONT color='#0000FF'>"+pt1.lessThanEq(that)+"</FONT>\n";
	input_str += " 16. greaterThan(that): <FONT color='#0000FF'>"+pt1.greaterThan(that)+"</FONT>\n";
	input_str += " 17. greaterThanEq(that): <FONT color='#0000FF'>"+pt1.greaterThanEq(that)+"</FONT>\n";
    // - utility methods
	input_str += " 18. lerp(that,t): <FONT color='#0000FF'>"+pt1.lerp(that,t)+"</FONT>\n";
	input_str += " 19. distanceFrom(that): <FONT color='#0000FF'>"+pt1.distanceFrom(that)+"</FONT>\n";
	input_str += " 20. min(that): <FONT color='#0000FF'>"+pt1.min(that)+"</FONT>\n";
	input_str += " 21. max(that): <FONT color='#0000FF'>"+pt1.max(that)+"</FONT>\n";
	input_str += " 22. toString(): <FONT color='#0000FF'>"+pt1.toString()+"</FONT>\n";
    // - get/set methods
    pt1.setXYZ(x,y,z);
	input_str += " 23. setXYZ(x,y,z): <FONT color='#0000FF'>pt1.x:"+pt1.x+",y:"+pt1.y+",z:"+pt1.z+"</FONT>\n";
	pt1.setFromPoint(that);
	input_str += " 24. setFromPoint(that): <FONT color='#0000FF'>pt1.x:"+pt1.x+",y:"+pt1.y+",z:"+pt1.z+"</FONT>\n";
	pt1.swap(that);
	input_str += " 25. swap(that): <FONT color='#0000FF'>pt1.x:"+pt1.x+",y:"+pt1.y+",z:"+pt1.z+" .. that.x:"+that.x+",y:"+that.y+",z:"+that.z+"</FONT>\n";
    // - 3d-centric methods
    pt1.recenter(pcx,pcy);
	input_str += " 26. recenter(pcx,pcy): <FONT color='#0000FF'>pt1.xCtr:"+pt1.xCtr+",yCtr:"+pt1.yCtr+"</FONT>\n";
	pt1.resize(pSize);
	input_str += " 27. resize(pSize): <FONT color='#0000FF'>pt1.size:"+pt1.size+"</FONT>\n";
	pt1.translate(tx,ty,tz)
	input_str += " 28. translate(tx,ty,tz): <FONT color='#0000FF'>pt1.x:"+pt1.x+",y:"+pt1.y+",z:"+pt1.z+"</FONT>\n";
	pt1.scale(sx,sy,sz);
	input_str += " 29. scale(sx,sy,sz): <FONT color='#0000FF'>pt1.x:"+pt1.x+",y:"+pt1.y+",z:"+pt1.z+"</FONT>\n";
	pt1.rotateXMatrix(a);
	input_str += " 30. rotateXMatrix(a): <FONT color='#0000FF'>pt1.M:"+pt1.M+"</FONT>\n";
	pt1.rotateYMatrix(a);
	input_str += " 31. rotateYMatrix(a): <FONT color='#0000FF'>pt1.M:"+pt1.M+"</FONT>\n";
	pt1.rotateZMatrix(a);
	input_str += " 32. rotateZMatrix(a): <FONT color='#0000FF'>pt1.M:"+pt1.M+"</FONT>\n";
	pt1.axisMatrix(axis,a);
	input_str += " 33. axisMatrix(axis,a): <FONT color='#0000FF'>\n                                    pt1.M[0]:"+pt1.M[0]+", \n                                    pt1.M[1]:"+pt1.M[1]+", \n                                    pt1.M[2]:"+pt1.M[2]+"</FONT>\n";
	pt1.rotate(mat);
	input_str += " 34. rotate(mat): <FONT color='#0000FF'>pt1.x:"+pt1.x+",y:"+pt1.y+",z:"+pt1.z+"</FONT>\n";
	pt1.perspective();
	input_str += " 35. perspective(): <FONT color='#0000FF'>pt1.xp:"+pt1.xp+", yp:"+pt1.yp+", perSize:"+pt1.perSize+"</FONT>\n";
	pt1.render();
	input_str += " 36. render(): <FONT color='#0000FF'>pt1.clip name:"+pt1.clip._name+", x:"+pt1.clip._x+", y:"+pt1.clip._y+", xscale:"+pt1.clip._xscale+", yscale:"+pt1.clip._yscale+"</FONT>\n";
	pt1.setDepth();
	input_str += " 37. setDepth(): <FONT color='#0000FF'>pt1.clip.depth:"+pt1.clip.getDepth()+"</FONT>\n";
	input_str += " 38. lineD1(p1,p2,v): <FONT color='#0000FF'>"+pt1.lineD1(p1,p2,v)+"</FONT>\n";
	input_str += " 39. angle(p3,p4,p5): <FONT color='#0000FF'>"+pt1.angle(p3,p4,p5)+"</FONT>\n";

    input_txt.htmlText = input_str;
};

reDraw();

this.createTextField("input_txt",++depth,0,100,0,0);
input_txt.autoSize = "left";
input_txt.selectable = false;
input_txt.multiline = true;
input_txt.html = true;
input_txt.htmlText = input_str;

// trace properties
//trace ("\n#### Point Properties ####\n");
//for (arguments in Point) {
//    trace (arguments+":"+Point[arguments]);
//}

