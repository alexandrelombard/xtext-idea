/*
 * generated by Xtext
 */
package org.eclipse.xtext.lexer.idea.facet;

import com.intellij.facet.Facet;
import com.intellij.facet.FacetTypeId;
import org.eclipse.xtext.idea.facet.AbstractFacetType;
import org.eclipse.xtext.lexer.idea.lang.BacktrackingLexerTestLanguageLanguage;

public class BacktrackingLexerTestLanguageFacetType extends AbstractFacetType<BacktrackingLexerTestLanguageFacetConfiguration> {

	public static final FacetTypeId<Facet<BacktrackingLexerTestLanguageFacetConfiguration>> TYPEID = new FacetTypeId<Facet<BacktrackingLexerTestLanguageFacetConfiguration>>("org.eclipse.xtext.lexer.BacktrackingLexerTestLanguage");

	public BacktrackingLexerTestLanguageFacetType() {
		super(TYPEID, "org.eclipse.xtext.lexer.BacktrackingLexerTestLanguage", "BacktrackingLexerTestLanguage");
		BacktrackingLexerTestLanguageLanguage.INSTANCE.injectMembers(this);
	}
}
