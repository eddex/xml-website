# xml-website
A web project based on XML technologies

## problems, solutions & usefull stuff

### my xsd desn't work :(
* make sure you use a **good** IDE.
* Atom, Sublime, VS Code etc. are cool but are horrible at validating XSDs
* use IntelliJ, NetBeans or another IDE with proper XML/XSD/XSLT/FO/SVG validation

### FO-XML namespace not found in IntelliJ
1. download XML schema [XSL:FO](https://svn.apache.org/repos/asf/xmlgraphics/fop/trunk/fop/src/foschema/fop.xsd)
2. in IntelliJ go to File > Settings > Languages & Frameworks > Schemas & DTDs
3. Add new External Schema with URI *http://www.w3.org/1999/XSL/Format* and the XSL:FO schema from step 1

### error or empty page when opened in the browser
* do not use a browser that has the [METAMASK](https://metamask.io/) extension installed, otherwise everything crashes
and you will be reconsidering all the choices you have taken in your life ¯\\_(ツ)_/¯

### how to access other XML files in XSLT
* use a constant XSLT variable: [xml.com](https://www.xml.com/pub/a/2002/03/06/xslt.html)
* same thing but different: [techrepublic.com](https://www.techrepublic.com/article/accessing-multiple-documents-with-xslt/)

### how to use glyphicons
* [referencce on w3schools](https://www.w3schools.com/bootstrap/bootstrap_ref_comp_glyphs.asp)

## open source software
* [Glyphicons from Twitter Bootstrap](https://github.com/twbs/bootstrap/)
* [Bootstrap "Flatly" theme](https://bootswatch.com/flatly/)
* [Bootstrap "Cyborg" theme](https://bootswatch.com/cyborg/)