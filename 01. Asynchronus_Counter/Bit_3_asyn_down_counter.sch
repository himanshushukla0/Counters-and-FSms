<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3a" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="T" />
        <signal name="CLR" />
        <signal name="XLXN_3" />
        <signal name="XLXN_4" />
        <signal name="Q0" />
        <signal name="Q1" />
        <signal name="Q2" />
        <signal name="CLK" />
        <port polarity="Input" name="T" />
        <port polarity="Input" name="CLR" />
        <port polarity="Output" name="Q0" />
        <port polarity="Output" name="Q1" />
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
            <blockpin signalname="XLXN_3" name="Qb" />
        </block>
        <block symbolname="TFF" name="XLXI_2">
            <blockpin signalname="T" name="T" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="XLXN_3" name="CLK" />
            <blockpin signalname="Q1" name="Q" />
            <blockpin signalname="XLXN_4" name="Qb" />
        </block>
        <block symbolname="TFF" name="XLXI_3">
            <blockpin signalname="T" name="T" />
            <blockpin signalname="CLR" name="CLR" />
            <blockpin signalname="XLXN_4" name="CLK" />
            <blockpin signalname="Q2" name="Q" />
            <blockpin name="Qb" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="880" y="880" name="XLXI_1" orien="R0">
        </instance>
        <instance x="1520" y="880" name="XLXI_2" orien="R0">
        </instance>
        <instance x="2240" y="880" name="XLXI_3" orien="R0">
        </instance>
        <branch name="T">
            <wire x2="816" y1="720" y2="720" x1="736" />
            <wire x2="880" y1="720" y2="720" x1="816" />
            <wire x2="1328" y1="592" y2="592" x1="816" />
            <wire x2="1328" y1="592" y2="720" x1="1328" />
            <wire x2="1520" y1="720" y2="720" x1="1328" />
            <wire x2="1984" y1="592" y2="592" x1="1328" />
            <wire x2="1984" y1="592" y2="720" x1="1984" />
            <wire x2="2240" y1="720" y2="720" x1="1984" />
            <wire x2="816" y1="592" y2="720" x1="816" />
        </branch>
        <branch name="CLR">
            <wire x2="800" y1="784" y2="784" x1="704" />
            <wire x2="880" y1="784" y2="784" x1="800" />
            <wire x2="800" y1="784" y2="944" x1="800" />
            <wire x2="1328" y1="944" y2="944" x1="800" />
            <wire x2="1984" y1="944" y2="944" x1="1328" />
            <wire x2="1328" y1="784" y2="944" x1="1328" />
            <wire x2="1520" y1="784" y2="784" x1="1328" />
            <wire x2="1984" y1="784" y2="944" x1="1984" />
            <wire x2="2240" y1="784" y2="784" x1="1984" />
        </branch>
        <branch name="XLXN_3">
            <wire x2="1520" y1="848" y2="848" x1="1264" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="2240" y1="848" y2="848" x1="1904" />
        </branch>
        <branch name="Q0">
            <wire x2="1264" y1="720" y2="1072" x1="1264" />
        </branch>
        <branch name="Q1">
            <wire x2="1920" y1="720" y2="720" x1="1904" />
            <wire x2="1920" y1="720" y2="1040" x1="1920" />
        </branch>
        <branch name="Q2">
            <wire x2="2656" y1="720" y2="720" x1="2624" />
            <wire x2="2656" y1="720" y2="1040" x1="2656" />
        </branch>
        <iomarker fontsize="28" x="736" y="720" name="T" orien="R180" />
        <iomarker fontsize="28" x="704" y="784" name="CLR" orien="R180" />
        <branch name="CLK">
            <wire x2="880" y1="848" y2="848" x1="848" />
        </branch>
        <iomarker fontsize="28" x="848" y="848" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="1264" y="1072" name="Q0" orien="R90" />
        <iomarker fontsize="28" x="1920" y="1040" name="Q1" orien="R90" />
        <iomarker fontsize="28" x="2656" y="1040" name="Q2" orien="R90" />
    </sheet>
</drawing>