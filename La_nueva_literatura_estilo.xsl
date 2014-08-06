<?xml version="1.0" encoding="UTF-8"?>
<!--root element por xsl file-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei" version="1.0">

    <xsl:output method="html" indent="yes" encoding="iso-8859-1" omit-xml-declaration="yes"/><!-- le dice lo que estamos haciendo?
    -->
    <!-- template son las rules de lo que queremos que xslt haga 
    MAster TEMPLATE PARA ORGANIZAR LA ESTRUCTURA DEL DOCUMENTO EN OUTPUT, INCLUIRA BASIC DIC STRUCTURE TAGS Y AND ANY PULLING/REORGANIZING OF INFORMATION FROM THE ORIGINAL
    -->
 <!-- this rule is like to look for location in the doc and hten apply the rule, where do you want to locate yourself? pero este es mas complejo pq es el master, y que nos queremos poner en la jerarquia mas alta del documento tei--> 
    
    <xsl:template match="/">
        <body>
            <xsl:apply-templates/>
        </body>

   </xsl:template>
        <!-- Ahora las reglas individuales -->
        
    <!--ahora una norma para los pbs y las miniaturas, tengo que separar el pdf en diferentes imagenes primero
    <xsl:template match="tei:pb">
        aqui un enlace a las imágenes??
    </xsl:template>
    -->
    
    <xsl:template match="tei:head">
        
        <header>
            <u><b><xsl:apply-templates/></b></u>
        </header>
    
    <!-- </xsl:template> 
        
        <xsl:template match="tei:pb">
        <A HREF="Portada Prometeo.jpg">
            
            <xsl:apply-templates/>-->
        </A>
    </xsl:template>
        <xsl:template match="tei:fw">
        <header>
            <xsl:apply-templates/>
        </header>
    </xsl:template>
    
    <xsl:template match="tei:p">
            <p>
                
                <xsl:apply-templates/>
            </p>
    
    
    <!--</xsl:template>
    
    <xsl:template match= "tei:lb">      para los lb  
        <br>
            <xsl:apply-templates/>
        </br>
    </xsl:template>
 <xsl:template match= "tei:l">
    
     <xsl:apply-templates/>
        <br/>-->  
 
 </xsl:template>
    
  <xsl:template match="tei:teiHeader"> <!-- si no ponemos nada despues de esto, simplemente no lo representa o lee o whatever -->
      
  </xsl:template>  
    
    <xsl:template match="tei:note[@type='archival']"> <!-- esto lo hacemos para dentro de un group como note elegir algunas -->
        
    </xsl:template>
    <xsl:template match="tei:note[@type='unknown'][1]">
        <h1>
            
            <xsl:apply-templates/>
        </h1>
        
    </xsl:template>
    
    <xsl:template match="tei:pb">
        <p>
            
        </p>
        
    </xsl:template>
    
    
    
    <xsl:template match="tei:pb">
        <xsl:for-each select=".">
            
            <xsl:element name="img">
                <xsl:attribute name="src">
                    <xsl:value-of select="@facs"/>
                </xsl:attribute>
                <xsl:attribute name="width">
                    100 
                </xsl:attribute>
                <xsl:attribute name="height">
                    150
                </xsl:attribute>
                
            </xsl:element>
        </xsl:for-each>
    </xsl:template>


</xsl:stylesheet>
<!--  
—Configurar: llave, elegir que xml to mess with, luego elegir el transformer, saxon 9.5.; ir a output, lo que haremos cuando este transformed.salvarlo como file html. Eso es lo que se va a guardar en mi mac. Elegir apply associated.
 
—Our file speaks tei, xsl y html, asi que hay que especificar el idioma que estamos hablando a cada momento. Richness xml es que puedes hacer todo?
en diferentes lenguas la misma palabra es diff cosas. POr eso hay que decirle en el head de nuestro file que lenguas vamos a usar y en que manera: xml, tei, html. 
xmlns:xsl esto es decir que un ns q vamos a usar es xsl

XSL having two main components, 1basicamente el menu del dia, y el resto son las recetas de lo que hay en el menu. lo primero es el master template y lo de despues minireglas

-->
