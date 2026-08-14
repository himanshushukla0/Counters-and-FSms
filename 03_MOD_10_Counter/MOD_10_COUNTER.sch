<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="artix7" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="T" />
        <signal name="CLK" />
        <signal name="Q(0)" />
        <signal name="Q(1)" />
        <signal name="Q(3:0)" />
        <signal name="CLR" />
        <signal name="XLXN_18" />
        <signal name="XLXN_21" />
        <signal name="XLXN_9" />
        <signal name="Q(3)" />
        <signal name="XLXN_11" />
        <signal name="Q(2)" />
        <port polarity="Input" name="CLK" />
        <port polarity="Output" name="Q(3:0)" />
        <port polarity="Input" name="CLR" />
        <blockdef name="TFF">
            <timestamp>2026-7-8T7:23:1</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
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
        <blockdef name="nand2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="216" y1="-96" y2="-96" x1="256" />
            <circle r="12" cx="204" cy="-96" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
        </blockdef>
        <block symbolname="TFF" name="XLXI_1">
            <blockpin signalname="T" name="T" />
            <blockpin signalname="XLXN_21" name="CLR" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="Q(0)" name="Q" />
            <blockpin name="Qb" />
        </block>
        <block symbolname="TFF" name="XLXI_2">
            <blockpin signalname="T" name="T" />
            <blockpin signalname="XLXN_21" name="CLR" />
            <blockpin signalname="Q(0)" name="CLK" />
            <blockpin signalname="Q(1)" name="Q" />
            <blockpin name="Qb" />
        </block>
        <block symbolname="TFF" name="XLXI_3">
            <blockpin signalname="T" name="T" />
            <blockpin signalname="XLXN_21" name="CLR" />
            <blockpin signalname="Q(1)" name="CLK" />
            <blockpin signalname="Q(2)" name="Q" />
            <blockpin name="Qb" />
        </block>
        <block symbolname="TFF" name="XLXI_9">
            <blockpin signalname="T" name="T" />
            <blockpin signalname="XLXN_21" name="CLR" />
            <blockpin signalname="Q(2)" name="CLK" />
            <blockpin signalname="Q(3)" name="Q" />
            <blockpin name="Qb" />
        </block>
        <block symbolname="vcc" name="XLXI_10">
            <blockpin signalname="T" name="P" />
        </block>
        <block symbolname="and2" name="XLXI_12">
            <blockpin signalname="CLR" name="I0" />
            <blockpin signalname="XLXN_18" name="I1" />
            <blockpin signalname="XLXN_21" name="O" />
        </block>
        <block symbolname="nand2" name="XLXI_11">
            <blockpin signalname="Q(2)" name="I0" />
            <blockpin signalname="Q(3)" name="I1" />
            <blockpin signalname="XLXN_18" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="7040">
        <instance x="1280" y="2640" name="XLXI_1" orien="R0">
        </instance>
        <instance x="2080" y="2640" name="XLXI_2" orien="R0">
        </instance>
        <instance x="2880" y="2640" name="XLXI_3" orien="R0">
        </instance>
        <branch name="T">
            <wire x2="1216" y1="2352" y2="2352" x1="1136" />
            <wire x2="1728" y1="2352" y2="2352" x1="1216" />
            <wire x2="2544" y1="2352" y2="2352" x1="1728" />
            <wire x2="2544" y1="2352" y2="2480" x1="2544" />
            <wire x2="2880" y1="2480" y2="2480" x1="2544" />
            <wire x2="3328" y1="2352" y2="2352" x1="2544" />
            <wire x2="3328" y1="2352" y2="2480" x1="3328" />
            <wire x2="3808" y1="2480" y2="2480" x1="3328" />
            <wire x2="1728" y1="2352" y2="2480" x1="1728" />
            <wire x2="2080" y1="2480" y2="2480" x1="1728" />
            <wire x2="1216" y1="2352" y2="2480" x1="1216" />
            <wire x2="1280" y1="2480" y2="2480" x1="1216" />
        </branch>
        <branch name="CLK">
            <wire x2="1280" y1="2608" y2="2608" x1="1168" />
        </branch>
        <instance x="3808" y="2640" name="XLXI_9" orien="R0">
        </instance>
        <instance x="1136" y="2416" name="XLXI_10" orien="R270" />
        <branch name="Q(0)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2368" y="3008" type="branch" />
            <wire x2="1712" y1="2480" y2="2480" x1="1664" />
            <wire x2="1712" y1="2480" y2="2608" x1="1712" />
            <wire x2="2080" y1="2608" y2="2608" x1="1712" />
            <wire x2="1712" y1="2608" y2="2816" x1="1712" />
            <wire x2="2368" y1="2816" y2="2816" x1="1712" />
            <wire x2="2368" y1="2816" y2="3008" x1="2368" />
            <wire x2="2368" y1="3008" y2="3024" x1="2368" />
        </branch>
        <branch name="Q(1)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2688" y="3008" type="branch" />
            <wire x2="2528" y1="2480" y2="2480" x1="2464" />
            <wire x2="2528" y1="2480" y2="2608" x1="2528" />
            <wire x2="2880" y1="2608" y2="2608" x1="2528" />
            <wire x2="2528" y1="2608" y2="2816" x1="2528" />
            <wire x2="2688" y1="2816" y2="2816" x1="2528" />
            <wire x2="2688" y1="2816" y2="3008" x1="2688" />
            <wire x2="2688" y1="3008" y2="3024" x1="2688" />
        </branch>
        <branch name="Q(3:0)">
            <wire x2="2368" y1="3120" y2="3120" x1="1168" />
            <wire x2="2688" y1="3120" y2="3120" x1="2368" />
            <wire x2="3008" y1="3120" y2="3120" x1="2688" />
            <wire x2="3328" y1="3120" y2="3120" x1="3008" />
            <wire x2="4048" y1="3120" y2="3120" x1="3328" />
        </branch>
        <bustap x2="3328" y1="3120" y2="3024" x1="3328" />
        <bustap x2="3008" y1="3120" y2="3024" x1="3008" />
        <bustap x2="2688" y1="3120" y2="3024" x1="2688" />
        <bustap x2="2368" y1="3120" y2="3024" x1="2368" />
        <instance x="1264" y="2800" name="XLXI_12" orien="R180" />
        <branch name="CLR">
            <wire x2="1296" y1="2864" y2="2864" x1="1264" />
        </branch>
        <instance x="1584" y="2864" name="XLXI_11" orien="R180" />
        <branch name="XLXN_18">
            <wire x2="1280" y1="2928" y2="2928" x1="1264" />
            <wire x2="1280" y1="2928" y2="2960" x1="1280" />
            <wire x2="1328" y1="2960" y2="2960" x1="1280" />
        </branch>
        <branch name="XLXN_21">
            <wire x2="1280" y1="2544" y2="2544" x1="928" />
            <wire x2="928" y1="2544" y2="2720" x1="928" />
            <wire x2="928" y1="2720" y2="2896" x1="928" />
            <wire x2="1008" y1="2896" y2="2896" x1="928" />
            <wire x2="1728" y1="2720" y2="2720" x1="928" />
            <wire x2="2512" y1="2720" y2="2720" x1="1728" />
            <wire x2="3328" y1="2720" y2="2720" x1="2512" />
            <wire x2="1728" y1="2544" y2="2720" x1="1728" />
            <wire x2="2080" y1="2544" y2="2544" x1="1728" />
            <wire x2="2512" y1="2544" y2="2720" x1="2512" />
            <wire x2="2880" y1="2544" y2="2544" x1="2512" />
            <wire x2="3328" y1="2544" y2="2720" x1="3328" />
            <wire x2="3808" y1="2544" y2="2544" x1="3328" />
        </branch>
        <branch name="Q(3)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3328" y="3008" type="branch" />
            <wire x2="2448" y1="2992" y2="2992" x1="1584" />
            <wire x2="2448" y1="2944" y2="2992" x1="2448" />
            <wire x2="3328" y1="2944" y2="2944" x1="2448" />
            <wire x2="4272" y1="2944" y2="2944" x1="3328" />
            <wire x2="3328" y1="2944" y2="3008" x1="3328" />
            <wire x2="3328" y1="3008" y2="3024" x1="3328" />
            <wire x2="4272" y1="2480" y2="2480" x1="4192" />
            <wire x2="4272" y1="2480" y2="2944" x1="4272" />
        </branch>
        <branch name="Q(2)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:28;fontname:Arial" attrname="Name" x="3008" y="3008" type="branch" />
            <wire x2="2752" y1="2928" y2="2928" x1="1584" />
            <wire x2="2752" y1="2816" y2="2928" x1="2752" />
            <wire x2="3008" y1="2816" y2="2816" x1="2752" />
            <wire x2="3312" y1="2816" y2="2816" x1="3008" />
            <wire x2="3008" y1="2816" y2="3008" x1="3008" />
            <wire x2="3008" y1="3008" y2="3024" x1="3008" />
            <wire x2="3312" y1="2480" y2="2480" x1="3264" />
            <wire x2="3312" y1="2480" y2="2608" x1="3312" />
            <wire x2="3808" y1="2608" y2="2608" x1="3312" />
            <wire x2="3312" y1="2608" y2="2816" x1="3312" />
        </branch>
        <iomarker fontsize="28" x="1168" y="2608" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="4048" y="3120" name="Q(3:0)" orien="R0" />
        <iomarker fontsize="28" x="1296" y="2864" name="CLR" orien="R0" />
    </sheet>
</drawing>