<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output indent="yes" method="html"/>



<xsl:template match="/resume">

<html>
<head>
  <title>Resume of <xsl:value-of select="contact/name"/></title>
</head>
<body>

<div id="centercontent">

	<span style="font-size:25px; font-weight:bold"><xsl:value-of select="contact/name"/></span><br/>
	<xsl:if test="contact/street">
	  <xsl:value-of select="contact/street"/>, 
	</xsl:if>
	<xsl:value-of select="contact/city"/><xsl:text>, </xsl:text><xsl:value-of select="contact/state"/>
	<xsl:text> </xsl:text><xsl:value-of select="contact/zip"/><br/>
	<table cellpadding="0" cellspacing="0">
	  <tr>
	  	<xsl:if test="contact/phone/@type='h'">
	    <th align="right">Home:&#160;</th>
	    <td><xsl:value-of select="contact/phone[@type='h']"/> (h)</td>
	    <td width="15"/>
	    </xsl:if>
        <xsl:if test="contact/phone/@type='m'">
	    <th align="right">Cell:&#160;</th>
	    <td><xsl:value-of select="contact/phone[@type='m']"/> (m)</td>
        </xsl:if>
	  </tr>
	  <tr>
	    <th align="right">Email:&#160;</th>
	    <td><xsl:value-of select="contact/email"/></td>
	    <td width="15"/>
	    <th align="right">Web:&#160;</th>
	    <td><a href="{contact/url}"><xsl:value-of select="contact/url"/></a></td>
          </tr>
	</table>

	<hr/>
    <span id="updated" style="font-size=8pt">Last Updated: <xsl:value-of select="datestamp"/>.</span><br />
    <span id="online" style="font-size=8pt">
    	Visit <a><xsl:attribute name="href"><xsl:value-of select="online/site"/></xsl:attribute><xsl:value-of select="online/site"/></a> for the most current version, available in
    	<xsl:for-each select="online/formats/format">
			<xsl:if test="position() != 1">
				<xsl:text>, </xsl:text>
			</xsl:if>
    		<a>
    		<xsl:attribute name="href">
				<xsl:value-of select="../../base"/>/<xsl:value-of select="../../prefix"/>.<xsl:value-of select="@extension"/>
    		</xsl:attribute>
    		<xsl:value-of select="."/>
    		</a>
    	</xsl:for-each> versions, or 
    	<a><xsl:attribute name="href"><xsl:value-of select="online/source"/></xsl:attribute><xsl:value-of select="online/source"/></a> to see the code that created this resume.
	</span>
	
	<p/>


	<span class="header">KEYWORD SUMMARY</span><br />
	<xsl:for-each select="keywords/keyword">
	  <xsl:if test="position() != 1">
            <xsl:text>, </xsl:text>
          </xsl:if>
	  <xsl:value-of select="."/>
	</xsl:for-each>


	<p/>

	
	<span class="header">OBJECTIVE</span><br />
	<xsl:value-of select="objective"/>


	<p/>


	<span class="header">HIGHLIGHTS</span><br />
	<ul>
	  <xsl:for-each select="highlights/highlight">
	    <li><xsl:value-of select="."/></li>
	  </xsl:for-each>
	</ul>	


	<p/>


	<span class="header">CORE COMPETENCIES</span><br/>
	<ul>
	  <xsl:for-each select="competencies/competency">
	    <li><xsl:value-of select="."/></li>
	  </xsl:for-each>
	</ul>		


	<p/>


	<span class="header">EXPERIENCE</span><br />
        <table cellpadding="7" cellspacing="0">
  	  <xsl:for-each select="experience/job">
	      <xsl:variable name="colspan">
	        <xsl:choose>
                  <xsl:when test="count(projects/project) &gt; 0">2</xsl:when>
	          <xsl:otherwise>3</xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
	    <tr>
              <td>
 	        <b><xsl:value-of select="title"/></b>, 
	        <xsl:value-of select="start_date"/> - <xsl:value-of select="end_date"/>
              </td>
	      <td>
	        <a href="{company/url}"><xsl:value-of select="company/name"/></a> 
	      </td>
              <td>
	        <xsl:value-of select="company/location"/>
              </td>
            </tr>
	    <tr>
	      <td colspan="{$colspan}" rowspan="2" valign="top">
	        <ul>
 	          <xsl:for-each select="tasks/task">
	            <li><xsl:value-of select="."/></li>
	          </xsl:for-each>
 	        </ul>
	      </td>
	      <xsl:if test="$colspan = 2">
	        <td width="25%" height="10%" bgcolor="#d4d4c4" valign="top" style="font-size:12px; font-family:helvetica">
                  <span style="font-weight:bold; text-decoration:underline">PROJECTS</span>:<br/>
	          <xsl:for-each select="projects/project">
	            <xsl:choose>
                      <xsl:when test="url">+ <a href="{url}"><xsl:value-of select="name"/></a><br/></xsl:when>
		      <xsl:otherwise>+ <xsl:value-of select="name"/><br/></xsl:otherwise>
                    </xsl:choose>
	          </xsl:for-each>
	        </td>
	        <td/>
              </xsl:if>
 	    </tr>
	    <tr>
	    <xsl:if test="$colspan = 2">
	       <td/>
	    </xsl:if>
            </tr>
	    <tr>
              <td colspan="3" height="1"/>
            </tr>
  	    </xsl:for-each>
	  </table>
	  <p/>
	
	<p/>


	<span class="header">COMPUTER SKILLS</span><br />
	<b>Computer Languages</b>:<br />
	<xsl:for-each select="skills/languages/language">
	  <xsl:if test="position() != 1">
            <xsl:text>, </xsl:text>
      </xsl:if>
	  <xsl:value-of select="."/>
 	</xsl:for-each>

	<p/>

	<b>Databases</b>:<br />
	<xsl:for-each select="skills/databases/database">
	  <xsl:if test="position() != 1">
            <xsl:text>, </xsl:text>
      </xsl:if>
	  <xsl:value-of select="."/>
 	</xsl:for-each>

	<p/>

	<b>Platforms</b>:<br />
	<xsl:for-each select="skills/platforms/platform">
	  <xsl:if test="position() != 1">
            <xsl:text>, </xsl:text>
      </xsl:if>
	  <xsl:value-of select="."/>
 	</xsl:for-each>

	<p/>

	<b>Tools</b>:<br />
	<xsl:for-each select="skills/tools/tool">
	  &#160;&#160;<b><xsl:value-of select="@category" /></b><xsl:text>: </xsl:text><xsl:value-of select="."/><br />
 	</xsl:for-each>

	<p/>

	<b>OSes</b>:<br />
	<xsl:for-each select="skills/oses/os">
	  <xsl:if test="position() != 1">
            <xsl:text>, </xsl:text>
      </xsl:if>
	  <xsl:value-of select="."/>
 	</xsl:for-each>

	
	<p/>

	<span class="header">PUBLICATIONS</span><br />
    <table>
	<xsl:for-each select="publications/publication">
	  <u><xsl:value-of select="title"/></u>
      <br />
      <xsl:value-of select="description"/>
      <br />
      <b>Published</b>: <xsl:value-of select="publisher"/>, <xsl:value-of select="publish_date"/>
      <p/>
	</xsl:for-each>
    </table>

    <p/>

	<span class="header">EDUCATION</span><br/>
	<xsl:for-each select="education/experience">
	  <xsl:value-of select="start_date"/> - <xsl:value-of select="end_date"/><xsl:text> </xsl:text>
	  <a href="{institution/url}"><xsl:value-of select="institution/name"/></a>
      <xsl:text> </xsl:text><xsl:value-of select="institution/location"/><br />
      <xsl:if test="degree!=''">
        <xsl:value-of select="degree"/><br />
      </xsl:if>
	  <xsl:value-of select="highlights"/>
	  <p/>
	</xsl:for-each>


	<p/>


	<span class="header">REFERENCES</span><br/>
	<xsl:for-each select="references/reference">
	  <xsl:value-of select="."/>
	</xsl:for-each>

</div>

</body>
</html>

</xsl:template>

</xsl:stylesheet>
