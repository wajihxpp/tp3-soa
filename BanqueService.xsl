<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
    <html>
        <head>
            <title>Liste des comptes</title>
        </head>
        <body>
            <h1>Liste des comptes</h1>
            <table border="1">
                <tr>
                    <th>Code</th>
                    <th>Solde</th>
                    <th>Date de création</th>
                </tr>
                <xsl:for-each select="BanqueService/getComptes/compte">
                    <tr>
                        <td><xsl:value-of select="code"/></td>
                        <td><xsl:value-of select="solde"/></td>
                        <td><xsl:value-of select="dateCreation"/></td>
                    </tr>
                </xsl:for-each>
            </table>

           
            <p>Total Solde: <xsl:value-of select="$totalSolde"/></p>

            <h1>Liste des comptes créés après 2000</h1>
            <table border="1">
                <tr>
                    <th>Code</th>
                    <th>Solde</th>
                    <th>Date de création</th>
                </tr>
                <xsl:for-each select="BanqueService/getComptes/compte[number(substring(dateCreation, 1, 4)) > 2000]">
                    <tr>
                        <td><xsl:value-of select="code"/></td>
                        <td><xsl:value-of select="solde"/></td>
                        <td><xsl:value-of select="dateCreation"/></td>
                    </tr>
                </xsl:for-each>
            </table>

            
            <xsl:variable name="totalSoldeFiltre" select="sum(BanqueService/getComptes/compte[number(substring(dateCreation, 1, 4)) > 2000]/solde)"/>

          
            <p>Total Solde des comptes créés après 2000: <xsl:value-of select="$totalSoldeFiltre"/></p>
        </body>
    </html>
</xsl:template>


</xsl:stylesheet>


