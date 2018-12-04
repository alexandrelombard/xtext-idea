/*******************************************************************************
 * Copyright (c) 2015, 2016 itemis AG (http://www.itemis.eu) and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package org.eclipse.xtext.idea.extensions

import com.intellij.openapi.application.ApplicationManager
import org.eclipse.emf.ecore.EPackage
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.resource.IResourceServiceProvider

/**
 * @author kosyakov - Initial contribution and API
 */
class EcoreGlobalRegistries {

	new() {
		val packageRegistry = EPackage.Registry.INSTANCE
		EPackageEP.EP_NAME.extensionList.forEach [
			packageRegistry.put(nsURI, createDescriptor)
		]

		val extensionToFactoryMap = Resource.Factory.Registry.INSTANCE.extensionToFactoryMap
		ResourceFactoryEP.EP_NAME.extensionList.forEach [
			extensionToFactoryMap.put(type, createDescriptor)
		]
		

		val registry = IResourceServiceProvider.Registry.INSTANCE 
		ResourceServiceProviderEP.EP_NAME.extensionList.forEach [
			if (uriExtension !== null)
				registry.extensionToFactoryMap.put(uriExtension, createDescriptor)
			if (protocolName !== null)
				registry.protocolToFactoryMap.put(protocolName, createDescriptor)
			if (contentTypeIdentifier !== null)
				registry.contentTypeToFactoryMap.put(contentTypeIdentifier, createDescriptor)
		]
	}

	static def ensureInitialized() {
		ApplicationManager.application.getComponent(EcoreGlobalRegistries)
	}

}