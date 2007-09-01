/**
 * -----------------------------------------------
 * @application  test_Bitwise.fla
 * @appVersion   test_Bitwise0.1.as
 * @appUpdate    June 26, 2004
 * -----------------------------------------------
 * @class        com.wis.math.alg.Bitwise
 * @author       Richard Wright - wisolutions2002@shaw.ca
 * @version      1.4
 * @description  Implements the static behaviours of the Bitwise Class.
 *               <p>
 *		         All methods in this class are static, allowing for inline bitwise 
 *               operations without the need for class instantiation.
 *		         <p>
 * @usage        <pre>Bitwise.binMethod(binArg)</pre>
 * @param        none
 * @update       June 20, 2004
 * -----------------------------------------------
 * AS2 revision copyright © 2003, Richard Wright [wisolutions2002@shaw.ca]
 * AS1 original copyright © 2002, Jos Juffermans [jjuffermans@CHELLO.com]
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
 *   Functions:
 *          Bitwise()
 *              1.  binToDec(bin)
 *              2.  decToBin(dec)
 *              3.  binPad(bin,len)
 *              4.  binOr(bin1,bin2,..,binN)
 *              5.  binAnd(bin1,bin2,..,binN)
 *              6.  binXor(bin1,bin2,..,binN)
 *              7.  binNot(bin)
 *              8.  binInvert(bin)
 *              9.  binInvert64(bin)
 *              10. binShiftLeft(bin,pos)
 *              11. binShiftRight(bin,pos)
 *              12. binShiftRightUnsigned(bin,pos)
 *  ----------------------------------------------
 *  Updates may be available at:
 *              http://members.shaw.ca/flashprogramming/wisASLibrary/wis/
 *  ----------------------------------------------
**/
  
//class com.wis.math.alg.Bitwise 
//{ 
	/**
	 * @property none no class properties
	**/
	
// -----------------------------------------------

import com.wis.math.alg.Bitwise;

input_str = "\n 1.  binToDec(bin): -01001 binary = <FONT color='#0000FF'>"+Bitwise.binToDec("-01001")+"</FONT> decimal\n";
input_str += " 2.  decToBin(dec): -9 decimal = <FONT color='#0000FF'>"+Bitwise.decToBin(-9)+"</FONT> binary\n";
input_str += " 3.  binPad(bin,len): -9 decimal = <FONT color='#0000FF'>"+Bitwise.binPad(Bitwise.decToBin(-9),8)+"</FONT> 8 bits binary\n";
input_str += " 4.  binPad(bin,len): 9 decimal = <FONT color='#0000FF'>"+Bitwise.binPad(Bitwise.decToBin(9),32)+"</FONT> 32 bits binary\n";
input_str += " 5.  binPad(bin1,len): -9 decimal = <FONT color='#0000FF'>"+Bitwise.binPad(Bitwise.decToBin(-9),64)+"</FONT> 64 bits binary\n";
input_str += " 6.  binOr(bin1,bin2): 01001 | 1010 = <FONT color='#0000FF'>"+Bitwise.binOr("01001","1010")+"</FONT>\n";
input_str += " 7.  binOr(bin1,bin2,..,binN): 110001 | 000100 | 000111 = <FONT color='#0000FF'>"+Bitwise.binOr("110001","000100","000111")+"</FONT>\n";
input_str += " 8.  binAnd(bin1,bin2,..,binN): 01001 & 1010 = <FONT color='#0000FF'>"+Bitwise.binAnd("01001","1010")+"</FONT>\n";
input_str += " 9.  binXor(bin1,bin2,..,binN): 01001 ^ 1010 = <FONT color='#0000FF'>"+Bitwise.binXor("01001","1010")+"</FONT>\n";
input_str += " 10. binNot(bin): ~ 01001 = <FONT color='#0000FF'>"+Bitwise.binNot("01001")+"</FONT>\n";
input_str += " 11. binInvert(bin): inv 01001 = <FONT color='#0000FF'>"+Bitwise.binInvert("01010101010101010101010101010101")+"</FONT>\n";
input_str += " 12. binInvert64(bin): inv64 01001 = <FONT color='#0000FF'>"+Bitwise.binInvert64(Bitwise.binPad(Bitwise.decToBin(987654321),64))+"</FONT>\n";
input_str += " 13. binShiftLeft(bin,pos): -01001 &lt;&lt; 2 = <FONT color='#0000FF'>"+Bitwise.binShiftLeft("-01001",2)+"</FONT>\n";
input_str += " 14. binShiftRight(bin,pos): -01001 &gt;&gt; 2 = <FONT color='#0000FF'>"+Bitwise.binShiftRight("-01001",2)+"</FONT>\n";
input_str += " 15. binShiftRightUInsigned(bin,pos): -01001 &gt;&gt;&gt; 2 = <FONT color='#0000FF'>"+Bitwise.binShiftRightUnsigned("-01001",2)+"</FONT>";                

this.createTextField("input_txt",++depth,0,50,0,0);
input_txt.autoSize = "left";
input_txt.selectable = false;
input_txt.multiline = true;
input_txt.html = true;
input_txt.htmlText = input_str;

// trace properties
//trace ("\n#### Bitwise Properties ####\n");
//for (arguments in Bitwise) {
//    trace (arguments+":"+Bitwise[arguments]);
//}