/*
*   ------------------------------------------------------
*   Application:   test_Matrix
*   ------------------------------------------------------
*   Version:       test_Matrix0.7.as
*                  test_Matrix.fla
*   ------------------------------------------------------
*   Latest update: April 17, 2004
*   ------------------------------------------------------
*   Dependency:    com.wis.math.alg.Matrix.as
*                  com.wis.math.alg.Vector.as
*   ------------------------------------------------------
*
*   Copyright: © 2003, Richard Wright   [wisolutions2002@shaw.ca]
*   Copyright: © 2001, Brandon Williams [brandon@plotdev.com]
*
*
*   All rights reserved.
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
*       1.  initMatrix()
*       2.  initFunc()
*       5.  initSwitch()
*
*   ------------------------------------------------------
*
*   Class Functions:
*
*       Matrix(r,c)
*           
*           1.  resize(r,c)
*           2.  augment(m1)
*           3.  fragment(m1,sr,sc,er,ec)
*           4.  identity()
*           5.  constant(a)
*           6.  randomMatrix(a,b)
*           7.  addition(m1,m2)
*           8.  subtract(m1,m2)
*           9.  scalar(s)
*           10. transpose()
*           11. mult(m1,m2)
*           12. vectorMult(V)
*           13. determinant()
*           14. inverse(m1)
*           15. elemConstant(r,s)
*           16. elemSwitch(r1,r2)
*           17. elemCMA(r1,s,r2)
*           18. rowReduce()
*           19. print()
*           20. copy()
*           21. rotationX(sine,cosine)
*           22. rotationY(sine,cosine)
*           23. rotationZ(sine,cosine)
*           24. rotationAxis(V,sine,cosine)
*
*   ------------------------------------------------------
*   Updates may be available at:
*                    http://members.shaw.ca/flashprogramming/wisASLibrary/wis/
*   -----------------------------------------------------
*/

import com.wis.math.alg.Matrix;
import com.wis.math.alg.Vector;

////////////////////////////////
// initialize
////////////////////////////////

var d:Number;
var num:Number = 0;
var rows:Number = 4;
var columns:Number = 4;
var constant:Number = 10;
var x:Number = 10;
var y:Number = 5;
var z:Number = 2;
var V,V1:Vector;
var matrix:String;
var instr_arr:Array = [];

matrix_txt.text = "";
row_txt.text = rows;
column_txt.text = columns;
constant_txt.text = constant;
x_txt.text = x;
y_txt.text = y;
z_txt.text = z;

// ----------------------------------------

// grid to delineate loading space for AS2 Library scrollPane
this.createEmptyMovieClip("holder",-1);
holder._y = 110;
holder.lineStyle();
holder.lineTo(600,0);
holder.lineTo(600,400);
holder.lineTo(0,400);
holder.lineTo(0,0);

// ----------------------------------------

// populate first element of instr_arr
instr_arr[0] = "Instructions:\n\n"+
               "Each function test can be adjusted for matrix structure by changing the rows "+
               "and columns input below. Applicable functions can also be adjusted by "+
               "changing the constant input, and function #12 can be adjusted by changing the "+
               "vector input values.\n\n"+
               "Buttons:\n\nAfter performing a function operation, the determinant for each "+
               "matrix can be calculated by first selecting the matrix then clicking the "+
               "determinant button. Also, you can repeat the selected function with new random "+
               "elements by clicking the repeat button.\n\n"+
               "Note:\n\n"+
               "The functionality is incomplete at present .. I still have a problem resizing "+
               "the matrix display, and the rotation functions require changes to the UI to "+
               "test them within this application.";

// ----------------------------------------

// func_cb dataProvider
func_cb.dataProvider = [
        {label:"Choose a Function"},
        {label:"1. Initialize an empty matrix in A"},
        {label:"2. Initialize a matrix in A with all elements equal to constant"},
        {label:"3. Initialize a random matrix in A (5 to 20)"},
        {label:"4. Resize a random matrix in A to a 2 by 2 matrix in B (you will lose some elements)"},
        {label:"5. Initialize two random matrices in A and B, then adjoin B onto A and display in M"},
        {label:"6. Create an identity matrix in M (existing matrices in A and B remain displayed)"},
        {label:"7. Initialize a random matrix in A, then copy elements (1,2) through (2,3) of A into B"},
        {label:"8. Initialize a random matrix in A, then transpose A and display in B"},
        {label:"9. Initialize two random matrices, then add them and display in M"},
        {label:"10. Multiply a random matrix in A by a scalar (constant) and display in B"},
        {label:"11. Initialize two random matrices in A and B, then subtract them and display in M"},
        {label:"12. Initialize a random matrix in A, mult by vector V and display the vector result in Vector field"},
        {label:"13. Initialize two random matrices in A and B, then mult and display product in M"},
        {label:"14. Initialize a random matrix in A, then display it's inverse in B"},
        {label:"15. Multiply the third row of a random matrix in A by the constant and display in B"},
        {label:"16. Initialize a random matrix in A, switch row one and two and display in B"},
        {label:"17. Add the 1st row of a random matrix in A, multiplied by the constant to the 2nd row and display in B"},
        {label:"18. Initialize a random matrix in A, row reduce and display in B"}];

////////////////////////////////
// functions
////////////////////////////////

// initMatrix function
initMatrix = function() {

    var iWidth,mat,i,j,k,m,n,tCol,tRow,tempLen,maxWidth,gridWidth:Number;
    var depth:Number = 0;
    var iMat:Number = 0;
    var iHeight:Number = 18;
    var factor:Number = 10;
    var gridStart:Number = 130;
    var matSpan:Number = 145;
    var gridSpan:Number = 115;
    var gridFill:Number = 40;
    var maxLen:Number = 0;
    var field_arr:Array = [];

    holder.clear();
    for (i=0;i<3;i++) {
        for (j=0;j<20;j++) {    
            for (k=0;k<20;k++) {
                holder["el"+i+"_"+k+j].removeTextField();
            }
        }
    }
    
    if (A) mat = 1;
    if (B) mat = 2;
    if (M) mat = 3;
    
    for (i=0;i<mat;i++) {
        if (i==0) tCol = A.$columns,tRow = A.$rows;
        else if (i==1) tCol = B.$columns,tRow = B.$rows;
        else if (i==2) tCol = M.$columns,tRow = M.$rows;
        for (j=0;j<tCol;j++) {
            var obj:Object = func_obj["m"+i+"Field"+j];
            field_arr.push(obj.split(","));
            //trace ("1. "+j+" .. field_arr["+j+"]: "+field_arr[j]+", obj: "+obj+", func_obj[m"+i+"Field"+j+"]: "+func_obj["m"+i+"Field"+j]);
            for (m=0;m<field_arr.length;m++) {
                for (n=0;n<field_arr[m].length;n++) {
                    tempLen = Math.max(field_arr[m][n].length,field_arr[m][n-1].length);
                    //trace ("2. "+m+n+" .. tempLen: "+tempLen+", field_arr["+m+"]["+n+"].length: "+field_arr[m][n].length+", field_arr["+m+"]["+(n-1)+"].length: "+field_arr[m][n-1].length);
                    if (tempLen>maxLen) maxLen = tempLen;
                    //trace ("3. "+j+" .. maxLen: "+maxLen+", tempLen: "+tempLen);
                }
            }
            //if (tempLen>maxLen) maxLen = tempLen;
            iWidth = maxLen*factor;
            //if (i==2 && num==5) tCol = gridWidth = iWidth*columns*2;
            //else gridWidth = iWidth*columns;
            gridWidth = iWidth*columns;
            //trace ("4. "+j+" .. maxLen: "+maxLen+", iWidth: "+iWidth+", gridWidth: "+gridWidth);
            for (k=0;k<tRow;k++) {
                holder.createTextField("el"+i+"_"+k+j,++depth,140+((j+1)*iWidth),35+(115*iMat)+((k+1)*iHeight),0,0);
                with (holder["el"+i+"_"+k+j]) {
                    autoSize = "center";
                    if (i==0) text = A.$m[k][j];
                    else if (i==1) text = B.$m[k][j];
                    else if (i==2) text = M.$m[k][j];
                }
            }
        }
        if (i==2 && num==5) gridWidth = iWidth*columns*2;
        if (i==1 && (num==4 || num==7)) gridWidth = iWidth*B.$columns;
        
        var rowSpan:Number = (gridSpan-tRow/5*gridSpan)-(20-4*tRow);
        
        with (holder) {
            lineStyle(0);
            moveTo(gridStart+10,50+(gridSpan*iMat));
            lineTo(gridStart,50+(gridSpan*iMat));
            lineTo(gridStart,(matSpan+(gridSpan*iMat)-rowSpan));
            lineTo(gridStart+10,(matSpan+(gridSpan*iMat)-rowSpan));
            moveTo(gridStart-10+gridWidth+gridFill,50+(gridSpan*iMat));
		    lineTo(gridStart+gridWidth+gridFill,50+(gridSpan*iMat));
		    lineTo(gridStart+gridWidth+gridFill,(matSpan+(gridSpan*iMat)-rowSpan));
            lineTo(gridStart-10+gridWidth+gridFill,(matSpan+(gridSpan*iMat)-rowSpan));
            ++iMat;
        }
    }
}

// ----------------------------------------

// initFunc
initFunc = function() {
    if (row_txt.text=="") row_txt.text = 0;
    if (column_txt.text=="") column_txt.text = 0;
    if (constant_txt.text=="") constant_txt.text = 10;
    if (x_txt.text=="") x_txt.text = 10;
    if (y_txt.text=="") y_txt.text = 5;
    if (z_txt.text=="") z_txt.text = 2;
    rows = Number(row_txt.text);
    columns = Number(column_txt.text);
    constant = Number(constant_txt.text);
    if (rows>5) rows = row_txt.text = 5;
    determinant_txt.text = "";
    vector_txt.text = "";
    matrix_pb.label = "Matrix A";
    inc = 1;
}

// ----------------------------------------

// main function 
initSwitch = function() {
     
    switch(num) {
 
        case(1) :

 	instr_arr[1] = "new Matrix (r,c)\n\n"+
 	               "Creates a new matrix .. all elements of the matrix (object A, B, or C) are put in "+
 	               "an array called $m. The object also holds the information of how many rows and "+
 	               "columns the matrix has. When authoring, you can access these properties like this: "+
 	               "matrixInstance.$m[r][c], matrixInstance.$rows, and matrixInstance.$columns.";

    A = new Matrix(rows,columns);
 	B = "";
 	M = "";
    B.$rows = "";
    B.$columns = "";
    M.$rows = "";
    M.$columns = "";
    for (var j:Number=0;j<A.$m.length;j++) {
        for (var k:Number=0;k<A.$m[j].length;k++) {
            A.$m[j][k] = 0;
        }
    }

            break;

// ----------------------------------------

        case(2) :

	instr_arr[2] = "function constant (a)\n\n"+
	               "Sets all of the elements of matrix A to the input constant.";

	A = new Matrix(rows,columns);
	A.constant(constant);
	B = "";
	M = "";
    B.$rows = "";
    B.$columns = "";
    M.$rows = "";
    M.$columns = "";

            break;

// ----------------------------------------
             
        case(3) :

	instr_arr[3] = "function random (a,b)\n\n"+
	               "Fills matrix A with random elements ranging between the two arguments.";

	A = new Matrix(rows,columns);
	A.random(5,20);
	B = "";
	M = "";
    B.$rows = "";
    B.$columns = "";
    M.$rows = "";
    M.$columns = "";

            break;

// ----------------------------------------
             
        case(4) :

	instr_arr[4] = "function resize (r,c)\n\n"+
	               "Resizes matrix A to the given dimensions. If you are resizing to make the matrix "+
	               "bigger then all new elements are initialized to zero. If you are making the matrix "+
	               "smaller you will lose some elements.";

    A = new Matrix(rows,columns);
	A.random(5,20);
    B = new Matrix(rows,columns);
    A.copy(B);
	B.resize(2,2);
	M = "";
    M.$rows = "";
    M.$columns = "";

            break;

// ----------------------------------------
             
        case(5) :

	instr_arr[5] = "function augment (m1)\n\n"+
	               "Adjoins matrix B to A to form an augmented matrix in M. Matrix B *must* have the "+
	               "same number of rows as A .. if they do not matrix A is left alone and nothing is done.";

	A = new Matrix(rows,columns);
	B = new Matrix(rows,columns);
	M = new Matrix(rows,columns);
	A.random(0,10);
	B.random(0,10);
	A.copy(M);
    M.augment(B);

            break;

// ----------------------------------------
             
        case(6) :

	instr_arr[6] = "function identity ()\n\n"+
	               "Turns A into an identity matrix .. for square matrices only! If set rows and columns "+
	               "differ the identity matrix is mapped to rows x rows";

	M = new Matrix(rows,rows);
	M.identity();

            break;

// ----------------------------------------
             
        case(7) :

	instr_arr[7] = "function fragment (m1,sr,sc,er,ec)\n\n"+
	               "Takes a portion of matrix A and puts it into B (similar to the array method 'slice'). "+
	               "The variables 'sr' and 'sc' are the starting position of where to 'slice' and 'er' and "+
	               "'ec' are the ending positions to slice.  If 'sr' or 'sc' are negative it starts at the "+
	               "beginning and if 'er' and 'ec' are greater than the dimensions of B the slicing stops "+
	               "at the end -- the end elements are included.  All previous elements of A will be lost "+
	               "and the matrix will be resized. Note that row and column numbers are zero-based.";

	A = new Matrix(rows,columns);
	B = new Matrix(rows,columns);
	A.random(0,10);
	B.fragment(A,1,2,2,3);
	M = "";
    M.$rows = "";
    M.$columns = "";

            break;

// ----------------------------------------
             
        case(8) :

	instr_arr[8] = "function transpose ()\n\n"+
	               "Transposes matrix A (WARNING: transposing a matrix changes the dimensions of the matrix "+
	               ".. all of A's properties are updated though).";

    columns = column_txt.text = rows;
    A = new Matrix(rows,columns);
    A.random(0,10);
    B = new Matrix(rows,columns);
	A.copy(B);
	B.transpose();
 	M = "";
    M.$rows = "";
    M.$columns = "";
    
            break;

// ----------------------------------------
             
        case(9) :

	instr_arr[9] = "function addition (m1,m2)\n\n"+
	               "Adds the matrices A and B and stores the sum in M. If the matrices do not have the same "+
	               "dimensions matrix M is turned into a zero matrix.  If the matrices are capable of being "+
                   "added together A is automatically resized.";

	A = new Matrix(rows,columns); 
	B = new Matrix(rows,columns);
	M = new Matrix(rows,columns);
	A.random(0,10);
	B.random(0,10);
	M.addition(A,B);

            break;

// ----------------------------------------
             
        case(10) :

	instr_arr[10] = "function scalar (s)\n\n"+
	                "Multiplies matrix A by the scalar input 'constant'.";

	A = new Matrix(rows,columns);
	B = new Matrix(rows,columns);
	A.random(0,10);
	A.copy(B);
	B.scalar(constant);
	M = "";

            break;

// ----------------------------------------
             
        case(11) :

	instr_arr[11] = "function subtract (m1,m2)\n\n"+
	                "Subtracts matrix B from A and stores it in M (M = A-B). If the two matrices do not have "+
	                "the same dimensions A is turned into a zero matrix.  If the matrices are capable of being "+
	                "subtracted from each other M is automatically resized.";

	A = new Matrix(rows,columns);
	B = new Matrix(rows,columns);
	M = new Matrix(rows,columns);
    A.random(0,10);
	B.random(0,10);
	M.subtract(A,B);

            break;

// ----------------------------------------
             
        case(12) :

	instr_arr[12] = "function vectorMult (V)\n\n"+
	                "Multiplies matrix A by the vector V and displays the vector result in the Vector field. "+
	                "This is a simplified example that resets both rows and columns to 3 in order to return "+
	                "a 3D vector result. The present scope of this testing application doesn't apply multiple "+
					"vector multiplication or matrices greater than 3 rows. I may change this functionality "+
					"in a future version, however .. the main function within the class would also need altering.";

    row_txt.text = rows = 3;
    column_txt.text = columns = 3;
	A = new Matrix(rows,columns);
	A.random(0,10);
	
	var tx:Number = Number(x_txt.text);
	var ty:Number = Number(y_txt.text);
	var tz:Number = Number(z_txt.text);
	
	V = new Vector(tx,ty,tz);
    V1 = A.vectorMult(V);
    vector_txt.text = "x: "+V1.x+"  y: "+V1.y+"  z: "+V1.z;
	B = "";
	B.$rows = "";
    B.$columns = "";
	M = "";
	M.$rows = "";
    M.$columns = "";

            break;

// ----------------------------------------
             
        case(13) :

	instr_arr[13] = "function mult (m1,m2)\n\n"+
	                "Multiplies matrix A and B together and stores the product in M (M = A*B .. order matters!). "+
	                "The dimensions of A do not matter because it will be resized to fit the product matrix. If "+
	                "the two matrices are not capable of being multiplied together then M is turned into a zero matrix.";

	A = new Matrix(rows,columns);
	B = new Matrix(rows,columns);
	M = new Matrix(rows,columns);
	A.random(0,10);
	B.random(0,10);
	M.mult(A,B);

            break;

// ----------------------------------------
             
        case(14) :

	instr_arr[14] = "function inverse (m1)\n\n"+
	                "Makes matrix B the inverse of matrix A (uses row reducing and elementary row operations.  WARNING: "+
	                "round off errors make this function inaccurate sometimes.  The inaccuracies are so small that they "+
	                "really do not matter.";

	A = new Matrix(rows,columns);
	B = new Matrix(rows,columns);
	A.random(0,10);
	A.copy(B);
	B.inverse();
	M = "";
    M.$rows = "";
    M.$columns = "";
    for (var j=0;j<B.$m.length;j++) {
	    for (var k=0;k<B.$m[j].length;k++) {
	        B.$m[j][k] = Math.round(B.$m[j][k]*1000)/1000;
	    }
    }

            break;

// ----------------------------------------
             
        case(15) :
        
    // ELEMENTARY ROW OPERATIONS .. the next three functions are the three elementary row operations

    instr_arr[15] = "function elemConstant (r,s)\n\n"+
                    "Multiplies row 'r' of matrix A by the constant 's' (s != 0). Note that rows are zero-based.";

    if (rows<3) rows = row_txt.text = 3;
    A = new Matrix(rows,columns);
    B = new Matrix(rows,columns);
    A.random(0,10);
    A.copy(B);
    B.elemConstant(2,constant);
    M = "";
    M.$rows = "";
    M.$columns = "";

            break;

// ----------------------------------------
             
        case(16) :

    instr_arr[16] = "function elemSwitch (r1,r2)\n\n"+
                    "Switches row 'r1' and 'r2' of matrix A and displays the result in B. Note that rows are zero-based.";

    if (rows<2) rows = row_txt.text = 2;
    A = new Matrix(rows,columns);
    B = new Matrix(rows,columns);
    A.random(0,10);
    A.copy(B);
    B.elemSwitch(0,1);
    M = "";
    M.$rows = "";
    M.$columns = "";

            break;

// ----------------------------------------
             
        case(17) :

    instr_arr[17] = "function elemCMA (r1,s,r2)\n\n"+
                    "Multiplies row 'r1' of matrix A by the constant 's' and adds it to row 'r2'. Row 'r1' is left unchanged afterwards.";

    if (rows<2) rows = row_txt.text = 2;
    A = new Matrix(rows,columns);
    B = new Matrix(rows,columns);
    A.random(0,10);
    A.copy(B);
    B.elemCMA(0,10,1);
    M = "";
    M.$rows = "";
    M.$columns = "";

            break;
 
// ----------------------------------------
            
        case(18) :

    instr_arr[18] = "function rowReduce ()\n\n"+
                    "Row reduces matrix into row echelon form -- you can only row reduce matrices that have more columns than rows, so the code "+
                    "automatically detects a matrix where columns <= rows and augments the columns value to produce the desired results. Round-off errors make this "+
                    "function inaccurate occasionally, although the inaccuracies are so small that they really do not matter.";                                         

    if (rows>=columns) columns = rows+2,column_txt.text = columns;
    A = new Matrix(rows,columns);
    B = new Matrix(rows,columns);
    A.random(0,10);
    A.copy(B);
    B.rowReduce();
    M = "";
    M.$rows = "";
    M.$columns = "";
    for (var j=0;j<B.$m.length;j++) {
	    for (var k=0;k<B.$m[j].length;k++) {
	        B.$m[j][k] = Math.round(B.$m[j][k]*1000)/1000;
	    }
    }

            break;
             
        default :
           
            trace ("No button");
             
     }
 }
 
////////////////////////////////
// func_cb eventListener
////////////////////////////////

var func_obj:Object = new Object();
func_obj.change = function(evt){
    initFunc();
    num = evt.target.selectedIndex;
    initSwitch(num);
    for (var j:Number=0;j<5;j++) {
        this["m0Field"+j] = A.$m[j].toString();
        this["m1Field"+j] = B.$m[j].toString();
        this["m2Field"+j] = M.$m[j].toString();
    }
    initMatrix();
}
func_cb.addEventListener("change",func_obj);

////////////////////////////////
// button functionality
////////////////////////////////

repeat_pb.onPress = function() {
    initFunc();
    initSwitch(num);
    initMatrix();
}

// ----------------------------------------

matrix_pb.onPress = function() {
    ++inc;
    if (inc>3) inc = 1;
    if (inc==1) matrix_pb.label = "Matrix A";
    if (inc==2) matrix_pb.label = "Matrix B";
    if (inc==3) matrix_pb.label = "Matrix M";
}

// ----------------------------------------

determinant_pb.onPress = function() {
    if (inc==1) d = A.determinant();
    else if (inc==2) d = B.determinant();
    else if (inc==3) d = M.determinant();
    determinant_txt.text = d.toString();
}

////////////////////////////////
// UI functionality
////////////////////////////////

// populate instructions
info_ta.text = instr_arr[num];

// update fields
this.onMouseUp = function() {

    Arows.text = A.$rows;
    Acolumns.text = A.$columns;
    Brows.text = B.$rows;
    Bcolumns.text = B.$columns;
    Mrows.text = M.$rows;
    Mcolumns.text = M.$columns;
    
    if (Arows.text=="undefined") Arows.text = "";
    if (Acolumns.text=="undefined") Acolumns.text = "";
    if (Brows.text=="undefined") Brows.text = "";
    if (Bcolumns.text=="undefined") Bcolumns.text = "";
    if (Mrows.text=="undefined") Mrows.text = "";
    if (Mcolumns.text=="undefined") Mcolumns.text = "";

    //remove
    AmField.text = A.$m.toString();
    BmField.text = B.$m.toString();
    MmField.text = M.$m.toString();
    
    if (AmField.text=="undefined")  AmField.text = "";
	if (BmField.text=="undefined")  BmField.text = "";
    if (MmField.text=="undefined")  MmField.text = "";
    //
    
    // display instructions in AS2 Library instr_ta
    _root.instr_ta.text = instr_arr[num];
    
}

// ----------------------------------------------------------------- EOF
 
/*
*
*   DEBUGGING
*            19. m.print() -- this function is for debugging...it will trace the properties of the matrix
*   COPY
*            20. m.copy()  -- make copy of a matrix for display in another matrix
*   TODO
*            21. rotationX(sine,cosine)
*            22. rotationY(sine,cosine)
*            23. rotationZ(sine,cosine)
*            24. rotationAxis(V,sine,cosine) 
*
*   ----------------------------------------------------------------
*
*   NOTES:  
*           -- when using the addition, subtract, augment, fragment, 
*              mult, and inverse methods you pass "Matrix"(s),  
*              *not* the "$m" variable of the "Matrix". Even though all the elements of 
*              the matrix are held in "$m" you do not pass it...basically, just pass the object (not any contents)
*
*           -- try to keep away from initializing a matrix with empty dimensions.  Even if you are only using to 
*              hold the product of two other matrices (for example) you should at least initialize it to (0,0) 
*              because the "resize" function seems to have problems with it otherwise.
*
*           -- The row reducing function is *by far* the slowest.  Do not expect to be using that real time.  It
*              is helpful for solving large systems of equations but I was not able to get it any faster.
*
*           -- The one thing I am pretty sure *everyone* will get mixed up on is how to reference elements in your
*              matrices.  The "rows" and "columns" variables represent how many rows and columns you have but your
*              first element is at zero (just like an array...because these *are* arrays).
*
*           -- Be careful when using the inverse() and rowReduce() methods because not only are they the slowest
*              but they are also inaccurate.  Round off errors affect those functions a lot due to the fact that you
*              get some crazy fractions when ever row reducing a matrix.
*
*   ----------------------------------------------------------------
*/
 
 