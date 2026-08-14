<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3a" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_2" />
        <signal name="Q1" />
        <signal name="XLXN_5" />
        <signal name="CLK" />
        <signal name="T" />
        <signal name="Q2" />
        <signal name="CLR" />
        <signal name="Q0" />
        <port polarity="Output" name="Q1" />
        <port polarity="Input" name="CLK" />
        <port polarity="Input" name="T" />
        <port polarity="Output" name="Q2" />
        <port polarity="Input" name="CLR" />
        <port polarity="Output" name="Q0" />
        <blockdef name="TFF">
            <timestamp>2026-7-8T7:23:1</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <block symbolname="TFF" name="XLXI_1">
            <blockpin signalname="T" name="T" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="Q0" name="Q" />
            <blockpin name="Qb" />
        </block>
        <block symbolname="TFF" name="XLXI_2">
            <blockpin signalname="Q0" name="T" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="Q1" name="Q" />
            <blockpin name="Qb" />
        </block>
        <block symbolname="TFF" name="XLXI_3">
            <blockpin signalname="XLXN_5" name="T" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="Q2" name="Q" />
            <blockpin name="Qb" />
        </block>
        <block symbolname="and2" name="XLXI_4">
            <blockpin signalname="Q0" name="I0" />
            <blockpin signalname="Q1" name="I1" />
            <blockpin signalname="XLXN_5" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="736" y="656" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1376" y="656" name="XLXI_2" orien="R0">
        </instance>
        <instance x="2192" y="640" name="XLXI_3" orien="R0">
        </instance>
        <instance x="1856" y="432" name="XLXI_4" orien="R0" />
        <branch name="Q1">
            <wire x2="1808" y1="496" y2="496" x1="1760" />
            <wire x2="1808" y1="256" y2="304" x1="1808" />
            <wire x2="1808" y1="304" y2="496" x1="1808" />
            <wire x2="1856" y1="304" y2="304" x1="1808" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="2144" y1="336" y2="336" x1="2112" />
            <wire x2="2144" y1="336" y2="480" x1="2144" />
            <wire x2="2192" y1="480" y2="480" x1="2144" />
        </branch>
        <branch name="CLK">
            <wire x2="672" y1="624" y2="624" x1="544" />
            <wire x2="736" y1="624" y2="624" x1="672" />
            <wire x2="672" y1="624" y2="752" x1="672" />
            <wire x2="1184" y1="752" y2="752" x1="672" />
            <wire x2="2096" y1="752" y2="752" x1="1184" />
            <wire x2="1376" y1="624" y2="624" x1="1184" />
            <wire x2="1184" y1="624" y2="752" x1="1184" />
            <wire x2="2192" y1="608" y2="608" x1="2096" />
            <wire x2="2096" y1="608" y2="752" x1="2096" />
        </branch>
        <branch name="T">
            <wire x2="736" y1="496" y2="496" x1="272" />
        </branch>
        <branch name="Q2">
            <wire x2="2608" y1="480" y2="480" x1="2576" />
        </branch>
        <iomarker fontsize="28" x="2608" y="480" name="Q2" orien="R0" />
        <iomarker fontsize="28" x="544" y="624" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="272" y="496" name="T" orien="R180" />
        <branch name="CLR">
            <wire x2="688" y1="560" y2="560" x1="624" />
            <wire x2="736" y1="560" y2="560" x1="688" />
            <wire x2="1168" y1="384" y2="384" x1="688" />
            <wire x2="1168" y1="384" y2="560" x1="1168" />
            <wire x2="1376" y1="560" y2="560" x1="1168" />
            <wire x2="1776" y1="384" y2="384" x1="1168" />
            <wire x2="1776" y1="384" y2="544" x1="1776" />
            <wire x2="2192" y1="544" y2="544" x1="1776" />
            <wire x2="688" y1="384" y2="560" x1="688" />
        </branch>
        <branch name="Q0">
            <wire x2="1200" y1="496" y2="496" x1="1120" />
            <wire x2="1376" y1="496" y2="496" x1="1200" />
            <wire x2="1184" y1="256" y2="368" x1="1184" />
            <wire x2="1200" y1="368" y2="368" x1="1184" />
            <wire x2="1856" y1="368" y2="368" x1="1200" />
            <wire x2="1200" y1="368" y2="496" x1="1200" />
        </branch>
        <iomarker fontsize="28" x="624" y="560" name="CLR" orien="R180" />
        <iomarker fontsize="28" x="1184" y="256" name="Q0" orien="R270" />
        <iomarker fontsize="28" x="1808" y="256" name="Q1" orien="R270" />
    </sheet>
</drawing>