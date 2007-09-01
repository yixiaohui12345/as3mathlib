/*
*   ------------------------------------------------------
*   Class:         com.wis.math.alg.Matrix.as
*   ------------------------------------------------------
*   Version:       1.1
*   ------------------------------------------------------
*   Latest update: November 5, 2003
*   ------------------------------------------------------
*   Dependency:    com.wis.math.alg.Vector.as
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

import com.wis.math.alg.Vector;

class com.wis.math.alg.Matrix {

    var $rows:Number;
    var $columns:Number;
    var $m:Array;
    
    // constructor
    function Matrix(r,c:Number) {    
        //trace ("Matrix Class loaded");
        
	    $m = new Array(r);
	    var j:Number;
	    
	    for (j=0;j<r;j++) {
		    $m[j] = new Array(c);
		}

	    $rows = r;
	    $columns = c;
    }
    
// ------------------------------------------------------------

    // 1. resize
    function resize(r,c:Number):Void {
    
	    var j,k:Number;
	    var diffR:Number = r-$rows;
	    var diffC:Number = c-$columns;

	    // add new rows
	    if (diffR>0) {
		    for (j=0;j<diffR;j++) {
			    $m.push(new Array());
			    // initialize new elements as zero
			    for (k=0;k<$columns+diffC;k++) {
				    $m[$columns+j][k] = 0;
			    }
		    }
	    }
	    // add new columns
	    if (diffC>0) {
		    for (j=0;j<$rows;j++) {
			    for (k=0;k<diffC;k++) {
				    $m[j].push(0);
				}
			}
		}

	    // take away extra rows
	    if (diffR<0) {
		    for (j=0;j>diffR;j--) {
			    $m.pop();
			}
		}
	    // take away extra columns
	    if (diffC<0) {
		    for (j=0;j<r;j++) {
			    for (k=0;k>diffC;k--) {
				    $m[j].pop();
				}
			}
		}

	    $rows = r;
	    $columns = c;
    }

// ------------------------------------------------------------

    // 2. augment
    function augment(m1:Matrix):Void {
    
        var j,k:Number;
	    
	    if ($rows==m1.$rows) {
		    for (j=0;j<$rows;j++) {
			    for (k=$columns;k<$columns+m1.$columns;k++) {
				    $m[j].push(m1.$m[j][k-$columns]);
				}
			}
		    $columns += m1.$columns;
	    }
    }

// ------------------------------------------------------------

    // 3. fragment
    function fragment(m1:Matrix,sr,sc,er,ec:Number):Void {
    
   		var j,k:Number;
	    
	    // dimension checks
	    if (sr<0) sr = 0;
	    if (sc<0) sc = 0;

	    if (er>m1.$rows) er = $rows;
	    if (ec>m1.$columns) ec = $columns;

	    // new dimensions -- add one to include last elements
	    this.resize(er-sr+1,ec-sc+1);

	    // copy elements
	    for (j=sr;j<=er;j++) {
		    for (k=sc;k<=ec;k++) {
			    $m[j-sr][k-sc] = m1.$m[j][k];
			}
		}
    }

// ------------------------------------------------------------

    // 4. identity
    function identity():Void {
        
	   	var j,k:Number;
	    
	    for (j=0;j<$rows;j++) {
		    for (k=0;k<$columns;k++) {
			    if (j==k) {
				    $m[j][k] = 1;
			    } else {
				    $m[j][k] = 0;
				}
			}
		}
    }

// ------------------------------------------------------------

    // 5. constant
    function constant(a:Number):Void {
    
        var j,k:Number;
	    
	    for (j=0;j<$m.length;j++) {
		    for (k=0;k<$m[j].length;k++) {
			    $m[j][k] = a;
			}
		}
    }

// ------------------------------------------------------------

    // 6. random
    function random(a,b:Number):Void {
    
        var j,k:Number;
	    
	    for (j=0;j<$rows;j++) {
		    for (k=0;k<$columns;k++) {
			    $m[j][k] = Math.round(Math.random()*(Math.max(a,b)-Math.min(a,b)))+Math.min(a,b);
			}
		}
    }

// ------------------------------------------------------------

    // 7. addition
    function addition(m1,m2:Matrix):Void {
    
        var j,k:Number;
	    
	    if (m1.$rows!=m2.$rows || m1.$columns!=m2.$columns) {
		    this.constant(0);
	    } else {
		    this.resize(m1.$rows,m1.$columns);
		    for (j=0;j<$rows;j++) {
			    for (k=0;k<$columns;k++) {
				    $m[j][k] = m1.$m[j][k]+m2.$m[j][k];
				}
			}
	    }
    }

// ------------------------------------------------------------

    // 8. subtract
    function subtract(m1,m2:Matrix):Void {
    
        var j,k:Number;
	    
	    if (m1.$rows!=m2.$rows || m1.$columns!=m2.$columns) {
		    this.constant (0);
	    } else {
		    this.resize (m1.$rows, m1.$columns);
		    for (j=0;j<$rows;j++) {
			    for (k=0;k<$columns;k++) {
				    $m[j][k] = m1.$m[j][k]-m2.$m[j][k];
				}
			}
	    }
    }

// ------------------------------------------------------------

    // 9. scalar
    function scalar(s:Number):Void {
    
        var j,k:Number;
	    
	    for (j=0;j<$rows;j++) {
		    for (k=0;k<$columns;k++) {
			    $m[j][k] *= s;
			}
		}
    }

// ------------------------------------------------------------

    // 10. transpose
    function transpose():Void {
    
        var j,k:Number;
	    var temp:Matrix = new Matrix($columns,$rows);

	    for (j=0;j<$rows;j++) {
		    for (k=0;k<$columns;k++) {
			    temp.$m[k][j] = $m[j][k];
			}
		}

	    this.resize($columns,$rows);
	    $m = temp.$m;
    }

// ------------------------------------------------------------

    // 11. mult
    function mult(m1,m2:Matrix):Void {
    
        var j,k,s:Number;
	    
	    if (m2.$rows!=m1.$columns) {
		    this.constant(0);
	    } else {
		    this.resize(m1.$rows,m2.$columns);
		    this.constant(0);
		    for (j=0;j<$rows;j++) {
			    for (k=0;k<$columns;k++) {
				    for (s=0;s<m2.$rows;s++) {
					    $m[j][k] += m1.$m[j][s]*m2.$m[s][k];
					}
				}
			}
	    }
    }

// ------------------------------------------------------------
    
    // 12. returns the vector made from multiplying a 3x3 matrix with V
	function vectorMult(V:Vector):Vector {
	
	    var j,k:Number;
	
	    // vector that will be returned
	    var product:Vector = new Vector(0.0,0.0,0.0);
		
	    // calculate the components of the vector
	    for (j=0;j<$columns;j++) {
	        product.x += V.x*$m[0][j];
	        product.y += V.y*$m[1][j];
	        product.z += V.z*$m[2][j];
	    }	   
		
	    // return the product vector
	    return (product);
    }

// ------------------------------------------------------------

    // 13. determinant
    function determinant():Number {
  
        var j,k,a,b:Number;
	    var value:Number = 0;
	    var temp:Number = 1;
	    var det:Matrix = new Matrix($rows,2*$columns-1);

	    // copy elements
	    for (j=0;j<$rows;j++) {
		    for (k=0;k<det.$columns;k++) {
			    if (k<$columns) {
				    det.$m[j][k] = $m[j][k];
			    } else {
				    det.$m[j][k] = $m[j][k-$columns];
				}
		    }
	    }

	    // pluses
	    for (a=0;a<$columns;a++) {
		    for (b=0;b<$rows;b++) {
			    temp *= det.$m[b][a+b];
			}
		    value += temp;
		    temp = 1;
	    }

	    temp = 1;
	    
	    // minuses
	    for (a=$columns-1;a<det.$columns;a++) {
		    for (b=0;b<$rows;b++) {
			    temp *= det.$m[b][a-b];
			}
		    value -= temp;
		    temp = 1;
	    }
	    if ($rows != $columns) {
	    
		    return null;
	    } else if ($rows==1 && $columns==1) {
	    
		    return $m[0][0];
	    } else {
	    
		    return value;
        }
    }

// ------------------------------------------------------------

    // 14. inverse
    function inverse():Void {
    
	    var I:Matrix = new Matrix($rows,$columns);
	    var temp:Matrix = new Matrix(0,0);
	
	    I.identity();

	    if ($rows==$columns) {
		    this.augment(I);
		    this.rowReduce();
		    temp.fragment(this,0,$columns/2,$rows-1,$columns-1);
		    this.fragment(temp,0,0,temp.$rows-1,temp.$columns-1);
	    }
    }

// ------------------------------------------------------------

    // 15. elemConstant
    function elemConstant(r,s:Number):Void {
    
        var j:Number;
        
	    if (s!=0) {
		    for (j=0;j<$columns;j++) {
			    $m[r][j] *= s;
			}
		}
    }

// ------------------------------------------------------------

    // 16. elemSwitch
    function elemSwitch(r1,r2:Number):Void {
        
        var k,t:Number;
	    var tempRow:Matrix = new Matrix(0,0);

	    // copy "r1" into a temp row
	    tempRow.fragment(this,r1,0,r1+1,$columns);

	    // copy "r2" into "r1"
	    for (k=0;k<$columns;k++) {
		    $m[r1][k] = $m[r2][k];
        }
        
	    // copy the temp row into "r2"
	    for (t=0;t<$columns;t++) {
		    $m[r2][t] = tempRow.$m[0][t];
		}
    }

// ------------------------------------------------------------

    // 17. elemCMA
    function elemCMA(r1,s,r2:Number):Void {
    
        var j:Number;
    
	    // temp matrix to keep from changing the value of "r1" -- same 
	    // dimensions as "this" but all extra elements are zero
	    var temp:Matrix =  new Matrix($rows,$columns);

	    // initialize to a zero matrix
	    temp.constant(0);

	    // copy "r1" of this matrix into "tempRow"
	    for (j=0;j<$columns;j++) {
		    temp.$m[r2][j] = $m[r1][j];
		}

	    // multiply "tempRow" by the constant "s"
	    temp.elemConstant(r2,s);

	    // add "this" and "temp" together
	    this.addition(this,temp);
    }

// ------------------------------------------------------------

    // 18. rowReduce
    function rowReduce():Void {
    
        var j,k:Number;
    
	    if ($rows==$columns) {
		    this.identity();
	    } else if ($rows<$columns) {
		    for (j=0;j<$rows;j++) {
			    if (j<($columns-1) && $m[j][j]==0) {
				    this.elemSwitch(j,j+1);
			    } else if ($m[j][j]==0) {
				    break;
				}

			    this.elemConstant(j,1/$m[j][j]);
			    for (k=0;k<$rows; k++) {
				    if (j!=k) this.elemCMA(j,-$m[k][j],k);
				}
		    }
		}
    }

// ------------------------------------------------------------

	// 19. print - used for debugging -- prints matrix properties
	function print():Void {
	
	    var j:Number;
	    
	    trace ("ELEMENTS:");
	    for (j=0;j<$rows;j++) {
		    trace ($m[j]);
		}
	    trace ("Matrix Rows:    "+$rows);
	    trace ("Matrix Columns: "+$columns+newline);
    }

// ------------------------------------------------------------

    // 20. copy - copy this matrix into m1 
    function copy(m1:Matrix):Void {

        var j,k:Number;
        
	    // mopy elements
	    for (j=0;j<$rows;j++) {
		    for (k=0;k<$columns;k++) {
			    m1.$m[j][k] = $m[j][k];
		    }
	    }
    }

// ------------------------------------------------------------

    // 21. rotationX - loads a rotation matrix for a rotation around 
    // the x-axis given the sine and cosine of the rotation angle
    function rotationX(sine,cosine:Number):Void {
    
        // set the elements of the rotation matrix
        $m[0][0] = 1.0; $m[0][1] = 0.0;    $m[0][2] = 0.0;
        $m[1][0] = 0.0; $m[1][1] = cosine; $m[1][2] = -sine;
        $m[2][0] = 0.0; $m[2][1] = sine;   $m[2][2] = cosine;
    }

// ------------------------------------------------------------

    // 22. rotationY - loads a rotation matrix for a rotation around 
    // the y-axis given the sine and cosine of the rotation angle
    function rotationY(sine,cosine:Number):Void {
    
        // set the elements of the rotation matrix
        $m[0][0] = cosine; $m[0][1] = 0.0; $m[0][2] = sine;
        $m[1][0] = 0.0;	   $m[1][1] = 1.0; $m[1][2] = 0.0;
        $m[2][0] = -sine;  $m[2][1] = 0.0; $m[2][2] = cosine;
    }

// ------------------------------------------------------------

    // 23. rotationZ - loads a rotation matrix for a rotation around 
    // the z-axis given the sine and cosine of the rotation angle
    function rotationZ(sine,cosine:Number):Void {
    
        // set the elements of the rotation matrix
        $m[0][0] = cosine; $m[0][1] = -sine;  $m[0][2] = 0.0;
        $m[1][0] = sine;   $m[1][1] = cosine; $m[1][2] = 0.0;
        $m[2][0] = 0.0;    $m[2][1] = 0.0;    $m[2][2] = 1.0;
    }

// ------------------------------------------------------------

    // 24. rotationAxis - loads a rotation matrix about a unit vector 
    // given the sine and cosine of the rotation angle
    function rotationAxis(V:Vector,sine,cosine:Number):Void {
    
        var t:Number = 1-cosine;
	
        // set the elements of the rotation matrix
        $m[0][0] = t*V.x*V.x+cosine;
        $m[0][1] = t*V.x*V.y-sine*V.z;
        $m[0][2] = t*V.x*V.z+sine*V.y;
	
        $m[1][0] = t*V.x*V.y+sine*V.z;
        $m[1][1] = t*V.y*V.y+cosine;
        $m[1][2] = t*V.y*V.z-sine*V.x;
	
        $m[2][0] = t*V.x*V.z-sine*V.y;
        $m[2][1] = t*V.y*V.z+sine*V.x;
        $m[2][2] = t*V.z*V.z+cosine;
    }

}

