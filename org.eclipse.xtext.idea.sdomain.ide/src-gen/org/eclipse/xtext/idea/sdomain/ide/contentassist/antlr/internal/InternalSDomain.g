/*******************************************************************************
 * Copyright (c) 2015 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
grammar InternalSDomain;

options {
	superClass=AbstractInternalContentAssistParser;
}

@lexer::header {
package org.eclipse.xtext.idea.sdomain.ide.contentassist.antlr.internal;

// Hack: Use our own Lexer superclass by means of import. 
// Currently there is no other way to specify the superclass for the lexer.
import org.eclipse.xtext.ide.editor.contentassist.antlr.internal.Lexer;
}

@parser::header {
package org.eclipse.xtext.idea.sdomain.ide.contentassist.antlr.internal;

import java.io.InputStream;
import org.eclipse.xtext.*;
import org.eclipse.xtext.parser.*;
import org.eclipse.xtext.parser.impl.*;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.ide.editor.contentassist.antlr.internal.AbstractInternalContentAssistParser;
import org.eclipse.xtext.ide.editor.contentassist.antlr.internal.DFA;
import org.eclipse.xtext.idea.sdomain.services.SDomainGrammarAccess;

}
@parser::members {
	private SDomainGrammarAccess grammarAccess;

	public void setGrammarAccess(SDomainGrammarAccess grammarAccess) {
		this.grammarAccess = grammarAccess;
	}

	@Override
	protected Grammar getGrammar() {
		return grammarAccess.getGrammar();
	}

	@Override
	protected String getValueForTokenName(String tokenName) {
		return tokenName;
	}
}

// Entry rule entryRuleFile
entryRuleFile
:
{ before(grammarAccess.getFileRule()); }
	 ruleFile
{ after(grammarAccess.getFileRule()); } 
	 EOF 
;

// Rule File
ruleFile 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getFileAccess().getElementsAssignment()); }
		(rule__File__ElementsAssignment)*
		{ after(grammarAccess.getFileAccess().getElementsAssignment()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleImport
entryRuleImport
:
{ before(grammarAccess.getImportRule()); }
	 ruleImport
{ after(grammarAccess.getImportRule()); } 
	 EOF 
;

// Rule Import
ruleImport 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getImportAccess().getGroup()); }
		(rule__Import__Group__0)
		{ after(grammarAccess.getImportAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleQualifiedNameWithWildCard
entryRuleQualifiedNameWithWildCard
:
{ before(grammarAccess.getQualifiedNameWithWildCardRule()); }
	 ruleQualifiedNameWithWildCard
{ after(grammarAccess.getQualifiedNameWithWildCardRule()); } 
	 EOF 
;

// Rule QualifiedNameWithWildCard
ruleQualifiedNameWithWildCard 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getQualifiedNameWithWildCardAccess().getGroup()); }
		(rule__QualifiedNameWithWildCard__Group__0)
		{ after(grammarAccess.getQualifiedNameWithWildCardAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleQualifiedName
entryRuleQualifiedName
:
{ before(grammarAccess.getQualifiedNameRule()); }
	 ruleQualifiedName
{ after(grammarAccess.getQualifiedNameRule()); } 
	 EOF 
;

// Rule QualifiedName
ruleQualifiedName 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getQualifiedNameAccess().getGroup()); }
		(rule__QualifiedName__Group__0)
		{ after(grammarAccess.getQualifiedNameAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleNamespace
entryRuleNamespace
:
{ before(grammarAccess.getNamespaceRule()); }
	 ruleNamespace
{ after(grammarAccess.getNamespaceRule()); } 
	 EOF 
;

// Rule Namespace
ruleNamespace 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getNamespaceAccess().getGroup()); }
		(rule__Namespace__Group__0)
		{ after(grammarAccess.getNamespaceAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleElement
entryRuleElement
:
{ before(grammarAccess.getElementRule()); }
	 ruleElement
{ after(grammarAccess.getElementRule()); } 
	 EOF 
;

// Rule Element
ruleElement 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getElementAccess().getAlternatives()); }
		(rule__Element__Alternatives)
		{ after(grammarAccess.getElementAccess().getAlternatives()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleType
entryRuleType
:
{ before(grammarAccess.getTypeRule()); }
	 ruleType
{ after(grammarAccess.getTypeRule()); } 
	 EOF 
;

// Rule Type
ruleType 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getTypeAccess().getAlternatives()); }
		(rule__Type__Alternatives)
		{ after(grammarAccess.getTypeAccess().getAlternatives()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleEntity
entryRuleEntity
:
{ before(grammarAccess.getEntityRule()); }
	 ruleEntity
{ after(grammarAccess.getEntityRule()); } 
	 EOF 
;

// Rule Entity
ruleEntity 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getEntityAccess().getGroup()); }
		(rule__Entity__Group__0)
		{ after(grammarAccess.getEntityAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleDatatype
entryRuleDatatype
:
{ before(grammarAccess.getDatatypeRule()); }
	 ruleDatatype
{ after(grammarAccess.getDatatypeRule()); } 
	 EOF 
;

// Rule Datatype
ruleDatatype 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getDatatypeAccess().getGroup()); }
		(rule__Datatype__Group__0)
		{ after(grammarAccess.getDatatypeAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

// Entry rule entryRuleProperty
entryRuleProperty
:
{ before(grammarAccess.getPropertyRule()); }
	 ruleProperty
{ after(grammarAccess.getPropertyRule()); } 
	 EOF 
;

// Rule Property
ruleProperty 
	@init {
		int stackSize = keepStackSize();
	}
	:
	(
		{ before(grammarAccess.getPropertyAccess().getGroup()); }
		(rule__Property__Group__0)
		{ after(grammarAccess.getPropertyAccess().getGroup()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Element__Alternatives
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getElementAccess().getNamespaceParserRuleCall_0()); }
		ruleNamespace
		{ after(grammarAccess.getElementAccess().getNamespaceParserRuleCall_0()); }
	)
	|
	(
		{ before(grammarAccess.getElementAccess().getTypeParserRuleCall_1()); }
		ruleType
		{ after(grammarAccess.getElementAccess().getTypeParserRuleCall_1()); }
	)
	|
	(
		{ before(grammarAccess.getElementAccess().getImportParserRuleCall_2()); }
		ruleImport
		{ after(grammarAccess.getElementAccess().getImportParserRuleCall_2()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Type__Alternatives
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getTypeAccess().getEntityParserRuleCall_0()); }
		ruleEntity
		{ after(grammarAccess.getTypeAccess().getEntityParserRuleCall_0()); }
	)
	|
	(
		{ before(grammarAccess.getTypeAccess().getDatatypeParserRuleCall_1()); }
		ruleDatatype
		{ after(grammarAccess.getTypeAccess().getDatatypeParserRuleCall_1()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Import__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Import__Group__0__Impl
	rule__Import__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Import__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getImportAccess().getImportKeyword_0()); }
	'import'
	{ after(grammarAccess.getImportAccess().getImportKeyword_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Import__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Import__Group__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Import__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getImportAccess().getImportedNamespaceAssignment_1()); }
	(rule__Import__ImportedNamespaceAssignment_1)
	{ after(grammarAccess.getImportAccess().getImportedNamespaceAssignment_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__QualifiedNameWithWildCard__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__QualifiedNameWithWildCard__Group__0__Impl
	rule__QualifiedNameWithWildCard__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__QualifiedNameWithWildCard__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getQualifiedNameWithWildCardAccess().getQualifiedNameParserRuleCall_0()); }
	ruleQualifiedName
	{ after(grammarAccess.getQualifiedNameWithWildCardAccess().getQualifiedNameParserRuleCall_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__QualifiedNameWithWildCard__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__QualifiedNameWithWildCard__Group__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__QualifiedNameWithWildCard__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getQualifiedNameWithWildCardAccess().getFullStopAsteriskKeyword_1()); }
	('.*')?
	{ after(grammarAccess.getQualifiedNameWithWildCardAccess().getFullStopAsteriskKeyword_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__QualifiedName__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__QualifiedName__Group__0__Impl
	rule__QualifiedName__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__QualifiedName__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getQualifiedNameAccess().getIDTerminalRuleCall_0()); }
	RULE_ID
	{ after(grammarAccess.getQualifiedNameAccess().getIDTerminalRuleCall_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__QualifiedName__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__QualifiedName__Group__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__QualifiedName__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getQualifiedNameAccess().getGroup_1()); }
	(rule__QualifiedName__Group_1__0)*
	{ after(grammarAccess.getQualifiedNameAccess().getGroup_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__QualifiedName__Group_1__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__QualifiedName__Group_1__0__Impl
	rule__QualifiedName__Group_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__QualifiedName__Group_1__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getQualifiedNameAccess().getFullStopKeyword_1_0()); }
	'.'
	{ after(grammarAccess.getQualifiedNameAccess().getFullStopKeyword_1_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__QualifiedName__Group_1__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__QualifiedName__Group_1__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__QualifiedName__Group_1__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getQualifiedNameAccess().getIDTerminalRuleCall_1_1()); }
	RULE_ID
	{ after(grammarAccess.getQualifiedNameAccess().getIDTerminalRuleCall_1_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Namespace__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Namespace__Group__0__Impl
	rule__Namespace__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Namespace__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getNamespaceAccess().getNameAssignment_0()); }
	(rule__Namespace__NameAssignment_0)
	{ after(grammarAccess.getNamespaceAccess().getNameAssignment_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Namespace__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Namespace__Group__1__Impl
	rule__Namespace__Group__2
;
finally {
	restoreStackSize(stackSize);
}

rule__Namespace__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getNamespaceAccess().getLeftCurlyBracketKeyword_1()); }
	'{'
	{ after(grammarAccess.getNamespaceAccess().getLeftCurlyBracketKeyword_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Namespace__Group__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Namespace__Group__2__Impl
	rule__Namespace__Group__3
;
finally {
	restoreStackSize(stackSize);
}

rule__Namespace__Group__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getNamespaceAccess().getElementsAssignment_2()); }
	(rule__Namespace__ElementsAssignment_2)*
	{ after(grammarAccess.getNamespaceAccess().getElementsAssignment_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Namespace__Group__3
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Namespace__Group__3__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Namespace__Group__3__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getNamespaceAccess().getRightCurlyBracketKeyword_3()); }
	'}'
	{ after(grammarAccess.getNamespaceAccess().getRightCurlyBracketKeyword_3()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Entity__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Entity__Group__0__Impl
	rule__Entity__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Entity__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getEntityAccess().getEntityKeyword_0()); }
	'entity'
	{ after(grammarAccess.getEntityAccess().getEntityKeyword_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Entity__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Entity__Group__1__Impl
	rule__Entity__Group__2
;
finally {
	restoreStackSize(stackSize);
}

rule__Entity__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getEntityAccess().getNameAssignment_1()); }
	(rule__Entity__NameAssignment_1)
	{ after(grammarAccess.getEntityAccess().getNameAssignment_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Entity__Group__2
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Entity__Group__2__Impl
	rule__Entity__Group__3
;
finally {
	restoreStackSize(stackSize);
}

rule__Entity__Group__2__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getEntityAccess().getLeftCurlyBracketKeyword_2()); }
	'{'
	{ after(grammarAccess.getEntityAccess().getLeftCurlyBracketKeyword_2()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Entity__Group__3
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Entity__Group__3__Impl
	rule__Entity__Group__4
;
finally {
	restoreStackSize(stackSize);
}

rule__Entity__Group__3__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getEntityAccess().getPropertiesAssignment_3()); }
	(rule__Entity__PropertiesAssignment_3)*
	{ after(grammarAccess.getEntityAccess().getPropertiesAssignment_3()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Entity__Group__4
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Entity__Group__4__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Entity__Group__4__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getEntityAccess().getRightCurlyBracketKeyword_4()); }
	'}'
	{ after(grammarAccess.getEntityAccess().getRightCurlyBracketKeyword_4()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Datatype__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Datatype__Group__0__Impl
	rule__Datatype__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Datatype__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getDatatypeAccess().getDatatypeKeyword_0()); }
	'datatype'
	{ after(grammarAccess.getDatatypeAccess().getDatatypeKeyword_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Datatype__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Datatype__Group__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Datatype__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getDatatypeAccess().getNameAssignment_1()); }
	(rule__Datatype__NameAssignment_1)
	{ after(grammarAccess.getDatatypeAccess().getNameAssignment_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__Property__Group__0
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Property__Group__0__Impl
	rule__Property__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Property__Group__0__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPropertyAccess().getTypeAssignment_0()); }
	(rule__Property__TypeAssignment_0)
	{ after(grammarAccess.getPropertyAccess().getTypeAssignment_0()); }
)
;
finally {
	restoreStackSize(stackSize);
}

rule__Property__Group__1
	@init {
		int stackSize = keepStackSize();
	}
:
	rule__Property__Group__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Property__Group__1__Impl
	@init {
		int stackSize = keepStackSize();
	}
:
(
	{ before(grammarAccess.getPropertyAccess().getNameAssignment_1()); }
	(rule__Property__NameAssignment_1)
	{ after(grammarAccess.getPropertyAccess().getNameAssignment_1()); }
)
;
finally {
	restoreStackSize(stackSize);
}


rule__File__ElementsAssignment
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getFileAccess().getElementsElementParserRuleCall_0()); }
		ruleElement
		{ after(grammarAccess.getFileAccess().getElementsElementParserRuleCall_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Import__ImportedNamespaceAssignment_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getImportAccess().getImportedNamespaceQualifiedNameWithWildCardParserRuleCall_1_0()); }
		ruleQualifiedNameWithWildCard
		{ after(grammarAccess.getImportAccess().getImportedNamespaceQualifiedNameWithWildCardParserRuleCall_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Namespace__NameAssignment_0
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getNamespaceAccess().getNameQualifiedNameParserRuleCall_0_0()); }
		ruleQualifiedName
		{ after(grammarAccess.getNamespaceAccess().getNameQualifiedNameParserRuleCall_0_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Namespace__ElementsAssignment_2
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getNamespaceAccess().getElementsElementParserRuleCall_2_0()); }
		ruleElement
		{ after(grammarAccess.getNamespaceAccess().getElementsElementParserRuleCall_2_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Entity__NameAssignment_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getEntityAccess().getNameIDTerminalRuleCall_1_0()); }
		RULE_ID
		{ after(grammarAccess.getEntityAccess().getNameIDTerminalRuleCall_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Entity__PropertiesAssignment_3
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getEntityAccess().getPropertiesPropertyParserRuleCall_3_0()); }
		ruleProperty
		{ after(grammarAccess.getEntityAccess().getPropertiesPropertyParserRuleCall_3_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Datatype__NameAssignment_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getDatatypeAccess().getNameIDTerminalRuleCall_1_0()); }
		RULE_ID
		{ after(grammarAccess.getDatatypeAccess().getNameIDTerminalRuleCall_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Property__TypeAssignment_0
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getPropertyAccess().getTypeTypeCrossReference_0_0()); }
		(
			{ before(grammarAccess.getPropertyAccess().getTypeTypeQualifiedNameParserRuleCall_0_0_1()); }
			ruleQualifiedName
			{ after(grammarAccess.getPropertyAccess().getTypeTypeQualifiedNameParserRuleCall_0_0_1()); }
		)
		{ after(grammarAccess.getPropertyAccess().getTypeTypeCrossReference_0_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

rule__Property__NameAssignment_1
	@init {
		int stackSize = keepStackSize();
	}
:
	(
		{ before(grammarAccess.getPropertyAccess().getNameIDTerminalRuleCall_1_0()); }
		RULE_ID
		{ after(grammarAccess.getPropertyAccess().getNameIDTerminalRuleCall_1_0()); }
	)
;
finally {
	restoreStackSize(stackSize);
}

RULE_ID : '^'? ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*;

RULE_INT : ('0'..'9')+;

RULE_STRING : ('"' ('\\' .|~(('\\'|'"')))* '"'|'\'' ('\\' .|~(('\\'|'\'')))* '\'');

RULE_ML_COMMENT : '/*' ( options {greedy=false;} : . )*'*/';

RULE_SL_COMMENT : '//' ~(('\n'|'\r'))* ('\r'? '\n')?;

RULE_WS : (' '|'\t'|'\r'|'\n')+;

RULE_ANY_OTHER : .;
