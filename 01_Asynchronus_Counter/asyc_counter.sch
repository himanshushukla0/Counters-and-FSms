<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3a" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="T" />
        <signal name="Q2" />
        <signal name="XLXN_9" />
        <signal name="CLR" />
        <signal name="XLXN_11" />
        <signal name="Q0" />
        <signal name="Q1" />
        <signal name="CLK" />
        <port polarity="Input" name="T" />
        <port polarity="Output" name="Q2" />
        <port polarity="Input" name="CLR" />
        <port polarity="Output" name="Q0" />
        <port polarity="Output" name="Q1" />
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
        <instance x="976" y="1168" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1616" y="1168" name="XLXI_2" orien="R0">
        </instance>
        <instance x="2432" y="1152" name="XLXI_3" orien="R0">
        </instance>
        <branch name="T">
            <wire x2="816" y1="1008" y2="1008" x1="512" />
            <wire x2="976" y1="1008" y2="1008" x1="816" />
            <wire x2="816" y1="912" y2="1008" x1="816" />
            <wire x2="1424" y1="912" y2="912" x1="816" />
            <wire x2="1424" y1="912" y2="1008" x1="1424" />
            <wire x2="1616" y1="1008" y2="1008" x1="1424" />
            <wire x2="2080" y1="912" y2="912" x1="1424" />
            <wire x2="2080" y1="912" y2="992" x1="2080" />
            <wire x2="2432" y1="992" y2="992" x1="2080" />
        </branch>
        <branch name="Q2">
            <wire x2="2848" y1="992" y2="992" x1="2816" />
        </branch>
        <branch name="CLR">
            <wire x2="928" y1="1072" y2="1072" x1="864" />
            <wire x2="976" y1="1072" y2="1072" x1="928" />
            <wire x2="1408" y1="896" y2="896" x1="928" />
            <wire x2="1408" y1="896" y2="1072" x1="1408" />
            <wire x2="1616" y1="1072" y2="1072" x1="1408" />
            <wire x2="2016" y1="896" y2="896" x1="1408" />
            <wire x2="2016" y1="896" y2="1056" x1="2016" />
            <wire x2="2432" y1="1056" y2="1056" x1="2016" />
            <wire x2="928" y1="896" y2="1072" x1="928" />
        </branch>
        <iomarker fontsize="28" x="2848" y="992" name="Q2" orien="R0" />
        <iomarker fontsize="28" x="512" y="1008" name="T" orien="R180" />
        <iomarker fontsize="28" x="864" y="1072" name="CLR" orien="R180" />
        <branch name="Q0">
            <wire x2="1392" y1="1008" y2="1008" x1="1360" />
            <wire x2="1392" y1="1008" y2="1136" x1="1392" />
            <wire x2="1616" y1="1136" y2="1136" x1="1392" />
            <wire x2="1392" y1="1136" y2="1264" x1="1392" />
        </branch>
        <branch name="Q1">
            <wire x2="2208" y1="1008" y2="1008" x1="2000" />
            <wire x2="2208" y1="1008" y2="1120" x1="2208" />
            <wire x2="2432" y1="1120" y2="1120" x1="2208" />
            <wire x2="2208" y1="1120" y2="1216" x1="2208" />
        </branch>
        <branch name="CLK">
            <wire x2="976" y1="1136" y2="1136" x1="944" />
        </branch>
        <iomarker fontsize="28" x="944" y="1136" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="1392" y="1264" name="Q0" orien="R90" />
        <iomarker fontsize="28" x="2208" y="1216" name="Q1" orien="R90" />
    </sheet>
</drawing>