package service;
	
	import javax.xml.transform.Transformer;
	import javax.xml.transform.TransformerFactory;
	import javax.xml.transform.stream.StreamResult;
	import javax.xml.transform.stream.StreamSource;
	import java.io.File;

	public class XSLTTransformation {
	    public static void main(String[] args) throws Exception {
	        File xmlFile = new File("BanqueService.xml");
	        File xsltFile = new File("BanqueService.xsl");
	        File outputFile = new File("out.xml"); 

	        TransformerFactory transformerFactory = TransformerFactory.newInstance();
	        Transformer transformer = transformerFactory.newTransformer(new StreamSource(xsltFile));
	        transformer.transform(new StreamSource(xmlFile), new StreamResult(outputFile));
	        System.out.println("Transformation complet");
	    }
	}


