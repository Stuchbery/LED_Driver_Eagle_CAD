<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.4">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="74ac-logic">
<description>&lt;b&gt;TTL Logic Devices, 74AC11xx and 74AC16xx Series&lt;/b&gt;&lt;p&gt;
Based on the following source:
&lt;ul&gt;
&lt;li&gt;www.ti.com
&lt;/ul&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="SSOP48DL">
<description>&lt;B&gt;Shrink Small Outline Package&lt;/b&gt;</description>
<wire x1="-7.747" y1="-3.81" x2="8.382" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="8.382" y1="-3.81" x2="8.382" y2="3.81" width="0.1524" layer="21"/>
<wire x1="8.382" y1="3.81" x2="-7.747" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-7.747" y1="-3.81" x2="-7.747" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-7.493" y1="-3.5306" x2="8.128" y2="-3.5306" width="0.0508" layer="21"/>
<wire x1="8.128" y1="3.5306" x2="8.128" y2="-3.5306" width="0.0508" layer="21"/>
<wire x1="8.128" y1="3.5306" x2="-7.493" y2="3.5306" width="0.0508" layer="21"/>
<wire x1="-7.493" y1="-3.5306" x2="-7.493" y2="3.5306" width="0.0508" layer="21"/>
<circle x="-6.35" y="-2.3622" radius="0.8128" width="0.1524" layer="21"/>
<smd name="1" x="-6.985" y="-4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="2" x="-6.35" y="-4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="3" x="-5.715" y="-4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="4" x="-5.08" y="-4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="5" x="-4.445" y="-4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="6" x="-3.81" y="-4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="7" x="-3.175" y="-4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="8" x="-2.54" y="-4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="9" x="-1.905" y="-4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="10" x="-1.27" y="-4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="11" x="-0.635" y="-4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="12" x="0" y="-4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="13" x="0.635" y="-4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="14" x="1.27" y="-4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="15" x="1.905" y="-4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="16" x="2.54" y="-4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="17" x="3.175" y="-4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="18" x="3.81" y="-4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="19" x="4.445" y="-4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="20" x="5.08" y="-4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="21" x="5.715" y="-4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="22" x="6.35" y="-4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="23" x="6.985" y="-4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="24" x="7.62" y="-4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="25" x="7.62" y="4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="26" x="6.985" y="4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="27" x="6.35" y="4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="28" x="5.715" y="4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="29" x="5.08" y="4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="30" x="4.445" y="4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="31" x="3.81" y="4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="32" x="3.175" y="4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="33" x="2.54" y="4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="34" x="1.905" y="4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="35" x="1.27" y="4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="36" x="0.635" y="4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="37" x="0" y="4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="38" x="-0.635" y="4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="39" x="-1.27" y="4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="40" x="-1.905" y="4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="41" x="-2.54" y="4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="42" x="-3.175" y="4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="43" x="-3.81" y="4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="44" x="-4.445" y="4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="45" x="-5.08" y="4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="46" x="-5.715" y="4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="47" x="-6.35" y="4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<smd name="48" x="-6.985" y="4.8768" dx="0.3048" dy="1.4224" layer="1"/>
<text x="-8.001" y="-3.683" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-6.223" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.127" y1="-5.334" x2="0.127" y2="-4.0894" layer="51"/>
<rectangle x1="-0.127" y1="-4.0894" x2="0.127" y2="-3.81" layer="21"/>
<rectangle x1="0.508" y1="-4.0894" x2="0.762" y2="-3.81" layer="21"/>
<rectangle x1="1.143" y1="-4.0894" x2="1.397" y2="-3.81" layer="21"/>
<rectangle x1="1.778" y1="-4.0894" x2="2.032" y2="-3.81" layer="21"/>
<rectangle x1="2.413" y1="-4.0894" x2="2.667" y2="-3.81" layer="21"/>
<rectangle x1="3.048" y1="-4.0894" x2="3.302" y2="-3.81" layer="21"/>
<rectangle x1="3.683" y1="-4.0894" x2="3.937" y2="-3.81" layer="21"/>
<rectangle x1="4.318" y1="-4.0894" x2="4.572" y2="-3.81" layer="21"/>
<rectangle x1="4.953" y1="-4.0894" x2="5.207" y2="-3.81" layer="21"/>
<rectangle x1="5.588" y1="-4.0894" x2="5.842" y2="-3.81" layer="21"/>
<rectangle x1="6.223" y1="-4.0894" x2="6.477" y2="-3.81" layer="21"/>
<rectangle x1="6.858" y1="-4.0894" x2="7.112" y2="-3.81" layer="21"/>
<rectangle x1="-0.762" y1="-4.0894" x2="-0.508" y2="-3.81" layer="21"/>
<rectangle x1="-1.397" y1="-4.0894" x2="-1.143" y2="-3.81" layer="21"/>
<rectangle x1="-2.032" y1="-4.0894" x2="-1.778" y2="-3.81" layer="21"/>
<rectangle x1="-2.667" y1="-4.0894" x2="-2.413" y2="-3.81" layer="21"/>
<rectangle x1="-3.302" y1="-4.0894" x2="-3.048" y2="-3.81" layer="21"/>
<rectangle x1="-3.937" y1="-4.0894" x2="-3.683" y2="-3.81" layer="21"/>
<rectangle x1="-4.572" y1="-4.0894" x2="-4.318" y2="-3.81" layer="21"/>
<rectangle x1="-5.207" y1="-4.0894" x2="-4.953" y2="-3.81" layer="21"/>
<rectangle x1="-5.842" y1="-4.0894" x2="-5.588" y2="-3.81" layer="21"/>
<rectangle x1="-6.477" y1="-4.0894" x2="-6.223" y2="-3.81" layer="21"/>
<rectangle x1="-6.477" y1="-5.334" x2="-6.223" y2="-4.0894" layer="51"/>
<rectangle x1="-5.842" y1="-5.334" x2="-5.588" y2="-4.0894" layer="51"/>
<rectangle x1="-5.207" y1="-5.334" x2="-4.953" y2="-4.0894" layer="51"/>
<rectangle x1="-4.572" y1="-5.334" x2="-4.318" y2="-4.0894" layer="51"/>
<rectangle x1="-3.937" y1="-5.334" x2="-3.683" y2="-4.0894" layer="51"/>
<rectangle x1="-3.302" y1="-5.334" x2="-3.048" y2="-4.0894" layer="51"/>
<rectangle x1="-2.667" y1="-5.334" x2="-2.413" y2="-4.0894" layer="51"/>
<rectangle x1="-2.032" y1="-5.334" x2="-1.778" y2="-4.0894" layer="51"/>
<rectangle x1="-1.397" y1="-5.334" x2="-1.143" y2="-4.0894" layer="51"/>
<rectangle x1="-0.762" y1="-5.334" x2="-0.508" y2="-4.0894" layer="51"/>
<rectangle x1="-7.112" y1="-4.0894" x2="-6.858" y2="-3.81" layer="21"/>
<rectangle x1="-7.112" y1="-5.334" x2="-6.858" y2="-4.0894" layer="51"/>
<rectangle x1="0.508" y1="-5.334" x2="0.762" y2="-4.0894" layer="51"/>
<rectangle x1="1.143" y1="-5.334" x2="1.397" y2="-4.0894" layer="51"/>
<rectangle x1="1.778" y1="-5.334" x2="2.032" y2="-4.0894" layer="51"/>
<rectangle x1="2.413" y1="-5.334" x2="2.667" y2="-4.0894" layer="51"/>
<rectangle x1="3.048" y1="-5.334" x2="3.302" y2="-4.0894" layer="51"/>
<rectangle x1="3.683" y1="-5.334" x2="3.937" y2="-4.0894" layer="51"/>
<rectangle x1="4.318" y1="-5.334" x2="4.572" y2="-4.0894" layer="51"/>
<rectangle x1="4.953" y1="-5.334" x2="5.207" y2="-4.0894" layer="51"/>
<rectangle x1="5.588" y1="-5.334" x2="5.842" y2="-4.0894" layer="51"/>
<rectangle x1="6.223" y1="-5.334" x2="6.477" y2="-4.0894" layer="51"/>
<rectangle x1="6.858" y1="-5.334" x2="7.112" y2="-4.0894" layer="51"/>
<rectangle x1="-0.127" y1="3.81" x2="0.127" y2="4.0894" layer="21"/>
<rectangle x1="-7.112" y1="3.81" x2="-6.858" y2="4.0894" layer="21"/>
<rectangle x1="-6.477" y1="3.81" x2="-6.223" y2="4.0894" layer="21"/>
<rectangle x1="-5.842" y1="3.81" x2="-5.588" y2="4.0894" layer="21"/>
<rectangle x1="-5.207" y1="3.81" x2="-4.953" y2="4.0894" layer="21"/>
<rectangle x1="-4.572" y1="3.81" x2="-4.318" y2="4.0894" layer="21"/>
<rectangle x1="-3.937" y1="3.81" x2="-3.683" y2="4.0894" layer="21"/>
<rectangle x1="-3.302" y1="3.81" x2="-3.048" y2="4.0894" layer="21"/>
<rectangle x1="-2.667" y1="3.81" x2="-2.413" y2="4.0894" layer="21"/>
<rectangle x1="-2.032" y1="3.81" x2="-1.778" y2="4.0894" layer="21"/>
<rectangle x1="-1.397" y1="3.81" x2="-1.143" y2="4.0894" layer="21"/>
<rectangle x1="-0.762" y1="3.81" x2="-0.508" y2="4.0894" layer="21"/>
<rectangle x1="0.508" y1="3.81" x2="0.762" y2="4.0894" layer="21"/>
<rectangle x1="1.143" y1="3.81" x2="1.397" y2="4.0894" layer="21"/>
<rectangle x1="1.778" y1="3.81" x2="2.032" y2="4.0894" layer="21"/>
<rectangle x1="2.413" y1="3.81" x2="2.667" y2="4.0894" layer="21"/>
<rectangle x1="3.048" y1="3.81" x2="3.302" y2="4.0894" layer="21"/>
<rectangle x1="3.683" y1="3.81" x2="3.937" y2="4.0894" layer="21"/>
<rectangle x1="4.318" y1="3.81" x2="4.572" y2="4.0894" layer="21"/>
<rectangle x1="4.953" y1="3.81" x2="5.207" y2="4.0894" layer="21"/>
<rectangle x1="5.588" y1="3.81" x2="5.842" y2="4.0894" layer="21"/>
<rectangle x1="6.223" y1="3.81" x2="6.477" y2="4.0894" layer="21"/>
<rectangle x1="6.858" y1="3.81" x2="7.112" y2="4.0894" layer="21"/>
<rectangle x1="7.493" y1="3.81" x2="7.747" y2="4.0894" layer="21"/>
<rectangle x1="7.493" y1="-4.0894" x2="7.747" y2="-3.81" layer="21"/>
<rectangle x1="7.493" y1="-5.334" x2="7.747" y2="-4.0894" layer="51"/>
<rectangle x1="-0.127" y1="4.0894" x2="0.127" y2="5.334" layer="51"/>
<rectangle x1="-7.112" y1="4.0894" x2="-6.858" y2="5.334" layer="51"/>
<rectangle x1="-6.477" y1="4.0894" x2="-6.223" y2="5.334" layer="51"/>
<rectangle x1="-5.842" y1="4.0894" x2="-5.588" y2="5.334" layer="51"/>
<rectangle x1="-5.207" y1="4.0894" x2="-4.953" y2="5.334" layer="51"/>
<rectangle x1="-4.572" y1="4.0894" x2="-4.318" y2="5.334" layer="51"/>
<rectangle x1="-3.937" y1="4.0894" x2="-3.683" y2="5.334" layer="51"/>
<rectangle x1="-3.302" y1="4.0894" x2="-3.048" y2="5.334" layer="51"/>
<rectangle x1="-2.667" y1="4.0894" x2="-2.413" y2="5.334" layer="51"/>
<rectangle x1="-2.032" y1="4.0894" x2="-1.778" y2="5.334" layer="51"/>
<rectangle x1="-1.397" y1="4.0894" x2="-1.143" y2="5.334" layer="51"/>
<rectangle x1="-0.762" y1="4.0894" x2="-0.508" y2="5.334" layer="51"/>
<rectangle x1="0.508" y1="4.0894" x2="0.762" y2="5.334" layer="51"/>
<rectangle x1="1.143" y1="4.0894" x2="1.397" y2="5.334" layer="51"/>
<rectangle x1="1.778" y1="4.0894" x2="2.032" y2="5.334" layer="51"/>
<rectangle x1="2.413" y1="4.0894" x2="2.667" y2="5.334" layer="51"/>
<rectangle x1="3.048" y1="4.0894" x2="3.302" y2="5.334" layer="51"/>
<rectangle x1="3.683" y1="4.0894" x2="3.937" y2="5.334" layer="51"/>
<rectangle x1="4.318" y1="4.0894" x2="4.572" y2="5.334" layer="51"/>
<rectangle x1="4.953" y1="4.0894" x2="5.207" y2="5.334" layer="51"/>
<rectangle x1="5.588" y1="4.0894" x2="5.842" y2="5.334" layer="51"/>
<rectangle x1="6.223" y1="4.0894" x2="6.477" y2="5.334" layer="51"/>
<rectangle x1="6.858" y1="4.0894" x2="7.112" y2="5.334" layer="51"/>
<rectangle x1="7.493" y1="4.0894" x2="7.747" y2="5.334" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="7416374">
<wire x1="-10.16" y1="27.94" x2="-10.16" y2="-27.94" width="0.4064" layer="94"/>
<wire x1="7.62" y1="-27.94" x2="-10.16" y2="-27.94" width="0.4064" layer="94"/>
<wire x1="7.62" y1="-27.94" x2="7.62" y2="27.94" width="0.4064" layer="94"/>
<wire x1="-10.16" y1="27.94" x2="7.62" y2="27.94" width="0.4064" layer="94"/>
<text x="-10.16" y="28.575" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="-30.48" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1OE" x="-15.24" y="-20.32" length="middle" direction="in" function="dot"/>
<pin name="1CLK" x="-15.24" y="-17.78" length="middle" direction="in" function="clk"/>
<pin name="2OE" x="-15.24" y="-25.4" length="middle" direction="in" function="dot"/>
<pin name="2CLK" x="-15.24" y="-22.86" length="middle" direction="in" function="clk"/>
<pin name="1Q1" x="12.7" y="25.4" length="middle" direction="hiz" rot="R180"/>
<pin name="1Q2" x="12.7" y="22.86" length="middle" direction="hiz" rot="R180"/>
<pin name="1Q3" x="12.7" y="20.32" length="middle" direction="hiz" rot="R180"/>
<pin name="1Q4" x="12.7" y="17.78" length="middle" direction="hiz" rot="R180"/>
<pin name="1Q5" x="12.7" y="15.24" length="middle" direction="hiz" rot="R180"/>
<pin name="1Q6" x="12.7" y="12.7" length="middle" direction="hiz" rot="R180"/>
<pin name="1Q7" x="12.7" y="10.16" length="middle" direction="hiz" rot="R180"/>
<pin name="1Q8" x="12.7" y="7.62" length="middle" direction="hiz" rot="R180"/>
<pin name="2Q1" x="12.7" y="5.08" length="middle" direction="hiz" rot="R180"/>
<pin name="2Q2" x="12.7" y="2.54" length="middle" direction="hiz" rot="R180"/>
<pin name="2Q3" x="12.7" y="0" length="middle" direction="hiz" rot="R180"/>
<pin name="2Q4" x="12.7" y="-2.54" length="middle" direction="hiz" rot="R180"/>
<pin name="2Q5" x="12.7" y="-5.08" length="middle" direction="hiz" rot="R180"/>
<pin name="2Q6" x="12.7" y="-7.62" length="middle" direction="hiz" rot="R180"/>
<pin name="2Q7" x="12.7" y="-10.16" length="middle" direction="hiz" rot="R180"/>
<pin name="2Q8" x="12.7" y="-12.7" length="middle" direction="hiz" rot="R180"/>
<pin name="1D1" x="-15.24" y="25.4" length="middle" direction="in"/>
<pin name="1D2" x="-15.24" y="22.86" length="middle" direction="in"/>
<pin name="1D3" x="-15.24" y="20.32" length="middle" direction="in"/>
<pin name="1D4" x="-15.24" y="17.78" length="middle" direction="in"/>
<pin name="1D5" x="-15.24" y="15.24" length="middle" direction="in"/>
<pin name="1D6" x="-15.24" y="12.7" length="middle" direction="in"/>
<pin name="1D7" x="-15.24" y="10.16" length="middle" direction="in"/>
<pin name="1D8" x="-15.24" y="7.62" length="middle" direction="in"/>
<pin name="2D1" x="-15.24" y="5.08" length="middle" direction="in"/>
<pin name="2D2" x="-15.24" y="2.54" length="middle" direction="in"/>
<pin name="2D3" x="-15.24" y="0" length="middle" direction="in"/>
<pin name="2D4" x="-15.24" y="-2.54" length="middle" direction="in"/>
<pin name="2D5" x="-15.24" y="-5.08" length="middle" direction="in"/>
<pin name="2D6" x="-15.24" y="-7.62" length="middle" direction="in"/>
<pin name="2D7" x="-15.24" y="-10.16" length="middle" direction="in"/>
<pin name="2D8" x="-15.24" y="-12.7" length="middle" direction="in"/>
</symbol>
<symbol name="4PWR8GND">
<text x="-0.635" y="-0.635" size="1.778" layer="95">&gt;NAME</text>
<text x="6.985" y="2.54" size="1.27" layer="95" rot="R90">VCC</text>
<text x="14.605" y="-5.842" size="1.27" layer="95" rot="R90">GND</text>
<pin name="VCC@1" x="-2.54" y="7.62" visible="pad" length="middle" direction="pwr" rot="R270"/>
<pin name="VCC@2" x="0" y="7.62" visible="pad" length="middle" direction="pwr" rot="R270"/>
<pin name="GND@4" x="2.54" y="-7.62" visible="pad" length="middle" direction="pwr" rot="R90"/>
<pin name="GND@3" x="0" y="-7.62" visible="pad" length="middle" direction="pwr" rot="R90"/>
<pin name="GND@2" x="-2.54" y="-7.62" visible="pad" length="middle" direction="pwr" rot="R90"/>
<pin name="GND@1" x="-5.08" y="-7.62" visible="pad" length="middle" direction="pwr" rot="R90"/>
<pin name="VCC@3" x="2.54" y="7.62" visible="pad" length="middle" direction="pwr" rot="R270"/>
<pin name="VCC@4" x="5.08" y="7.62" visible="pad" length="middle" direction="pwr" rot="R270"/>
<pin name="GND@5" x="5.08" y="-7.62" visible="pad" length="middle" direction="pwr" rot="R90"/>
<pin name="GND@6" x="7.62" y="-7.62" visible="pad" length="middle" direction="pwr" rot="R90"/>
<pin name="GND@7" x="10.16" y="-7.62" visible="pad" length="middle" direction="pwr" rot="R90"/>
<pin name="GND@8" x="12.7" y="-7.62" visible="pad" length="middle" direction="pwr" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="74AC16374" prefix="IC">
<description>16-bit edge-triggered D-type &lt;B&gt;FLIP FLOP&lt;/B&gt;, 3-state</description>
<gates>
<gate name="G$1" symbol="7416374" x="0" y="0"/>
<gate name="P" symbol="4PWR8GND" x="-43.18" y="0" addlevel="request"/>
</gates>
<devices>
<device name="" package="SSOP48DL">
<connects>
<connect gate="G$1" pin="1CLK" pad="48"/>
<connect gate="G$1" pin="1D1" pad="47"/>
<connect gate="G$1" pin="1D2" pad="46"/>
<connect gate="G$1" pin="1D3" pad="44"/>
<connect gate="G$1" pin="1D4" pad="43"/>
<connect gate="G$1" pin="1D5" pad="41"/>
<connect gate="G$1" pin="1D6" pad="40"/>
<connect gate="G$1" pin="1D7" pad="38"/>
<connect gate="G$1" pin="1D8" pad="37"/>
<connect gate="G$1" pin="1OE" pad="1"/>
<connect gate="G$1" pin="1Q1" pad="2"/>
<connect gate="G$1" pin="1Q2" pad="3"/>
<connect gate="G$1" pin="1Q3" pad="5"/>
<connect gate="G$1" pin="1Q4" pad="6"/>
<connect gate="G$1" pin="1Q5" pad="8"/>
<connect gate="G$1" pin="1Q6" pad="9"/>
<connect gate="G$1" pin="1Q7" pad="11"/>
<connect gate="G$1" pin="1Q8" pad="12"/>
<connect gate="G$1" pin="2CLK" pad="25"/>
<connect gate="G$1" pin="2D1" pad="36"/>
<connect gate="G$1" pin="2D2" pad="35"/>
<connect gate="G$1" pin="2D3" pad="33"/>
<connect gate="G$1" pin="2D4" pad="32"/>
<connect gate="G$1" pin="2D5" pad="30"/>
<connect gate="G$1" pin="2D6" pad="29"/>
<connect gate="G$1" pin="2D7" pad="27"/>
<connect gate="G$1" pin="2D8" pad="26"/>
<connect gate="G$1" pin="2OE" pad="24"/>
<connect gate="G$1" pin="2Q1" pad="13"/>
<connect gate="G$1" pin="2Q2" pad="14"/>
<connect gate="G$1" pin="2Q3" pad="16"/>
<connect gate="G$1" pin="2Q4" pad="17"/>
<connect gate="G$1" pin="2Q5" pad="19"/>
<connect gate="G$1" pin="2Q6" pad="20"/>
<connect gate="G$1" pin="2Q7" pad="22"/>
<connect gate="G$1" pin="2Q8" pad="23"/>
<connect gate="P" pin="GND@1" pad="4"/>
<connect gate="P" pin="GND@2" pad="10"/>
<connect gate="P" pin="GND@3" pad="15"/>
<connect gate="P" pin="GND@4" pad="21"/>
<connect gate="P" pin="GND@5" pad="28"/>
<connect gate="P" pin="GND@6" pad="34"/>
<connect gate="P" pin="GND@7" pad="39"/>
<connect gate="P" pin="GND@8" pad="45"/>
<connect gate="P" pin="VCC@1" pad="7"/>
<connect gate="P" pin="VCC@2" pad="18"/>
<connect gate="P" pin="VCC@3" pad="31"/>
<connect gate="P" pin="VCC@4" pad="42"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="battery">
<description>&lt;b&gt;Lithium Batteries and NC Accus&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="SL-150-1/2AA/PR">
<description>&lt;b&gt;LI BATTERY&lt;/b&gt; Sonnenschein</description>
<wire x1="9.525" y1="-7.366" x2="-12.192" y2="-7.366" width="0.1524" layer="21"/>
<wire x1="12.446" y1="-2.413" x2="12.446" y2="2.413" width="0.4064" layer="51"/>
<wire x1="-12.7" y1="-2.413" x2="-12.7" y2="2.413" width="0.4064" layer="51"/>
<wire x1="12.192" y1="1.905" x2="12.192" y2="3.556" width="0.1524" layer="21"/>
<wire x1="12.192" y1="-3.556" x2="12.192" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="12.192" y1="3.556" x2="11.303" y2="3.556" width="0.1524" layer="21"/>
<wire x1="11.303" y1="3.556" x2="9.906" y2="6.985" width="0.1524" layer="21"/>
<wire x1="12.192" y1="-3.556" x2="11.303" y2="-3.556" width="0.1524" layer="21"/>
<wire x1="11.303" y1="-3.556" x2="11.303" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="11.303" y1="-1.524" x2="11.303" y2="1.397" width="0.1524" layer="51"/>
<wire x1="11.303" y1="1.397" x2="11.303" y2="3.556" width="0.1524" layer="21"/>
<wire x1="-10.414" y1="0" x2="-8.89" y2="0" width="0.254" layer="21"/>
<wire x1="8.509" y1="-0.762" x2="8.509" y2="0.762" width="0.254" layer="21"/>
<wire x1="7.747" y1="0" x2="9.271" y2="0" width="0.254" layer="21"/>
<wire x1="9.906" y1="-6.985" x2="11.303" y2="-3.556" width="0.1524" layer="21"/>
<wire x1="9.525" y1="7.366" x2="-12.192" y2="7.366" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="2.54" x2="-1.905" y2="0" width="0.254" layer="21"/>
<wire x1="-5.08" y1="0" x2="-3.175" y2="0" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="0" x2="0" y2="0" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="0" x2="-1.905" y2="-2.54" width="0.254" layer="21"/>
<wire x1="-1.397" y1="1.524" x2="-0.381" y2="1.524" width="0.1524" layer="21"/>
<wire x1="-0.889" y1="2.032" x2="-0.889" y2="1.016" width="0.1524" layer="21"/>
<wire x1="12.192" y1="-1.905" x2="12.192" y2="1.905" width="0.1524" layer="51"/>
<wire x1="9.906" y1="6.985" x2="9.906" y2="-6.985" width="0.1524" layer="21"/>
<wire x1="-12.573" y1="-6.985" x2="-12.573" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-12.573" y1="6.985" x2="-12.573" y2="2.032" width="0.1524" layer="21"/>
<wire x1="9.525" y1="-7.366" x2="9.906" y2="-6.985" width="0.1524" layer="21" curve="90"/>
<wire x1="9.525" y1="7.366" x2="9.906" y2="6.985" width="0.1524" layer="21" curve="-90"/>
<wire x1="-12.573" y1="-6.985" x2="-12.192" y2="-7.366" width="0.1524" layer="21" curve="90"/>
<wire x1="-12.573" y1="6.985" x2="-12.192" y2="7.366" width="0.1524" layer="21" curve="-90"/>
<pad name="-" x="-12.7" y="0" drill="1.3208" diameter="3.1496" shape="octagon"/>
<pad name="+" x="12.446" y="0" drill="1.3208" diameter="3.1496" shape="octagon"/>
<text x="-12.7" y="8.001" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-8.763" y="4.191" size="1.27" layer="21" ratio="10">Lithium 3V</text>
<text x="-7.62" y="-5.715" size="1.27" layer="21" ratio="10">SL1/2PR</text>
<text x="-5.08" y="8.001" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-3.175" y1="-1.27" x2="-2.54" y2="1.27" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="1V2">
<wire x1="-0.635" y1="0.635" x2="-0.635" y2="0" width="0.4064" layer="94"/>
<wire x1="-2.54" y1="0" x2="-0.635" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.635" y1="0" x2="-0.635" y2="-0.635" width="0.4064" layer="94"/>
<wire x1="0.635" y1="2.54" x2="0.635" y2="0" width="0.4064" layer="94"/>
<wire x1="0.635" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="0.635" y1="0" x2="0.635" y2="-2.54" width="0.4064" layer="94"/>
<text x="-1.27" y="3.175" size="1.778" layer="95">&gt;NAME</text>
<text x="-1.27" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="+" x="5.08" y="0" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="-" x="-5.08" y="0" visible="pad" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="SL-150-1/2AA/PR" prefix="G">
<description>&lt;b&gt;LI BATTERY&lt;/b&gt; Sonnenschein</description>
<gates>
<gate name="G$1" symbol="1V2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SL-150-1/2AA/PR">
<connects>
<connect gate="G$1" pin="+" pad="+"/>
<connect gate="G$1" pin="-" pad="-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply2">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
Please keep in mind, that these devices are necessary for the
automatic wiring of the supply signals.&lt;p&gt;
The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="VCC">
<circle x="0" y="1.27" radius="1.27" width="0.254" layer="94"/>
<text x="-1.905" y="3.175" size="1.778" layer="96">&gt;VALUE</text>
<pin name="VCC" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="GND">
<wire x1="-1.27" y1="0" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="0" y2="-1.27" width="0.254" layer="94"/>
<wire x1="0" y1="-1.27" x2="-1.27" y2="0" width="0.254" layer="94"/>
<text x="-1.905" y="-3.175" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="VCC" prefix="SUPPLY">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="VCC" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="GND" prefix="SUPPLY">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="GND" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="fairchild-semic">
<description>&lt;b&gt;FAIRCHILD SEMICONDUCTOR&lt;/b&gt; Integrated Circuits&lt;p&gt;
www.fairchildsemi.com</description>
<packages>
<package name="SOP-18">
<description>&lt;b&gt;ULN2804-A SM&lt;b&gt;</description>
<wire x1="6.88" y1="3.01" x2="6.88" y2="-3.01" width="0.2032" layer="51"/>
<wire x1="6.88" y1="-3.01" x2="-6.88" y2="-3.01" width="0.2032" layer="51"/>
<wire x1="-6.88" y1="-3.01" x2="-6.88" y2="3.01" width="0.2032" layer="51"/>
<wire x1="-6.88" y1="3.01" x2="6.88" y2="3.01" width="0.2032" layer="51"/>
<smd name="1" x="-5.08" y="-3.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="2" x="-3.81" y="-3.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="3" x="-2.54" y="-3.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="4" x="-1.27" y="-3.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="5" x="0" y="-3.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="6" x="1.27" y="-3.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="7" x="2.54" y="-3.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="8" x="3.81" y="-3.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="9" x="5.08" y="-3.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="10" x="5.08" y="3.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="11" x="3.81" y="3.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="12" x="2.54" y="3.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="13" x="1.27" y="3.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="14" x="0" y="3.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="15" x="-1.27" y="3.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="16" x="-2.54" y="3.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="17" x="-3.81" y="3.6" dx="0.6" dy="2.2" layer="1"/>
<smd name="18" x="-5.08" y="3.6" dx="0.6" dy="2.2" layer="1"/>
<text x="-4.175" y="-1.65" size="1.27" layer="25">&gt;NAME</text>
<text x="-4.175" y="0.38" size="1.27" layer="27">&gt;VALUE</text>
<text x="-4.445" y="-2.54" size="1.27" layer="21" rot="R90">1</text>
<rectangle x1="-5.3299" y1="-4.4399" x2="-4.8301" y2="-3.11" layer="51"/>
<rectangle x1="-4.0599" y1="-4.4399" x2="-3.5601" y2="-3.11" layer="51"/>
<rectangle x1="-2.7899" y1="-4.4399" x2="-2.2901" y2="-3.11" layer="51"/>
<rectangle x1="-1.5199" y1="-4.4399" x2="-1.0201" y2="-3.11" layer="51"/>
<rectangle x1="-0.2499" y1="-4.4399" x2="0.2499" y2="-3.11" layer="51"/>
<rectangle x1="1.0201" y1="-4.4399" x2="1.5199" y2="-3.11" layer="51"/>
<rectangle x1="2.2901" y1="-4.4399" x2="2.7899" y2="-3.11" layer="51"/>
<rectangle x1="3.5601" y1="-4.4399" x2="4.0599" y2="-3.11" layer="51"/>
<rectangle x1="4.8301" y1="-4.4399" x2="5.3299" y2="-3.11" layer="51"/>
<rectangle x1="4.8301" y1="3.11" x2="5.3299" y2="4.4399" layer="51"/>
<rectangle x1="3.5601" y1="3.11" x2="4.0599" y2="4.4399" layer="51"/>
<rectangle x1="2.2901" y1="3.11" x2="2.7899" y2="4.4399" layer="51"/>
<rectangle x1="1.0201" y1="3.11" x2="1.5199" y2="4.4399" layer="51"/>
<rectangle x1="-0.2499" y1="3.11" x2="0.2499" y2="4.4399" layer="51"/>
<rectangle x1="-1.5199" y1="3.11" x2="-1.0201" y2="4.4399" layer="51"/>
<rectangle x1="-2.7899" y1="3.11" x2="-2.2901" y2="4.4399" layer="51"/>
<rectangle x1="-4.0599" y1="3.11" x2="-3.5601" y2="4.4399" layer="51"/>
<rectangle x1="-5.3299" y1="3.11" x2="-4.8301" y2="4.4399" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="ULN-SM">
<wire x1="-7.62" y1="12.7" x2="7.62" y2="12.7" width="0.4064" layer="94"/>
<wire x1="7.62" y1="-12.7" x2="7.62" y2="12.7" width="0.4064" layer="94"/>
<wire x1="7.62" y1="-12.7" x2="-7.62" y2="-12.7" width="0.4064" layer="94"/>
<wire x1="-7.62" y1="12.7" x2="-7.62" y2="-12.7" width="0.4064" layer="94"/>
<text x="-7.62" y="13.462" size="1.778" layer="95">&gt;NAME</text>
<text x="-7.62" y="-15.24" size="1.778" layer="96">&gt;VALUE</text>
<pin name="I1" x="-12.7" y="10.16" length="middle" direction="in"/>
<pin name="I2" x="-12.7" y="7.62" length="middle" direction="in"/>
<pin name="I3" x="-12.7" y="5.08" length="middle" direction="in"/>
<pin name="I4" x="-12.7" y="2.54" length="middle" direction="in"/>
<pin name="I5" x="-12.7" y="0" length="middle" direction="in"/>
<pin name="I6" x="-12.7" y="-2.54" length="middle" direction="in"/>
<pin name="I7" x="-12.7" y="-5.08" length="middle" direction="in"/>
<pin name="I8" x="-12.7" y="-7.62" length="middle" direction="in"/>
<pin name="O8" x="12.7" y="-7.62" length="middle" direction="oc" rot="R180"/>
<pin name="O1" x="12.7" y="10.16" length="middle" direction="oc" rot="R180"/>
<pin name="O2" x="12.7" y="7.62" length="middle" direction="oc" rot="R180"/>
<pin name="O3" x="12.7" y="5.08" length="middle" direction="oc" rot="R180"/>
<pin name="O4" x="12.7" y="2.54" length="middle" direction="oc" rot="R180"/>
<pin name="O5" x="12.7" y="0" length="middle" direction="oc" rot="R180"/>
<pin name="O6" x="12.7" y="-2.54" length="middle" direction="oc" rot="R180"/>
<pin name="O7" x="12.7" y="-5.08" length="middle" direction="oc" rot="R180"/>
<pin name="CD+" x="12.7" y="-10.16" length="middle" direction="pas" rot="R180"/>
<pin name="GND" x="-12.7" y="-10.16" length="middle" direction="pwr"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ULN2804-SM">
<description>ULN2804 is a high voltage, high current Darlington array comprised of eight NPN Darlington pairs.
The device features open-collector outputs with suppression diodes for inductive loads and is ideally suited for interfacing between low-level logic circuitry and high power loads.</description>
<gates>
<gate name="G$1" symbol="ULN-SM" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOP-18">
<connects>
<connect gate="G$1" pin="CD+" pad="10"/>
<connect gate="G$1" pin="GND" pad="9"/>
<connect gate="G$1" pin="I1" pad="1"/>
<connect gate="G$1" pin="I2" pad="2"/>
<connect gate="G$1" pin="I3" pad="3"/>
<connect gate="G$1" pin="I4" pad="4"/>
<connect gate="G$1" pin="I5" pad="5"/>
<connect gate="G$1" pin="I6" pad="6"/>
<connect gate="G$1" pin="I7" pad="7"/>
<connect gate="G$1" pin="I8" pad="8"/>
<connect gate="G$1" pin="O1" pad="18"/>
<connect gate="G$1" pin="O2" pad="17"/>
<connect gate="G$1" pin="O3" pad="16"/>
<connect gate="G$1" pin="O4" pad="15"/>
<connect gate="G$1" pin="O5" pad="14"/>
<connect gate="G$1" pin="O6" pad="13"/>
<connect gate="G$1" pin="O7" pad="12"/>
<connect gate="G$1" pin="O8" pad="11"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="74xx-eu">
<description>&lt;b&gt;TTL Devices, 74xx Series with European Symbols&lt;/b&gt;&lt;p&gt;
Based on the following sources:
&lt;ul&gt;
&lt;li&gt;Texas Instruments &lt;i&gt;TTL Data Book&lt;/i&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;Volume 1, 1996.
&lt;li&gt;TTL Data Book, Volume 2 , 1993
&lt;li&gt;National Seminconductor Databook 1990, ALS/LS Logic
&lt;li&gt;ttl 74er digital data dictionary, ECA Electronic + Acustic GmbH, ISBN 3-88109-032-0
&lt;li&gt;http://icmaster.com/ViewCompare.asp
&lt;/ul&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="DIL14">
<description>&lt;b&gt;Dual In Line Package&lt;/b&gt;</description>
<wire x1="8.89" y1="2.921" x2="-8.89" y2="2.921" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="-2.921" x2="8.89" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="8.89" y1="2.921" x2="8.89" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="2.921" x2="-8.89" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="-2.921" x2="-8.89" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="1.016" x2="-8.89" y2="-1.016" width="0.1524" layer="21" curve="-180"/>
<pad name="1" x="-7.62" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="-5.08" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="7" x="7.62" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="8" x="7.62" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="-2.54" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="4" x="0" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="6" x="5.08" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="5" x="2.54" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="9" x="5.08" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="10" x="2.54" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="11" x="0" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="12" x="-2.54" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="13" x="-5.08" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="14" x="-7.62" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<text x="-9.271" y="-3.048" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-6.731" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="SO14">
<description>&lt;b&gt;Small Outline package&lt;/b&gt; 150 mil</description>
<wire x1="4.064" y1="1.9558" x2="-4.064" y2="1.9558" width="0.1524" layer="51"/>
<wire x1="4.064" y1="-1.9558" x2="4.445" y2="-1.5748" width="0.1524" layer="21" curve="90"/>
<wire x1="-4.445" y1="1.5748" x2="-4.064" y2="1.9558" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.064" y1="1.9558" x2="4.445" y2="1.5748" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.445" y1="-1.5748" x2="-4.064" y2="-1.9558" width="0.1524" layer="21" curve="90"/>
<wire x1="-4.064" y1="-1.9558" x2="4.064" y2="-1.9558" width="0.1524" layer="51"/>
<wire x1="4.445" y1="-1.5748" x2="4.445" y2="1.5748" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.5748" x2="-4.445" y2="0.508" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="0.508" x2="-4.445" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-0.508" x2="-4.445" y2="-1.5748" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="0.508" x2="-4.445" y2="-0.508" width="0.1524" layer="21" curve="-180"/>
<wire x1="-4.445" y1="-1.6002" x2="4.445" y2="-1.6002" width="0.0508" layer="21"/>
<smd name="1" x="-3.81" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="14" x="-3.81" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="2" x="-2.54" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="3" x="-1.27" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="13" x="-2.54" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="12" x="-1.27" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="4" x="0" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="11" x="0" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="5" x="1.27" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="6" x="2.54" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="10" x="1.27" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="9" x="2.54" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="7" x="3.81" y="-3.0734" dx="0.6604" dy="2.032" layer="1"/>
<smd name="8" x="3.81" y="3.0734" dx="0.6604" dy="2.032" layer="1"/>
<text x="-3.175" y="-0.762" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-4.826" y="-1.905" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<rectangle x1="-0.254" y1="1.9558" x2="0.254" y2="3.0988" layer="51"/>
<rectangle x1="-4.064" y1="-3.0988" x2="-3.556" y2="-1.9558" layer="51"/>
<rectangle x1="-2.794" y1="-3.0988" x2="-2.286" y2="-1.9558" layer="51"/>
<rectangle x1="-1.524" y1="-3.0734" x2="-1.016" y2="-1.9304" layer="51"/>
<rectangle x1="-0.254" y1="-3.0988" x2="0.254" y2="-1.9558" layer="51"/>
<rectangle x1="-1.524" y1="1.9558" x2="-1.016" y2="3.0988" layer="51"/>
<rectangle x1="-2.794" y1="1.9558" x2="-2.286" y2="3.0988" layer="51"/>
<rectangle x1="-4.064" y1="1.9558" x2="-3.556" y2="3.0988" layer="51"/>
<rectangle x1="1.016" y1="1.9558" x2="1.524" y2="3.0988" layer="51"/>
<rectangle x1="2.286" y1="1.9558" x2="2.794" y2="3.0988" layer="51"/>
<rectangle x1="3.556" y1="1.9558" x2="4.064" y2="3.0988" layer="51"/>
<rectangle x1="1.016" y1="-3.0988" x2="1.524" y2="-1.9558" layer="51"/>
<rectangle x1="2.286" y1="-3.0988" x2="2.794" y2="-1.9558" layer="51"/>
<rectangle x1="3.556" y1="-3.0988" x2="4.064" y2="-1.9558" layer="51"/>
</package>
<package name="LCC20">
<description>&lt;b&gt;Leadless Chip Carrier&lt;/b&gt;&lt;p&gt; Ceramic Package</description>
<wire x1="-0.4001" y1="4.4" x2="-0.87" y2="4.4" width="0.2032" layer="51"/>
<wire x1="-3.3" y1="4.4" x2="-4.4" y2="3.3" width="0.2032" layer="51"/>
<wire x1="-0.4001" y1="4.3985" x2="0.4001" y2="4.3985" width="0.2032" layer="51" curve="180"/>
<wire x1="-1.6701" y1="4.3985" x2="-0.8699" y2="4.3985" width="0.2032" layer="51" curve="180"/>
<wire x1="-4.3985" y1="2.14" x2="-4.3985" y2="2.94" width="0.2032" layer="51" curve="180"/>
<wire x1="-2.9401" y1="4.4" x2="-3.3" y2="4.4" width="0.2032" layer="51"/>
<wire x1="0.87" y1="4.4" x2="0.4001" y2="4.4" width="0.2032" layer="51"/>
<wire x1="0.87" y1="4.3985" x2="1.67" y2="4.3985" width="0.2032" layer="51" curve="180"/>
<wire x1="-4.4" y1="3.3" x2="-4.4" y2="2.9401" width="0.2032" layer="51"/>
<wire x1="-4.4" y1="2.14" x2="-4.4" y2="1.6701" width="0.2032" layer="51"/>
<wire x1="-4.3985" y1="0.87" x2="-4.3985" y2="1.67" width="0.2032" layer="51" curve="180"/>
<wire x1="-4.3985" y1="-0.4001" x2="-4.3985" y2="0.4001" width="0.2032" layer="51" curve="180"/>
<wire x1="-4.3985" y1="-1.6701" x2="-4.3985" y2="-0.8699" width="0.2032" layer="51" curve="180"/>
<wire x1="-4.4" y1="0.87" x2="-4.4" y2="0.4001" width="0.2032" layer="51"/>
<wire x1="-4.4" y1="-0.4001" x2="-4.4" y2="-0.87" width="0.2032" layer="51"/>
<wire x1="-4.4" y1="-2.9401" x2="-4.4" y2="-4.4" width="0.2032" layer="51"/>
<wire x1="-4.4" y1="-4.4" x2="-4.4" y2="-4.4099" width="0.2032" layer="51"/>
<wire x1="2.14" y1="4.3985" x2="2.94" y2="4.3985" width="0.2032" layer="51" curve="180"/>
<wire x1="2.14" y1="4.4" x2="1.6701" y2="4.4" width="0.2032" layer="51"/>
<wire x1="4.4" y1="4.4" x2="2.9401" y2="4.4" width="0.2032" layer="51"/>
<wire x1="0.4001" y1="-4.4" x2="0.87" y2="-4.4" width="0.2032" layer="51"/>
<wire x1="-0.4001" y1="-4.3985" x2="0.4001" y2="-4.3985" width="0.2032" layer="51" curve="-180"/>
<wire x1="0.87" y1="-4.3985" x2="1.67" y2="-4.3985" width="0.2032" layer="51" curve="-180"/>
<wire x1="2.9401" y1="-4.4" x2="4.4" y2="-4.4" width="0.2032" layer="51"/>
<wire x1="-0.87" y1="-4.4" x2="-0.4001" y2="-4.4" width="0.2032" layer="51"/>
<wire x1="-1.6701" y1="-4.3985" x2="-0.8699" y2="-4.3985" width="0.2032" layer="51" curve="-180"/>
<wire x1="-2.9401" y1="-4.3985" x2="-2.1399" y2="-4.3985" width="0.2032" layer="51" curve="-180"/>
<wire x1="-2.14" y1="-4.4" x2="-1.6701" y2="-4.4" width="0.2032" layer="51"/>
<wire x1="-4.4" y1="-4.4" x2="-2.9401" y2="-4.4" width="0.2032" layer="51"/>
<wire x1="4.4" y1="0.4001" x2="4.4" y2="0.87" width="0.2032" layer="51"/>
<wire x1="4.3985" y1="0.4001" x2="4.3985" y2="-0.4001" width="0.2032" layer="51" curve="180"/>
<wire x1="4.3985" y1="1.6701" x2="4.3985" y2="0.8699" width="0.2032" layer="51" curve="180"/>
<wire x1="4.4" y1="2.9401" x2="4.4" y2="4.4" width="0.2032" layer="51"/>
<wire x1="4.4" y1="-0.87" x2="4.4" y2="-0.4001" width="0.2032" layer="51"/>
<wire x1="4.3985" y1="-0.87" x2="4.3985" y2="-1.67" width="0.2032" layer="51" curve="180"/>
<wire x1="4.3985" y1="-2.14" x2="4.3985" y2="-2.94" width="0.2032" layer="51" curve="180"/>
<wire x1="4.4" y1="-2.14" x2="4.4" y2="-1.6701" width="0.2032" layer="51"/>
<wire x1="4.4" y1="-4.4" x2="4.4" y2="-2.9401" width="0.2032" layer="51"/>
<wire x1="-2.9401" y1="4.3985" x2="-2.1399" y2="4.3985" width="0.2032" layer="51" curve="180"/>
<wire x1="-1.6701" y1="4.4" x2="-2.14" y2="4.4" width="0.2032" layer="51"/>
<wire x1="-4.3985" y1="-2.9401" x2="-4.3985" y2="-2.1399" width="0.2032" layer="51" curve="180"/>
<wire x1="-4.4" y1="-1.6701" x2="-4.4" y2="-2.14" width="0.2032" layer="51"/>
<wire x1="1.6701" y1="-4.4" x2="2.14" y2="-4.4" width="0.2032" layer="51"/>
<wire x1="2.14" y1="-4.3985" x2="2.94" y2="-4.3985" width="0.2032" layer="51" curve="-180"/>
<wire x1="4.3985" y1="2.9401" x2="4.3985" y2="2.1399" width="0.2032" layer="51" curve="180"/>
<wire x1="4.4" y1="1.6701" x2="4.4" y2="2.14" width="0.2032" layer="51"/>
<wire x1="-3.3" y1="4.4" x2="-4.4" y2="3.3" width="0.2032" layer="21"/>
<wire x1="-4.4" y1="-3.1941" x2="-4.4" y2="-4.4" width="0.2032" layer="21"/>
<wire x1="-4.4" y1="-4.4" x2="-3.1941" y2="-4.4" width="0.2032" layer="21"/>
<wire x1="3.1941" y1="-4.4" x2="4.4" y2="-4.4" width="0.2032" layer="21"/>
<wire x1="4.4" y1="-4.4" x2="4.4" y2="-3.1941" width="0.2032" layer="21"/>
<wire x1="4.4" y1="3.1941" x2="4.4" y2="4.4" width="0.2032" layer="21"/>
<wire x1="4.4" y1="4.4" x2="3.1941" y2="4.4" width="0.2032" layer="21"/>
<smd name="2" x="-1.27" y="4.5001" dx="0.8" dy="2" layer="1"/>
<smd name="1" x="0" y="3.8001" dx="0.8" dy="3.4" layer="1"/>
<smd name="3" x="-2.54" y="4.5001" dx="0.8" dy="2" layer="1"/>
<smd name="4" x="-4.5001" y="2.54" dx="2" dy="0.8" layer="1"/>
<smd name="5" x="-4.5001" y="1.27" dx="2" dy="0.8" layer="1"/>
<smd name="6" x="-4.5001" y="0" dx="2" dy="0.8" layer="1"/>
<smd name="7" x="-4.5001" y="-1.27" dx="2" dy="0.8" layer="1"/>
<smd name="8" x="-4.5001" y="-2.54" dx="2" dy="0.8" layer="1"/>
<smd name="9" x="-2.54" y="-4.5001" dx="0.8" dy="2" layer="1"/>
<smd name="10" x="-1.27" y="-4.5001" dx="0.8" dy="2" layer="1"/>
<smd name="11" x="0" y="-4.5001" dx="0.8" dy="2" layer="1"/>
<smd name="12" x="1.27" y="-4.5001" dx="0.8" dy="2" layer="1"/>
<smd name="13" x="2.54" y="-4.5001" dx="0.8" dy="2" layer="1"/>
<smd name="14" x="4.5001" y="-2.54" dx="2" dy="0.8" layer="1"/>
<smd name="15" x="4.5001" y="-1.27" dx="2" dy="0.8" layer="1"/>
<smd name="16" x="4.5001" y="0" dx="2" dy="0.8" layer="1"/>
<smd name="17" x="4.5001" y="1.27" dx="2" dy="0.8" layer="1"/>
<smd name="18" x="4.5001" y="2.54" dx="2" dy="0.8" layer="1"/>
<smd name="19" x="2.54" y="4.5001" dx="0.8" dy="2" layer="1"/>
<smd name="20" x="1.27" y="4.5001" dx="0.8" dy="2" layer="1"/>
<text x="-4.0051" y="6.065" size="1.778" layer="25">&gt;NAME</text>
<text x="-3.9751" y="-7.5601" size="1.778" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="7408">
<wire x1="-2.54" y1="5.08" x2="-2.54" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-2.54" y1="5.08" x2="-2.54" y2="-5.08" width="0.4064" layer="94" curve="-180"/>
<text x="2.54" y="3.175" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="I0" x="-7.62" y="2.54" visible="pad" length="middle" direction="in" swaplevel="1"/>
<pin name="I1" x="-7.62" y="-2.54" visible="pad" length="middle" direction="in" swaplevel="1"/>
<pin name="O" x="7.62" y="0" visible="pad" length="middle" direction="out" rot="R180"/>
</symbol>
<symbol name="PWRN">
<text x="-0.635" y="-0.635" size="1.778" layer="95">&gt;NAME</text>
<text x="1.905" y="-5.842" size="1.27" layer="95" rot="R90">GND</text>
<text x="1.905" y="2.54" size="1.27" layer="95" rot="R90">VCC</text>
<pin name="GND" x="0" y="-7.62" visible="pad" length="middle" direction="pwr" rot="R90"/>
<pin name="VCC" x="0" y="7.62" visible="pad" length="middle" direction="pwr" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="74*08" prefix="IC">
<description>Quad 2-input &lt;b&gt;AND&lt;/b&gt; gate</description>
<gates>
<gate name="A" symbol="7408" x="20.32" y="0" swaplevel="1"/>
<gate name="B" symbol="7408" x="20.32" y="-12.7" swaplevel="1"/>
<gate name="C" symbol="7408" x="43.18" y="0" swaplevel="1"/>
<gate name="D" symbol="7408" x="43.18" y="-12.7" swaplevel="1"/>
<gate name="P" symbol="PWRN" x="2.54" y="-7.62" addlevel="request"/>
</gates>
<devices>
<device name="N" package="DIL14">
<connects>
<connect gate="A" pin="I0" pad="1"/>
<connect gate="A" pin="I1" pad="2"/>
<connect gate="A" pin="O" pad="3"/>
<connect gate="B" pin="I0" pad="4"/>
<connect gate="B" pin="I1" pad="5"/>
<connect gate="B" pin="O" pad="6"/>
<connect gate="C" pin="I0" pad="9"/>
<connect gate="C" pin="I1" pad="10"/>
<connect gate="C" pin="O" pad="8"/>
<connect gate="D" pin="I0" pad="12"/>
<connect gate="D" pin="I1" pad="13"/>
<connect gate="D" pin="O" pad="11"/>
<connect gate="P" pin="GND" pad="7"/>
<connect gate="P" pin="VCC" pad="14"/>
</connects>
<technologies>
<technology name="AC"/>
<technology name="ACT"/>
<technology name="ALS"/>
<technology name="AS"/>
<technology name="HC"/>
<technology name="HCT"/>
<technology name="LS"/>
<technology name="S"/>
</technologies>
</device>
<device name="D" package="SO14">
<connects>
<connect gate="A" pin="I0" pad="1"/>
<connect gate="A" pin="I1" pad="2"/>
<connect gate="A" pin="O" pad="3"/>
<connect gate="B" pin="I0" pad="4"/>
<connect gate="B" pin="I1" pad="5"/>
<connect gate="B" pin="O" pad="6"/>
<connect gate="C" pin="I0" pad="9"/>
<connect gate="C" pin="I1" pad="10"/>
<connect gate="C" pin="O" pad="8"/>
<connect gate="D" pin="I0" pad="12"/>
<connect gate="D" pin="I1" pad="13"/>
<connect gate="D" pin="O" pad="11"/>
<connect gate="P" pin="GND" pad="7"/>
<connect gate="P" pin="VCC" pad="14"/>
</connects>
<technologies>
<technology name="AC"/>
<technology name="ACT"/>
<technology name="ALS"/>
<technology name="AS"/>
<technology name="HC"/>
<technology name="HCT"/>
<technology name="LS"/>
<technology name="S"/>
</technologies>
</device>
<device name="FK" package="LCC20">
<connects>
<connect gate="A" pin="I0" pad="2"/>
<connect gate="A" pin="I1" pad="3"/>
<connect gate="A" pin="O" pad="4"/>
<connect gate="B" pin="I0" pad="6"/>
<connect gate="B" pin="I1" pad="8"/>
<connect gate="B" pin="O" pad="9"/>
<connect gate="C" pin="I0" pad="13"/>
<connect gate="C" pin="I1" pad="14"/>
<connect gate="C" pin="O" pad="12"/>
<connect gate="D" pin="I0" pad="18"/>
<connect gate="D" pin="I1" pad="19"/>
<connect gate="D" pin="O" pad="16"/>
<connect gate="P" pin="GND" pad="10"/>
<connect gate="P" pin="VCC" pad="20"/>
</connects>
<technologies>
<technology name="AC"/>
<technology name="ACT"/>
<technology name="ALS"/>
<technology name="AS"/>
<technology name="HC"/>
<technology name="HCT"/>
<technology name="LS"/>
<technology name="S"/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="IC1" library="74ac-logic" deviceset="74AC16374" device=""/>
<part name="G1" library="battery" deviceset="SL-150-1/2AA/PR" device=""/>
<part name="SUPPLY1" library="supply2" deviceset="VCC" device=""/>
<part name="SUPPLY2" library="supply2" deviceset="GND" device=""/>
<part name="U$1" library="fairchild-semic" deviceset="ULN2804-SM" device=""/>
<part name="IC2" library="74xx-eu" deviceset="74*08" device="D" technology="LS"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="IC1" gate="G$1" x="91.44" y="45.72"/>
<instance part="G1" gate="G$1" x="129.54" y="86.36"/>
<instance part="SUPPLY1" gate="G$1" x="134.62" y="106.68"/>
<instance part="SUPPLY2" gate="GND" x="132.08" y="68.58"/>
<instance part="U$1" gate="G$1" x="35.56" y="33.02"/>
<instance part="IC2" gate="A" x="22.86" y="106.68"/>
<instance part="IC2" gate="B" x="22.86" y="93.98"/>
<instance part="IC2" gate="C" x="22.86" y="81.28"/>
<instance part="IC2" gate="D" x="22.86" y="68.58"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="G1" gate="G$1" pin="-"/>
<wire x1="124.46" y1="86.36" x2="121.92" y2="86.36" width="0.1524" layer="91"/>
<wire x1="121.92" y1="86.36" x2="121.92" y2="78.74" width="0.1524" layer="91"/>
<wire x1="121.92" y1="78.74" x2="132.08" y2="78.74" width="0.1524" layer="91"/>
<pinref part="SUPPLY2" gate="GND" pin="GND"/>
<wire x1="132.08" y1="78.74" x2="132.08" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="VCC" class="0">
<segment>
<pinref part="G1" gate="G$1" pin="+"/>
<wire x1="134.62" y1="86.36" x2="134.62" y2="104.14" width="0.1524" layer="91"/>
<pinref part="SUPPLY1" gate="G$1" pin="VCC"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
