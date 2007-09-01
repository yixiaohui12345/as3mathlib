import com.wis.types.Col;

// grid
this.lineStyle();
this.moveTo(0,0);
this.lineTo(600,0);
this.lineTo(600,820);
this.lineTo(0,820);
this.lineTo(0,0);

// initialize variables
var r:Number = 100;
var g:Number = 220;
var b:Number = 170;
var red:Number = 200;
var green:Number = 120;
var blue:Number = 240;
var hexStr:String = "#bbaa66";
var bright:Number = -20;
var offset:Number = 150;
var rgb:Number = 0xFFAABB;
var percent:Number = 65;
var amount:Number = 200;
var sNum:String = "2";
var s:Number = 200;

// display variables
r_txt.text = r;
g_txt.text = g;
b_txt.text = b;
red_txt.text = red;
green_txt.text = green;
blue_txt.text = blue;
hexStr_txt.text = hexStr;
bright_txt.text = bright;
offset_txt.text = offset;
rgb_txt.text = rgb;
percent_txt.text = percent;
amount_txt.text = amount;
sNum_txt.text = sNum;
s_txt.text = s;

/*
// initialize targets
var target1:Color = new Color(clip1);
var c1:Col = new Col(target1);
var target2:Color = new Color(clip2);
var c2:Col = new Col(target2);
var target3:Color = new Color(clip3);
var c3:Col = new Col(target3);
var target4:Color = new Color(clip4);
var c4:Col = new Col(target4);
var target5:Color = new Color(clip5);
var c5:Col = new Col(target5);
var target6:Color = new Color(clip6);
var c6:Col = new Col(target6);
var target7:Color = new Color(clip7);
var c7:Col = new Col(target7);
var target8:Color = new Color(clip8);
var c8:Col = new Col(target8);
var target9:Color = new Color(clip9);
var c9:Col = new Col(target9);
var target10:Color = new Color(clip10);
var c10:Col = new Col(target10);
var target11:Color = new Color(clip11);
var c11:Col = new Col(target11);
var target12:Color = new Color(clip12);
var c12:Col = new Col(target12);
var target13:Color = new Color(clip13);
var c13:Col = new Col(target13);
var target14:Color = new Color(clip14);
var c14:Col = new Col(target14);
var target15:Color = new Color(clip15);
var c15:Col = new Col(target15);
var target16:Color = new Color(clip16);
var c16:Col = new Col(target16);
var target17:Color = new Color(clip17);
var c17:Col = new Col(target17);
var target18:Color = new Color(clip18);
var c18:Col = new Col(target18);
var target19:Color = new Color(clip19);
var c19:Col = new Col(target19);
var target20:Color = new Color(clip20);
var c20:Col = new Col(target20);
var target21:Color = new Color(clip21);
var c21:Col = new Col(target21);
var target22:Color = new Color(clip22);
var c22:Col = new Col(target22);
var target23:Color = new Color(clip23);
var c23:Col = new Col(target23);
var target24:Color = new Color(clip24);
var c24:Col = new Col(target24);
var target25:Color = new Color(clip25);
var c25:Col = new Col(target25);
var target26:Color = new Color(clip26);
var c26:Col = new Col(target26);
var target27:Color = new Color(clip27);
var c27:Col = new Col(target27);
var target28:Color = new Color(clip28);
var c28:Col = new Col(target28);
var target29:Color = new Color(clip29);
var c29:Col = new Col(target29);
var target30:Color = new Color(clip30);
var c30:Col = new Col(target30);
*/

for (var j=1;j<=30;j++) {
    this["target"+j] = new Color(this["clip"+j]);
    this["c"+j] = new Col(this["target"+j]);
    trace ("this['target'+"+j+"]: "+(typeof(this["target"+j]))+" .. "+(this["target"+j] instanceof Color));
    trace ("this['c'+"+j+"]: "+(typeof(this["c"+j]))+" .. "+(this["c"+j] instanceof Col));
}

// reDraw screen
reDraw = function() {
	
	// change variables based on UI fields
	r = Number(r_txt.text);
    g = Number(g_txt.text);
    b = Number(b_txt.text);
    red = Number(red_txt.text);
    green = Number(green_txt.text);
    blue = Number(blue_txt.text);
    hexStr = hexStr_txt.text;
    bright = Number(bright_txt.text);
    offset = Number(offset_txt.text);
	rgb = Number(rgb_txt.text);
    percent = Number(percent_txt.text);
    amount = Number(amount_txt.text);
    sNum = sNum_txt.text;
    s = Number(s_txt.text);
	
	// function tests
    input_str = "\n 1a. (1) set _rgbStr = hexStr: no return\n";
    c1._rgbStr = hexStr;
    input_str += " 1b. (2) get _rgbStr: <FONT color='#0000FF'>"+c1._rgbStr+"</FONT>\n";
    input_str += " 2a. (3) set _rgb2 = {r:red,g:green,b:blue}: no return\n";
    c2._rgb2 = {r:red,g:green,b:blue};
    c1._rgb2 = {r:r,g:g,b:b};
    input_str += " 2b. (4) get _rgb2: <FONT color='#0000FF'>r:"+c1._rgb2.r+", g:"+c1._rgb2.g+", b:"+c1._rgb2.b+"</FONT>\n";
    c3._rgb2 = {r:r,g:g,b:b};
    c3.reset();
    input_str += " 3. (5) reset(): <FONT color='#0000FF'>r:"+c3._rgb2.r+", g:"+c3._rgb2.g+", b:"+c3._rgb2.b+"</FONT>\n\n";

    input_str += " 4a. (6) set _brightness = bright: no return\n";
    c4._rgb2 = {r:red,g:green,b:blue};
    c4._brightness = bright;
    input_str += " 4b. (7) get _brightness: <FONT color='#0000FF'>"+Math.round(c4._brightness)+"</FONT>\n";
    input_str += " 5a. (8) set _brightOffset = offset: no return\n";
    c5._rgb2 = {r:r,g:g,b:b};
    c5._brightOffset = offset;
    input_str += " 5b. (9) get _brightOffset: <FONT color='#0000FF'>"+c5._brightOffset+"</FONT>\n\n";  		
 		
    input_str += " 6a. (10) set _tint = {r:r,g:g,b:b,percent:percent}: no return\n";
    c6._tint = {r:r,g:g,b:b,percent:percent};
    input_str += " 6b. (11) get _tint: <FONT color='#0000FF'>r:"+Math.round(c6._tint.r*10)/10+", g:"+Math.round(c6._tint.g*10)/10+", b:"+Math.round(c6._tint.b*10)/10+"</FONT>\n";
    input_str += " 7a. (12) set _tint2 = {rgb:rgb,percent:percent}: no return\n";
    c7._tint2 = {rgb:rgb,percent:percent};
    input_str += " 7b. (13) get _tint2: <FONT color='#0000FF'>rgb:"+c7._tint2.rgb+", percent:"+Math.round(c7._tint2.percent*10)/10+"</FONT>\n";
    input_str += " 8a. (14) set _tintOffset = {r:r,g:g,b:b}: no return\n";
    c8._rgb2 = {r:red,g:green,b:blue};
    c8._tintOffset = {r:r,g:g,b:b};
    input_str += " 8b. (15) get _tintOffset: <FONT color='#0000FF'>r:"+c8._tintOffset.r+", g:"+c8._tintOffset.g+", b:"+c8._tintOffset.b+"</FONT>\n\n";

    input_str += " 9. (16) invert(): no return\n";
    c9._rgb2 = {r:r,g:g,b:b};
    c9.invert();
    input_str += " 10a. (17) set _negative = percent: no return\n";
    c10._rgb2 = {r:red,g:green,b:blue};
    c10._negative = percent;
    input_str += " 10b. (18) get _negative: <FONT color='#0000FF'>"+Math.round(c10._negative*10)/10+"</FONT>\n\n";
		
    input_str += " 11a. (19) set _red = amount: no return\n";
    c11._rgb2 = {r:r,g:g,b:b};
    c11._red = amount;
    input_str += " 11b. (20) get _red: <FONT color='#0000FF'>"+c11._red+"</FONT>\n";
    input_str += " 12a. (21) set _green = amount: no return\n";
    c12._rgb2 = {r:red,g:green,b:blue};
    c12._green = amount;
    input_str += " 12b. (22) get _green: <FONT color='#0000FF'>"+c12._green+"</FONT>\n";
    input_str += " 13a. (23) set _blue = amount: no return\n";
    c13._rgb2 = {r:r,g:g,b:b};
    c13._blue = amount;
    input_str += " 13b. (24) get _blue: <FONT color='#0000FF'>"+c13._blue+"</FONT>\n\n";
  		
    input_str += " 14a. (25) set _redPercent = percent: no return\n";
    c14._rgb2 = {r:red,g:green,b:blue};
    c14._redPercent = percent;
    input_str += " 14b. (26) get _redPercent: <FONT color='#0000FF'>"+Math.round(c14._redPercent*10)/10+"</FONT>\n";
    input_str += " 15a. (27) set _greenPercent = percent: no return\n";
    c15._rgb2 = {r:r,g:g,b:b};
    c15._greenPercent = percent;
    input_str += " 15b. (28) get _greenPercent: <FONT color='#0000FF'>"+Math.round(c15._greenPercent*10)/10+"</FONT>\n";
    input_str += " 16a. (29) set _bluePercent = percent: no return\n";
    c16._rgb2 = {r:red,g:green,b:blue};
    c16._bluePercent = percent;
    input_str += " 16b. (30) get _bluePercent: <FONT color='#0000FF'>"+Math.round(c16._bluePercent*10)/10+"</FONT>\n\n";
  		
    input_str += " 17a. (31) set _redOffset = offset: no return\n";
    c17._rgb2 = {r:r,g:g,b:b};
    c17._redOffset = offset;
    input_str += " 17b. (32) get _redOffset: <FONT color='#0000FF'>"+c17._redOffset+"</FONT>\n";
    input_str += " 18a. (33) set _greenOffset = offset: no return\n";
    c18._rgb2 = {r:red,g:green,b:blue};
    c18._greenOffset = offset;
    input_str += " 18b. (34) get _greenOffset: <FONT color='#0000FF'>"+c18._greenOffset+"</FONT>\n";
    input_str += " 19a. (35) set _blueOffset = offset: no return\n";
    c19._rgb2 = {r:r,g:g,b:b};
    c19._blueOffset = offset;
    input_str += " 19b. (36) get _blueOffset: <FONT color='#0000FF'>"+c19._blueOffset+"</FONT>\n\n";

    input_str += " 20. (37) resetVal(red,green,blue): no return\n";
    c20.init(red,green,blue);
    c20.resetVal(r,g,b);
    c21.init(r,g,b);
    c21.copy();
    input_str += " 21. (38) copy(): <FONT color='#0000FF'>r:"+c21._rgb2.r+", g:"+c21._rgb2.g+", b:"+c21._rgb2.b+"</FONT>\n";
    c22.init(red,green,blue);
    c22.clip();
    input_str += " 22. (39) clip(): <FONT color='#0000FF'>r:"+c22._rgb2.r+", g:"+c22._rgb2.g+", b:"+c22._rgb2.b+"</FONT>\n";
    c23.init(r,g,b);
    input_str += " 23. (40) twoChars(sNum): no change to swatch <FONT color='#0000FF'>"+c23.twoChars(sNum)+"</FONT>\n";
    c24.init(red,green,blue);
    input_str += " 24. (41) get _htmlStr(): <FONT color='#0000FF'>"+c24._htmlStr+"</FONT>\n";
    c25.init(r,g,b);
    input_str += " 25. (42) toString(): <FONT color='#0000FF'>"+c25.toString()+"</FONT>\n";
    c26.init(red,green,blue);
    c26.difference(c25);
    input_str += " 26. (43) difference(c25): <FONT color='#0000FF'>r:"+c26._rgb2.r+", g:"+c26._rgb2.g+", b:"+c26._rgb2.b+"</FONT>\n";
    c27.init(r,g,b);
    c27.neg();
    input_str += " 27. (44) neg(): <FONT color='#0000FF'>r:"+c27._rgb2.r+", g:"+c27._rgb2.g+", b:"+c27._rgb2.b+"</FONT>\n";
    c28.init(red,green,blue);
    c28.mult(c27);
    input_str += " 28. (45) mult(c27): <FONT color='#0000FF'>r:"+c28._rgb2.r+", g:"+c28._rgb2.g+", b:"+c28._rgb2.b+"</FONT>\n";
    c29.init(r,g,b);
    c29.scalar(s);
    input_str += " 29. (46) scalar(s): <FONT color='#0000FF'>r:"+c29._rgb2.r+", g:"+c29._rgb2.g+", b:"+c29._rgb2.b+"</FONT>\n";
    c30.init(red,green,blue);
    c30.adds(c29);
    input_str += " 30. (47) adds(c29): <FONT color='#0000FF'>r:"+c30._rgb2.r+", g:"+c30._rgb2.g+", b:"+c30._rgb2.b+"</FONT>\n";

	input_txt.htmlText = input_str;

};

reDraw();

///////////////////////////

// reDraw_btn
reDraw_btn.onPress = function() {
	reDraw();
};

///////////////////////////

// textfield display
this.createTextField("input_txt",++depth,0,50,0,0);
input_txt.autoSize = "left";
input_txt.selectable = false;
input_txt.multiline = true;
input_txt.html = true;
input_txt.htmlText = input_str;

// trace properties
//trace ("\n#### Col Properties ####\n");
//for (arguments in Col) {
//    trace (arguments+":"+Col[arguments]);
//}