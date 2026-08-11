<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3a" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Q0" />
        <signal name="Q1" />
        <signal name="T" />
        <signal name="CLR" />
        <signal name="Q2" />
        <signal name="CLK" />
        <port polarity="Output" name="Q0" />
        <port polarity="Output" name="Q1" />
        <port polarity="Input" name="T" />
        <port polarity="Input" name="CLR" />
        <port polarity="Output" name="Q2" />
        <port polarity="Input" name="CLK" />
        <blockdef name="TFF">
            <timestamp>2026-7-8T7:23:1</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="TFF" name="XLXI_1">
            <blockpin signalname="T" name="T" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="Q0" name="Q" />
            <blockpin name="Qb" />
        </block>
        <block symbolname="TFF" name="XLXI_2">
            <blockpin signalname="T" name="T" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="Q0" name="CLK" />
            <blockpin signalname="Q1" name="Q" />
            <blockpin name="Qb" />
        </block>
        <block symbolname="TFF" name="XLXI_3">
            <blockpin signalname="T" name="T" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="Q1" name="CLK" />
            <blockpin signalname="Q2" name="Q" />
            <blockpin name="Qb" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="544" y="1200" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1184" y="1200" name="XLXI_2" orien="R0">
        </instance>
        <instance x="1824" y="1200" name="XLXI_3" orien="R0">
        </instance>
        <branch name="Q0">
            <wire x2="1056" y1="1040" y2="1040" x1="928" />
            <wire x2="1056" y1="1040" y2="1168" x1="1056" />
            <wire x2="1184" y1="1168" y2="1168" x1="1056" />
            <wire x2="1056" y1="1168" y2="1360" x1="1056" />
        </branch>
        <branch name="Q1">
            <wire x2="1696" y1="1040" y2="1040" x1="1568" />
            <wire x2="1696" y1="1040" y2="1168" x1="1696" />
            <wire x2="1824" y1="1168" y2="1168" x1="1696" />
            <wire x2="1696" y1="1168" y2="1360" x1="1696" />
        </branch>
        <branch name="T">
            <wire x2="464" y1="1040" y2="1040" x1="368" />
            <wire x2="544" y1="1040" y2="1040" x1="464" />
            <wire x2="1104" y1="880" y2="880" x1="464" />
            <wire x2="1744" y1="880" y2="880" x1="1104" />
            <wire x2="1744" y1="880" y2="1040" x1="1744" />
            <wire x2="1824" y1="1040" y2="1040" x1="1744" />
            <wire x2="1104" y1="880" y2="1040" x1="1104" />
            <wire x2="1184" y1="1040" y2="1040" x1="1104" />
            <wire x2="464" y1="880" y2="1040" x1="464" />
        </branch>
        <branch name="CLR">
            <wire x2="480" y1="1104" y2="1104" x1="384" />
            <wire x2="544" y1="1104" y2="1104" x1="480" />
            <wire x2="480" y1="1104" y2="1280" x1="480" />
            <wire x2="992" y1="1280" y2="1280" x1="480" />
            <wire x2="1648" y1="1280" y2="1280" x1="992" />
            <wire x2="992" y1="1104" y2="1280" x1="992" />
            <wire x2="1184" y1="1104" y2="1104" x1="992" />
            <wire x2="1648" y1="1104" y2="1280" x1="1648" />
            <wire x2="1824" y1="1104" y2="1104" x1="1648" />
        </branch>
        <branch name="Q2">
            <wire x2="2224" y1="1040" y2="1040" x1="2208" />
            <wire x2="2224" y1="1040" y2="1344" x1="2224" />
        </branch>
        <iomarker fontsize="28" x="1056" y="1360" name="Q0" orien="R90" />
        <iomarker fontsize="28" x="1696" y="1360" name="Q1" orien="R90" />
        <iomarker fontsize="28" x="2224" y="1344" name="Q2" orien="R90" />
        <branch name="CLK">
            <wire x2="544" y1="1168" y2="1168" x1="512" />
        </branch>
        <iomarker fontsize="28" x="512" y="1168" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="368" y="1040" name="T" orien="R180" />
        <iomarker fontsize="28" x="384" y="1104" name="CLR" orien="R180" />
    </sheet>
</drawing>