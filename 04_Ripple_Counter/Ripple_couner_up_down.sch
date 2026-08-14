<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3a" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <signal name="Q0" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="XLXN_9" />
        <signal name="XLXN_10" />
        <signal name="XLXN_11" />
        <signal name="XLXN_12" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="M" />
        <signal name="T" />
        <signal name="CLR" />
        <signal name="CLK" />
        <signal name="Q1" />
        <signal name="Q2" />
        <port polarity="Output" name="Q0" />
        <port polarity="Input" name="M" />
        <port polarity="Input" name="T" />
        <port polarity="Input" name="CLR" />
        <port polarity="Input" name="CLK" />
        <port polarity="Output" name="Q1" />
        <port polarity="Output" name="Q2" />
        <blockdef name="TFF">
            <timestamp>2026-7-8T7:23:1</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
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
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <block symbolname="TFF" name="XLXI_1">
            <blockpin signalname="T" name="T" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="Q0" name="Q" />
            <blockpin signalname="XLXN_5" name="Qb" />
        </block>
        <block symbolname="TFF" name="XLXI_2">
            <blockpin signalname="T" name="T" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="XLXN_9" name="CLK" />
            <blockpin signalname="Q1" name="Q" />
            <blockpin signalname="XLXN_11" name="Qb" />
        </block>
        <block symbolname="TFF" name="XLXI_3">
            <blockpin signalname="T" name="T" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="XLXN_14" name="CLK" />
            <blockpin signalname="Q2" name="Q" />
            <blockpin name="Qb" />
        </block>
        <block symbolname="inv" name="XLXI_4">
            <blockpin signalname="M" name="I" />
            <blockpin signalname="XLXN_15" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_5">
            <blockpin signalname="Q0" name="I0" />
            <blockpin signalname="XLXN_15" name="I1" />
            <blockpin signalname="XLXN_7" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_6">
            <blockpin signalname="M" name="I0" />
            <blockpin signalname="XLXN_5" name="I1" />
            <blockpin signalname="XLXN_8" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_7">
            <blockpin signalname="XLXN_8" name="I0" />
            <blockpin signalname="XLXN_7" name="I1" />
            <blockpin signalname="XLXN_9" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_8">
            <blockpin signalname="M" name="I0" />
            <blockpin signalname="XLXN_11" name="I1" />
            <blockpin signalname="XLXN_13" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_9">
            <blockpin signalname="Q1" name="I0" />
            <blockpin signalname="XLXN_15" name="I1" />
            <blockpin signalname="XLXN_12" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_10">
            <blockpin signalname="XLXN_13" name="I0" />
            <blockpin signalname="XLXN_12" name="I1" />
            <blockpin signalname="XLXN_14" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="752" y="1040" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1840" y="1040" name="XLXI_2" orien="R0">
        </instance>
        <instance x="3008" y="1040" name="XLXI_3" orien="R0">
        </instance>
        <instance x="704" y="592" name="XLXI_4" orien="R0" />
        <instance x="1232" y="1136" name="XLXI_6" orien="R0" />
        <instance x="1216" y="944" name="XLXI_5" orien="R0" />
        <branch name="Q0">
            <wire x2="1200" y1="880" y2="880" x1="1136" />
            <wire x2="1216" y1="880" y2="880" x1="1200" />
            <wire x2="1200" y1="880" y2="1264" x1="1200" />
            <wire x2="1200" y1="1264" y2="1264" x1="1136" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="1232" y1="1008" y2="1008" x1="1136" />
        </branch>
        <instance x="1568" y="1104" name="XLXI_7" orien="R0" />
        <branch name="XLXN_7">
            <wire x2="1520" y1="848" y2="848" x1="1472" />
            <wire x2="1520" y1="848" y2="976" x1="1520" />
            <wire x2="1568" y1="976" y2="976" x1="1520" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="1568" y1="1040" y2="1040" x1="1488" />
        </branch>
        <branch name="XLXN_9">
            <wire x2="1840" y1="1008" y2="1008" x1="1824" />
        </branch>
        <instance x="2368" y="1136" name="XLXI_8" orien="R0" />
        <instance x="2352" y="944" name="XLXI_9" orien="R0" />
        <branch name="XLXN_11">
            <wire x2="2368" y1="1008" y2="1008" x1="2224" />
        </branch>
        <instance x="2704" y="1104" name="XLXI_10" orien="R0" />
        <branch name="XLXN_12">
            <wire x2="2656" y1="848" y2="848" x1="2608" />
            <wire x2="2656" y1="848" y2="976" x1="2656" />
            <wire x2="2704" y1="976" y2="976" x1="2656" />
        </branch>
        <branch name="XLXN_13">
            <wire x2="2704" y1="1040" y2="1040" x1="2624" />
        </branch>
        <branch name="XLXN_14">
            <wire x2="3008" y1="1008" y2="1008" x1="2960" />
        </branch>
        <branch name="XLXN_15">
            <wire x2="1200" y1="560" y2="560" x1="928" />
            <wire x2="1200" y1="560" y2="816" x1="1200" />
            <wire x2="1216" y1="816" y2="816" x1="1200" />
            <wire x2="2432" y1="560" y2="560" x1="1200" />
            <wire x2="2432" y1="560" y2="736" x1="2432" />
            <wire x2="2272" y1="736" y2="816" x1="2272" />
            <wire x2="2352" y1="816" y2="816" x1="2272" />
            <wire x2="2432" y1="736" y2="736" x1="2272" />
        </branch>
        <branch name="M">
            <wire x2="640" y1="480" y2="480" x1="400" />
            <wire x2="640" y1="480" y2="560" x1="640" />
            <wire x2="704" y1="560" y2="560" x1="640" />
            <wire x2="1440" y1="480" y2="480" x1="640" />
            <wire x2="2480" y1="480" y2="480" x1="1440" />
            <wire x2="2480" y1="480" y2="752" x1="2480" />
            <wire x2="1440" y1="480" y2="736" x1="1440" />
            <wire x2="1152" y1="736" y2="1072" x1="1152" />
            <wire x2="1232" y1="1072" y2="1072" x1="1152" />
            <wire x2="1440" y1="736" y2="736" x1="1152" />
            <wire x2="2288" y1="752" y2="1072" x1="2288" />
            <wire x2="2368" y1="1072" y2="1072" x1="2288" />
            <wire x2="2480" y1="752" y2="752" x1="2288" />
        </branch>
        <branch name="T">
            <wire x2="672" y1="880" y2="880" x1="576" />
            <wire x2="752" y1="880" y2="880" x1="672" />
            <wire x2="1552" y1="688" y2="688" x1="672" />
            <wire x2="1552" y1="688" y2="880" x1="1552" />
            <wire x2="1840" y1="880" y2="880" x1="1552" />
            <wire x2="2672" y1="688" y2="688" x1="1552" />
            <wire x2="2672" y1="688" y2="880" x1="2672" />
            <wire x2="3008" y1="880" y2="880" x1="2672" />
            <wire x2="672" y1="688" y2="880" x1="672" />
        </branch>
        <branch name="CLR">
            <wire x2="688" y1="944" y2="944" x1="624" />
            <wire x2="752" y1="944" y2="944" x1="688" />
            <wire x2="688" y1="944" y2="1184" x1="688" />
            <wire x2="1216" y1="1184" y2="1184" x1="688" />
            <wire x2="2272" y1="1184" y2="1184" x1="1216" />
            <wire x2="1840" y1="944" y2="944" x1="1216" />
            <wire x2="1216" y1="944" y2="1184" x1="1216" />
            <wire x2="2272" y1="944" y2="1184" x1="2272" />
            <wire x2="3008" y1="944" y2="944" x1="2272" />
        </branch>
        <iomarker fontsize="28" x="400" y="480" name="M" orien="R180" />
        <iomarker fontsize="28" x="576" y="880" name="T" orien="R180" />
        <iomarker fontsize="28" x="624" y="944" name="CLR" orien="R180" />
        <branch name="CLK">
            <wire x2="752" y1="1008" y2="1008" x1="720" />
        </branch>
        <iomarker fontsize="28" x="720" y="1008" name="CLK" orien="R180" />
        <branch name="Q1">
            <wire x2="2320" y1="880" y2="880" x1="2224" />
            <wire x2="2352" y1="880" y2="880" x1="2320" />
            <wire x2="2320" y1="880" y2="1280" x1="2320" />
            <wire x2="2336" y1="1280" y2="1280" x1="2320" />
        </branch>
        <branch name="Q2">
            <wire x2="3408" y1="1312" y2="1312" x1="3312" />
            <wire x2="3408" y1="880" y2="880" x1="3392" />
            <wire x2="3408" y1="880" y2="1312" x1="3408" />
        </branch>
        <iomarker fontsize="28" x="1136" y="1264" name="Q0" orien="R180" />
        <iomarker fontsize="28" x="2336" y="1280" name="Q1" orien="R0" />
        <iomarker fontsize="28" x="3312" y="1312" name="Q2" orien="R180" />
    </sheet>
</drawing>