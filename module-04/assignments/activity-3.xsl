<?xml version="1.0" encoding="UTF-8"?>
<!-- xsl stylesheet declaration with xsl namespace: 
Namespace tells the xlst processor about which 
element is to be processed and which is used for output purpose only 
--> 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">   
<!-- xsl template declaration:  
template tells the xlst processor about the section of xml 
document which is to be formatted. It takes an XPath expression. 
In our case, it is matching document root element and will 
tell processor to process the entire document with this template. 
--> 
  <xsl:template match="/"> 
    <!-- HTML tags 
      Used for formatting purpose. Processor will skip them and browser 
      will simply render them. 
    --> 
		
    <html> 
      <body> 
        <h2>Products</h2> 
				
        <table border="1"> 
          <tr bgcolor="#9acd32"> 
            <th>Product Name</th> 
            <th>sku</th>
            <th>Creted At</th>
            <th>Is Shiped</th>
            <th>manufacturer</th> 
            <th>description</th> 
            <th>prices</th> 
            <th>productItems</th> 
          </tr> 
				
          <!-- for-each processing instruction 
            Looks for each element matching the XPath expression 
          --> 
          <xsl:for-each select="products/product"> 
            <tr> 
             <td><xsl:value-of select="productName"/></td> 
              <td> 
                <!-- value-of processing instruction 
                  process the value of the element matching the XPath expression 
                --> 
                <xsl:value-of select="@sku"/> 
              </td> 
              <td><xsl:value-of select="@createdAt"/></td> 
              <td><xsl:value-of select="@shippable"/></td> 
              <td><xsl:value-of select="manufacturer"/></td> 
              <td><xsl:value-of select="description"/></td>
              <!-- <td><xsl:value-of select="prices"/></td>  -->
              <td>
                    <ul>
                        <li><xsl:value-of select="prices/price[1]"/></li>
                        <li><xsl:value-of select="prices/price[2]"/></li>
                        <li><xsl:value-of select="prices/price[3]"/></li>
                    </ul>
                </td> 
              <td><xsl:value-of select="productItems"/></td> 
						</tr> 
          </xsl:for-each> 
        </table> 
      </body> 
    </html> 
  </xsl:template>  
</xsl:stylesheet>