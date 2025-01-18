<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <!-- Match the specific recipe by name -->
    <xsl:template match="/">
        <xsl:apply-templates select="recipes/recipe[name='pantofel']"/>
    </xsl:template>

    <xsl:template match="recipe">
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <link rel="stylesheet" href="style-recipe.css"/>
                <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono&amp;display=swap" rel="stylesheet"/>
                <title>
                    <xsl:value-of select="name"/>
                </title>
            </head>
            <body>
                <div id="header">
                    <h1>
                        <xsl:value-of select="name"/>
                    </h1>
                </div>
                <div id="content">
                    <div id="left">
                        <img>
                            <xsl:attribute name="src">
                                <xsl:text>../recipe-images/</xsl:text>
                                <xsl:value-of select="img"/>
                            </xsl:attribute>
                            <xsl:attribute name="alt">
                                <xsl:value-of select="name"/>
                            </xsl:attribute>
                        </img>
                        <h2>składniki:</h2>
                        <ul class="grocery-list">
                            <xsl:for-each select="ingridients/i">
                                <li>
                                    <input type="checkbox"/>
                                    <label>
                                        <xsl:value-of select="."/>
                                    </label>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                    <div id="right">
                        <h2>przepis:</h2>
                        <xsl:for-each select="directions/step">
                            <h3>
                                <xsl:value-of select="@stepName"/>
                            </h3>
                            <p>
                                <xsl:value-of select="."/>
                            </p>
                        </xsl:for-each>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
