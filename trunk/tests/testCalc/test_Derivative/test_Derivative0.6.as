// test_Derivative0.5.as

// original Java library:
//package org.opensourcephysics.sip.ch4;
//import org.opensourcephysics.controls.*;
//import org.opensourcephysics.numerics.Function;
//import org.opensourcephysics.sip.ch3.MyFunction;
//import org.opensourcephysics.sip.extras.MyMath;

import com.wis.math.calc.*;

var xmin:Number,xmax:Number,numPts:Number;
var func:Function = new Function();

function resetCalculation():Void
{
    xmin_ti.text = xmin = 0;            // default values
    xmax_ti.text = xmax = 1;
    numPts_ti.text = numPts = 10;
}

function calculate():Void
{
    // get the input parameters from the UI
    xmin = Number(xmin_ti.text);
    xmax = Number(xmax_ti.text);
    numPts = Number(numPts_ti.text);
    calculateDerivative();
}

function calculateDerivative():Void
{
    var dx:Number = (xmax-xmin)/numPts;
    var x:Number = xmin;
    debug_ta.text = "";
    for (var i:Number=0;i<numPts;i++)
    {
        var deriv:Derivative = new Derivative();
        var derivRomberg:Number = Derivative.romberg(func,x,dx,1.0e-9);
        var derivCentered:Number = deriv.centered(func,x,dx);
        trace("derivRomberg = "+derivRomberg);
        trace("derivCentered = "+derivCentered);
        trace("x = "+x+", dx = "+dx);
        x += dx;
        debug_ta.text += "x = "+x+", dx = "+dx+", xmin = "+xmin+", xmax = "+xmax+
                         "\nderivRomberg: "+derivRomberg+"\nderivCentered: "+derivCentered+"\n";
    }
}

function main():Void
{
    resetCalculation();
    calculate();
}

diff_btn.onRelease = function()
{
    calculate();
}

main();

