<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output indent="yes" method="text"/>


<!-- These must be provided externally, probably by ant -->
<xsl:param name="datestamp"/>
<xsl:param name="online_prefix"/>


<xsl:template match="/resume">
<xsl:text>
---
title: Resume
author: grahame
type: page
---
</xsl:text>

# <xsl:value-of select="contact/name"/> <xsl:text>
</xsl:text>
<xsl:value-of select="contact/url"/>
<xsl:text> &#160;&#160;&#160;&#160;&#160; | </xsl:text>
<xsl:value-of select="contact/email"/>
<xsl:text>
--- | ---
</xsl:text>
<xsl:if test="contact/street"><xsl:value-of select="contact/street"/>, </xsl:if><xsl:value-of select="contact/city"/><xsl:text>, </xsl:text><xsl:value-of select="contact/state"/> <xsl:text> </xsl:text> <xsl:value-of select="contact/zip"/>
<xsl:text> | </xsl:text>
<xsl:for-each select="contact/phone">
  <xsl:value-of select="."/>
</xsl:for-each>
<xsl:text>
* * *
</xsl:text>
<xsl:text>Last Updated on </xsl:text><xsl:value-of select="$datestamp"/>.  Also available in <xsl:for-each select="online/formats/format">
  <xsl:if test="position() != 1"><xsl:text>, </xsl:text></xsl:if>
  [<xsl:value-of select="."/>](<xsl:value-of select="../../base"/>/<xsl:value-of select="$online_prefix"/>.<xsl:value-of select="@extension"/>)</xsl:for-each>.
Visit <xsl:value-of select="online/source"/> to see the code that created this resume.
<xsl:text>
* * *
</xsl:text>

## KEYWORD SUMMARY
<xsl:for-each select="keywords/keyword">
  <xsl:if test="position() != 1">
        <xsl:text>, </xsl:text>
      </xsl:if>
  <xsl:value-of select="."/>
</xsl:for-each>


## OBJECTIVE
<xsl:value-of select="objective"/>


## HIGHLIGHTS<xsl:for-each select="highlights/highlight">
* <xsl:value-of select="."/>
</xsl:for-each>


## CORE COMPETENCIES<xsl:for-each select="competencies/competency">
* <xsl:value-of select="."/>
</xsl:for-each>


## EXPERIENCE
<xsl:for-each select="experience/job">
### <xsl:value-of select="title"/>, *<xsl:value-of select="start_date"/> - <xsl:value-of select="end_date"/>*
#### <xsl:value-of select="company/name"/> <xsl:text>  -  </xsl:text>  *<xsl:value-of select="company/location"/>*
<xsl:text>
</xsl:text>
##### <xsl:for-each select="org/*">
  <xsl:value-of select="."/>
  <xsl:if test="position() != last()">, </xsl:if>
</xsl:for-each>
<xsl:text>
</xsl:text>
<xsl:for-each select="tasks/task">
* <xsl:value-of select="."/>
</xsl:for-each>
<xsl:text>
</xsl:text>
</xsl:for-each>


## COMPUTER SKILLS
### Computer Languages:
<xsl:for-each select="skills/languages/language">
  <xsl:if test="position() != 1">
        <xsl:text>, </xsl:text>
      </xsl:if>
  <xsl:value-of select="."/>
</xsl:for-each>

### Databases:
<xsl:for-each select="skills/databases/database">
  <xsl:if test="position() != 1">
        <xsl:text>, </xsl:text>
  </xsl:if>
  <xsl:value-of select="."/>
</xsl:for-each>

### Platforms:
<xsl:for-each select="skills/platforms/platform">
  <xsl:if test="position() != 1">
        <xsl:text>, </xsl:text>
  </xsl:if>
  <xsl:value-of select="."/>
</xsl:for-each>

### Tools:
<xsl:for-each select="skills/tools/tool">
  <xsl:text>  </xsl:text>**<xsl:value-of select="@category" />**: <xsl:value-of select="."/>
<xsl:text>

</xsl:text>

</xsl:for-each>
### Operating Systems:
<xsl:for-each select="skills/oses/os">
  <xsl:if test="position() != 1">
        <xsl:text>, </xsl:text>
  </xsl:if>
  <xsl:value-of select="."/>
</xsl:for-each>



## PUBLICATIONS
<xsl:for-each select="publications/publication">"<xsl:value-of select="title"/>"<xsl:text>
</xsl:text>
<xsl:value-of select="description"/>
Published: <xsl:value-of select="publisher"/>, <xsl:value-of select="publish_date"/>
<xsl:text>

</xsl:text>
</xsl:for-each>

## EDUCATION
<xsl:for-each select="education/experience">
<xsl:value-of select="start_date"/> - <xsl:value-of select="end_date"/>
<xsl:text> </xsl:text>
<xsl:value-of select="institution/name"/><xsl:text>  </xsl:text><xsl:value-of select="institution/location"/>
<xsl:text>
</xsl:text>
<xsl:if test="degree!=''">
<xsl:value-of select="degree"/><xsl:text>
</xsl:text>
</xsl:if>
<xsl:value-of select="highlights"/>
<xsl:text>

</xsl:text>
</xsl:for-each>

## REFERENCES
<xsl:for-each select="references/reference">
<xsl:value-of select="."/>
</xsl:for-each>

</xsl:template>

</xsl:stylesheet>
