<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml"
	      doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
	      doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
	      encoding="utf-8"
	      indent="no"/>    

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


  <xsl:template match="/">
    <html>
      <head>
	<title><xsl:value-of select="$title"/></title>
	<style type="text/css">	  
	  body {
	      font: 14.34px/20px arial, sans-serif;
	      color: #333333;
	      background-color: #FEFEFE;
	  }
	  
	  div.page {
	      width: 960px;
	  }

	  *.label {
	      font-style: italic;
	      font-weight: bold;
	  }
	  
	  div.head {
	      border-left: 4px solid #CCCCCC;
	      border-right: 4px solid #CCCCCC;
	      background-color: #F9F9F9;
	      padding: 4px 10px;
	      font-size: 16pt;
	      font-weight: bold;
	      color: #222222;
	      margin: 10px 0px;	      
	  }
	  
	  div.section{
	      margin: 10pt 5pt;
	  }
	  
	  div.content{
	      margin-left: 5pt;
	  }

	  *.name {
	      margin: 10pt 5pt;
	      font-size: 18pt;	      
	      font-weight: bold;
	  }

	  table.job-head {
	      border-bottom: 1pt dashed #CCCCCC;
	      font-size: 13pt;
	      font-weight: bold;
	  }

	  div.project div.name {
	      font-weight: bold;
	      font-size: 12pt;
	      margin: 5pt 0pt;
	  }

	  div.task div.title {
	      font-weight: bold;
	      font-size: 11pt;
	      margin: 5pt 0pt;
	  }
	  
	  div.skill ul {
	      margin: 0pt;
	  }
	</style>
      </head>
      <body>
	<div class="page">
	  <xsl:apply-templates/>
	</div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="name">
    <div class="name">
      <xsl:value-of select="."/>
    </div>
  </xsl:template>

  <xsl:template match="profile">
    <div class="profile section">
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="profile/gender">
    <span class="label"><xsl:value-of select="$gender"/> : </span><xsl:value-of select="."/><br />
  </xsl:template>

  <xsl:template match="profile/birthday">
    <span class="label"><xsl:value-of select="$birthday"/> : </span><xsl:value-of select="."/><br />
  </xsl:template>

  <xsl:template match="profile/telephone">
    <span class="label"><xsl:value-of select="$tel"/> : </span><xsl:value-of select="."/><br />
  </xsl:template>

  <xsl:template match="profile/email">
    <span class="label"><xsl:value-of select="$email"/> : </span><xsl:value-of select="."/><br />
  </xsl:template>

  <xsl:template match="profile/experience">
    <span class="label"><xsl:value-of select="$experience"/> : </span><xsl:value-of select="."/><br />
  </xsl:template>

  <xsl:template match="academy">
    <div class="education section">
      <div class="head"><xsl:value-of select="$education"/></div>
      <div class="content">
	<table width="100%">
	  <colgroup>
	    <col width="20%"/>
	    <col width="20%"/>
	    <col width="60%"/>
	  </colgroup>
	  <tbody>
	    <xsl:apply-templates/>
	</tbody>
	</table>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="academy/duration">
    <tr>
      <td align="left">
	<xsl:value-of select="from"/> - <xsl:value-of select="to"/>
      </td>
      <td align="left">
	<xsl:value-of select="degree"/>
      </td>
      <td align="right">
	<xsl:value-of select="major"/>, <xsl:value-of select="school"/>
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="history">
    <div class="section history">
      <div class="head">
	<xsl:value-of select="$history"/>
      </div>
      <div class="content">
	<xsl:for-each select="job">
	  <xsl:call-template name="job"/>
	</xsl:for-each>
      </div>      
    </div>            
  </xsl:template>

  <xsl:template name="job-head">
    <xsl:param name="from"/>
    <xsl:param name="to"/>
    <xsl:param name="organization"/>
    <xsl:param name="title"/>
    
    <table width="100%" class="job-head">
      <colgroup>
	<col width="25%"/>
	<col width="25%"/>
	<col width="50%"/>
	<tbody>
	  <tr>
	    <td align="left"><xsl:value-of select="$from"/> - <xsl:value-of select="$to"/></td>
	    <td align="left"><xsl:value-of select="$title"/></td>
	    <td align="right"><xsl:value-of select="$organization"/></td>
	  </tr>
	</tbody>
      </colgroup>
    </table>
  </xsl:template>

  <xsl:template name="job">
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
  </xsl:template>

  <xsl:template match="projects">
    <ul class="projects">
      <xsl:for-each select="project">
	<li>
	  <xsl:call-template name="project"/>
	</li>
      </xsl:for-each>
    </ul>
  </xsl:template>

  <xsl:template name="project">
    <div class="project">
      <div class="name"><xsl:value-of select="name"/></div>
      <div class="description">
	<xsl:value-of select="description"/>
      </div>
      <xsl:apply-templates select="taskset"/>
    </div>
    </xsl:template>  
    
  <xsl:template match="taskset">
    <ul class="tasks">
      <xsl:for-each select="task">
	<li>	
	  <xsl:call-template name="task"/>
	</li>      
      </xsl:for-each>
    </ul>
  </xsl:template>

  <xsl:template name="task">
    <div class="task">
      <div class="title">
	<xsl:value-of select="title"/>
      </div>
      <xsl:apply-templates select="keywords"/>
      <xsl:apply-templates select="responsibility"/>
    </div>
  </xsl:template>

  <xsl:template match="keywords">
    <span class="label"><xsl:value-of select="$keywords"/> : </span><xsl:value-of select="."/>
  </xsl:template>

  <xsl:template match="task/responsibility">
    <ul class="responsibility">
      <xsl:for-each select="item">
	<li>
	  <xsl:value-of select="."/>
	</li>
      </xsl:for-each>
    </ul>
  </xsl:template>

  <xsl:template match="skillset">
    <div class="skills section">
      <div class="head"><xsl:value-of select="$skills"/></div>
      <div class="content">
	<xsl:for-each select="skill">
	  <xsl:call-template name="skill"/>
	</xsl:for-each>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="skill">
    <div class="skill">
      <span class="label">
	<xsl:value-of select="title"/> : 
      </span>    
      <xsl:apply-templates select="description"/>
    </div>
  </xsl:template>

  <xsl:template match="skill/description">
    <xsl:if test="count(item) &gt; 0 ">
      <ul>
	<xsl:for-each select="item">
	  <li>
	    <xsl:value-of select="."/>
	  </li>
	</xsl:for-each>
      </ul>
    </xsl:if>
    <xsl:if test="count(item) = 0">
      <xsl:value-of select="."/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="awards">
    <div class="awards">
      <div class="head">
	<xsl:value-of select="$awards"/>
      </div>
      <div class="content">	
	<table width="100%">
	  <colgroup>
	    <col width="10pt"/>
	    <col width="80%"/>
	    <col/>
	  </colgroup>
	  <tbody>
	  <xsl:for-each select="award">
	    <tr>
	      <td> - </td>
	      <xsl:call-template name="award"/>
	    </tr>
	  </xsl:for-each>
	  </tbody>
	</table>	    
      </div>
    </div>
  </xsl:template>

  <xsl:template name="award">
    <td align="left">
      <xsl:value-of select="description"/>
    </td>
    <td align="right">
	  <xsl:value-of select="time/year"/>
    </td>
  </xsl:template>
</xsl:stylesheet>

