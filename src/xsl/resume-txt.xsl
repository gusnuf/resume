<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output indent="yes" method="text" />


<!-- These must be provided externally, probably by ant -->
<xsl:param name="datestamp" />
<xsl:param name="online_prefix" />


<xsl:template match="/resume">

<xsl:value-of select="contact/name" /> <xsl:text>
</xsl:text>
<xsl:if test="contact/street"><xsl:value-of select="contact/street" />, </xsl:if><xsl:value-of select="contact/city" /><xsl:text
    >, </xsl:text><xsl:value-of select="contact/state" /> <xsl:text> </xsl:text> <xsl:value-of select="contact/zip" />
<xsl:text>  </xsl:text>
<xsl:if test="contact/phone/@type='h'">Home: <xsl:value-of select="contact/phone[@type='h']" /></xsl:if><xsl:text>  </xsl:text><xsl:if
      test="contact/phone/@type='m'"
    >Cell: <xsl:value-of select="contact/phone[@type='m']" /></xsl:if>
Email: <xsl:value-of select="contact/email" />    Web: <xsl:value-of select="contact/url" />
----------------------------------------------------
<xsl:text>Last Updated: </xsl:text><xsl:value-of select="$datestamp" />

Visit <xsl:value-of select="online/base" /> for the most current version, available in <xsl:for-each select="online/formats/format">
			<xsl:if test="position() != 1">
				<xsl:text>, </xsl:text>
			</xsl:if>
    		<xsl:value-of select="." />
    	</xsl:for-each> versions, or <xsl:value-of select="online/source" /> to see the code that created this resume.

SUMMARY
<xsl:value-of select="summary" />

HIGHLIGHTS<xsl:for-each select="highlights/highlight">
* <xsl:value-of select="." />
</xsl:for-each>

EXPERIENCE
<xsl:for-each select="experience/job">
<xsl:value-of select="title" />, <xsl:value-of select="start_date" /> - <xsl:value-of select="end_date" />
<xsl:text>      </xsl:text>  <xsl:value-of select="company/name" /> <xsl:text>   </xsl:text>  <xsl:value-of select="company/location" />
<xsl:text>
</xsl:text>
<xsl:for-each select="org/*">
  <xsl:value-of select="." />
  <xsl:if test="position() != last()">, </xsl:if>
</xsl:for-each>
<xsl:for-each select="tasks/task">
* <xsl:value-of select="." />
</xsl:for-each>
<xsl:text>

</xsl:text>
</xsl:for-each>


COMPUTER SKILLS
Computer Languages:
<xsl:for-each select="skills/languages/language">
  <xsl:if test="position() != 1">
        <xsl:text>, </xsl:text>
      </xsl:if>
  <xsl:value-of select="." />
</xsl:for-each>

Databases:
<xsl:for-each select="skills/databases/database">
  <xsl:if test="position() != 1">
        <xsl:text>, </xsl:text>
  </xsl:if>
  <xsl:value-of select="." />
</xsl:for-each>

Platforms:
<xsl:for-each select="skills/platforms/platform">
  <xsl:if test="position() != 1">
        <xsl:text>, </xsl:text>
  </xsl:if>
  <xsl:value-of select="." />
</xsl:for-each>

Tools:
<xsl:for-each select="skills/tools/tool">
  <xsl:text>  </xsl:text><xsl:value-of select="@category" />: <xsl:value-of select="." />
<xsl:text>
</xsl:text>

</xsl:for-each>



<xsl:if test="publications/publication">
PUBLICATIONS
<xsl:for-each select="publications/publication">"<xsl:value-of select="title" />"<xsl:text>
</xsl:text>
<xsl:value-of select="description" />
Published: <xsl:value-of select="publisher" /><xsl:if test="publish_date">, <xsl:value-of select="publish_date" /></xsl:if>
<xsl:text>

</xsl:text>
</xsl:for-each>
</xsl:if>

EDUCATION
<xsl:for-each select="education/experience">
<xsl:if test="start_date and end_date"><xsl:value-of select="start_date" /> - <xsl:value-of select="end_date" />
<xsl:text> </xsl:text></xsl:if>
<xsl:value-of select="institution/name" /><xsl:text>  </xsl:text><xsl:value-of select="institution/location" />
<xsl:text>
</xsl:text>
<xsl:if test="degree!=''">
<xsl:value-of select="degree" /><xsl:text>
</xsl:text>
</xsl:if>
<xsl:value-of select="highlights" />
<xsl:text>

</xsl:text>
</xsl:for-each>

REFERENCES
<xsl:for-each select="references/reference">
<xsl:value-of select="." />
</xsl:for-each>

</xsl:template>

</xsl:stylesheet>
