/**
 * -----------------------------------------------
 * @application  test_Complex.fla
 * @appVersion   test_Complex0.9.as
 * @appUpdate    July 8, 2004
 * -----------------------------------------------
 * @class       com.wis.math.alg.Complex
 * @author      Richard Wright - wisolutions2002@shaw.ca
 * @version     1.5
 * @description Implements the static behaviours of the Complex Class, with
 *              algorithm logic based on the use of reverse Polish notation.
 *              <p>
 *		        Supports all functions pertaining to the complex number calculator
 *              and three added functions that are beyond the calculator's scope.
 *              The calculator is capable of performing all basic operations:
 *              powers, roots, logarithms, trigonometric functions, hyperbolic
 *              functions, gamma and polygamma functions. Other than the following
 *              exceptions, all methods call an inner 'Complex.input(re,im)' method
 *              to capture the values of the two UI input fields for manipulation
 *              within the outer method:
 *              <blockquote><pre>
 *              - new complex number instantiation (C button)
 *              - new Math.PI complex number instantiation (Pi button)
 *              - hold active complex number in memory (MR button)
 *              </pre></blockquote>
 *              Although many of the methods are only used privately within the
 *              class for the calculator's procedures, I have left all methods
 *              declared as 'public static' to be able to utilize all class methods
 *              in other application structures.
 * @usage       <pre>Complex.compMethod(compArgs)</pre>
 * @param       re (Number) real portion of complex number from re_txt string converted in UI
 * @param       im (Number) imaginary portion of complex number from im_txt string converted in UI
 * -----------------------------------------------
 * @update      July 8, 2004
 * -----------------------------------------------
 * AS2 revision copyright © 2003, Richard Wright [wisolutions2002@shaw.ca]
 * JS  original copyright © 2003, Dario Alpern   [http://www.alpertron.com.ar/ENGLISH.HTM]
 * -----------------------------------------------
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *     - Redistributions of source code must retain the above copyright notice,
 *       this list of conditions and the following disclaimer.
 *
 *     - Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *
 *     - Neither the name of this software nor the names of its contributors
 *       may be used to endorse or promote products derived from this software
 *       without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * -----------------------------------------------
 * Functions in Complex class:
 *     Complex(re,im)
 *           1.  input(re,im)
 *           2.  arg(x,y)
 *           3.  chSign(c)
 *           4.  norm(c)
 *           5.  rAbs(c)
 *           6.  abs(c)
 *           7.  timesi(c)
 *           8.  timesi3(c)
 *           9.  adds(c1,c2)
 *           10. subt(c1,c2)
 *           11. mult(c1,c2)
 *           12. div(c1,c2)
 *           13. log(c)
 *           14. exp(c)
 *           15. sqrt(c)
 *           16. power(c1,c2)
 *           17. root(c1,c2)
 *           18. rSinh(r)
 *           19. rCosh(r)
 *           20. sin(c)
 *           21. cos(c)
 *           22. tan(c)
 *           23. cot(c)
 *           24. sec(c)
 *           25. cosec(c)
 *           26. asin(c)
 *           27. acos(c)
 *           28. atan(c)
 *           29. acot(c)
 *           30. asec(c)
 *           31. acosec(c)
 *           32. sinh(c)
 *           33. cosh(c)
 *           34. tanh(c)
 *           35. coth(c)
 *           36. sech(c)
 *           37. cosech(c)
 *           38. asinh(c)
 *           39. acosh(c)
 *           40. atanh(c)
 *           41. acoth(c)
 *           42. asech(c)
 *           43. acosech(c)
 *           44. contFrac(arguments)
 *           45. factorial(c)
 *           46. equals(c1,c2)
 *           47. conjugate(c)
 *           48. modulo(c)
 *           49. logGamma(c)
 *           50. diGamma(c)
 *           51. triGamma(c)
 *           52. tetraGamma(c)
 *           53. pentaGamma(c)
 *           54. hexaGamma(c)
 *         - getters/setters
 *           55. get _real()
 *           55. set _real()
 *           56. get _imag()
 *           56. set _imag()
 * -----------------------------------------------
 *  Updates may be available at:
 *              http://members.shaw.ca/flashprogramming/wisASLibrary/wis/
 * -----------------------------------------------
**/

//class com.wis.math.alg.Complex
//{
	/**
	 * @property $r  (Number)  private - real portion of complex number - any real number
	 * @property $i  (Number)  private - imaginary portion of complex number - any real number
	 * @property Mem  (Complex)  static: holder for saved complex number
	 * @property One  (Complex)  static: identity instantiated complex number
	 * @property Pi  (Complex)  static: pi instantiated complex number
	 * @property ToRad  (Complex)  static: rad-to-deg instantiated complex number for radio group manipulation
	**/

// ------------------------------------------------
// ------------------------------------------------

import com.wis.math.alg.Complex;

///////////////////////////////////
// initialize
///////////////////////////////////

/**
 * @property num  (Number)  **
 * @property re  (Number)  **
 * @property im  (Number)  **
 * @property sp  (Number)  **
 * @property stackLen  (Number)  **
 * @property output  (Complex)  **
 * @property val  (Complex)  **
 * @property stack_arr  (Array)  **
**/
var num:Number;
var re:Number;
var im:Number;
var sp:Number = 0;
var stackLen:Number = 20;
var output:Complex;
var val:Complex = new Complex(0,0);
var stack_arr:Array = [];

// display initial 0 values of val:Complex
re_ti.text = val._real;
im_ti.text = val._imag;

// populate stack_arr with stackLen of Complex number instances
for (var j:Number=0;j<stackLen;j++) stack_arr[j] = new Complex(0,0);

///////////////////////////////////
// listeners
///////////////////////////////////

// radioGroup i/o - radioListener
var radio_obj:Object = {hyp:0,rad:1,deg:180/Math.PI,grad:200/Math.PI};
var radioTgt:String;

var radioListener:Object = {};
radioListener.click = function(evt)
{
    radioTgt = evt.target.selection._name;
    trace ("radioObj:"+radio_obj[radioTgt.substr(0,-3)]);
    Complex.ToRad._real = radio_obj[radioTgt.substr(0,-3)];
};
radioGroup.addEventListener("click",radioListener);

// --------------------------------------------------------------

// re_ti textfield i/o - realListener
var realListener:Object = {};
realListener.handleEvent = function(evt)
{
    if (evt.type=="change")
    {
        re = Number(re_ti.text);
        trace ("realListener .. re:"+re);
    }
};
re_ti.addEventListener("change",realListener);

// --------------------------------------------------------------

// im_ti textfield i/o - imagListener
var imagListener:Object = {};
imagListener.handleEvent = function(evt)
{
    if (evt.type=="change")
    {
        im = Number(im_ti.text);
        trace ("imagListener .. im:"+im);
    }
};
im_ti.addEventListener("change",imagListener);

// --------------------------------------------------------------

// calc buttons i/o - btnListener
var btn_arr:Array =
[
    chSign_pb,inv_pb,clr_pb,pi_pb,abs_pb,enter_pb,
    mAdd_pb,mSubt_pb,mMult_pb,mDiv_pb,mIn_pb,mRec_pb,
    adds_pb,subt_pb,mult_pb,div_pb,pow_pb,root_pb,
    log_pb,exp_pb,sq_pb,cube_pb,sqrt_pb,fact_pb,
    sin_pb,cos_pb,tan_pb,cot_pb,sec_pb,csc_pb,
    asin_pb,acos_pb,atan_pb,acot_pb,asec_pb,acsc_pb,
    logG_pb,diG_pb,triG_pb,tetraG_pb,pentaG_pb,hexaG_pb
];

var btnListener:Object = {};
btnListener.click = function(evt)
{
    for (var j:Number=0;j<btn_arr.length;j++)
    {
	    if (btn_arr[j]._name==evt.target._name)
	    {
	        trace("btn_arr["+j+"]:"+btn_arr[j]._name);
	        num = j;
	        initSwitch(num);
	        break;
	    }
    }
};

// populate btnListener with all buttons
for (var j:Number=0;j<btn_arr.length;j++)
{
    btn_arr[j].addEventListener("click",btnListener);
}

///////////////////////////////////
// main function
///////////////////////////////////

// initSwitch
initSwitch = function()
{
    re = Number(re_ti.text);
    im = Number(im_ti.text);
    trace ("initSwitch ... re: "+(typeof(re))+", "+re+" .. im: "+(typeof(im))+", "+im+", num: "+num);

    switch(num)
    {
        case(0)  :
            output = Complex.chSign(Complex.input(re,im)); // +/-
            break;
        case(1)  :
            output = Complex.div(Complex.One,Complex.input(re,im)); // 1/z
            break;
        case(2)  :
            output = new Complex(0,0); // C
            break;
        case(3)  :
            output = Complex.Pi; // Pi
            break;
        case(4)  :
            output = Complex.abs(Complex.input(re,im)); // Abs
            break;
        case(5)  :
            sp = ((sp+1)%stackLen);
            output = stack_arr[sp] = Complex.input(re,im); // Enter
            trace ("enter: sp: "+sp+","+stack_arr[sp]+","+stack_arr[sp]._real+","+stack_arr[sp]._imag);
            break;
        case(6)  :
            output = Complex.Mem = Complex.adds(Complex.Mem,Complex.input(re,im)); // M+
            break;
        case(7)  :
            output = Complex.Mem = Complex.subt(Complex.Mem,Complex.input(re,im)); // M-
            break;
        case(8)  :
            output = Complex.Mem = Complex.mult(Complex.Mem,Complex.input(re,im)); // M*
            break;
        case(9)  :
            output = Complex.Mem = Complex.div(Complex.Mem,Complex.input(re,im)); // M/
            break;
        case(10) :
            output = Complex.Mem = Complex.input(re,im); // Min
            break;
        case(11) :
            output = Complex.Mem; // MR
            break;
        case(12) :
            output = Complex.adds(stack_arr[sp],Complex.input(re,im)); // +
            sp = ((sp+19)%stackLen);
            break;
        case(13) :
            output = Complex.subt(stack_arr[sp],Complex.input(re,im)); // -
            sp = ((sp+19)%stackLen);
            break;
        case(14) :
            output = Complex.mult(stack_arr[sp],Complex.input(re,im)); // *
            sp = ((sp+19)%stackLen);
            break;
        case(15) :
            output = Complex.div(stack_arr[sp],Complex.input(re,im)); // /
            sp = ((sp+19)%stackLen);
            break;
        case(16) :
            trace ("power: "+stack_arr[sp]+","+stack_arr[sp]._real+","+stack_arr[sp]._imag);
            output = Complex.power(stack_arr[sp],Complex.input(re,im)); // Power
            sp = ((sp+19)%stackLen);
            break;
        case(17) :
            trace ("root: "+stack_arr[sp]+","+stack_arr[sp]._real+","+stack_arr[sp]._imag);
            output = Complex.root(stack_arr[sp],Complex.input(re,im)); // Root
            sp = ((sp+19)%stackLen);
            break;
        case(18) :
            output = Complex.log(Complex.input(re,im)); // log
            break;
        case(19) :
            output = Complex.exp(Complex.input(re,im)); // exp
            break;
        case(20) :
            output = Complex.mult(Complex.input(re,im),Complex.input(re,im)); // x^2
            break;
        case(21) :
            output = Complex.mult(Complex.input(re,im),Complex.mult(Complex.input(re,im),Complex.input(re,im))); // x^3
            break;
        case(22) :
            output = Complex.sqrt(Complex.input(re,im)); // sqrt
            break;
        case(23) :
            output = Complex.factorial(Complex.input(re,im)); // !
            break;
        case(24) :
            output = Complex.ToRad._real?Complex.sin(Complex.div(Complex.input(re,im),Complex.ToRad)):Complex.sinh(Complex.input(re,im)); // sin
            break;
        case(25) :
            output = Complex.ToRad._real?Complex.cos(Complex.div(Complex.input(re,im),Complex.ToRad)):Complex.cosh(Complex.input(re,im)); // cos
            break;
        case(26) :
            output = Complex.ToRad._real?Complex.tan(Complex.div(Complex.input(re,im),Complex.ToRad)):Complex.tanh(Complex.input(re,im)); // tan
            break;
        case(27) :
            output = Complex.ToRad._real?Complex.cot(Complex.div(Complex.input(re,im),Complex.ToRad)):Complex.coth(Complex.input(re,im)); // cot
            break;
        case(28) :
            output = Complex.ToRad._real?Complex.sec(Complex.div(Complex.input(re,im),Complex.ToRad)):Complex.sech(Complex.input(re,im)); // sec
            break;
        case(29) :
            output = Complex.ToRad._real?Complex.cosec(Complex.div(Complex.input(re,im),Complex.ToRad)):Complex.cosech(Complex.input(re,im)); // cosec
            break;
        case(30) :
            output = Complex.ToRad._real?Complex.mult(Complex.asin(Complex.input(re,im)),Complex.ToRad):Complex.asinh(Complex.input(re,im)); // asin
            break;
        case(31) :
            output = Complex.ToRad._real?Complex.mult(Complex.acos(Complex.input(re,im)),Complex.ToRad):Complex.acosh(Complex.input(re,im)); // acos
            break;
        case(32) :
            output = Complex.ToRad._real?Complex.mult(Complex.atan(Complex.input(re,im)),Complex.ToRad):Complex.atanh(Complex.input(re,im)); // atan
            break;
        case(33) :
            output = Complex.ToRad._real?Complex.mult(Complex.acot(Complex.input(re,im)),Complex.ToRad):Complex.acoth(Complex.input(re,im)); // acot
            break;
        case(34) :
            output = Complex.ToRad._real?Complex.mult(Complex.asec(Complex.input(re,im)),Complex.ToRad):Complex.asech(Complex.input(re,im)); // asec
            break;
        case(35) :
            output = Complex.ToRad._real?Complex.mult(Complex.acosec(Complex.input(re,im)),Complex.ToRad):Complex.acosech(Complex.input(re,im)); // acosec
            break;
        case(36) :
            output = Complex.logGamma(Complex.input(re,im));   //log gamma
            break;
        case(37) :
            output = Complex.diGamma(Complex.input(re,im));    //digamma
            break;
        case(38) :
            output = Complex.triGamma(Complex.input(re,im));   //trigamma
            break;
        case(39) :
            output = Complex.tetraGamma(Complex.input(re,im)); //tetragamma
            break;
        case(40) :
            output = Complex.pentaGamma(Complex.input(re,im)); //pentagamma
            break;
        case(41) :
            output = Complex.hexaGamma(Complex.input(re,im));  //hexagamma
            break;
        default :
            trace ("No button");
     }
     trace ("output._real: "+output._real+", _imag: "+output._imag);
     re_ti.text = output._real;
     im_ti.text = output._imag;
     stack_ta.text = "";
     for (var j:Number=0;j<stack_arr.length;j++) stack_ta.text += "stack_arr["+j+"]._real: "+stack_arr[j]._real+", _imag: "+stack_arr[j]._imag+"\n";
 };

