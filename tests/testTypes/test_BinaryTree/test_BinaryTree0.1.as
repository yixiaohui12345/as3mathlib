import com.wis.types.lists.BinaryTree;

this.lineStyle();
this.moveTo(0,0);
this.lineTo(600,0);
this.lineTo(600,310);
this.lineTo(0,310);
this.lineTo(0,0);

reDraw_btn.onRelease = function() {
	reDraw();
};

reDraw = function() {

    var data_arr:Array = [];
	var other_arr:Array = [];
    var data:Number;
	var lookupData:Number = Number(lookupData_txt.text);
	var newData:Number = Number(newData_txt.text);
	var sum:Number = Number(sum_txt.text);
	var numKeys:Number = Number(numKeys_txt.text);
	var temp_arr = data_txt.text.split(",");
	var temp2_arr = other_txt.text.split(",");
	var j:Number;

    for (j=0;j<temp_arr.length;j++) {
	    data_arr.push(Number(temp_arr[j]));
    }
	
	for (j=0;j<temp2_arr.length;j++) {
	    other_arr.push(Number(temp2_arr[j]));
    }
	
	var bt:BinaryTree = new BinaryTree();
	var other:BinaryTree = new BinaryTree();
	
	for (j=0;j<data_arr.length;j++) {
		bt.insert(data_arr[j]);
	}
	
	for (j=0;j<other_arr.length;j++) {
		other.insert(data_arr[j]);
	}
	
	input_str = " 1.  lookup(lookupData): <FONT color='#0000FF'>"+bt.lookup(lookupData)+"</FONT>\n";
    //(private function)input_str += " 2.  lookupRecurs(node,data): <FONT color='#0000FF'>"+bt.lookupRecurs(node,data)+"</FONT>\n";
	bt.insert(newData);
    input_str += " 3.  insert(newData): no return (see debug)\n";
    //(private function)input_str += " 4.  insertRecurs(node,data): <FONT color='#0000FF'>"+bt.insertRecurs(node,data)+"</FONT>\n";
    input_str += " 5.  size(): <FONT color='#0000FF'>"+bt.size()+"</FONT>\n";
    //(private function)input_str += " 6.  sizeRecurs(node): <FONT color='#0000FF'>"+bt.sizeRecurs(node)+"</FONT>\n";
    input_str += " 7.  maxDepth(): <FONT color='#0000FF'>"+bt.maxDepth()+"</FONT>\n";
    //(private function)input_str += " 8.  maxDepthRecurs(node): <FONT color='#0000FF'>\n"+bt.maxDepthRecurs(node)+"</FONT>\n";
    input_str += " 9.  minValue(): <FONT color='#0000FF'>"+bt.minValue()+"</FONT>\n";
    //(private function)input_str += " 10. minValueIter(node): <FONT color='#0000FF'>"+bt.minValueIter(node)+"</FONT>\n";
    input_str += " 11. maxValue(): <FONT color='#0000FF'>"+bt.maxValue()+"</FONT>\n";
    //(private function)input_str += " 12. maxValueIter(node): <FONT color='#0000FF'>"+bt.maxValueIter(node)+"</FONT>\n";
    bt.printTree();
	input_str += " 13. printTree(): no return (see debug)\n";
    //(private function)input_str += " 14. printTreeRecurs(node): <FONT color='#0000FF'>\n"+bt.printTreeRecurs(node)+"</FONT>\n";
    bt.printPostOrder();
	input_str += " 15. printPostOrder(): no return (see debug)\n";
    //(private function)input_str += " 16. printPostOrderRecurs(node): <FONT color='#0000FF'>"+bt.printPostOrderRecurs(node)+"</FONT>\n";
    input_str += " 17. hasPathSum(sum): <FONT color='#0000FF'>"+bt.hasPathSum(sum)+"</FONT>\n";
    //(private function)input_str += " 18. hasPathSumRecurs(node,sum): <FONT color='#0000FF'>"+bt.hasPathSumRecurs(node,sum)+"</FONT>\n";
    bt.printPaths();
	input_str += " 19. printPaths(): no return (see debug)\n";
    //(private function)input_str += " 20. printPathsRecurs(node,path,pathLen): <FONT color='#0000FF'>"+bt.printPathsRecurs(node,path,pathLen)+"</FONT>\n";
    //(private function)input_str += " 21. printArray(ints,len): <FONT color='#0000FF'>"+bt.printArray(ints,len)+"</FONT>\n";
    bt.mirror();
	input_str += " 22. mirror(): no return (see debug)\n";
    //(private function)input_str += " 23. mirrorRecurs(node): <FONT color='#0000FF'>"+bt.mirrorRecurs(node)+"</FONT>\n";
    bt.doubleTree();
	input_str += " 24. doubleTree(): no return (see debug)\n";
    //(private function)input_str += " 25. doubleTreeRecurs(node): <FONT color='#0000FF'>"+bt.doubleTreeRecurs(node)+"</FONT>\n";
    input_str += " 26. sameTree(other): <FONT color='#0000FF'>"+bt.sameTree(other)+"</FONT>\n";
    //(private function)input_str += " 27. sameTreeRecurs(a,b): <FONT color='#0000FF'>"+bt.sameTreeRecurs(a,b)+"</FONT>\n";
    input_str += " 28. countTreesRecurs(numKeys): <FONT color='#0000FF'>"+BinaryTree.countTreesRecurs(numKeys)+"</FONT>\n";
    input_str += " 29. isBST(): <FONT color='#0000FF'>"+bt.isBST()+"</FONT>\n";
    //(private function)input_str += " 30. isBSTRecurs(node): <FONT color='#0000FF'>"+bt.isBSTRecurs(node)+"</FONT>\n";
    input_str += " 31. isBST2(): <FONT color='#0000FF'>"+bt.isBST2()+"</FONT>\n";
    //(private function)input_str += " 32. isBST2Recurs(node,min,max): <FONT color='#0000FF'>"+bt.isBST2Recurs(node,min,max)+"</FONT>\n";

    input_txt.htmlText = input_str;
	debug_ta.text = bt.debug_str;
};

reDraw();

this.createTextField("input_txt",++depth,0,70,0,0);
input_txt.autoSize = "left";
input_txt.selectable = false;
input_txt.multiline = true;
input_txt.html = true;
input_txt.htmlText = input_str;

// trace properties
//trace ("\n#### BinaryTree Properties ####\n");
//for (arguments in BinaryTree) {
//    trace (arguments+":"+BinaryTree[arguments]);
//}