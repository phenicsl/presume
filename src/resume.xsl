<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:template match="/">
    <fo:root>
      <fo:layout-master-set>
	<fo:simple-page-master master-name="A4" 
			       page-height="297mm"
			       page-width="210mm"
			       margin-top="10mm"
			       margin-bottom="10mm"
			       margin-left="10mm"
			       margin-right="10mm">
	  <fo:region-body margin="15mm"/>
	  <fo:region-before extent="20mm"/>
	  <fo:region-after extent="20mm"/>
	  <fo:region-start extent="10mm"/>
	  <fo:region-end extent="10mm"/>
	</fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="A4">
      <fo:flow flow-name="xsl-region-body">
	  <xsl:apply-templates/>
      </fo:flow>
      </fo:page-sequence>
  </fo:root>
  </xsl:template>

  <!-- define indicator for each head -->
  <xsl:template name="indicator">
    <fo:block>
      <fo:instream-foreign-object xmlns:svg="http://www.w3.org/2000/svg">
	<svg:svg width="20mm" height="5pt">
	  <svg:g style="fill:rgb(42, 155, 201)">
	    <svg:rect x="0" y="0" width="5cm" height="7pt"/>
	  </svg:g>
	</svg:svg>
      </fo:instream-foreign-object>
    </fo:block>
  </xsl:template>

  <!-- head with indicator support -->
  <xsl:template name="head">
    <xsl:param name="title"/>
    <fo:table-row>
      <fo:table-cell padding-right="4mm"
		     text-align="right">
	<xsl:call-template name="indicator"/>	
      </fo:table-cell>
      <fo:table-cell text-align="left">
	<fo:block font-weight="bold"
		  font-size="12pt">
	  <xsl:value-of select="$title"/>
	</fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>

  <!-- output the name part of it-->
  <xsl:template match="name">
    <fo:block font-family="Times"
	      font-weight="bold"
	      font-size="14pt"
	      margin-bottom="2mm">
      <xsl:value-of select="."/>
    </fo:block>
  </xsl:template>

  <xsl:template match="info">
    <fo:block font-size="10pt"
	      font-family="Times">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  
  <xsl:template match="info/gender">
    <fo:block>
      <fo:inline font-weight="bold">Gender : </fo:inline>
      <fo:inline><xsl:value-of select="."/></fo:inline>
    </fo:block>
  </xsl:template>
  
  <xsl:template match="info/telephone">
    <fo:block>
      <fo:inline font-weight="bold">Tel : </fo:inline>
      <fo:inline><xsl:value-of select="."/></fo:inline>
    </fo:block>    
  </xsl:template>
  
  <xsl:template match="info/email">
    <fo:block>
      <fo:inline font-weight="bold">Email : </fo:inline>
      <fo:inline><xsl:value-of select="."/></fo:inline>
    </fo:block>    
  </xsl:template>
  
  <xsl:template match="info/experience">
    <fo:block>
      <fo:inline font-weight="bold">Work Expience:</fo:inline>
      <fo:inline><xsl:value-of select="."/></fo:inline>
    </fo:block>
  </xsl:template>

  <xsl:template match="academics">
    <fo:block font-family="Times"
	      font-size="10pt">
      <fo:table width="160mm"
		table-layout="fixed"
		border="solid 1pt black">
	<fo:table-column column-width="24mm"/>
	<fo:table-column column-width="36mm"/>
	<fo:table-column column-width="100mm"/>
	<fo:table-body>
	  <fo:table-row>
	    <fo:table-cell>
	      <xsl:call-template name="indicator"/>
	    </fo:table-cell>
	    <fo:table-cell display-align="center"
			   number-columns-spanned="2">
		<fo:block font-weight="bold"	
			  font-size="12pt">
		  Education Background
		</fo:block>			
	    </fo:table-cell>
	  </fo:table-row>
	  <xsl:apply-templates />
	</fo:table-body>
      </fo:table>
    </fo:block>
  </xsl:template>

  <xsl:template match="academics/duration">
    <fo:table-row>
      <fo:table-cell text-align="right">
	<fo:block font-style="italic" 
		  margin-right="4mm">
	  <fo:inline><xsl:value-of select="from"/></fo:inline>
	  <fo:inline> - </fo:inline>
	  <fo:inline><xsl:value-of select="to"/></fo:inline>
	</fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="left">
	<fo:block>
	  <xsl:value-of select="degree"/>
	</fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="right">
	<fo:block>
	  <fo:inline><xsl:value-of select="major"/></fo:inline>
	  <fo:inline>, </fo:inline>
	  <fo:inline><xsl:value-of select="school"/></fo:inline>
	</fo:block>
      </fo:table-cell>
    </fo:table-row>    
  </xsl:template>

  <xsl:template match="history">
    <fo:block font-family="Times"
	      font-size="10pt"
	      margin-top="2mm">
      <fo:table width="160mm"
		table-layout="fixed">
	<fo:table-column column-width="24mm"/>
	<fo:table-column column-width="136mm"/>
	<fo:table-body>
	  <xsl:call-template name="head">
	    <xsl:with-param name="title">
	      <xsl:text>Employment History</xsl:text>
	    </xsl:with-param>
	  </xsl:call-template>
	  <xsl:apply-templates/>
	</fo:table-body>
      </fo:table>
    </fo:block>
  </xsl:template>

  <xsl:template match="history/job">
    <fo:table-row>
      <fo:table-cell text-align="right"
		     padding-right="4mm"
		     font-style="italic">
	<fo:block font-style="italic">
	  <fo:inline><xsl:value-of select="duration/from"/></fo:inline>
	  <fo:inline> - </fo:inline>
	  <fo:inline><xsl:value-of select="duration/to"/></fo:inline>
	  <fo:inline> :</fo:inline>
	</fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="left">
	<fo:block>
	  <fo:block font-weight="bold">
	    <fo:inline><xsl:value-of select="title"/></fo:inline>
	    <fo:inline padding="2em"/>
	    <fo:inline><xsl:value-of select="company"/></fo:inline>
	  </fo:block>	  
	</fo:block>
      </fo:table-cell>
    </fo:table-row>
    <xsl:apply-templates select="projects"/>
  </xsl:template>
  
  <!-- empty cell-->
  <xsl:template name="empty-cell">
    <fo:table-cell>
      <fo:block/>
    </fo:table-cell>
  </xsl:template>

  <xsl:template match="projects">
    <xsl:for-each select="project">      
	<xsl:call-template name="project"/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="project">
    <fo:table-row>
      <xsl:call-template name="empty-cell"/>
      <fo:table-cell text-align="left">
	<fo:block font-weight="bold">
	  <xsl:value-of select="name"/>
	</fo:block>
	<fo:block>
	  <xsl:value-of select="description"/>
	  <xsl:apply-templates select="taskset"/>
	</fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>

  <xsl:template match="taskset">
    <xsl:for-each select="task">
      <xsl:call-template name="task"/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="task">
    <fo:block font-weight="bold">
      <xsl:value-of select="title"/>
    </fo:block>
    <xsl:apply-templates select="key-words"/>
    <xsl:apply-templates select="description"/>
  </xsl:template>

  <xsl:template match="key-words">
    <fo:block>
      <fo:inline font-weight="bold">Key Word: </fo:inline>
      <fo:inline><xsl:value-of select="."/></fo:inline>
    </fo:block>
  </xsl:template>

  <xsl:template match="description">
    <fo:block>
      <xsl:value-of select="description"/>
    </fo:block>
  </xsl:template>
</xsl:stylesheet>