import com.wis.types.ColMC;

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
var ra:Number = 50;
var ga:Number = 50;
var ba:Number = 50;
var rb:Number = 150;
var gb:Number = 150;
var bb:Number = 150;
var trans:Object = {ra:ra,ga:ga,ba:ba,rb:rb,gb:gb,bb:bb};

// ------------------------------------------

// MCE dynamic class instantiation: 
// MCE.attach(scope,depth,name[,linkage][,initObj][,class][,classArguments]); 
MCE.attach(this,++depth,"c",null,null,ColMC);

// ------------------------------------------

c._x = 350;
c._y = 400;
c.beginFill(0xFF0000);
c.lineStyle(0,0x0000FF);
c.lineTo(20,0);
c.lineTo(20,20);
c.lineTo(0,20);
c.lineTo(0,0);
c.endFill();
/*
newclip._x = 350;
newclip._y = 400;
newclip.beginFill(0xFF0000,10);
newclip.lineStyle(0,0x0000FF);
newclip.lineTo(20,0);
newclip.lineTo(20,20);
newclip.lineTo(0,20);
newclip.lineTo(0,0);
newclip.endFill();
*/

c._rgb2 = {r:0,g:0,b:255};
trace ("c.typeof:"+(typeof(c))+"..instanceOf(ColMC):"+(c instanceof ColMC)+"..c._blue:"+c._blue);

// ------------------------------------------

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
ra_txt.text = trans.ra;
ga_txt.text = trans.ga;
ba_txt.text = trans.ba;
rb_txt.text = trans.rb;
gb_txt.text = trans.gb;
bb_txt.text = trans.bb;

// ------------------------------------------

// reDraw screen
reDraw = function() 
{	
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
    trans.ra = Number(ra_txt.text);
	trans.ga = Number(ga_txt.text);
    trans.ba = Number(ba_txt.text);
    trans.rb = Number(rb_txt.text);
	trans.gb = Number(gb_txt.text);
    trans.bb = Number(bb_txt.text);
	
	// function tests
    input_str = "\n 1a. (1) set _rgb = rgb: no return\n";
    clip1._rgb = rgb;
    input_str += " 1b. (2) get _rgb: <FONT color='#0000FF'>"+clip1._rgb+"</FONT>\n";
    input_str += " 2a. (3) set _rgbStr = hexStr: no return\n";
    clip2._rgbStr = hexStr;
    input_str += " 2b. (4) get _rgbStr: <FONT color='#0000FF'>"+clip2._rgbStr+"</FONT>\n";
    input_str += " 3a. (5) set _rgb2 = {r:r,g:g,b:b}: no return\n";
    clip3._rgb2 = {r:0,g:0,b:255};
    input_str += " 3b. (6) get _rgb2. <FONT color='#0000FF'>r:"+clip3._rgb2.r+",g:"+clip3._rgb2.g+",b:"+clip3._rgb2.b+"</FONT>\n";
    clip4._rgb2 = {r:red,g:green,b:blue};
    clip4.resetColor();
    input_str += " 4. (7) resetColor(): <FONT color='#0000FF'>r:"+clip4._red+", g:"+clip4._green+", b:"+clip4._blue+"</FONT>\n";
    input_str += " 5a. (8) set _colorTransform = trans: no return\n";
    clip5._colorTransform = trans;
    input_str += " 5b. (9) get _colorTransform. \n        <FONT color='#0000FF'>ra:"+clip5._colorTransform.ra+",ga:"+clip5._colorTransform.ga+",ba:"+clip5._colorTransform.ba+",rb:"+clip5._colorTransform.rb+",gb:"+clip5._colorTransform.gb+",bb:"+clip5._colorTransform.bb+"</FONT>\n\n";

    input_str += " 6a. (10) set _brightness = bright: no return\n";
    clip6._brightness = bright;
    input_str += " 6b. (11) get _brightness: <FONT color='#0000FF'>"+clip6._brightness+"</FONT>\n";
    input_str += " 7a. (12) set _brightOffset = offset: no return\n";
    clip7._brightOffset = offset;
    input_str += " 7b. (13) get _brightOffset: <FONT color='#0000FF'>"+clip7._brightOffset+"</FONT>\n\n";  		
 		
    input_str += " 8a. (14) set _tint = {r:r,g:g,b:b,percent:percent}: no return\n";
    clip8._tint = {r:r,g:g,b:b,percent:percent};
    input_str += " 8b. (15) get _tint. <FONT color='#0000FF'>r:"+Math.round(clip8._tint.r)+",g:"+Math.round(clip8._tint.g)+",b:"+Math.round(clip8._tint.b)+",percent:"+Math.round(clip8._tint.percent)+"</FONT>\n";
    input_str += " 9a. (16) set _tint2 = {rgb:rgb,percent:percent}: no return\n";
    clip9._tint2 = {rgb:rgb,percent:percent};
    input_str += " 9b. (17) get _tint2. <FONT color='#0000FF'>rgb"+clip9._tint2.rgb+",percent:"+Math.round(clip9._tint2.percent)+"</FONT>\n";
    input_str += " 10a. (18) set _tintOffset = {r:r,g:g,b:b}: no return\n";
    clip10._tintOffset = {r:r,g:g,b:b};
    input_str += " 10b. (19) get _tintOffset. <FONT color='#0000FF'>r:"+clip10._tintOffset.r+",g:"+clip10._tintOffset.g+",b:"+clip10._tintOffset.b+"</FONT>\n\n";
    
    clip11.setRGB(rgb);
    clip11.invertColor();
    input_str += " 11. (20) invertColor(): <FONT color='#0000FF'>r:"+clip11._red+", g:"+clip11._green+", b:"+clip11._blue+"</FONT>\n";
    input_str += " 12a. (21) set _negativeColor = percent: no return\n";
    clip12._negativeColor = percent;
    input_str += " 12b. (22) get _negativeColor: <FONT color='#0000FF'>"+clip12._negativeColor+"</FONT>\n\n";
		
    input_str += " 13a. (23) set _red = amount: no return\n";
    clip13._red = amount;
    input_str += " 13b. (24) get _red: <FONT color='#0000FF'>"+clip13._red+"</FONT>\n";
    input_str += " 14a. (25) set _green = amount: no return\n";
    clip14._green = amount;
    input_str += " 14b. (26) get _green: <FONT color='#0000FF'>"+clip14._green+"</FONT>\n";
    input_str += " 15a. (27) set _blue = amount: no return\n";
    clip15._blue = amount;
    input_str += " 15b. (28) get _blue: <FONT color='#0000FF'>"+clip15._blue+"</FONT>\n\n";
	
    input_str += " 16a. (29) set _redPercent = percent: no return\n";
    clip16._redPercent = percent;
    input_str += " 16b. (30) get _redPercent(): <FONT color='#0000FF'>"+clip16._redPercent+"</FONT>\n";
    input_str += " 17a. (31) set _greenPercent = percent: no return\n";
    clip17._greenPercent = percent;
    input_str += " 17b. (32) get _greenPercent(): <FONT color='#0000FF'>"+clip17._greenPercent+"</FONT>\n";
    input_str += " 18a. (33) set _bluePercent = percent: no return\n";
    clip18._bluePercent = percent;
    input_str += " 18b. (34) get _bluePercent: <FONT color='#0000FF'>"+clip18._bluePercent+"</FONT>\n\n";
	
    input_str += " 19a. (35) set _redOffset = offset: no return\n";
    clip19._redOffset = offset;
    input_str += " 19b. (36) get _redOffset(): <FONT color='#0000FF'>"+clip19._redOffset+"</FONT>\n";
    input_str += " 20a. (37) set _greenOffset = offset: no return\n";
    clip20._greenOffset = offset;
    input_str += " 20b. (38) get _greenOffset(): <FONT color='#0000FF'>"+clip20._greenOffset+"</FONT>\n";
    input_str += " 21a. (39) set _blueOffset = offset: no return\n";
    clip21._blueOffset = offset;
    input_str += " 21b. (40) get _blueOffset(): <FONT color='#0000FF'>"+clip21._blueOffset+"</FONT>\n";

	input_txt.htmlText = input_str;

};

reDraw();

// ------------------------------------------

// reDraw_btn
reDraw_btn.onPress = function() 
{
	reDraw();
};

// ------------------------------------------

// textfield display
this.createTextField("input_txt",++depth,0,50,0,0);
input_txt.autoSize = "left";
input_txt.selectable = false;
input_txt.multiline = true;
input_txt.html = true;
input_txt.htmlText = input_str;

// trace properties
//trace ("\n#### ColMC Properties ####\n");
//for (arguments in ColMC) 
//{
//    trace (arguments+":"+ColMC[arguments]);
//}