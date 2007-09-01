/*
*   -----------------------------------------------
*   Application:   perlinNoise
*   -----------------------------------------------
*   Version:       perlinNoise0.8.as
*                  perlinNoise0.8.fla
*   -----------------------------------------------
*   Latest update: October 21, 2003
*   -----------------------------------------------
*   Original ASP.NET application by James Long
*   ref: http://www.animeimaging.com/asp/PerlinNoise.aspx
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
*           1.  perlin(clip)
*
*   from Noise class:
*
*           8.  noise2D(x,y)
*           10. smoothNoise2D(x,y)
*           11. interpolate2(g,h,x)
*           12. interpolatedNoise2D(x,y)
*
*   -----------------------------------------------
*   Updates may be available at:
*                    http://members.shaw.ca/flashprogramming/wisASLibrary/wis/
*   -----------------------------------------------
*/

import com.wis.math.geom.util.Noise;

//////////////////////////////////////////////
// initialize
//////////////////////////////////////////////

var grid:Number = 256; // 2^n
var spacer:Number = 8;
var cenX:Number = 300;
var cenY:Number = 220;
var depth:Number = 0;

// ----------------------------------------------------

// grid for scrollPane
this.lineStyle();
this.moveTo(0,0);
this.lineTo(600,0);
this.lineTo(600,400);
this.lineTo(0,400);
this.lineTo(0,0);

// ----------------------------------------------------

// holder for noise graph
this.createEmptyMovieClip('holder_mc',++depth);
with (holder_mc) {
    _x = cenX-grid/2;
    _y = cenY-grid/2;
    lineStyle();
    moveTo(0,0);
	lineTo(grid,0);
	lineTo(grid,grid);
	lineTo(0,grid);
	lineTo(0,0);
}

//////////////////////////////////////////////
// functions
//////////////////////////////////////////////

// perlin
function perlin(clip:MovieClip):Void {

    var freq:Number;
    var pers:Number;
    var dim:Number;
    var octaves:Number;
    
    spacer = Number(spacer_txt.text);
    freq = Number(freq_txt.text);
    pers = Number(pers_txt.text);
    octaves = Number(octaves_txt.text);
    dim = grid/spacer;
    
    var i:Number;
    var j:Number;
    var k:Number;
        
    var startTime:Number = getTimer();
        
    for (i=0;i<dim;i++) {
        for (j=0;j<dim;j++) {
        
            var total:Number = 0;
			var amp:Number = 1;
            var freqFac:Number = freq;
    
            for (k=0;k<octaves;k++) {
                total += Noise.interpolatedNoise2D(j*freqFac,i*freqFac)*amp;
                amp *= pers;
                freqFac *= 2;
                total = total*0.5+0.5;
				
				if (total<0) total = 0.0;
                if (total>1) total = 1.0;

                var val:Number = total*255;
                var num:Number = (val<<16 | val<<8 | val);                    
            }
            
	        var x1:Number = i*spacer;
	        var y1:Number = j*spacer;
			var x2:Number = x1+spacer;
			var y2:Number = y1+spacer;
								    
			with (clip) {
				beginFill(num);
			    lineStyle();
				moveTo(x1,y1);
				lineTo(x2,y1);
				lineTo(x2,y2);
				lineTo(x1,y2);
				lineTo(x1,y1);
				endFill();
            }
            //trace ("num"+i+"_"+j+": 0x"+num.toString(16).toUpperCase());
        }
    }
 
    var endTime:Number = getTimer()-startTime;
    info_txt.text = "Drawing time: "+endTime;
     
}

//////////////////////////////////////////////
// UI functionality
//////////////////////////////////////////////

perlin(holder_mc);

// -------------------------------------------

reDraw_btn.onPress = function():Void {
    holder_mc.clear();
    info_txt.text = "Rendering Noise";
};

// -------------------------------------------

reDraw_btn.onRelease = function():Void {
    perlin(holder_mc);
};

// ------------------------------------------------------------ EOF

