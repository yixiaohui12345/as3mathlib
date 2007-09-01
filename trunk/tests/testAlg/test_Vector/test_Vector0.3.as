/*
*   -----------------------------------------------------
*   Application:   test_Vector
*   -----------------------------------------------------
*   Version:       test_Vaector0.2.as
*   -----------------------------------------------------
*   Latest update: November 5, 2003
*   -----------------------------------------------------
*   Dependency:    com.wis.math.alg.Vector.as
*   --------------------------------------------------
*
*   Copyright © 2003, Richard Wright [wisolutions2002@shaw.ca]
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

import com.wis.math.alg.Vector;
import com.wis.math.geom.util.Transformation;

this.lineStyle();
this.moveTo(0,0);
this.lineTo(600,0);
this.lineTo(600,730);
this.lineTo(0,730);
this.lineTo(0,0);

reDraw_btn.onRelease = function() {
	reDraw();
};

reDraw = function() {

    var x:Number = Number(x_txt.text);
    var y:Number = Number(y_txt.text);
    var z:Number = Number(z_txt.text);
    var vx:Number = Number(vx_txt.text);
    var vy:Number = Number(vy_txt.text);
    var vz:Number = Number(vz_txt.text);
    var incX:Number = Number(incX_txt.text);
    var incY:Number = Number(incY_txt.text);
    var incZ:Number = Number(incZ_txt.text);
    var s:Number = Number(s_txt.text);
    var x1:Number = Number(x1_txt.text);
    var y1:Number = Number(y1_txt.text);
    var z1:Number = Number(z1_txt.text);
    var x2:Number = Number(x2_txt.text);
    var y2:Number = Number(y2_txt.text);
    var z2:Number = Number(z2_txt.text);
    
    var A_temp = A_txt.text.split(",");
    var B_temp = B_txt.text.split(",");
    var V_temp = V_txt.text.split(",");
    var vec1_temp = vec1_txt.text.split(",");
    var vec2_temp = vec2_txt.text.split(",");
    var vec3_temp = vec3_txt.text.split(",");
    
    var A:Vector = new Vector(Number(A_temp[0]),Number(A_temp[1]),Number(A_temp[2]));
    var B:Vector = new Vector(Number(B_temp[0]),Number(B_temp[1]),Number(B_temp[2]));
    var V:Vector = new Vector(Number(V_temp[0]),Number(V_temp[1]),Number(V_temp[2]));
    var vec1:Vector = new Vector(Number(vec1_temp[0]),Number(vec1_temp[1]),Number(vec1_temp[2]));
    var vec2:Vector = new Vector(Number(vec2_temp[0]),Number(vec2_temp[1]),Number(vec2_temp[2]));
    var vec3:Vector = new Vector(Number(vec3_temp[0]),Number(vec3_temp[1]),Number(vec3_temp[2])); 
    
    var v1:Vector = new Vector(x,y,z);
    
    var trans:Transformation = new Transformation(vec1,vec2,vec3,A,false,false);
    var dontTranslate:Boolean = true;

	input_str = " 1.  toString(): <FONT color='#0000FF'>"+v1.toString()+"</FONT>\n";
	v1.resetComponents(vx,vy,vz);
	input_str += " 2.  resetComponents(vx,vy,vz): <FONT color='#0000FF'>v1.x:"+v1.x+",y:"+v1.y+",z:"+v1.z+"</FONT>\n";
	v1.copyComponents(V);
	input_str += " 3.  copyComponents(V): <FONT color='#0000FF'>v1.x:"+v1.x+",y:"+v1.y+",z:"+v1.z+"</FONT>\n";
	v1.incrementX(incX);
	input_str += " 4.  incrementX(incX): <FONT color='#0000FF'>v1.x:"+v1.x+"</FONT>\n";
	v1.incrementY(incY);
	input_str += " 5.  incrementY(incY): <FONT color='#0000FF'>v1.y:"+v1.y+"</FONT>\n";
	v1.incrementZ(incZ);
	input_str += " 6.  incrementZ(incZ): <FONT color='#0000FF'>v1.z:"+v1.z+"</FONT>\n";
	v1.incrementComponents(incX,incY,incZ);
	input_str += " 7.  incrementComponents(incX,incY,incZ): <FONT color='#0000FF'>v1.x:"+v1.x+",y:"+v1.y+",z:"+v1.z+"</FONT>\n";
	input_str += " 8.  adds(V): <FONT color='#0000FF'>"+v1.adds(V)+"</FONT>\n";
	input_str += " 9.  returnAddition(V): <FONT color='#0000FF'>"+v1.returnAddition(V)+"</FONT>\n";
	input_str += " 10. subtract(V): <FONT color='#0000FF'>"+v1.subtract(V)+"</FONT>\n";
	input_str += " 11. returnSubtraction(V): <FONT color='#0000FF'>"+v1.returnSubtraction(V)+"</FONT>\n";
	input_str += " 12  scalar(s): <FONT color='#0000FF'>"+v1.scalar(s)+"</FONT>\n";
	input_str += " 13. returnScalar(s): <FONT color='#0000FF'>"+v1.returnScalar(s)+"</FONT>\n";
	input_str += " 14. scalarComponent(V): <FONT color='#0000FF'>"+v1.scalarComponent(V)+"</FONT>\n";
	input_str += " 15. divide(s): <FONT color='#0000FF'>"+v1.divide(s)+"</FONT>\n";
	input_str += " 16. returnDivide(s): <FONT color='#0000FF'>"+v1.returnDivide(s)+"</FONT>\n";
	input_str += " 17. dotProduct(V): <FONT color='#0000FF'>"+v1.dotProduct(V)+"</FONT>\n";
	input_str += " 18. crossProduct(V): <FONT color='#0000FF'>"+v1.crossProduct(V)+"</FONT>\n";
	input_str += " 19. norm(): <FONT color='#0000FF'>"+v1.norm()+"</FONT>\n";
	input_str += " 20. unitVector(): <FONT color='#0000FF'>"+v1.unitVector()+"</FONT>\n";
	input_str += " 21. normalize(): <FONT color='#0000FF'>"+v1.normalize()+"</FONT>\n";
	input_str += " 22. swap(V): <FONT color='#0000FF'>"+v1.swap(V)+"</FONT>\n";
	input_str += " 23. angleVector(V): <FONT color='#0000FF'>"+v1.angleVector(V)+"</FONT>\n";
	input_str += " 24. areaPara(V): <FONT color='#0000FF'>"+v1.areaPara(V)+"</FONT>\n";
	input_str += " 25. areaTriangle(A,B): <FONT color='#0000FF'>"+v1.areaTriangle(A,B)+"</FONT>\n";
	input_str += " 26. volumePara3d(A,B): <FONT color='#0000FF'>"+v1.volumePara3d(A,B)+"</FONT>\n";
	input_str += " 27. perp(): <FONT color='#0000FF'>"+v1.perp()+"</FONT>\n";
	input_str += " 28. fromPointVals(x1,x2,y1,y2,z1,z2): <FONT color='#0000FF'>"+v1.fromPointVals(x1,x2,y1,y2,z1,z2)+"</FONT>\n";
	input_str += " 29. equal(V): <FONT color='#0000FF'>"+v1.equal(V)+"</FONT>\n";
	input_str += " 30. sameDirection(V): <FONT color='#0000FF'>"+v1.sameDirection(V)+"</FONT>\n";
	input_str += " 31. greater(V): <FONT color='#0000FF'>"+v1.greater(V)+"</FONT>\n";
	input_str += " 32. greaterEqual(V): <FONT color='#0000FF'>"+v1.greaterEqual(V)+"</FONT>\n";
	input_str += " 33. less(V): <FONT color='#0000FF'>"+v1.less(V)+"</FONT>\n";
	input_str += " 34. lessEqual(V): <FONT color='#0000FF'>"+v1.lessEqual(V)+"</FONT>\n";
	input_str += " 35. round3(x): <FONT color='#0000FF'>"+v1.round3(x)+"</FONT>\n";
	input_str += " 36. transform(trans,dontTranslate): <FONT color='#0000FF'>"+v1.transform(trans,dontTranslate)+"</FONT>\n";
	input_str += " 37. transformed(trans,dontTranslate): <FONT color='#0000FF'>"+v1.transformed(trans,dontTranslate)+"</FONT>\n";
	input_str += " 38. Vector.normalizer(vec1): <FONT color='#0000FF'>"+Vector.normalizer(vec1)+"</FONT>\n";
	input_str += " 39. Vector.neg(vec1): <FONT color='#0000FF'>"+Vector.neg(vec1)+"</FONT>\n";
	input_str += " 40. inv(): <FONT color='#0000FF'>"+v1.inv()+"</FONT>\n";
	input_str += " 41. len(): <FONT color='#0000FF'>"+v1.len()+"</FONT>\n";
	input_str += " 42. lengthSquared(): <FONT color='#0000FF'>"+v1.lengthSquared()+"</FONT>\n";
	input_str += " 43. Vector.adder(vec2,vec3): <FONT color='#0000FF'>"+Vector.adder(vec2,vec3)+"</FONT>\n";
	input_str += " 44. Vector.scaler(vec2,s): <FONT color='#0000FF'>"+Vector.scaler(vec2,s)+"</FONT>\n";
	input_str += " 45. Vector.compare(vec2,vec3): <FONT color='#0000FF'>"+Vector.compare(vec2,vec3)+"</FONT>\n";
	input_str += " 46. Vector.mult(vec2,vec3): <FONT color='#0000FF'>"+Vector.mult(vec2,vec3)+"</FONT>\n";
	input_str += " 47. Vector.dot(vec2,vec3): <FONT color='#0000FF'>"+Vector.dot(vec2,vec3)+"</FONT>\n";
	input_str += " 48. Vector.cross(vec2,vec3): <FONT color='#0000FF'>"+Vector.cross(vec2,vec3)+"</FONT>\n";
	input_str += " 49. copy(): <FONT color='#0000FF'>"+v1.copy()+"</FONT>\n";
	input_str += " 50. identity vectors: "+
	"<FONT color='#0000FF'>Vector.XX: ["+Vector.XX.x+","+Vector.XX.y+","+Vector.XX.z+"] </FONT>\n"+
	"<FONT color='#0000FF'>Vector.YY: ["+Vector.YY.x+","+Vector.YY.y+","+Vector.YY.z+"] </FONT>\n"+
	"<FONT color='#0000FF'>Vector.ZZ: ["+Vector.ZZ.x+","+Vector.ZZ.y+","+Vector.ZZ.z+"] </FONT>\n"+
	"<FONT color='#0000FF'>Vector.OO: ["+Vector.OO.x+","+Vector.OO.y+","+Vector.OO.z+"]</FONT>\n";

    input_txt.htmlText = input_str;
};

reDraw();

this.createTextField("input_txt",++depth,0,70,0,0);
input_txt.autoSize = "left";
input_txt.selectable = false;
input_txt.multiline = true;
input_txt.html = true;
input_txt.htmlText = input_str;

// trace properties
//trace ("\n#### Vector Properties ####\n");
//for (arguments in Vector) {
//    trace (arguments+":"+Vector[arguments]);
//}

