VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL PC(31:0)
        SIGNAL Clk
        SIGNAL New_PC(31:0)
        SIGNAL PC(6:2)
        SIGNAL Instr(15:11)
        SIGNAL XLXN_29
        SIGNAL Instr(25:21)
        SIGNAL Instr(20:16)
        SIGNAL RegDest
        SIGNAL WrReg(4:0)
        SIGNAL Instr(31:0)
        PORT Input Clk
        BEGIN BLOCKDEF PC_Update
            TIMESTAMP 2017 3 24 10 28 2
            RECTANGLE N -16 -44 48 -20 
            LINE N 48 -32 -16 -32 
            RECTANGLE N 48 -196 368 0 
            RECTANGLE N 368 -172 432 -148 
            LINE N 368 -160 432 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF ProgCnt
            TIMESTAMP 2017 3 24 10 18 45
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -108 384 -84 
            LINE N 320 -96 384 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF ROM32x32
            TIMESTAMP 2017 3 24 11 16 52
            RECTANGLE N 64 -64 320 0 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF MUX2V5
            TIMESTAMP 2017 3 25 8 6 19
            RECTANGLE N 64 -192 320 0 
            RECTANGLE N 320 -172 384 -148 
            LINE N 320 -160 384 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
        END BLOCKDEF
        BEGIN BLOCK U_PC ProgCnt
            PIN Clk Clk
            PIN New_PC(31:0) New_PC(31:0)
            PIN PC(31:0) PC(31:0)
        END BLOCK
        BEGIN BLOCK U_New_PC PC_Update
            PIN PC(31:0) PC(31:0)
            PIN New_PC(31:0) New_PC(31:0)
        END BLOCK
        BEGIN BLOCK U_ROM ROM32x32
            PIN Addr(4:0) PC(6:2)
            PIN Data(31:0) Instr(31:0)
        END BLOCK
        BEGIN BLOCK U_MUXRegD MUX2V5
            PIN Y(4:0) WrReg(4:0)
            PIN I0(4:0) Instr(20:16)
            PIN I1(4:0) Instr(15:11)
            PIN Sel RegDest
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH PC(31:0)
            WIRE 1168 880 1248 880
            WIRE 1248 880 1248 976
            WIRE 1248 976 1248 1200
            WIRE 1248 1200 1248 1312
            WIRE 1248 1312 1248 1392
            WIRE 1168 1200 1248 1200
            BEGIN DISPLAY 1248 976 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clk
            WIRE 752 1200 768 1200
            WIRE 768 1200 784 1200
        END BRANCH
        BEGIN INSTANCE U_PC 784 1296 R0
            BEGIN DISPLAY 64 24 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH New_PC(31:0)
            WIRE 592 752 592 1040
            WIRE 592 1040 592 1264
            WIRE 592 1264 784 1264
            WIRE 592 752 720 752
            BEGIN DISPLAY 592 1040 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_New_PC 1152 912 M0
            BEGIN DISPLAY 320 -272 ATTR InstName
                ALIGNMENT RIGHT
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BUSTAP 1248 1312 1344 1312
        BEGIN BRANCH PC(6:2)
            WIRE 1344 1312 1392 1312
            WIRE 1392 1312 1504 1312
            BEGIN DISPLAY 1392 1312 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_ROM 1504 1344 R0
            BEGIN DISPLAY 48 -152 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        IOMARKER 752 1200 Clk R180 28
        BEGIN BRANCH Instr(31:0)
            WIRE 1888 1312 1920 1312
            WIRE 1920 1312 1920 1360
            WIRE 1920 1360 1920 1392
            WIRE 1920 1392 1920 1472
            WIRE 1920 1472 1920 1680
            WIRE 1920 1680 1920 1840
            WIRE 1920 1840 1920 2080
            BEGIN DISPLAY 1920 1680 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1920 1392 2016 1392
        BUSTAP 1920 1472 2016 1472
        BEGIN INSTANCE U_MUXRegD 2208 1936 R0
            BEGIN DISPLAY 80 -280 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH Instr(25:21)
            WIRE 2016 1392 2480 1392
            WIRE 2480 1392 2640 1392
            BEGIN DISPLAY 2480 1392 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(20:16)
            WIRE 2016 1472 2064 1472
            WIRE 2064 1472 2064 1776
            WIRE 2064 1776 2208 1776
            WIRE 2064 1472 2480 1472
            WIRE 2480 1472 2640 1472
            BEGIN DISPLAY 2480 1472 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1920 1840 2016 1840
        BEGIN BRANCH Instr(15:11)
            WIRE 2016 1840 2064 1840
            WIRE 2064 1840 2208 1840
            BEGIN DISPLAY 2064 1840 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegDest
            WIRE 2064 1904 2144 1904
            WIRE 2144 1904 2208 1904
            BEGIN DISPLAY 2144 1904 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrReg(4:0)
            WIRE 2592 1776 2720 1776
            WIRE 2720 1776 2864 1776
            BEGIN DISPLAY 2720 1776 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
    END SHEET
END SCHEMATIC
