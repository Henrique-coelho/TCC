package com.github.mauricioaniche.ck.metric;

import com.github.mauricioaniche.ck.CKClassResult;
import com.github.mauricioaniche.ck.CKMethodResult;
import org.eclipse.jdt.core.dom.NumberLiteral;

public class NumberOfNumbers implements CKASTVisitor, ClassLevelMetric, MethodLevelMetric {

	private int qty = 0;

	@Override
	public void visit(NumberLiteral node) {
		qty++;
	}

	@Override
	public void setResult(CKMethodResult result) {
		result.setNumbersQty(qty);
	}

	@Override
	public void setResult(CKClassResult result) {
		result.setNumbersQty(qty);
	}
}
