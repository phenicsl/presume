<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:fo="http://www.w3.org/1999/XSL/Format">

  <xsl:variable name="font" select="document('lang.xml')/lang/font"/>
  <xsl:variable name="title" select="document('lang.xml')/lang/title"/>
  <xsl:variable name="gender" select="document('lang.xml')/lang/gender"/>
  <xsl:variable name="birthday" select="document('lang.xml')/lang/birthday"/>
  <xsl:variable name="tel" select="document('lang.xml')/lang/tel"/>
  <xsl:variable name="email" select="document('lang.xml')/lang/email"/>
  <xsl:variable name="experience" select="document('lang.xml')/lang/experience"/>
  <xsl:variable name="education" select="document('lang.xml')/lang/education"/>
  <xsl:variable name="history" select="document('lang.xml')/lang/history"/>
  <xsl:variable name="keywords" select="document('lang.xml')/lang/keywords"/>
  <xsl:variable name="skills" select="document('lang.xml')/lang/skills"/>
  <xsl:variable name="awards" select="document('lang.xml')/lang/awards"/>
  <xsl:variable name="responsibilities" select="document('lang.xml')/lang/responsibilities"/>

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

  <!-- empty cell-->
  <xsl:template name="empty-cell">
    <fo:table-cell>
      <fo:block/>
    </fo:table-cell>
  </xsl:template>

  <xsl:template name="head">
    <xsl:param name="title"/>
    <fo:block font-weight="bold"
	      font-size="12pt"
	      border-left="2pt solid #CCCCCC"
	      border-right="2pt solid #CCCCCC"	      
	      border-top="1px dashed #CCCCCC"
	      border-bottom="1px dashed #CCCCCC"
	      padding-top="2px"
	      padding-left="10px"
	      padding-bottom="1px"
	      margin-top="15px"
	      margin-bottom="5px"
	      margin-left="1pt">      
      <xsl:value-of select="$title"/>
    </fo:block>
  </xsl:template>  

  <!-- output the name part -->
  <xsl:template match="name">
    <fo:block font-family="{$font}"
	      font-weight="bold"
	      font-size="14pt"
	      margin-bottom="2mm">
      <xsl:value-of select="."/>
    </fo:block>
  </xsl:template>

  <xsl:template match="profile">
    <fo:block font-size="10pt"
	      font-family="{$font}">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  
  <xsl:template match="profile/gender">
    <fo:block>
      <fo:inline font-weight="bold" font-style="normal"><xsl:value-of select="$gender"/> : </fo:inline>
      <fo:inline><xsl:value-of select="."/></fo:inline>
    </fo:block>
  </xsl:template>
  
  <xsl:template match="profile/birthday">
    <fo:block>
      <fo:inline font-weight="bold" font-style="italic"><xsl:value-of select="$birthday"/> : </fo:inline>
      <fo:inline><xsl:value-of select="."/></fo:inline>
    </fo:block>
  </xsl:template>
  <xsl:template match="profile/telephone">
    <fo:block>
      <fo:inline font-weight="bold" font-style="italic"><xsl:value-of select="$tel"/> : </fo:inline>
      <fo:inline><xsl:value-of select="."/></fo:inline>
    </fo:block>    
  </xsl:template>
  
  <xsl:template match="profile/email">
    <fo:block>
      <fo:inline font-weight="bold" font-style="italic"><xsl:value-of select="$email"/> : </fo:inline>
      <fo:inline><xsl:value-of select="."/></fo:inline>
    </fo:block>    
  </xsl:template>
  
  <xsl:template match="profile/experience">
    <fo:block>
      <fo:inline font-weight="bold" font-style="italic"><xsl:value-of select="$experience"/> : </fo:inline>
      <fo:inline><xsl:value-of select="."/></fo:inline>
    </fo:block>
  </xsl:template>

  <!--
      Academies will be formated as a table with three columns.      
  -->
  <xsl:template match="academy">
    <fo:block font-family="{$font}"
	      font-size="10pt">
      <xsl:call-template name="head">
	<xsl:with-param name="title">
	  <xsl:value-of select="$education"/>
	</xsl:with-param>
      </xsl:call-template>
      <fo:block margin-left="3pt">
	<fo:table width="100%"
		  table-layout="fixed">		 
	  <fo:table-column column-width="20%"/>
	  <fo:table-column column-width="20%"/>
	  <fo:table-column column-width="60%"/>
	  <fo:table-body>
	    <xsl:apply-templates/>
	  </fo:table-body>
	</fo:table>
      </fo:block>
    </fo:block>
  </xsl:template>

  <!--
      Each is formatted as a row in the academies table
  -->
  <xsl:template match="academy/duration">
    <fo:table-row>
      <fo:table-cell text-align="left">
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
    <fo:block font-family="{$font}"
	      font-size="10pt">
      <xsl:call-template name="head">
	<xsl:with-param name="title">
	  <xsl:value-of select="$history"/>
	</xsl:with-param>
      </xsl:call-template>
      <fo:block margin-left="3pt">
	<xsl:for-each select="job">
	  <xsl:call-template name="job"/>
	</xsl:for-each>
      </fo:block>
    </fo:block>
  </xsl:template>

  <xsl:template name="job-head">
    <xsl:param name="from"/>
    <xsl:param name="to"/>
    <xsl:param name="organization"/>
    <xsl:param name="title"/>
    <fo:block margin-top="4pt"
	      margin-bottom="3pt"
	      font-weight="bold"
	      font-size="11pt">
      <fo:table width="100%" table-layout="fixed"
		border-bottom="1px dashed #CCCCCC">
	<fo:table-column column-width="30%"/>
	<fo:table-column column-width="25%"/>
	<fo:table-column column-width="45%"/>
	<fo:table-body>
	  <fo:table-row>
	    <fo:table-cell text-align="left">
	      <fo:block>
		<fo:inline><xsl:value-of select="$from"/></fo:inline>
		<fo:inline> - </fo:inline>
		<fo:inline><xsl:value-of select="$to"/></fo:inline>
	      </fo:block>
	  </fo:table-cell>
	  <fo:table-cell text-align="left">
	    <fo:block>
	      <xsl:value-of select="$title"/>
	    </fo:block>
	  </fo:table-cell>
	  <fo:table-cell text-align="right">
	    <fo:block>
	      <xsl:value-of select="$organization"/>
	    </fo:block>
	  </fo:table-cell>
	  </fo:table-row>
	</fo:table-body>
      </fo:table>
    </fo:block>
  </xsl:template>

  <xsl:template name="job">
    <fo:block margin-top="2mm"
	      margin-bottom="5mm">
      <xsl:call-template name="job-head">
	<xsl:with-param name="from">
	  <xsl:value-of select="duration/from"/>
	</xsl:with-param>
	<xsl:with-param name="to">
	  <xsl:value-of select="duration/to"/>
	</xsl:with-param>      
	<xsl:with-param name="organization">
	  <xsl:value-of select="organization"/>
	</xsl:with-param>
	<xsl:with-param name="title">
	  <xsl:value-of select="title"/>
	</xsl:with-param>
      </xsl:call-template>
      <xsl:apply-templates select="projects"/>
    </fo:block>
  </xsl:template>
  
  <!-- 
       projects are formatted in a single block
  -->
  <xsl:template match="projects">
    <fo:list-block margin-top="2mm"
		   start-indent="2mm">
      <xsl:for-each select="project">
	<fo:list-item margin-bottom="2mm">
	  <fo:list-item-label>
	    <fo:block>
	      <fo:external-graphic src="url('imgs/project.svg')"
				   content-height="1em"
				   content-width="1em"/>
	    </fo:block>
	  </fo:list-item-label>
	  <fo:list-item-body start-indent="6mm">
	    <xsl:call-template name="project"/>
	  </fo:list-item-body>
	</fo:list-item>
      </xsl:for-each>
    </fo:list-block>
  </xsl:template>

  <xsl:template name="project">
    <fo:block font-weight="bold"
	      font-size="11pt">
      <xsl:value-of select="name"/>
    </fo:block>
    <fo:block>
      <xsl:value-of select="description"/>
      <xsl:apply-templates select="taskset"/>
    </fo:block>
  </xsl:template>

  <xsl:template match="taskset">
    <xsl:for-each select="task">
      <fo:list-block provisional-distance-between-starts="4mm"
		     margin-top="2pt">
	<fo:list-item>
	  <fo:list-item-label end-indent="label-end()">
	    <fo:block>&#x2022;</fo:block>
	  </fo:list-item-label>
	  <fo:list-item-body start-indent="body-start()">
	    <xsl:call-template name="task"/>
	  </fo:list-item-body>
	</fo:list-item>
      </fo:list-block>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="task">
    <fo:block font-weight="bold">
      <xsl:value-of select="title"/>
    </fo:block>
    <xsl:apply-templates select="keywords"/>
    <xsl:apply-templates select="responsibility"/>
  </xsl:template>

  <xsl:template match="keywords">
    <fo:block>
      <fo:inline font-weight="bold" font-style="italic"><xsl:value-of select="$keywords"/> : </fo:inline>
      <fo:inline><xsl:value-of select="."/></fo:inline>
    </fo:block>
  </xsl:template>

  <xsl:template match="task/responsibility">
    <fo:block font-weight="bold" font-style="italic"><xsl:value-of select="$responsibilities"/> : </fo:block>
    <fo:list-block provisional-distance-between-starts="3mm" 
		   start-indent="12mm">
      <xsl:for-each select="item">
	<fo:list-item>
	  <fo:list-item-label>
	    <fo:block> - </fo:block>
	  </fo:list-item-label>
	  <fo:list-item-body start-indent="body-start()">
	    <fo:block>
	      <xsl:value-of select="."/>
	    </fo:block>
	  </fo:list-item-body>
	</fo:list-item>
      </xsl:for-each>    
    </fo:list-block>
  </xsl:template>

  <xsl:template match="skillset">
    <fo:block font-family="{$font}"
	      font-size="10pt">
      <xsl:call-template name="head">
	<xsl:with-param name="title">
	  <xsl:value-of select="$skills"/>
	</xsl:with-param>
      </xsl:call-template>
      <fo:block margin-left="4pt">
	<xsl:for-each select="skill">
	  <xsl:call-template name="skill"/>
	</xsl:for-each>
      </fo:block>
    </fo:block>
  </xsl:template>

  <xsl:template name="skill">
    <fo:block>
      <fo:inline font-weight="bold"
		 font-style="italic">
	<xsl:value-of select="title"/> : 
      </fo:inline>
      <fo:inline>
	  <xsl:apply-templates select="description"/>
      </fo:inline>
    </fo:block>
  </xsl:template>

  <xsl:template match="skill/description">
    <xsl:if test="count(item) &gt; 0 ">
      <fo:block margin-left="3mm">
	<fo:list-block>
	  <xsl:for-each select="item">
	    <fo:list-item>
	      <fo:list-item-label>
		<fo:block> - </fo:block>
	      </fo:list-item-label>
	      <fo:list-item-body start-indent="7mm">
		<fo:block>
		  <xsl:value-of select="."/>
		</fo:block>
	      </fo:list-item-body>
	    </fo:list-item>
	  </xsl:for-each>
	</fo:list-block>
      </fo:block>
    </xsl:if>
    <xsl:if test="count(item) = 0">
      <xsl:value-of select="."/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="awards">
    <fo:block font-family="{$font}"
	      font-size="10pt">
      <xsl:call-template name="head">
	<xsl:with-param name="title">
	  <xsl:value-of select="$awards"/>
	</xsl:with-param>
      </xsl:call-template>      
      <fo:table width="100%"
		table-layout="fixed"
		margin-left="3pt">
	<fo:table-column column-width="2%"/>
	<fo:table-column column-width="83%"/>
	<fo:table-column column-width="15%"/>
	<fo:table-body>
	  <xsl:for-each select="award">
	    <fo:table-row>
	      <fo:table-cell>
		<fo:block> - </fo:block>
	      </fo:table-cell>
	      <xsl:apply-templates select="."/>
	    </fo:table-row>
	</xsl:for-each>
	</fo:table-body>
      </fo:table>
    </fo:block>
  </xsl:template>

  <xsl:template match="awards/award">
      <fo:table-cell>
	<fo:block>
	  <xsl:value-of select="description"/>
	</fo:block>
      </fo:table-cell>
      <fo:table-cell text-align="right">
	<fo:block>
	  <xsl:value-of select="time/year"/>
	</fo:block>
      </fo:table-cell>
  </xsl:template>
</xsl:stylesheet>
