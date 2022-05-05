<?xml version="1.0" encoding="UTF-8"?>
<!--
    Document   : horariParc.xsl
    Created on : 17 de febrer de 2022, 11:38
    Author: Marc-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
 <xsl:template match="/">
    <html>
      <head>
          <title>horariParc.xsl</title>
          <meta charset="UTF-8"/>
          <link rel="stylesheet" type="text/css" href="horariParc.css"/>
      </head>
      <body>
          <header class="capcalera">
              <span>
                  <img alt="logoParc" width="50" height="50">
                      <xsl:attribute name = "src">
                          <xsl:value-of select = "parc/@logo"/>
                      </xsl:attribute>
                  </img>
              </span>
              <span class="nom">
                  <xsl:value-of select="parc/@nom"/>
              </span>
          </header>
          <header class = "dades">
              Obrim del <xsl:value-of select="parc/dates/dataObertura"/> al <xsl:value-of select="parc/dates/dataTancament"/>
          </header>
          <header class="mes">
              <xsl:value-of select="parc/horaris/mes[5]/@nom"/>
          </header>
          <section>
              <table>
                  <tr>
                      <xsl:for-each select = "parc/horaris/mes[1]/periode/diaSetmana">
                          <th>
                              <xsl:value-of select = "current()"/>
                          </th>
                      </xsl:for-each>
                  </tr>
                      <xsl:for-each select = "parc/horaris/mes[5]/periode">
                          <tr>
                              <xsl:for-each select = "diaSetmana">
                                  <td>
                                      <xsl:choose>
                                          <xsl:when test = "@diaMes">
                                              <div class = "dia">
                                                  <xsl:value-of select = "@diaMes"/>
                                              </div>
                                              <div>
                                                  <xsl:choose>
                                                      <xsl:when test = "@horaObertura">
                                                          <xsl:value-of select ="@horaObertura"/> - <xsl:value-of select = "@horaTancament"/>
                                                      </xsl:when>
                                                      <xsl:otherwise>
                                                          tancat
                                                      </xsl:otherwise>
                                                  </xsl:choose>
                                              </div>   
                                          </xsl:when>
                                      </xsl:choose>
                                  </td>
                              </xsl:for-each>
                          </tr>
                      </xsl:for-each>
              </table>
          </section>
          <footer class = "dades">
              <div>
                  <xsl:value-of select = "parc/adreca"/>
              </div>
              <div>
                  <xsl:value-of select = "parc/ciutat"/>
                  -
                  <xsl:value-of select = "parc/pais"/> 
              </div>
              <div>
                  web: 
                  <a>
                      <xsl:attribute name ="href">
                          <xsl:value-of select = "parc/paginaWeb"/>
                      </xsl:attribute>    
                      <xsl:value-of select = "parc/paginaWeb"/>
                  </a>
              </div>
          </footer>
      </body>
    </html>
    </xsl:template>
</xsl:stylesheet>