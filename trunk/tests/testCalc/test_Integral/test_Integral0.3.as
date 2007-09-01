// test_Integral0.2.as

/**
 * The org.opensourcephysics.ch14 package contains examples
 * for Chapter 14, Numerical Integration.
 *
 * Copyright (c) 2004, H. Gould, J. Tobochnik, and W. Christian.
**/
//package org.opensourcephysics.sip.ch14;
//import org.opensourcephysics.numerics.*;



/**
 * test_Integral tests the static methods in the Integral class.
 *
 * @author H. Gould, J. Tobochnik, W. Christian, J. Gould
 * @version 1.0
**/
//var LN2:Number = Math.log(2);     // integral of 1/x from 1 to 2

import com.wis.math.calc.*;
//import com.wis.math.alg.Eval;

var bInt:Boolean = false;
x_ti.text = 4;
a_ti.text = 1;
b_ti.text = 2;
func_ti.text = "1.0/x";

/**
 * Starts the application.
 * @param args  command line parameters
**/
function main():Void
{
    debug_ta.text = "";
    var integ:Integral = new Integral();
	var a:Number = 1;
	var b:Number = 2;
	var tol:Number = 1e-10;
    var area:Number;
    //var str:Eval;
    var str:String;

    if (bInt)
    {
        a = a_ti.text;
        b = b_ti.text;
        //str = new Eval(func_ti.text);
        str = func_ti.text;
        //var f:Function = testFunction(x_ti.text,func_ti.text);
        var f:Function = function(x:Number):Number
		{
		    //str = str.substr(0,3); //str.indexOf("x"));
		    //trace (str.indexOf("x")+" #### "+str);
		    //return Number(str)/x; //1.0/x;
		    //trace ("str: "+(str instanceof Eval)+" :: "+str);
		    return Number(str);
        }
    }
    else
    {
        var f:Function = function(x:Number):Number
        {
	        return 1.0/x;
        }
    }

    bInt = false;

    /*debug_ta.text +=
    "function main():Void\n"+
    "{\n"+
    "    var f:Function = function(x:Number):Number\n"+
	"    {\n"+
	"        return 1.0/x;\n"+
	"    }\n"+
	"    var integ:Integral = new Integral();\n"+
	"    var a:Number = 1;\n"+
	"    var b:Number = 2;\n"+
	"    var tol:Number = 1e-10;\n"+
    "    var area:Number;\n"+
    "    //[err = area-Math.LN2 (0.693147180559945)]\n"+
    "    ...\n\n";*/

    area = integ.trapezoidal(f,a,b,2,tol);
    debug_ta.text += ("integ.trapezoidal(f,a,b,2,tol)\narea = "+area+"\nerr = "+(area-Math.LN2))+"\n\n";
    area = integ.simpson(f,a,b,2);
    debug_ta.text += ("integ.simpson(f,a,b,2)\narea = " +area+"\nerr = "+(area-Math.LN2))+"\n\n";
    area = integ.simpsonTol(f,a,b,2,tol);
    debug_ta.text += ("integ.simpsonTol(f,a,b,2,tol)\narea = " +area+"\nerr = "+(area-Math.LN2))+"\n\n";
    area = integ.romberg(f,a,b,2,tol);
    debug_ta.text += ("integ.romberg(f,a,b,2,tol)\narea = " +area+"\nerr = "+(area-Math.LN2))+"\n\n";
    area = integ.ode(f,a,b,tol);
    debug_ta.text += ("integ.ode(f,a,b,tol)\narea = "+area+"\nerr = "+(area-Math.LN2))+"\n\n";

    //debug_ta.text += "}";
}

/**
 * integ_btn
**/
integ_btn.onRelease = function()
{
    bInt = true;
    main();
}

/**
 * A test function for numeric integration.
**/
function testFunction(x:String,str:String)
{
    var func:Number = Number(str);
    return func; //1.0/x;
}

main();

