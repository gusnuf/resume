<?xml version="1.0"?> <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
xmlns:fox="http://xml.apache.org/fop/extensions">


<!-- These must be provided externally, probably by ant -->
<xsl:param name="datestamp"/>
<xsl:param name="online_prefix"/>


  <xsl:template match="/">

    <fo:root
        xmlns:fo="http://www.w3.org/1999/XSL/Format"
        xmlns:fox="http://xml.apache.org/fop/extensions">

      <fo:layout-master-set>
        <fo:simple-page-master
        margin-right="1.5cm"
        margin-left="1.5cm"
        margin-bottom="1cm"
        margin-top="1cm"
        page-width="21cm"
        page-height="29.7cm"
        master-name="first">
          <fo:region-body margin-top="1cm" margin-bottom="1cm"/>
          <fo:region-before extent="1cm"/>
          <fo:region-after extent=".7cm"/>
        </fo:simple-page-master>
      </fo:layout-master-set>

        <!-- Bookmarks Section -->
        <fox:outline internal-destination="contact">
            <fox:label>Contact</fox:label>
        </fox:outline>
        <fox:outline internal-destination="keywords">
            <fox:label>Keywords</fox:label>
        </fox:outline>
        <fox:outline internal-destination="objective">
            <fox:label>Objective</fox:label>
        </fox:outline>
        <fox:outline internal-destination="highlights">
            <fox:label>Highlights</fox:label>
        </fox:outline>
        <fox:outline internal-destination="competencies">
            <fox:label>Competencies</fox:label>
        </fox:outline>
        <fox:outline internal-destination="experience">
            <fox:label>Experience</fox:label>
        </fox:outline>
        <fox:outline internal-destination="skills">
            <fox:label>Skills</fox:label>

            <fox:outline internal-destination="languages">
                <fox:label>Computer Languages</fox:label>
            </fox:outline>
            <fox:outline internal-destination="databases">
                <fox:label>Databases</fox:label>
            </fox:outline>
            <fox:outline internal-destination="appservers">
                <fox:label>Application Servers</fox:label>
            </fox:outline>
            <fox:outline internal-destination="tools">
                <fox:label>Development Tools</fox:label>
            </fox:outline>
            <fox:outline internal-destination="oses">
                <fox:label>Operating Systems</fox:label>
            </fox:outline>
        </fox:outline>
        <fox:outline internal-destination="publications">
            <fox:label>Publications</fox:label>
        </fox:outline>
        <fox:outline internal-destination="education">
            <fox:label>Education</fox:label>
        </fox:outline>
        <fox:outline internal-destination="references">
            <fox:label>References</fox:label>
        </fox:outline>
        <!-- End Bookmarks -->


    <fo:page-sequence master-reference="first">
        <fo:static-content flow-name="xsl-region-before">
          <fo:block line-height="14pt" font-size="10pt"
            text-align="end"><xsl:value-of select="resume/contact/name"/></fo:block>
        </fo:static-content>
        <fo:static-content flow-name="xsl-region-after">
          <fo:block line-height="14pt" font-size="10pt"
            text-align="end">Page <fo:page-number/></fo:block>
        </fo:static-content>

        <fo:flow flow-name="xsl-region-body">
            <fo:block font-size="9pt"><xsl:apply-templates/></fo:block>
        </fo:flow>
    </fo:page-sequence>
    </fo:root>
  </xsl:template>

<xsl:template match="resume">

    <fo:table
        id="contact"
        padding="5pt"
        background-color="#c4c4b4"
        border-width="0.5pt"
        border-color="#000000"
        border-style="solid">
        <fo:table-column column-width="6.5cm"/>
        <fo:table-column column-width="1.2cm"/>
        <fo:table-column column-width="4cm"/>
        <fo:table-column column-width="1cm"/>
        <fo:table-column column-width="4cm"/>
        <fo:table-body>
            <fo:table-row>
                <fo:table-cell>
                    <fo:block font-size="18pt" font-weight="bold"><xsl:value-of select="contact/name"/></fo:block>
                </fo:table-cell>
				<fo:table-cell>
				  <fo:block><xsl:text> </xsl:text></fo:block>
				</fo:table-cell>
				<fo:table-cell>
				  <fo:block><xsl:text> </xsl:text></fo:block>
				</fo:table-cell>
				<fo:table-cell>
				  <fo:block><xsl:text> </xsl:text></fo:block>
				</fo:table-cell>
				<fo:table-cell>
				  <fo:block><xsl:text> </xsl:text></fo:block>
				</fo:table-cell>
            </fo:table-row>
            <fo:table-row>
                <fo:table-cell>
		  			<fo:block>
              	    <xsl:if test="contact/street"><xsl:value-of select="contact/street"/></xsl:if>
                  </fo:block>
                </fo:table-cell>
				 <xsl:choose>
				 <xsl:when test="contact/phone/@type='h'">
					<fo:table-cell>
						<fo:block>Home:<xsl:text> </xsl:text></fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block><xsl:value-of select="contact/phone[@type='h']"/></fo:block>
					</fo:table-cell>
				 </xsl:when>
				 <xsl:otherwise>
						<fo:table-cell>
						  <fo:block><xsl:text> </xsl:text></fo:block>
						</fo:table-cell>
						<fo:table-cell>
						  <fo:block><xsl:text> </xsl:text></fo:block>
						</fo:table-cell>
				 </xsl:otherwise>
				 </xsl:choose>

				 <xsl:choose>
					 <xsl:when test="contact/phone/@type='m'">
						<fo:table-cell>
							<fo:block>Cell:<xsl:text> </xsl:text></fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block><xsl:value-of select="contact/phone[@type='m']"/></fo:block>
						</fo:table-cell>
					 </xsl:when>
				 <xsl:otherwise>
						<fo:table-cell>
						  <fo:block><xsl:text> </xsl:text></fo:block>
						</fo:table-cell>
						<fo:table-cell>
						  <fo:block><xsl:text> </xsl:text></fo:block>
						</fo:table-cell>
				 </xsl:otherwise>
				 </xsl:choose>
            </fo:table-row>
            <fo:table-row>
                <fo:table-cell>
                    <fo:block>
                        <xsl:value-of select="contact/city"/>
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="contact/state"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="contact/zip"/>
                    </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                    <fo:block>Email: </fo:block>
                </fo:table-cell>

                <fo:table-cell>
                    <fo:block><xsl:value-of select="contact/email"/></fo:block>
                </fo:table-cell>

                <fo:table-cell>
                    <fo:block>Web: </fo:block>
                </fo:table-cell>

                <fo:table-cell>
                    <fo:block><xsl:value-of select="contact/url"/></fo:block>
                </fo:table-cell>
            </fo:table-row>
        </fo:table-body>
    </fo:table>

    <fo:block id="updated" font-size="8pt" keep-together="always">
        Last Updated: <xsl:value-of select="$datestamp"/>.
    </fo:block>

    <fo:block space-before="0.5cm"/>

    <fo:block id="online" font-size="8pt">
    	Visit <fo:basic-link text-decoration="underline"><xsl:attribute name="external-destination"><xsl:value-of select="online/base"/></xsl:attribute><xsl:value-of select="online/base"/></fo:basic-link>
    	for the most current version, available in
    	<xsl:for-each select="online/formats/format">
			<xsl:if test="position() != 1">
				<xsl:text>, </xsl:text>
			</xsl:if>
    		<fo:basic-link text-decoration="underline">
    		<xsl:attribute name="external-destination">
				<xsl:value-of select="../../base"/>/<xsl:value-of select="$online_prefix"/>.<xsl:value-of select="@extension"/>
    		</xsl:attribute>
    		<xsl:value-of select="."/>
    		</fo:basic-link>
    	</xsl:for-each> versions, or
    	<fo:basic-link text-decoration="underline">
    		<xsl:attribute name="external-destination"><xsl:value-of select="online/source"/></xsl:attribute><xsl:value-of select="online/source"/>
    	</fo:basic-link> to see the code that created this resume.
    </fo:block>



    <fo:block space-before="0.5cm"/>


    <fo:block
        id="keywords"
        font-size="10pt"
        font-weight="bold">KEYWORD SUMMARY</fo:block>
    <fo:block>
        <xsl:for-each select="keywords/keyword">
            <xsl:if test="position() != 1">
              <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:value-of select="."/>
        </xsl:for-each>
    </fo:block>


    <fo:block space-before="0.5cm"/>


	<fo:block
        id="objective"
        font-size="10pt"
        font-weight="bold">OBJECTIVE</fo:block>
	<fo:block><xsl:value-of select="objective"/></fo:block>


    <fo:block space-before="0.5cm"/>


    <fo:block
        id="highlights"
        font-size="10pt"
        font-weight="bold">HIGHLIGHTS</fo:block>
    <fo:list-block
        start-indent="5mm"
        provisional-distance-between-starts="2mm">

        <xsl:for-each select="highlights/highlight">
          <fo:list-item>
            <fo:list-item-label end-indent="label-end()">
              <fo:block>&#x2022;</fo:block>
            </fo:list-item-label>
            <fo:list-item-body start-indent="body-start()">
              <fo:block>
                <xsl:value-of select="."/>
              </fo:block>
            </fo:list-item-body>
          </fo:list-item>
        </xsl:for-each>
    </fo:list-block>


    <fo:block space-before="0.5cm"/>


	<fo:block
        id="competencies"
        font-size="10pt"
        font-weight="bold">CORE COMPETENCIES</fo:block>
    <fo:list-block
        start-indent="5mm"
        provisional-distance-between-starts="2mm">
        <xsl:for-each select="competencies/competency">
          <fo:list-item>
            <fo:list-item-label end-indent="label-end()">
              <fo:block>&#x2022;</fo:block>
            </fo:list-item-label>
            <fo:list-item-body start-indent="body-start()">
              <fo:block>
                <xsl:value-of select="."/>
              </fo:block>
            </fo:list-item-body>
          </fo:list-item>
        </xsl:for-each>
    </fo:list-block>


    <fo:block space-before="0.5cm"/>


	<fo:block
        id="experience"
        font-size="10pt"
        font-weight="bold">EXPERIENCE</fo:block>

    <fo:table border-width="0" padding="2">
        <fo:table-column column-width="7cm"/>
        <fo:table-column column-width="5cm"/>
        <fo:table-column column-width="7cm"/>

        <fo:table-body>
            <xsl:for-each select="experience/job">
                <fo:table-row>
                  <fo:table-cell>
                    <fo:block font-weight="bold"><xsl:value-of select="title"/></fo:block>,
                  </fo:table-cell>

                  <fo:table-cell>
                    <fo:block font-size="8pt"><xsl:value-of select="start_date"/> - <xsl:value-of select="end_date"/></fo:block>
                  </fo:table-cell>

                  <fo:table-cell>
                    <fo:block><xsl:value-of select="company/name"/></fo:block>
                  </fo:table-cell>
                </fo:table-row>

                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2">
                    <fo:block font-size="7pt" font-style="italic">
                      <xsl:for-each select="org/*">
                        <xsl:value-of select="."/>
                        <xsl:if test="position() != last()">, </xsl:if>
                      </xsl:for-each>
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell>
                    <fo:block><xsl:value-of select="company/location"/></fo:block>
                  </fo:table-cell>
                </fo:table-row>

                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" padding-bottom="8mm">
                      <fo:table>
                          <fo:table-column column-width="14cm"/>
                          <xsl:if test="count(projects/project) != 0">
                            <fo:table-column column-width="4cm"/>
                          </xsl:if>

                          <fo:table-body>
                              <fo:table-row>
                                  <fo:table-cell padding="2pt">
                                      <fo:list-block
                                          space-after="0.5cm"
                                          start-indent="5mm"
                                          provisional-distance-between-starts="2mm">

                                          <xsl:for-each select="tasks/task">
                                              <fo:list-item>
                                                <fo:list-item-label end-indent="label-end()">
                                                  <fo:block>&#x2022;</fo:block>
                                                </fo:list-item-label>
                                                <fo:list-item-body start-indent="body-start()">
                                                  <fo:block>
                                                    <xsl:value-of select="."/>
                                                  </fo:block>
                                                </fo:list-item-body>
                                              </fo:list-item>
                                          </xsl:for-each>
                                      </fo:list-block>
                                  </fo:table-cell>

                                  <xsl:if test="count(projects/project) != 0">
                                      <fo:table-cell
                                          padding="2pt"
                                          background-color="#d4d4c4"
                                          border-color="#000000"
                                          border-style="solid"
                                          border-width="0.5pt">

                                        <fo:block font-family="Times" font-size="8pt">
                                            <fo:block font-weight="bold" text-decoration="underline">PROJECTS:</fo:block>
                                            <xsl:for-each select="projects/project">
                                                <fo:block>+ <xsl:value-of select="name"/></fo:block>
                                            </xsl:for-each>
                                        </fo:block>
                                      </fo:table-cell>
                                  </xsl:if>
                              </fo:table-row>
                          </fo:table-body>

                      </fo:table>



                  </fo:table-cell>

                </fo:table-row>

                <!--fo:table-row/-->

            </xsl:for-each>
        </fo:table-body>
	  </fo:table>


    <fo:block space-before="0.5cm"/>


	<fo:block
        id="skills"
        font-size="10pt"
        font-weight="bold">COMPUTER SKILLS</fo:block>
	<fo:block
        id="languages"
        font-weight="bold">Computer Languages:</fo:block>
	<xsl:for-each select="skills/languages/language">
	  <xsl:if test="position() != 1">
            <xsl:text>, </xsl:text>
          </xsl:if>
	  <xsl:value-of select="."/>
 	</xsl:for-each>


    <fo:block space-before="0.5cm"/>


	<fo:block
        id="databases"
        font-weight="bold">Databases:</fo:block>
	<xsl:for-each select="skills/databases/database">
	  <xsl:if test="position() != 1">
            <xsl:text>, </xsl:text>
          </xsl:if>
	  <xsl:value-of select="."/>
 	</xsl:for-each>


    <fo:block space-before="0.5cm"/>


	<fo:block
        id="appservers"
        font-weight="bold">Platforms:</fo:block>
	<xsl:for-each select="skills/platforms/platform">
	  <xsl:if test="position() != 1">
            <xsl:text>, </xsl:text>
      </xsl:if>
	  <xsl:value-of select="."/>
 	</xsl:for-each>


    <fo:block space-before="0.5cm"/>


	<fo:block
        id="tools"
        font-weight="bold">Tools:</fo:block>
	<xsl:for-each select="skills/tools/tool">
	  <fo:block text-indent="2mm"><fo:inline font-weight="bold"><xsl:value-of select="@category" /></fo:inline>: <xsl:value-of select="."/></fo:block>
 	</xsl:for-each>


    <fo:block space-before="0.5cm"/>


	<fo:block
        id="oses"
        font-weight="bold">Operating Systems:</fo:block>
	<xsl:for-each select="skills/oses/os">
	  <xsl:if test="position() != 1">
            <xsl:text>, </xsl:text>
      </xsl:if>
	  <xsl:value-of select="."/>
 	</xsl:for-each>


    <fo:block space-before="1cm"/>


	<fo:block
        id="publications"
        font-size="10pt"
        font-weight="bold">PUBLICATIONS</fo:block>
	<xsl:for-each select="publications/publication">
      <fo:block space-after="0.3cm">
          <fo:block text-decoration="underline"><xsl:value-of select="title"/></fo:block>
          <fo:block><xsl:value-of select="description"/></fo:block>
          Published: <xsl:value-of select="publisher"/>, <xsl:value-of select="publish_date"/>
          <xsl:if test="language!='English'">
              <fo:block>Language: <xsl:value-of select="language"/></fo:block>
          </xsl:if>
	  </fo:block>
	</xsl:for-each>


    <fo:block space-before="0.5cm"/>


	<fo:block
        id="education"
        font-size="10pt"
        font-weight="bold">EDUCATION</fo:block>
	<xsl:for-each select="education/experience">
      <fo:block space-after="0.3cm">
          <fo:block><xsl:value-of select="start_date"/> - <xsl:value-of select="end_date"/><xsl:text> </xsl:text></fo:block>
          <fo:block><xsl:value-of select="institution/name"/><xsl:text> </xsl:text><xsl:value-of select="institution/location"/></fo:block>
          <xsl:if test="degree!=''">
            <fo:block><xsl:value-of select="degree"/></fo:block>
          </xsl:if>
          <fo:block><xsl:value-of select="highlights"/></fo:block>
	  </fo:block>
	</xsl:for-each>


    <fo:block space-before="1cm"/>



	<fo:block
        id="references"
        font-size="10pt"
        font-weight="bold">REFERENCES</fo:block>
	<xsl:for-each select="references/reference">
	  <xsl:value-of select="."/>
	</xsl:for-each>

</xsl:template>


</xsl:stylesheet>
