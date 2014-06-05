/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20130117-64 [Apr 20 2014]
 * Copyright (c) 2000 - 2013 Intel Corporation
 * 
 * Disassembly of dsdt.dat, Wed Jun  4 17:01:30 2014
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x0000CA66 (51814)
 *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
 *     Checksum         0x64
 *     OEM ID           "LENOVO"
 *     OEM Table ID     "CB-01   "
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "ACPI"
 *     Compiler Version 0x00040000 (262144)
 */

DefinitionBlock ("dsdt.aml", "DSDT", 1, "LENOVO", "CB-01   ", 0x00000001)
{
    External (_PR_.C000._PPC, IntObj)
    External (_PR_.C000.PPCV)
    External (_SB_.ALIB, MethodObj)    // 2 Arguments
    External (_SB_.APTS, MethodObj)    // 1 Arguments
    External (_SB_.AWAK, MethodObj)    // 1 Arguments
    External (ALIB, MethodObj)    // 2 Arguments

    OperationRegion (DBG0, SystemIO, 0x80, One)
    Field (DBG0, ByteAcc, NoLock, Preserve)
    {
        IO80,   8
    }

    OperationRegion (DBG1, SystemIO, 0x80, 0x02)
    Field (DBG1, WordAcc, NoLock, Preserve)
    {
        P80H,   16
    }

    OperationRegion (ACMS, SystemIO, 0x72, 0x02)
    Field (ACMS, ByteAcc, NoLock, Preserve)
    {
        INDX,   8, 
        DATA,   8
    }

    OperationRegion (PSMI, SystemIO, 0xB0, 0x02)
    Field (PSMI, ByteAcc, NoLock, Preserve)
    {
        APMC,   8, 
        APMD,   8
    }

    OperationRegion (SMIO, SystemIO, 0xB0, 0x02)
    Field (SMIO, ByteAcc, NoLock, Preserve)
    {
        SMIC,   8, 
        SMID,   8
    }

    OperationRegion (PMRG, SystemIO, 0x0CD6, 0x02)
    Field (PMRG, ByteAcc, NoLock, Preserve)
    {
        PMRI,   8, 
        PMRD,   8
    }

    IndexField (PMRI, PMRD, ByteAcc, NoLock, Preserve)
    {
        Offset (0x24), 
        MMSO,   32, 
        Offset (0x50), 
        HPAD,   32, 
        Offset (0x60), 
        P1EB,   16, 
        Offset (0xC8), 
            ,   2, 
        SPRE,   1, 
        TPDE,   1, 
        Offset (0xF0), 
            ,   3, 
        RSTU,   1
    }

    OperationRegion (GSMM, SystemMemory, MMSO, 0x1000)
    Field (GSMM, AnyAcc, NoLock, Preserve)
    {
        Offset (0x132), 
            ,   7, 
        GP51,   1, 
        Offset (0x136), 
            ,   7, 
        GP55,   1, 
        Offset (0x13A), 
            ,   7, 
        GP59,   1, 
        Offset (0x13F), 
            ,   7, 
        GP64,   1, 
        Offset (0x160), 
            ,   7, 
        GE01,   1, 
        Offset (0x16A), 
            ,   7, 
        GE11,   1, 
            ,   7, 
        GE12,   1, 
        Offset (0x16E), 
            ,   7, 
        BATS,   1, 
        Offset (0x1FF), 
            ,   1, 
        G01S,   1, 
        Offset (0x203), 
            ,   1, 
        G01E,   1, 
        Offset (0x207), 
            ,   1, 
        TR01,   1, 
        Offset (0x20B), 
            ,   1, 
        TL01,   1, 
        Offset (0x20D), 
            ,   7, 
        ACIR,   1, 
        Offset (0x287), 
            ,   1, 
        CLPS,   1, 
        Offset (0x298), 
            ,   7, 
        G15A,   1, 
        Offset (0x2AF), 
            ,   2, 
        SLPS,   2, 
        Offset (0x376), 
        EPNM,   1, 
        DPPF,   1, 
        Offset (0x3BA), 
            ,   6, 
        PWDE,   1, 
        Offset (0x3BD), 
            ,   5, 
        ALLS,   1, 
        Offset (0x3DE), 
        BLNK,   2, 
        Offset (0x3EF), 
        PHYD,   1, 
        Offset (0xE80), 
            ,   2, 
        ECES,   1
    }

    OperationRegion (P1E0, SystemIO, P1EB, 0x04)
    Field (P1E0, ByteAcc, NoLock, Preserve)
    {
            ,   14, 
        PEWS,   1, 
        WSTA,   1, 
            ,   14, 
        PEWD,   1
    }

    OperationRegion (IOCC, SystemIO, 0x0400, 0x80)
    Field (IOCC, ByteAcc, NoLock, Preserve)
    {
        Offset (0x01), 
            ,   2, 
        RTCS,   1
    }

    Name (PRWP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (GPRW, 2, NotSerialized)
    {
        Store (Arg0, Index (PRWP, Zero))
        Store (Arg1, Index (PRWP, One))
        If (LAnd (LEqual (DAS3, Zero), LEqual (DAS1, Zero)))
        {
            If (LLessEqual (Arg1, 0x03))
            {
                Store (Zero, Index (PRWP, One))
            }
        }
        Else
        {
            If (LAnd (LEqual (DAS3, Zero), LEqual (Arg1, 0x03)))
            {
                Store (One, Index (PRWP, One))
            }

            If (LAnd (LEqual (DAS1, Zero), LEqual (Arg1, One)))
            {
                Store (Zero, Index (PRWP, One))
            }
        }

        Return (PRWP)
    }

    Method (SPTS, 1, NotSerialized)
    {
        If (LEqual (Arg0, 0x03))
        {
            Store (Zero, RSTU)
        }

        Store (One, CLPS)
        Store (One, SLPS)
        Store (PEWS, PEWS)
    }

    Method (SWAK, 1, NotSerialized)
    {
        If (LEqual (Arg0, 0x03))
        {
            Store (One, RSTU)
        }

        Store (PEWS, PEWS)
        Store (One, PWDE)
        Store (Zero, PEWD)
    }

    Method (CHKH, 0, NotSerialized)
    {
        If (\_SB.PCI0.SMBS.GE05)
        {
            Store (Zero, \_SB.PCI0.SMBS.G05T)
        }
        Else
        {
            Store (One, \_SB.PCI0.SMBS.G05T)
        }

        Store (Not (\_SB.PCI0.SMBS.GE06), \_SB.PCI0.SMBS.G06T)
        Store (Not (\_SB.PCI0.SMBS.GE16), \_SB.PCI0.SMBS.G16T)
    }

    OperationRegion (ABIO, SystemIO, 0x0CD8, 0x08)
    Field (ABIO, DWordAcc, NoLock, Preserve)
    {
        INAB,   32, 
        DAAB,   32
    }

    Method (RDAB, 1, NotSerialized)
    {
        Store (Arg0, INAB)
        Return (DAAB)
    }

    Method (WTAB, 2, NotSerialized)
    {
        Store (Arg0, INAB)
        Store (Arg1, DAAB)
    }

    Method (RWAB, 3, NotSerialized)
    {
        And (RDAB (Arg0), Arg1, Local0)
        Or (Local0, Arg2, Local1)
        WTAB (Arg0, Local1)
    }

    Method (CABR, 3, NotSerialized)
    {
        ShiftLeft (Arg0, 0x05, Local0)
        Add (Local0, Arg1, Local1)
        ShiftLeft (Local1, 0x18, Local2)
        Add (Local2, Arg2, Local3)
        Return (Local3)
    }

    OperationRegion (PEBA, SystemMemory, 0xF8000000, 0x02000000)
    Field (PEBA, AnyAcc, NoLock, Preserve)
    {
        Offset (0xA807A), 
        PMS0,   1, 
        Offset (0xA8088), 
        TLS0,   4, 
        Offset (0xA907A), 
        PMS1,   1, 
        Offset (0xA9088), 
        TLS1,   4, 
        Offset (0xAA07A), 
        PMS2,   1, 
        Offset (0xAA088), 
        TLS2,   4, 
        Offset (0xAB07A), 
        PMS3,   1, 
        Offset (0xAB088), 
        TLS3,   4
    }

    OperationRegion (GNVS, SystemMemory, 0xAFBBCF18, 0x0000001B)
    Field (GNVS, AnyAcc, NoLock, Preserve)
    {
        DAS1,   8, 
        DAS3,   8, 
        TNBH,   8, 
        TCP0,   8, 
        TCP1,   8, 
        ATNB,   8, 
        PCP0,   8, 
        PCP1,   8, 
        PWMN,   8, 
        LPTY,   8, 
        M92D,   8, 
        WKPM,   8, 
        ALST,   8, 
        AFUC,   8, 
        EXUS,   8, 
        AIRC,   8, 
        WLSH,   8, 
        TSSS,   8, 
        ODZC,   8, 
        PCBA,   32, 
        PCBL,   32
    }

    OperationRegion (OGNS, SystemMemory, 0xAFBBCE98, 0x00000020)
    Field (OGNS, AnyAcc, Lock, Preserve)
    {
        TPDF,   8, 
        OG01,   8, 
        OG02,   8, 
        OG03,   8, 
        OG04,   8, 
        OG05,   8, 
        OG06,   8, 
        OG07,   8, 
        OG08,   8, 
        OG09,   8, 
        PRS5,   8, 
        OSYS,   16, 
        WLFG,   8, 
        BL00,   8, 
        BL01,   8, 
        BL02,   8, 
        BL03,   8, 
        BL04,   8, 
        BL05,   8, 
        BL06,   8, 
        BL07,   8, 
        BL08,   8, 
        BL09,   8, 
        BL10,   8, 
        BL11,   8, 
        BL12,   8, 
        BL13,   8, 
        BL14,   8, 
        BL15,   8, 
        PRYA,   8, 
        PRGH,   8
    }

    OperationRegion (NVST, SystemMemory, 0xAFBBDE8E, 0x0000012B)
    Field (NVST, AnyAcc, Lock, Preserve)
    {
        SMIF,   8, 
        PRM0,   8, 
        PRM1,   8, 
        BRTL,   8, 
        TLST,   8, 
        IGDS,   8, 
        LCDA,   16, 
        CSTE,   16, 
        NSTE,   16, 
        CADL,   16, 
        PADL,   16, 
        LIDS,   8, 
        PWRS,   8, 
        BVAL,   32, 
        ADDL,   16, 
        BCMD,   8, 
        SBFN,   8, 
        DID,    32, 
        INFO,   2048, 
        TOML,   8, 
        TOMH,   8, 
        CEBP,   8, 
        C0LS,   8, 
        C1LS,   8, 
        C0HS,   8, 
        C1HS,   8, 
        ROMS,   32, 
        MUXF,   8, 
        PDDN,   8
    }

    Method (SCMP, 2, NotSerialized)
    {
        Name (STG1, Buffer (0x50) {})
        Name (STG2, Buffer (0x50) {})
        Store (Arg0, STG1)
        Store (Arg1, STG2)
        If (LNotEqual (SizeOf (Arg0), SizeOf (Arg1)))
        {
            Return (Zero)
        }

        Store (Zero, Local0)
        While (LLess (Local0, SizeOf (Arg0)))
        {
            If (LNotEqual (DerefOf (Index (STG1, Local0)), DerefOf (Index (
                STG2, Local0))))
            {
                Return (Zero)
            }

            Increment (Local0)
        }

        Return (One)
    }

    Name (WNOS, Zero)
    Name (MYOS, Zero)
    Name (HTTS, Zero)
    Name (OSTB, Ones)
    Name (TPOS, Zero)
    Name (LINX, Zero)
    Name (OSSP, Zero)
    Method (CKOS, 0, NotSerialized)
    {
        If (LEqual (WNOS, Zero))
        {
            If (SCMP (_OS, "Microsoft Windows"))
            {
                Store (One, WNOS)
            }

            If (SCMP (_OS, "Microsoft Windows NT"))
            {
                Store (0x02, WNOS)
            }

            If (SCMP (_OS, "Microsoft WindowsME: Millennium Edition"))
            {
                Store (0x03, WNOS)
            }

            If (CondRefOf (\_OSI, Local0))
            {
                If (SCMP (_OS, "Windows 2006"))
                {
                    Store (0x05, WNOS)
                }
                Else
                {
                    If (SCMP (_OS, "Windows 2009"))
                    {
                        Store (0x06, WNOS)
                    }
                    Else
                    {
                        Store (0x04, WNOS)
                    }
                }
            }
        }

        Return (WNOS)
    }

    Method (SEQL, 2, Serialized)
    {
        Store (SizeOf (Arg0), Local0)
        Store (SizeOf (Arg1), Local1)
        If (LNotEqual (Local0, Local1))
        {
            Return (Zero)
        }

        Name (BUF0, Buffer (Local0) {})
        Store (Arg0, BUF0)
        Name (BUF1, Buffer (Local0) {})
        Store (Arg1, BUF1)
        Store (Zero, Local2)
        While (LLess (Local2, Local0))
        {
            Store (DerefOf (Index (BUF0, Local2)), Local3)
            Store (DerefOf (Index (BUF1, Local2)), Local4)
            If (LNotEqual (Local3, Local4))
            {
                Return (Zero)
            }

            Increment (Local2)
        }

        Return (One)
    }

    Method (OSTY, 0, NotSerialized)
    {
        If (LEqual (OSTB, Ones))
        {
            If (CondRefOf (\_OSI, Local0))
            {
                Store (Zero, OSTB)
                Store (Zero, TPOS)
                If (_OSI ("Windows 2001"))
                {
                    Store (0x08, OSTB)
                    Store (0x08, TPOS)
                }

                If (_OSI ("Windows 2001.1"))
                {
                    Store (0x20, OSTB)
                    Store (0x20, TPOS)
                }

                If (_OSI ("Windows 2001 SP1"))
                {
                    Store (0x10, OSTB)
                    Store (0x10, TPOS)
                }

                If (_OSI ("Windows 2001 SP2"))
                {
                    Store (0x11, OSTB)
                    Store (0x11, TPOS)
                }

                If (_OSI ("Windows 2001 SP3"))
                {
                    Store (0x12, OSTB)
                    Store (0x12, TPOS)
                }

                If (_OSI ("Windows 2006"))
                {
                    Store (0x40, OSTB)
                    Store (0x40, TPOS)
                }

                If (_OSI ("Windows 2006 SP1"))
                {
                    Store (0x41, OSTB)
                    Store (0x41, TPOS)
                    Store (One, OSSP)
                }

                If (_OSI ("Windows 2009"))
                {
                    Store (One, OSSP)
                    Store (0x50, OSTB)
                    Store (0x50, TPOS)
                }

                If (_OSI ("Windows 2012"))
                {
                    Store (One, OSSP)
                    Store (0x60, OSTB)
                    Store (0x60, TPOS)
                }

                If (_OSI ("Linux"))
                {
                    Store (One, LINX)
                    Store (0x80, OSTB)
                    Store (0x80, TPOS)
                    Store (0x02, \_SB.PCI0.LPC0.EC0.OSTY)
                }
            }
            Else
            {
                If (CondRefOf (\_OS, Local0))
                {
                    If (SEQL (_OS, "Microsoft Windows"))
                    {
                        Store (One, OSTB)
                        Store (One, TPOS)
                    }
                    Else
                    {
                        If (SEQL (_OS, "Microsoft WindowsME: Millennium Edition"))
                        {
                            Store (0x02, OSTB)
                            Store (0x02, TPOS)
                        }
                        Else
                        {
                            If (SEQL (_OS, "Microsoft Windows NT"))
                            {
                                Store (0x04, OSTB)
                                Store (0x04, TPOS)
                            }
                            Else
                            {
                                Store (Zero, OSTB)
                                Store (Zero, TPOS)
                            }
                        }
                    }
                }
                Else
                {
                    Store (Zero, OSTB)
                    Store (Zero, TPOS)
                }
            }
        }

        Return (OSTB)
    }

    Scope (_PR)
    {
        Processor (C000, 0x00, 0x00000410, 0x06) {}
        Processor (C001, 0x01, 0x00000410, 0x06) {}
        Processor (C002, 0x02, 0x00000410, 0x06) {}
        Processor (C003, 0x03, 0x00000410, 0x06) {}
    }

    Name (_S0, Package (0x04)  // _S0_: S0 System State
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    If (LEqual (DAS1, One))
    {
        Name (_S1, Package (0x04)  // _S1_: S1 System State
        {
            One, 
            One, 
            Zero, 
            Zero
        })
    }

    If (LEqual (DAS3, One))
    {
        Name (_S3, Package (0x04)  // _S3_: S3 System State
        {
            0x03, 
            0x03, 
            Zero, 
            Zero
        })
    }

    Name (_S4, Package (0x04)  // _S4_: S4 System State
    {
        0x04, 
        0x04, 
        Zero, 
        Zero
    })
    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x05, 
        0x05, 
        Zero, 
        Zero
    })
    Scope (_GPE)
    {
        Method (_L1C, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Store (0xFFFF, Local1)
            Store (\_SB.PCI0.SMBS.MIN, Local2)
            ShiftLeft (Local2, 0x08, Local1)
            Store (\_SB.PCI0.SMBS.SEC, Local2)
            Or (Local1, Local2, Local1)
            Store (Local1, P80H)
        }

        Method (_L08, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.PB2, 0x02)
            Notify (\_SB.PCI0.PB3, 0x02)
            Notify (\_SB.PCI0.PB4, 0x02)
            Notify (\_SB.PCI0.PB5, 0x02)
            Notify (\_SB.PCI0.PB6, 0x02)
            Notify (\_SB.PCI0.PB7, 0x02)
            Notify (\_SB.PCI0.SPB0, 0x02)
            Notify (\_SB.PCI0.SPB1, 0x02)
            Notify (\_SB.PCI0.SPB2, 0x02)
            Notify (\_SB.PCI0.SPB3, 0x02)
        }

        Name (CALB, Buffer (0x05) {})
        Name (XX05, Buffer (0x05) {})
        Method (_L05, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            CreateWordField (CALB, Zero, SZZE)
            CreateField (CALB, 0x10, 0x03, FUCC)
            CreateField (CALB, 0x13, 0x05, DEVV)
            CreateByteField (CALB, 0x03, BUSS)
            CreateByteField (CALB, 0x04, HPST)
            Store (0x05, SZZE)
            Store (Zero, BUSS)
            Store (0x07, DEVV)
            Store (Zero, FUCC)
            If (\_SB.PCI0.SMBS.GE05)
            {
                Store (Zero, \_SB.PCI0.SMBS.G05T)
                Store (0x0F04, P80H)
                Store (Zero, HPST)
                \_SB.ALIB (0x06, CALB)
                Store (0x0F05, P80H)
            }
            Else
            {
                Store (One, \_SB.PCI0.SMBS.G05T)
                Store (0x0204, P80H)
                Store (One, HPST)
                \_SB.ALIB (0x06, CALB)
                Store (0x0205, P80H)
            }

            Notify (\_SB.PCI0.PB7, Zero)
        }

        Method (_L18, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.OHC1, 0x02)
            Notify (\_SB.PCI0.OHC2, 0x02)
            Notify (\_SB.PCI0.OHC3, 0x02)
            Notify (\_SB.PCI0.OHC4, 0x02)
            Notify (\_SB.PCI0.EHC1, 0x02)
            Notify (\_SB.PCI0.EHC2, 0x02)
            Notify (\_SB.PCI0.EHC3, 0x02)
            Notify (\_SB.PCI0.XHC0, 0x02)
            Notify (\_SB.PCI0.XHC1, 0x02)
            Notify (\_SB.PWRB, 0x02)
        }

        Method (_L09, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Store (0x4400, P80H)
            Store (\_SB.PCI0.SMBS.I199, Local0)
            Or (Local0, \_SB.PCI0.SMBS.O012, Local0)
            Or (Local0, \_SB.PCI0.SMBS.O013, Local0)
            CreateWordField (XX05, Zero, SZZE)
            CreateField (XX05, 0x10, 0x03, FUCC)
            CreateField (XX05, 0x13, 0x05, DEVV)
            CreateByteField (XX05, 0x03, BUSS)
            CreateByteField (XX05, 0x04, HPST)
            Store (0x05, SZZE)
            Store (Zero, BUSS)
            Store (0x05, DEVV)
            Store (Zero, FUCC)
            If (LEqual (Local0, One))
            {
                If (LEqual (WLSH, Zero))
                {
                    Store (Zero, \_SB.PCI0.SMBS.O199)
                    Store (Zero, \_SB.PCI0.SMBS.O012)
                    Store (Zero, \_SB.PCI0.SMBS.O013)
                    Store (Zero, \_SB.PCI0.SMBS.E199)
                    Store (Zero, \_SB.PCI0.SMBS.E012)
                    Store (Zero, \_SB.PCI0.SMBS.E013)
                }
                Else
                {
                    Store (Zero, HPST)
                    \_SB.ALIB (0x06, XX05)
                    Store (Zero, \_SB.PCI0.SMBS.O199)
                    Store (Zero, \_SB.PCI0.SMBS.E199)
                    Store (Zero, \_SB.PCI0.SMBS.O012)
                    Store (Zero, \_SB.PCI0.SMBS.O013)
                    Store (Zero, \_SB.PCI0.SMBS.E012)
                    Store (Zero, \_SB.PCI0.SMBS.E013)
                }
            }

            If (LEqual (Local0, Zero))
            {
                If (LEqual (WLSH, Zero))
                {
                    Store (One, \_SB.PCI0.SMBS.O199)
                    Store (One, \_SB.PCI0.SMBS.O012)
                    Store (One, \_SB.PCI0.SMBS.O013)
                    Store (Zero, \_SB.PCI0.SMBS.E199)
                    Store (Zero, \_SB.PCI0.SMBS.E012)
                    Store (Zero, \_SB.PCI0.SMBS.E013)
                }
                Else
                {
                    Store (One, \_SB.PCI0.SMBS.O199)
                    Store (Zero, \_SB.PCI0.SMBS.E199)
                    Store (One, HPST)
                    \_SB.ALIB (0x06, XX05)
                    Sleep (0x14)
                    Store (One, \_SB.PCI0.SMBS.O012)
                    Store (One, \_SB.PCI0.SMBS.O013)
                    Store (Zero, \_SB.PCI0.SMBS.E012)
                    Store (Zero, \_SB.PCI0.SMBS.E013)
                }
            }

            Notify (\_SB.PCI0.PB5, Zero)
            Notify (\_SB.PCI0.SPB2, Zero)
        }

        Method (_L06, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            If (LAnd (LEqual (ODZC, One), LEqual (\_SB.PCI0.SMBS.GE16, Zero)))
            {
                If (\_SB.PCI0.SMBS.G06T)
                {
                    Sleep (0x14)
                    If (\_SB.PCI0.SMBS.GE06)
                    {
                        If (LOr (LEqual (\_SB.PCI0.SATA.VIDI, 0x78001022), LEqual (\_SB.PCI0.SATA.VIDI, 0x78011022))) {}
                        If (LOr (LEqual (\_SB.PCI0.SATA.VIDI, 0x78041022), LEqual (\_SB.PCI0.SATA.VIDI, 0x78021002)))
                        {
                            Notify (\_SB.PCI0.SATA.ODDZ, 0x80)
                        }

                        If (LEqual (\_SB.PCI0.SATA.VIDI, 0x78031022))
                        {
                            Notify (\_SB.PCI0.SATA.ODDZ, 0x80)
                        }

                        Store (0xDF15, P80H)
                    }
                }
                Else
                {
                    Sleep (0x14)
                    If (LNot (\_SB.PCI0.SMBS.GE06))
                    {
                        If (LOr (LEqual (\_SB.PCI0.SATA.VIDI, 0x78001022), LEqual (\_SB.PCI0.SATA.VIDI, 0x78011022))) {}
                        If (LOr (LEqual (\_SB.PCI0.SATA.VIDI, 0x78041022), LEqual (\_SB.PCI0.SATA.VIDI, 0x78021002)))
                        {
                            Notify (\_SB.PCI0.SATA.ODDZ, 0x80)
                        }

                        If (LEqual (\_SB.PCI0.SATA.VIDI, 0x78031022))
                        {
                            Notify (\_SB.PCI0.SATA.ODDZ, 0x80)
                        }

                        Store (0xDF14, P80H)
                    }
                }

                Store (Not (\_SB.PCI0.SMBS.GE06), \_SB.PCI0.SMBS.G06T)
            }
        }

        Method (_L10, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Sleep (0xC8)
            Store (One, \_SB.PCI0.SMBS.M170)
            Store (Zero, \_SB.PCI0.SMBS.E170)
            Store (Zero, \_SB.PCI0.SMBS.O170)
            If (\_SB.PCI0.SMBS.GE16)
            {
                Store (Zero, \_SB.PCI0.SMBS.O171)
                \_SB.PCI0.SATA.PRT1.DIS ()
                Sleep (0x28)
                Notify (\_SB.PCI0.SATA, Zero)
                If (LEqual (ODZC, One))
                {
                    Notify (\_SB.PCI0.SATA.ODDZ, 0x81)
                }

                Store (0x0F17, P80H)
            }
            Else
            {
                \_SB.PCI0.SATA.PRT1.ENA ()
                Store (One, \_SB.PCI0.SMBS.O171)
                Sleep (0x28)
                Notify (\_SB.PCI0.SATA, Zero)
                If (LEqual (ODZC, One))
                {
                    Notify (\_SB.PCI0.SATA.ODDZ, 0x81)
                }

                Store (0x1F17, P80H)
            }

            Store (Not (\_SB.PCI0.SMBS.GE16), \_SB.PCI0.SMBS.G16T)
        }
    }

    Name (PICM, Zero)
    Name (GPIC, Zero)
    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        Store (Arg0, PICM)
        Store (Arg0, GPIC)
        If (PICM)
        {
            \_SB.DSPI ()
        }
    }

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        SPTS (Arg0)
        If (LEqual (Arg0, One))
        {
            Store (0x51, IO80)
            \_SB.S80H (0x51)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (0x53, IO80)
            \_SB.S80H (0x53)
            Store (One, \_SB.PCI0.SMBS.SLPS)
            Store (One, \_SB.PCI0.LPC0.EC0.S3ST)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0x54, IO80)
            \_SB.S80H (0x54)
            Store (One, \_SB.PCI0.SMBS.SLPS)
            Store (One, RSTU)
            Store (One, \_SB.PCI0.LPC0.EC0.S4ST)
            Store (Zero, \_PR.C000.PPCV)
        }

        If (LEqual (Arg0, 0x05))
        {
            Store (0x55, IO80)
            \_SB.S80H (0x55)
            Store (0x90, BCMD)
            \_SB.BSMI (Zero)
            \_SB.GSMI (0x03)
        }

        \_SB.APTS (Arg0)
        If (\_SB.PCI0.LPC0.EC0.ADPT)
        {
            Store (One, \_SB.PCI0.LPC0.EC0.UWAK)
            Store (One, \_SB.PCI0.LPC0.EC0.LWAK)
        }
        Else
        {
            Store (Zero, \_SB.PCI0.LPC0.EC0.UWAK)
            Store (Zero, \_SB.PCI0.LPC0.EC0.LWAK)
        }

        If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
        {
            If (LEqual (\_SB.PCI0.LPC0.EC0.VGAT, One))
            {
                If (LEqual (\_SB.PCI0.LPC0.EC0.ADPT, One))
                {
                    \_SB.PCI0.VGA.AFN4 (One)
                }
                Else
                {
                    \_SB.PCI0.VGA.AFN4 (0x02)
                }
            }

            If (LEqual (PRYA, One))
            {
                If (\_SB.PCI0.SMBS.O171)
                {
                    Store (One, \_SB.PCI0.LPC0.EC0.SODD)
                }
                Else
                {
                    Store (Zero, \_SB.PCI0.LPC0.EC0.SODD)
                }
            }
        }
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        SWAK (Arg0)
        \_SB.AWAK (Arg0)
        If (LEqual (Arg0, One))
        {
            Store (0xE1, IO80)
            \_SB.S80H (0xE1)
            Store (0xF1, \_SB.PCI0.P2P.PR4B)
        }

        If (LEqual (PRYA, One))
        {
            Store (One, \_SB.PCI0.LPC0.EC0.SODD)
        }

        Notify (\_SB.LID, 0x80)
        Store (Zero, \_SB.PCI0.LPC0.EC0.VGAT)
        If (LEqual (Arg0, 0x03))
        {
            Store (0xE3, IO80)
            \_SB.S80H (0xE3)
            CHKH ()
            Notify (\_SB.PWRB, 0x02)
            Store (One, \_SB.PCI0.LPC0.EC0.S3RM)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0xE4, IO80)
            \_SB.S80H (0xE4)
            \_SB.PCI0._INI ()
            If (LOr (LEqual (TPOS, 0x40), LEqual (TPOS, 0x41)))
            {
                \_SB.PCI0.EHC1.STOS ()
                \_SB.PCI0.EHC2.STOS ()
                \_SB.PCI0.EHC3.STOS ()
            }

            Notify (\_SB.PWRB, 0x02)
            Notify (\_SB.PCI0.PB7, Zero)
            Store (One, \_SB.PCI0.LPC0.EC0.S4RM)
        }

        If (LLess (OSTB, 0x40))
        {
            Acquire (\_SB.PCI0.LPC0.PSMX, 0xFFFF)
            Store (One, SBFN)
            Store (0x8A, BCMD)
            \_SB.BSMI (Zero)
            Release (\_SB.PCI0.LPC0.PSMX)
        }

        If (LEqual (Arg0, 0x05))
        {
            Store (0xE5, IO80)
        }

        If (And (LEqual (\_SB.PCI0.LPC0.EC0.WLEX, One), LEqual (\_SB.PCI0.LPC0.EC0.WLAT, One)))
        {
            Store (Zero, \_SB.PCI0.SMBS.E057)
            Store (One, \_SB.PCI0.SMBS.O057)
        }
        Else
        {
            Store (Zero, \_SB.PCI0.SMBS.E057)
            Store (Zero, \_SB.PCI0.SMBS.O057)
        }

        If (And (LEqual (\_SB.PCI0.LPC0.EC0.BTEX, One), LEqual (\_SB.PCI0.LPC0.EC0.BTAT, One)))
        {
            Store (Zero, \_SB.PCI0.SMBS.E054)
            Store (Zero, \_SB.PCI0.SMBS.O054)
            Store (Zero, \_SB.PCI0.SMBS.E056)
            Store (One, \_SB.PCI0.SMBS.O056)
        }
        Else
        {
            Store (Zero, \_SB.PCI0.SMBS.E054)
            Store (One, \_SB.PCI0.SMBS.O054)
            Store (Zero, \_SB.PCI0.SMBS.E056)
            Store (Zero, \_SB.PCI0.SMBS.O056)
        }

        Return (Zero)
    }

    Scope (_SB)
    {
        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0B)
            }
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08"))  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03"))  // _CID: Compatible ID
            Name (_ADR, Zero)  // _ADR: Address
            OperationRegion (SCTH, PCI_Config, 0x7A, One)
            Field (SCTH, ByteAcc, NoLock, Preserve)
            {
                RSMF,   1
            }

            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                If (LEqual (GPIC, Zero)) {}
                Else
                {
                    DSPI ()
                }

                OSTY ()
                CHKH ()
                If (CondRefOf (_OSI, Local0))
                {
                    Store (Zero, MYOS)
                }
                Else
                {
                    If (LEqual (SizeOf (_OS), 0x14))
                    {
                        Store (One, MYOS)
                    }
                    Else
                    {
                        If (LEqual (SizeOf (_OS), 0x27))
                        {
                            Store (0x02, MYOS)
                        }
                        Else
                        {
                            Store (0x03, MYOS)
                        }
                    }
                }

                If (LNotEqual (^LPC0.EC0.OSTY, 0x04))
                {
                    Store (BL00, Index (^VGA.LCD.BRTB, Zero))
                    Store (BL01, Index (^VGA.LCD.BRTB, One))
                    Store (BL02, Index (^VGA.LCD.BRTB, 0x02))
                    Store (BL03, Index (^VGA.LCD.BRTB, 0x03))
                    Store (BL04, Index (^VGA.LCD.BRTB, 0x04))
                    Store (BL05, Index (^VGA.LCD.BRTB, 0x05))
                    Store (BL06, Index (^VGA.LCD.BRTB, 0x06))
                    Store (BL07, Index (^VGA.LCD.BRTB, 0x07))
                    Store (BL08, Index (^VGA.LCD.BRTB, 0x08))
                    Store (BL09, Index (^VGA.LCD.BRTB, 0x09))
                    Store (BL10, Index (^VGA.LCD.BRTB, 0x0A))
                    Store (BL11, Index (^VGA.LCD.BRTB, 0x0B))
                    Store (BL12, Index (^VGA.LCD.BRTB, 0x0C))
                    Store (BL13, Index (^VGA.LCD.BRTB, 0x0D))
                    Store (BL14, Index (^VGA.LCD.BRTB, 0x0E))
                    Store (BL15, Index (^VGA.LCD.BRTB, 0x0F))
                    Store (BL00, Index (^LPC0.EC0.VPC0.TBSL, Zero))
                    Store (BL01, Index (^LPC0.EC0.VPC0.TBSL, One))
                    Store (BL02, Index (^LPC0.EC0.VPC0.TBSL, 0x02))
                    Store (BL03, Index (^LPC0.EC0.VPC0.TBSL, 0x03))
                    Store (BL04, Index (^LPC0.EC0.VPC0.TBSL, 0x04))
                    Store (BL05, Index (^LPC0.EC0.VPC0.TBSL, 0x05))
                    Store (BL06, Index (^LPC0.EC0.VPC0.TBSL, 0x06))
                    Store (BL07, Index (^LPC0.EC0.VPC0.TBSL, 0x07))
                    Store (BL08, Index (^LPC0.EC0.VPC0.TBSL, 0x08))
                    Store (BL09, Index (^LPC0.EC0.VPC0.TBSL, 0x09))
                    Store (BL10, Index (^LPC0.EC0.VPC0.TBSL, 0x0A))
                    Store (BL11, Index (^LPC0.EC0.VPC0.TBSL, 0x0B))
                    Store (BL12, Index (^LPC0.EC0.VPC0.TBSL, 0x0C))
                    Store (BL13, Index (^LPC0.EC0.VPC0.TBSL, 0x0D))
                    Store (BL14, Index (^LPC0.EC0.VPC0.TBSL, 0x0E))
                    Store (BL15, Index (^LPC0.EC0.VPC0.TBSL, 0x0F))
                }

                Store (0xFA, IO80)
                If (And (LEqual (^LPC0.EC0.WLEX, One), LEqual (^LPC0.EC0.WLAT, One)))
                {
                    Store (Zero, ^SMBS.E057)
                    Store (One, ^SMBS.O057)
                }
                Else
                {
                    Store (Zero, ^SMBS.E057)
                    Store (Zero, ^SMBS.O057)
                }

                If (And (LEqual (^LPC0.EC0.BTEX, One), LEqual (^LPC0.EC0.BTAT, One)))
                {
                    Store (Zero, ^SMBS.E054)
                    Store (Zero, ^SMBS.O054)
                    Store (Zero, ^SMBS.E056)
                    Store (One, ^SMBS.O056)
                }
                Else
                {
                    Store (Zero, ^SMBS.E054)
                    Store (One, ^SMBS.O054)
                    Store (Zero, ^SMBS.E056)
                    Store (Zero, ^SMBS.O056)
                }

                Store (0xAA, IO80)
            }

            OperationRegion (NBMS, PCI_Config, 0x60, 0x08)
            Field (NBMS, DWordAcc, NoLock, Preserve)
            {
                MIDX,   32, 
                MIDR,   32
            }

            Mutex (NBMM, 0x00)
            Method (NBMR, 1, NotSerialized)
            {
                Acquire (NBMM, 0xFFFF)
                And (Arg0, 0x7F, Local0)
                Store (Local0, MIDX)
                Store (MIDR, Local0)
                Store (0x7F, MIDX)
                Release (NBMM)
                Return (Local0)
            }

            Method (NBMW, 2, NotSerialized)
            {
                Acquire (NBMM, 0xFFFF)
                And (Arg0, 0x7F, Local0)
                Or (Local0, 0x80, Local0)
                Store (Local0, MIDX)
                Store (Arg1, MIDR)
                Store (And (Local0, 0x7F, Local0), MIDX)
                Release (NBMM)
            }

            OperationRegion (NBXP, PCI_Config, 0xE0, 0x08)
            Field (NBXP, DWordAcc, NoLock, Preserve)
            {
                NBXI,   32, 
                NBXD,   32
            }

            Mutex (NBXM, 0x00)
            Method (NBXR, 1, NotSerialized)
            {
                Acquire (NBXM, 0xFFFF)
                Store (Arg0, NBXI)
                Store (NBXD, Local0)
                Store (Zero, NBXI)
                Release (NBXM)
                Return (Local0)
            }

            Method (NBXW, 2, NotSerialized)
            {
                Acquire (NBXM, 0xFFFF)
                Store (Arg0, NBXI)
                Store (Arg1, NBXD)
                Store (Zero, NBXI)
                Release (NBXM)
            }

            Method (XPTR, 2, NotSerialized)
            {
                If (LAnd (LLess (Arg0, 0x02), LGreater (Arg0, 0x07)))
                {
                    Return (Zero)
                }
                Else
                {
                    If (LLess (Arg0, 0x04))
                    {
                        Subtract (Arg0, 0x02, Local1)
                        Store (0x01310800, Local0)
                    }
                    Else
                    {
                        Subtract (Arg0, 0x04, Local1)
                        Store (0x01300900, Local0)
                    }

                    Add (Local0, ShiftLeft (Local1, 0x08), Local0)
                    ShiftLeft (Local0, Local1, Local0)
                    NBXW (Local0, Arg1)
                    Return (Ones)
                }
            }

            Method (XPLP, 2, NotSerialized)
            {
            }

            Method (XPLL, 2, NotSerialized)
            {
            }

            Name (_UID, One)  // _UID: Unique ID
            Name (_BBN, Zero)  // _BBN: BIOS Bus Number
            Name (SUPP, Zero)
            Name (CTRL, Zero)
            Name (AMHP, Zero)
            Method (XOSC, 4, NotSerialized)
            {
                CreateDWordField (Arg3, Zero, CDW1)
                CreateDWordField (Arg3, 0x04, CDW2)
                CreateDWordField (Arg3, 0x08, CDW3)
                If (LEqual (Arg0, Buffer (0x10)
                        {
                            /* 0000 */   0x5B, 0x4D, 0xDB, 0x33, 0xF7, 0x1F, 0x1C, 0x40,
                            /* 0008 */   0x96, 0x57, 0x74, 0x41, 0xC0, 0x3D, 0xD7, 0x66
                        }))
                {
                    Store (CDW2, SUPP)
                    Store (CDW3, CTRL)
                    If (LNotEqual (And (SUPP, 0x16), 0x16))
                    {
                        And (CTRL, 0x1E, CTRL)
                    }

                    And (CTRL, 0x1D, CTRL)
                    If (Not (And (CDW1, One)))
                    {
                        If (And (CTRL, One)) {}
                        If (And (CTRL, 0x10)) {}
                    }

                    If (LNotEqual (Arg1, One))
                    {
                        Or (CDW1, 0x08, CDW1)
                    }

                    If (LNotEqual (CDW3, CTRL))
                    {
                        Or (CDW1, 0x10, CDW1)
                    }

                    Store (CTRL, CDW3)
                    Return (Arg3)
                }
                Else
                {
                    Or (CDW1, 0x04, CDW1)
                    Return (Arg3)
                }
            }

            Method (TOM, 0, NotSerialized)
            {
                Multiply (TOML, 0x00010000, Local0)
                Multiply (TOMH, 0x01000000, Local1)
                Add (Local0, Local1, Local0)
                Return (Local0)
            }

            Name (CRES, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, SubDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    0x00,, )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    0x00,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    ,, , TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x80000000,         // Range Minimum
                    0xF7FFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x78000000,         // Length
                    0x00,, _Y00, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFC000000,         // Range Minimum
                    0xFED3FFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x02D40000,         // Length
                    0x00,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFED45000,         // Range Minimum
                    0xFFFFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x012BB000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateDWordField (CRES, \_SB.PCI0._Y00._MIN, BTMN)  // _MIN: Minimum Base Address
                CreateDWordField (CRES, \_SB.PCI0._Y00._MAX, BTMX)  // _MAX: Maximum Base Address
                CreateDWordField (CRES, \_SB.PCI0._Y00._LEN, BTLN)  // _LEN: Length
                CreateDWordField (CRES, \_SB.PCI0._Y01._MIN, BTN1)  // _MIN: Minimum Base Address
                CreateDWordField (CRES, \_SB.PCI0._Y01._MAX, BTX1)  // _MAX: Maximum Base Address
                CreateDWordField (CRES, \_SB.PCI0._Y01._LEN, BTL1)  // _LEN: Length
                Store (TOM (), BTMN)
                Subtract (PCBA, One, BTMX)
                Subtract (PCBA, BTMN, BTLN)
                Add (PCBL, One, BTN1)
                Subtract (BTX1, BTN1, BTL1)
                Add (BTL1, One, BTL1)
                Return (CRES)
            }

            Device (MEMR)
            {
                Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                Name (MEM1, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y02)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y03)
                })
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y02._BAS, MB01)  // _BAS: Base Address
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y02._LEN, ML01)  // _LEN: Length
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y03._BAS, MB02)  // _BAS: Base Address
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y03._LEN, ML02)  // _LEN: Length
                    If (GPIC)
                    {
                        Store (0xFEC00000, MB01)
                        Store (0xFEE00000, MB02)
                        Store (0x1000, ML01)
                        Store (0x1000, ML02)
                    }

                    Return (MEM1)
                }
            }

            Method (XCMP, 2, NotSerialized)
            {
                If (LNotEqual (0x10, SizeOf (Arg0)))
                {
                    Return (Zero)
                }

                If (LNotEqual (0x10, SizeOf (Arg1)))
                {
                    Return (Zero)
                }

                Store (Zero, Local0)
                While (LLess (Local0, 0x10))
                {
                    If (LNotEqual (DerefOf (Index (Arg0, Local0)), DerefOf (Index (
                        Arg1, Local0))))
                    {
                        Return (Zero)
                    }

                    Increment (Local0)
                }

                Return (One)
            }

            Method (AFN0, 0, Serialized)
            {
                If (LEqual (PDDN, One))
                {
                    ^VGA.AFN0 ()
                }

                If (LEqual (PDDN, 0x02))
                {
                    ^PB2.VGA.AFN0 ()
                }

                If (LEqual (PDDN, 0x03))
                {
                    ^PB3.VGA.AFN0 ()
                }
            }

            Method (AFN1, 1, Serialized)
            {
            }

            Method (AFN2, 2, Serialized)
            {
            }

            Method (AFN3, 2, Serialized)
            {
                If (LEqual (PDDN, One))
                {
                    ^VGA.AFN3 (Arg0, Arg1)
                }

                If (LEqual (PDDN, 0x02))
                {
                    ^PB2.VGA.AFN3 (Arg0, Arg1)
                }

                If (LEqual (PDDN, 0x03))
                {
                    ^PB3.VGA.AFN3 (Arg0, Arg1)
                }
            }

            Method (AFN4, 1, Serialized)
            {
                If (LEqual (PDDN, One))
                {
                    ^VGA.AFN4 (Arg0)
                }

                If (LEqual (PDDN, 0x02))
                {
                    ^PB2.VGA.AFN4 (Arg0)
                }

                If (LEqual (PDDN, 0x03))
                {
                    ^PB3.VGA.AFN4 (Arg0)
                }
            }

            Method (AFN5, 0, Serialized)
            {
                If (LEqual (PDDN, One))
                {
                    ^VGA.AFN5 ()
                }

                If (LEqual (PDDN, 0x02))
                {
                    ^PB2.VGA.AFN5 ()
                }

                If (LEqual (PDDN, 0x03))
                {
                    ^PB3.VGA.AFN5 ()
                }
            }

            Method (AFN6, 0, Serialized)
            {
                If (LEqual (PDDN, One))
                {
                    ^VGA.AFN6 ()
                }

                If (LEqual (PDDN, 0x02))
                {
                    ^PB2.VGA.AFN6 ()
                }

                If (LEqual (PDDN, 0x03))
                {
                    ^PB3.VGA.AFN6 ()
                }
            }

            Method (AFN7, 1, Serialized)
            {
                ^VGA.AFN7 (Arg0)
            }

            Name (PR00, Package (0x1B)
            {
                Package (0x04)
                {
                    0x0011FFFF, 
                    Zero, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0012FFFF, 
                    Zero, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0012FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0013FFFF, 
                    Zero, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0013FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x03, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0015FFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0015FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0015FFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0015FFFF, 
                    0x03, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    Zero, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    One, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    Zero, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    One, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x02, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x03, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0005FFFF, 
                    Zero, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    Zero, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0007FFFF, 
                    Zero, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    Zero, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }
            })
            Name (AR00, Package (0x1B)
            {
                Package (0x04)
                {
                    0x0011FFFF, 
                    Zero, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0012FFFF, 
                    Zero, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0012FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0013FFFF, 
                    Zero, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0013FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0015FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0015FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0015FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0015FFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    Zero, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0016FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    One, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    Zero, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    One, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x02, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x03, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0005FFFF, 
                    Zero, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    Zero, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0007FFFF, 
                    Zero, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    Zero, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0010FFFF, 
                    One, 
                    Zero, 
                    0x11
                }
            })
            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (PICM)
                {
                    Return (AR00)
                }

                Return (PR00)
            }

            Device (VGA)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                Name (PXEN, 0x80000000)
                Name (PXID, 0x00020000)
                Name (PXMX, 0x80000001)
                Name (PXFX, 0x80000000)
                Name (PXDY, 0x80000000)
                Name (AF7E, 0x80000001)
                OperationRegion (PCIG, PCI_Config, Zero, 0x50)
                Field (PCIG, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x18), 
                    GBA2,   32
                }

                OperationRegion (GFMM, SystemMemory, GBA2, 0x6000)
                Field (GFMM, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x5F68), 
                    AZPS,   32
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (DOSA, Zero)
                Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                {
                    Store (Arg0, DOSA)
                }

                Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                {
                    Name (DODL, Package (0x05)
                    {
                        0x00010100, 
                        0x00010110, 
                        0x0200, 
                        0x00010210, 
                        0x00010220
                    })
                    Return (DODL)
                }

                Device (LCD)
                {
                    Name (_ADR, 0x0110)  // _ADR: Address
                    Name (BRLV, Package (0x12)
                    {
                        0x4E, 
                        0x18, 
                        One, 
                        0x06, 
                        0x0C, 
                        0x12, 
                        0x18, 
                        0x1E, 
                        0x24, 
                        0x2A, 
                        0x30, 
                        0x36, 
                        0x3C, 
                        0x42, 
                        0x48, 
                        0x4E, 
                        0x54, 
                        0x64
                    })
                    Name (BRTB, Package (0x10) {})
                    Name (BRL2, Package (0x67)
                    {
                        0x46, 
                        0x1E, 
                        Zero, 
                        One, 
                        0x02, 
                        0x03, 
                        0x04, 
                        0x05, 
                        0x06, 
                        0x07, 
                        0x08, 
                        0x09, 
                        0x0A, 
                        0x0B, 
                        0x0C, 
                        0x0D, 
                        0x0E, 
                        0x0F, 
                        0x10, 
                        0x11, 
                        0x12, 
                        0x13, 
                        0x14, 
                        0x15, 
                        0x16, 
                        0x17, 
                        0x18, 
                        0x19, 
                        0x1A, 
                        0x1B, 
                        0x1C, 
                        0x1D, 
                        0x1E, 
                        0x1F, 
                        0x20, 
                        0x21, 
                        0x22, 
                        0x23, 
                        0x24, 
                        0x25, 
                        0x26, 
                        0x27, 
                        0x28, 
                        0x29, 
                        0x2A, 
                        0x2B, 
                        0x2C, 
                        0x2D, 
                        0x2E, 
                        0x2F, 
                        0x30, 
                        0x31, 
                        0x32, 
                        0x33, 
                        0x34, 
                        0x35, 
                        0x36, 
                        0x37, 
                        0x38, 
                        0x39, 
                        0x3A, 
                        0x3B, 
                        0x3C, 
                        0x3D, 
                        0x3E, 
                        0x3F, 
                        0x40, 
                        0x41, 
                        0x42, 
                        0x43, 
                        0x44, 
                        0x45, 
                        0x46, 
                        0x47, 
                        0x48, 
                        0x49, 
                        0x4A, 
                        0x4B, 
                        0x4C, 
                        0x4D, 
                        0x4E, 
                        0x4F, 
                        0x50, 
                        0x51, 
                        0x52, 
                        0x53, 
                        0x54, 
                        0x55, 
                        0x56, 
                        0x57, 
                        0x58, 
                        0x59, 
                        0x5A, 
                        0x5B, 
                        0x5C, 
                        0x5D, 
                        0x5E, 
                        0x5F, 
                        0x60, 
                        0x61, 
                        0x62, 
                        0x63, 
                        0x64
                    })
                    Name (BRL3, Package (0x0D)
                    {
                        0x64, 
                        0x43, 
                        One, 
                        0x02, 
                        0x03, 
                        0x05, 
                        0x08, 
                        0x0C, 
                        0x12, 
                        0x1B, 
                        0x27, 
                        0x43, 
                        0x64
                    })
                    Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
                    {
                        If (LEqual (^^^LPC0.EC0.OSTY, 0x02))
                        {
                            Return (BRL3)
                        }

                        If (LEqual (^^^LPC0.EC0.OSTY, 0x04))
                        {
                            Return (BRL2)
                        }
                        Else
                        {
                            Return (BRLV)
                        }
                    }

                    Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
                    {
                        If (LEqual (AF7E, 0x80000001))
                        {
                            Divide (Multiply (Arg0, 0xFF), 0x64, Local1, Local0)
                            If (LEqual (^^^LPC0.EC0.OSTY, 0x04))
                            {
                                If (LEqual (Arg0, Zero))
                                {
                                    Store (One, Arg0)
                                }

                                Store (Arg0, ^^^LPC0.EC0.BRTS)
                            }

                            If (LEqual (^^^LPC0.EC0.OSTY, 0x03))
                            {
                                Store (LVLS (Arg0), Local1)
                                Store (Local1, ^^^LPC0.EC0.BRTS)
                                Notify (^^^LPC0.EC0.VPC0, 0x80)
                            }

                            ^^^AFN7 (Local0)
                        }
                        Else
                        {
                            Acquire (^^^LPC0.PSMX, 0xFFFF)
                            Store (LVLS (Arg0), Local1)
                            Store (Local1, ^^^LPC0.EC0.BRTS)
                            Store (DerefOf (Index (BRTB, Local1)), Local2)
                            Store (Local2, BRTL)
                            Store (0x72, BCMD)
                            BSMI (Zero)
                            Notify (^^^LPC0.EC0.VPC0, 0x80)
                            Release (^^^LPC0.PSMX)
                        }
                    }

                    Method (LVLS, 1, NotSerialized)
                    {
                        Store (One, Local0)
                        Store (Zero, Local1)
                        While (Local0)
                        {
                            Add (Local1, 0x02, Local2)
                            Store (DerefOf (Index (BRLV, Local2)), Local3)
                            And (Arg0, 0xFF, Local4)
                            If (LEqual (Local4, Local3))
                            {
                                Store (Zero, Local0)
                            }

                            If (LGreaterEqual (Local1, 0x0F))
                            {
                                Store (Zero, Local0)
                            }

                            If (Local0)
                            {
                                Add (One, Local1, Local1)
                            }
                        }

                        Return (Local1)
                    }
                }

                Name (ATIB, Buffer (0x0100) {})
                Method (ATIF, 2, Serialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Return (AF00 ())
                    }

                    If (LEqual (Arg0, One))
                    {
                        Return (AF01 ())
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Return (AF02 ())
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Return (AF03 (DerefOf (Index (Arg1, 0x02)), DerefOf (Index (Arg1, 
                            0x04))))
                    }

                    If (LEqual (Arg0, 0x0F))
                    {
                        Return (AF15 ())
                    }
                    Else
                    {
                        CreateWordField (ATIB, Zero, SSZE)
                        CreateWordField (ATIB, 0x02, VERN)
                        CreateDWordField (ATIB, 0x04, NMSK)
                        CreateDWordField (ATIB, 0x08, SFUN)
                        Store (Zero, SSZE)
                        Store (Zero, VERN)
                        Store (Zero, NMSK)
                        Store (Zero, SFUN)
                        Return (ATIB)
                    }
                }

                Method (AF00, 0, NotSerialized)
                {
                    And (AZPS, 0xC0000001, AZPS)
                    CreateWordField (ATIB, Zero, SSZE)
                    CreateWordField (ATIB, 0x02, VERN)
                    CreateDWordField (ATIB, 0x04, NMSK)
                    CreateDWordField (ATIB, 0x08, SFUN)
                    Store (0x0C, SSZE)
                    Store (One, VERN)
                    If (LEqual (PXEN, 0x80000000))
                    {
                        Store (0x11, NMSK)
                    }
                    Else
                    {
                        Store (0x51, NMSK)
                    }

                    If (LEqual (AF7E, 0x80000001))
                    {
                        Or (NMSK, 0x80, NMSK)
                    }

                    Store (NMSK, MSKN)
                    Store (0x4007, SFUN)
                    Return (ATIB)
                }

                Method (AF01, 0, NotSerialized)
                {
                    CreateWordField (ATIB, Zero, SSZE)
                    CreateDWordField (ATIB, 0x02, VMSK)
                    CreateDWordField (ATIB, 0x06, FLGS)
                    Store (0x0A, SSZE)
                    Store (0x03, VMSK)
                    Store (One, FLGS)
                    Return (ATIB)
                }

                Name (PSBR, Buffer (0x04)
                {
                     0x00, 0x00, 0x00, 0x00
                })
                Name (MSKN, Zero)
                Name (SEXM, Zero)
                Name (STHG, Zero)
                Name (STHI, Zero)
                Name (SFPG, Zero)
                Name (SFPI, Zero)
                Name (SSPS, Zero)
                Name (SSDM, 0x0A)
                Name (SCDY, Zero)
                Name (SACT, Buffer (0x07)
                {
                     0x01, 0x02, 0x08, 0x80, 0x03, 0x09, 0x81
                })
                Method (AF02, 0, NotSerialized)
                {
                    CreateBitField (PSBR, Zero, PDSW)
                    CreateBitField (PSBR, One, PEXM)
                    CreateBitField (PSBR, 0x02, PTHR)
                    CreateBitField (PSBR, 0x03, PFPS)
                    CreateBitField (PSBR, 0x04, PSPS)
                    CreateBitField (PSBR, 0x05, PDCC)
                    CreateBitField (PSBR, 0x06, PXPS)
                    CreateBitField (PSBR, 0x07, PBRT)
                    CreateWordField (ATIB, Zero, SSZE)
                    CreateDWordField (ATIB, 0x02, PSBI)
                    CreateByteField (ATIB, 0x06, EXPM)
                    CreateByteField (ATIB, 0x07, THRM)
                    CreateByteField (ATIB, 0x08, THID)
                    CreateByteField (ATIB, 0x09, FPWR)
                    CreateByteField (ATIB, 0x0A, FPID)
                    CreateByteField (ATIB, 0x0B, SPWR)
                    CreateByteField (ATIB, 0x0C, BRTL)
                    Store (0x0D, SSZE)
                    Store (PSBR, PSBI)
                    If (PDSW)
                    {
                        Store (Zero, PDSW)
                    }

                    If (PEXM)
                    {
                        Store (SEXM, EXPM)
                        Store (Zero, SEXM)
                        Store (Zero, PEXM)
                    }

                    If (PTHR)
                    {
                        Store (STHG, THRM)
                        Store (STHI, THID)
                        Store (Zero, STHG)
                        Store (Zero, STHI)
                        Store (Zero, PTHR)
                    }

                    If (PFPS)
                    {
                        Store (SFPG, FPWR)
                        Store (SFPI, FPWR)
                        Store (Zero, SFPG)
                        Store (Zero, SFPI)
                        Store (Zero, PFPS)
                    }

                    If (PSPS)
                    {
                        Store (SSPS, SPWR)
                        Store (Zero, PSPS)
                    }

                    If (PXPS)
                    {
                        Store (Zero, PXPS)
                    }

                    If (PBRT)
                    {
                        Store (0xF7, P80H)
                        Store (Zero, PBRT)
                    }

                    Return (ATIB)
                }

                Method (AF03, 2, NotSerialized)
                {
                    CreateWordField (ATIB, Zero, SSZE)
                    CreateWordField (ATIB, 0x02, SSDP)
                    CreateWordField (ATIB, 0x04, SCDP)
                    Store (Arg0, SSDP)
                    Store (Arg1, SCDP)
                    Name (NXTD, 0x06)
                    Name (CIDX, 0x06)
                    Store (SSDP, Local1)
                    And (Local1, 0x8B, Local1)
                    Store (SCDP, Local2)
                    If (CondRefOf (\_SB.LID._LID, Local4))
                    {
                        And (Local2, 0xFFFFFFFE, Local2)
                        Or (Local2, ^^^LID._LID (), Local2)
                    }
                    Else
                    {
                        Or (Local2, One, Local2)
                    }

                    Store (Local2, P80H)
                    Store (Zero, Local0)
                    While (LLess (Local0, SizeOf (SACT)))
                    {
                        Store (DerefOf (Index (SACT, Local0)), Local3)
                        If (LEqual (Local3, Local1))
                        {
                            Store (Local0, CIDX)
                            Store (SizeOf (SACT), Local0)
                        }
                        Else
                        {
                            Increment (Local0)
                        }
                    }

                    Store (CIDX, Local0)
                    While (LLess (Local0, SizeOf (SACT)))
                    {
                        Increment (Local0)
                        If (LEqual (Local0, SizeOf (SACT)))
                        {
                            Store (Zero, Local0)
                        }

                        Store (DerefOf (Index (SACT, Local0)), Local3)
                        If (LEqual (And (Local3, Local2), Local3))
                        {
                            Store (Local0, NXTD)
                            Store (SizeOf (SACT), Local0)
                        }
                    }

                    If (LEqual (NXTD, SizeOf (SACT)))
                    {
                        Store (Zero, SSDP)
                    }
                    Else
                    {
                        Store (NXTD, Local0)
                        Store (DerefOf (Index (SACT, Local0)), Local3)
                        And (SSDP, 0xFFFFFFF4, SSDP)
                        Or (SSDP, Local3, SSDP)
                    }

                    Store (0x04, SSZE)
                    Store (SSDP, P80H)
                    Return (ATIB)
                }

                Method (AFN0, 0, Serialized)
                {
                    If (And (MSKN, One))
                    {
                        CreateBitField (PSBR, Zero, PDSW)
                        Store (One, PDSW)
                        Notify (VGA, 0x81)
                    }
                }

                Method (AFN3, 2, Serialized)
                {
                    If (And (MSKN, 0x08))
                    {
                        Store (Arg0, Local0)
                        Store (Local0, SFPI)
                        Store (Arg1, Local0)
                        Store (And (Local0, 0x03, Local0), SFPG)
                        CreateBitField (PSBR, 0x03, PFPS)
                        Store (One, PFPS)
                        Notify (VGA, 0x81)
                    }
                }

                Method (AFN4, 1, Serialized)
                {
                    If (And (MSKN, 0x10))
                    {
                        Store (Arg0, Local0)
                        Store (SSPS, Local1)
                        Store (Local0, SSPS)
                        If (LEqual (Local0, Local1)) {}
                        Else
                        {
                            CreateBitField (PSBR, 0x04, PSPS)
                            Store (One, PSPS)
                            Notify (VGA, 0x81)
                        }
                    }
                }

                Method (AFN5, 0, Serialized)
                {
                    If (And (MSKN, 0x20))
                    {
                        CreateBitField (PSBR, 0x05, PDCC)
                        Store (One, PDCC)
                        Notify (VGA, 0x81)
                    }
                }

                Method (AFN6, 0, Serialized)
                {
                    If (And (MSKN, 0x40))
                    {
                        CreateBitField (PSBR, 0x06, PXPS)
                        Store (One, PXPS)
                        Notify (VGA, 0x81)
                    }
                }

                Method (AFN7, 1, Serialized)
                {
                    If (And (MSKN, 0x80))
                    {
                        CreateBitField (PSBR, 0x07, PBRT)
                        Store (One, PBRT)
                        CreateByteField (ATIB, 0x0C, BRTL)
                        Store (Arg0, BRTL)
                        Notify (VGA, 0x81)
                    }
                }

                Method (AF15, 0, NotSerialized)
                {
                    Store (0xFF, P80H)
                    CreateWordField (ATIB, Zero, DNUM)
                    CreateWordField (ATIB, 0x02, DSZE)
                    CreateDWordField (ATIB, 0x04, FLAG)
                    CreateWordField (ATIB, 0x08, BUSN)
                    CreateWordField (ATIB, 0x0A, DEVN)
                    Store (0x08, DSZE)
                    Store (One, DNUM)
                    Store (0x04, FLAG)
                    Store (Zero, BUSN)
                    Store (One, DEVN)
                    Return (ATIB)
                }

                Scope (\_SB.PCI0.VGA)
                {
                    OperationRegion (REVD, SystemMemory, 0xAFBBCD98, 0x00000008)
                    Field (REVD, AnyAcc, NoLock, Preserve)
                    {
                        SROM,   32, 
                        VROM,   32
                    }

                    Name (TVGA, Buffer (0x0004)
                    {
                         0x00
                    })
                    Method (XTRM, 2, Serialized)
                    {
                        Add (Arg0, Arg1, Local0)
                        If (LLessEqual (Local0, SROM))
                        {
                            Multiply (Arg1, 0x08, Local1)
                            Multiply (Arg0, 0x08, Local2)
                            Store (VROM, TVGA)
                            CreateField (TVGA, Local2, Local1, TEMP)
                            Name (RETB, Buffer (Arg1) {})
                            Store (TEMP, RETB)
                            Return (RETB)
                        }
                        Else
                        {
                            If (LLess (Arg0, SROM))
                            {
                                Subtract (SROM, Arg0, Local3)
                                Multiply (Local3, 0x08, Local1)
                                Multiply (Arg0, 0x08, Local2)
                                Store (VROM, TVGA)
                                CreateField (TVGA, Local2, Local1, TEM)
                                Name (RETC, Buffer (Local3) {})
                                Store (TEM, RETC)
                                Return (RETC)
                            }
                            Else
                            {
                                Name (RETD, Buffer (One) {})
                                Return (RETD)
                            }
                        }
                    }
                }

                Scope (\_SB.PCI0.VGA)
                {
                    Name (ATPB, Buffer (0x0100) {})
                    Name (DSID, Ones)
                    Name (HSID, Ones)
                    Name (CNT0, Buffer (0x05)
                    {
                         0x05, 0x00, 0x00, 0x10, 0x01
                    })
                    Name (CNT1, Buffer (0x05)
                    {
                         0x05, 0x01, 0x00, 0x00, 0x01
                    })
                    Name (CNT2, Buffer (0x05)
                    {
                         0x07, 0x03, 0x00, 0x10, 0x02
                    })
                    Name (CNT3, Buffer (0x05)
                    {
                         0x07, 0x07, 0x00, 0x20, 0x02
                    })
                    Name (CNT4, Buffer (0x05)
                    {
                         0x00, 0x09, 0x00, 0x30, 0x02
                    })
                    Name (CNT5, Buffer (0x05)
                    {
                         0x01, 0x00, 0x01, 0x10, 0x01
                    })
                    Name (CNT6, Buffer (0x05)
                    {
                         0x01, 0x01, 0x01, 0x00, 0x01
                    })
                    Name (CNT7, Buffer (0x05)
                    {
                         0x03, 0x03, 0x01, 0x10, 0x02
                    })
                    Name (CNT8, Buffer (0x05)
                    {
                         0x03, 0x07, 0x01, 0x20, 0x02
                    })
                    Name (CNT9, Buffer (0x05)
                    {
                         0x00, 0x09, 0x01, 0x30, 0x02
                    })
                    Method (ATPX, 2, Serialized)
                    {
                        If (LEqual (Arg0, Zero))
                        {
                            Return (PX00 ())
                        }

                        If (LEqual (Arg0, One))
                        {
                            Return (PX01 ())
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            PX02 (DerefOf (Index (Arg1, 0x02)))
                            Return (ATPB)
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            PX03 (DerefOf (Index (Arg1, 0x02)))
                            Return (ATPB)
                        }

                        If (LEqual (Arg0, 0x04))
                        {
                            PX04 (DerefOf (Index (Arg1, 0x02)))
                            Return (ATPB)
                        }

                        If (LEqual (Arg0, 0x08))
                        {
                            Return (PX08 ())
                        }

                        If (LEqual (Arg0, 0x09))
                        {
                            Return (PX09 ())
                        }

                        CreateWordField (ATPB, Zero, SSZE)
                        CreateWordField (ATPB, 0x02, VERN)
                        CreateDWordField (ATPB, 0x04, SFUN)
                        Store (Zero, SSZE)
                        Store (Zero, VERN)
                        Store (Zero, SFUN)
                        Return (ATPB)
                    }

                    Method (PX00, 0, NotSerialized)
                    {
                        Store (0xE0, P80H)
                        CreateWordField (ATPB, Zero, SSZE)
                        CreateWordField (ATPB, 0x02, VERN)
                        CreateDWordField (ATPB, 0x04, SFUN)
                        Store (0x08, SSZE)
                        Store (One, VERN)
                        If (LEqual (PXEN, 0x80000000))
                        {
                            Store (Zero, SFUN)
                            Return (ATPB)
                        }

                        If (LEqual (PXMX, 0x80000000))
                        {
                            Store (0x018F, SFUN)
                        }
                        Else
                        {
                            Store (0x03, SFUN)
                        }

                        If (LEqual (PXID, ^^PB2._ADR))
                        {
                            Store (^^PB2.VGA.SVID, Local0)
                            Store (^^PB2.HDAU.SVID, Local1)
                        }
                        Else
                        {
                            Store (^^PB3.VGA.SVID, Local0)
                            Store (^^PB3.HDAU.SVID, Local1)
                        }

                        If (LNotEqual (Local0, Ones))
                        {
                            Store (Local0, DSID)
                        }

                        If (LNotEqual (Local1, Ones))
                        {
                            Store (Local1, HSID)
                        }

                        Return (ATPB)
                    }

                    Method (PX01, 0, NotSerialized)
                    {
                        Store (0xE1, P80H)
                        CreateWordField (ATPB, Zero, SSZE)
                        CreateDWordField (ATPB, 0x02, VMSK)
                        CreateDWordField (ATPB, 0x06, FLGS)
                        Store (0x0A, SSZE)
                        Store (0x07FF, VMSK)
                        If (LEqual (PXMX, 0x80000000))
                        {
                            Store (0x4B, FLGS)
                        }
                        Else
                        {
                            Store (Zero, FLGS)
                            If (LEqual (PXDY, 0x80000001))
                            {
                                Or (FLGS, 0x0680, FLGS)
                            }

                            If (LEqual (PXDY, 0x80000002))
                            {
                                Or (FLGS, 0x0280, FLGS)
                            }
                        }

                        Return (ATPB)
                    }

                    Method (PX02, 1, NotSerialized)
                    {
                        CreateWordField (ATPB, Zero, SSZE)
                        CreateByteField (ATPB, 0x02, PWST)
                        Store (0x03, SSZE)
                        Store (Buffer (0x05) {}, Local7)
                        CreateWordField (Local7, Zero, SZZE)
                        CreateField (Local7, 0x10, 0x03, FUCC)
                        CreateField (Local7, 0x13, 0x05, DEVV)
                        CreateByteField (Local7, 0x03, BUSS)
                        CreateByteField (Local7, 0x04, HPST)
                        Store (0x05, SZZE)
                        Store (Zero, BUSS)
                        Store (Zero, FUCC)
                        Store (Buffer (0x04) {}, Local6)
                        CreateByteField (Local6, 0x02, HPOX)
                        And (Arg0, One, PWST)
                        Name (HPOK, Zero)
                        If (PWST)
                        {
                            Store (0x11E2, P80H)
                            If (LEqual (PXID, ^^PB2._ADR))
                            {
                                Store (Zero, ^^PB2.PDC8)
                                Store (Zero, ^^PB2.PDS8)
                                Store (Zero, ^^PB2.HPC8)
                            }
                            Else
                            {
                                Store (Zero, ^^PB3.PDC8)
                                Store (Zero, ^^PB3.PDS8)
                                Store (Zero, ^^PB3.HPC8)
                            }

                            Store (Zero, ^^SMBS.O191)
                            Store (Zero, ^^SMBS.E191)
                            Store (Zero, ^^SMBS.O192)
                            Store (Zero, ^^SMBS.E192)
                            Sleep (0x0A)
                            Store (One, ^^SMBS.O192)
                            Store (Zero, ^^SMBS.E192)
                            Sleep (0x0A)
                            Store (One, ^^SMBS.O055)
                            Store (Zero, ^^SMBS.E055)
                            Sleep (0x0A)
                            Store (0x02, ^^SMBS.MX51)
                            While (LEqual (^^SMBS.I051, Zero)) {}
                            If (LOr (LEqual (PRYA, One), LEqual (PRS5, One)))
                            {
                                Sleep (0x64)
                            }

                            Store (One, ^^SMBS.O191)
                            Store (Zero, ^^SMBS.E191)
                            Store (0x12E2, P80H)
                            Store (Zero, HPOK)
                            Sleep (0x64)
                            Sleep (0x64)
                            If (LEqual (PXID, ^^PB2._ADR))
                            {
                                Store (0x02, DEVV)
                            }
                            Else
                            {
                                Store (0x03, DEVV)
                            }

                            Store (One, HPST)
                            Store (ALIB (0x06, Local7), Local6)
                            Sleep (0x14)
                            Store (Zero, Local2)
                            While (LLess (Local2, 0x0F))
                            {
                                If (LEqual (PXID, ^^PB2._ADR))
                                {
                                    Store (One, ^^PB2.PDC2)
                                }
                                Else
                                {
                                    Store (One, ^^PB3.PDC2)
                                }

                                Store (One, Local4)
                                Store (0xC8, Local5)
                                While (LAnd (Local4, Local5))
                                {
                                    If (LEqual (PXID, ^^PB2._ADR))
                                    {
                                        Store (^^PB2.XPRD (0xA5), Local0)
                                    }
                                    Else
                                    {
                                        Store (^^PB3.XPRD (0xA5), Local0)
                                    }

                                    And (Local0, 0x7F, Local0)
                                    If (LAnd (LGreaterEqual (Local0, 0x10), LNotEqual (Local0, 0x7F)))
                                    {
                                        Store (Zero, Local4)
                                    }
                                    Else
                                    {
                                        Sleep (0x05)
                                        Decrement (Local5)
                                    }
                                }

                                If (LNot (Local4))
                                {
                                    If (LEqual (PXID, ^^PB2._ADR))
                                    {
                                        Store (^^PB2.XPDL (), Local5)
                                    }
                                    Else
                                    {
                                        Store (^^PB3.XPDL (), Local5)
                                    }

                                    If (Local5)
                                    {
                                        If (LEqual (PXID, ^^PB2._ADR))
                                        {
                                            ^^PB2.XPRT ()
                                        }
                                        Else
                                        {
                                            ^^PB3.XPRT ()
                                        }

                                        Sleep (0x05)
                                        Increment (Local2)
                                    }
                                    Else
                                    {
                                        Store (Zero, Local0)
                                        If (LEqual (PXID, ^^PB2._ADR))
                                        {
                                            If (LEqual (^^PB2.XPR2 (), Ones))
                                            {
                                                Store (One, Local0)
                                            }
                                        }
                                        Else
                                        {
                                            If (LEqual (^^PB3.XPR2 (), Ones))
                                            {
                                                Store (One, Local0)
                                            }
                                        }

                                        If (Local0)
                                        {
                                            Store (One, HPOK)
                                            Store (0x10, Local2)
                                        }
                                        Else
                                        {
                                            Store (Zero, HPOK)
                                            Store (0x10, Local2)
                                        }
                                    }
                                }
                                Else
                                {
                                    Store (0x10, Local2)
                                }
                            }

                            If (LNot (HPOK))
                            {
                                Store (0x13E2, P80H)
                                If (LEqual (PXID, ^^PB2._ADR))
                                {
                                    Store (^^PB2.VGA.DVID, Local1)
                                }
                                Else
                                {
                                    Store (^^PB3.VGA.DVID, Local1)
                                }

                                Sleep (0x0A)
                                Store (One, Local4)
                                Store (0x05, Local5)
                                While (LAnd (Local4, Local5))
                                {
                                    If (LEqual (PXID, ^^PB2._ADR))
                                    {
                                        Store (^^PB2.XPRD (0xA5), Local0)
                                    }
                                    Else
                                    {
                                        Store (^^PB3.XPRD (0xA5), Local0)
                                    }

                                    And (Local0, 0x7F, Local0)
                                    If (LLessEqual (Local0, 0x04))
                                    {
                                        Store (Zero, Local4)
                                    }
                                    Else
                                    {
                                        If (LEqual (PXID, ^^PB2._ADR))
                                        {
                                            Store (^^PB2.VGA.DVID, Local1)
                                        }
                                        Else
                                        {
                                            Store (^^PB3.VGA.DVID, Local1)
                                        }

                                        Sleep (0x05)
                                        Decrement (Local5)
                                    }
                                }

                                If (LEqual (PXID, ^^PB2._ADR))
                                {
                                    Store (0x02, DEVV)
                                }
                                Else
                                {
                                    Store (0x03, DEVV)
                                }

                                Store (Zero, HPST)
                                ALIB (0x06, Local7)
                            }

                            Store (0x14E2, P80H)
                        }
                        Else
                        {
                            Store (0x02E2, P80H)
                            If (LEqual (PXID, ^^PB2._ADR))
                            {
                                Store (0x10, MUXF)
                            }
                            Else
                            {
                                Store (0x18, MUXF)
                            }

                            Store (Zero, ^^SMBS.O191)
                            Store (Zero, ^^SMBS.E191)
                            Store (Zero, ^^SMBS.O055)
                            Store (Zero, ^^SMBS.E055)
                            Sleep (0x0A)
                            Store (Zero, ^^SMBS.O192)
                            Store (Zero, ^^SMBS.E192)
                            Store (0x03E2, P80H)
                            If (LEqual (PXID, ^^PB2._ADR))
                            {
                                Store (One, ^^PB2.PDC2)
                                Store (^^PB2.VGA.DVID, Local1)
                            }
                            Else
                            {
                                Store (One, ^^PB3.PDC2)
                                Store (^^PB3.VGA.DVID, Local1)
                            }

                            Sleep (0x0A)
                            Store (One, Local4)
                            Store (0x05, Local5)
                            While (LAnd (Local4, Local5))
                            {
                                If (LEqual (PXID, ^^PB2._ADR))
                                {
                                    Store (^^PB2.XPRD (0xA5), Local0)
                                }
                                Else
                                {
                                    Store (^^PB3.XPRD (0xA5), Local0)
                                }

                                And (Local0, 0x7F, Local0)
                                If (LLessEqual (Local0, 0x04))
                                {
                                    Store (Zero, Local4)
                                }
                                Else
                                {
                                    If (LEqual (PXID, ^^PB2._ADR))
                                    {
                                        Store (^^PB2.VGA.DVID, Local1)
                                    }
                                    Else
                                    {
                                        Store (^^PB3.VGA.DVID, Local1)
                                    }

                                    Sleep (0x05)
                                    Decrement (Local5)
                                }
                            }

                            If (LEqual (PXID, ^^PB2._ADR))
                            {
                                Store (0x02, DEVV)
                            }
                            Else
                            {
                                Store (0x03, DEVV)
                            }

                            Store (Zero, HPST)
                            ALIB (0x06, Local7)
                            Store (0x02, HPOK)
                            Store (0x04E2, P80H)
                        }

                        If (HPOK)
                        {
                            If (LAnd (LEqual (HPOK, One), LNotEqual (DSID, Ones)))
                            {
                                Store (DSID, Local1)
                                If (LEqual (PXID, ^^PB2._ADR))
                                {
                                    Store (Local1, ^^PB2.VGA.SMID)
                                }
                                Else
                                {
                                    Store (Local1, ^^PB3.VGA.SMID)
                                }

                                Sleep (0x0A)
                                Store (HSID, Local1)
                                If (LNotEqual (Local1, Ones))
                                {
                                    If (LEqual (PXID, ^^PB2._ADR))
                                    {
                                        Store (Local1, ^^PB2.HDAU.SMID)
                                    }
                                    Else
                                    {
                                        Store (Local1, ^^PB3.HDAU.SMID)
                                    }
                                }

                                Sleep (0x0A)
                            }

                            If (LEqual (PXID, ^^PB2._ADR)) {}
                            Else
                            {
                            }

                            If (LEqual (^^SMBS.O192, One))
                            {
                                Store (One, ^^LPC0.EC0.HYMS)
                            }
                            Else
                            {
                                Store (Zero, ^^LPC0.EC0.HYMS)
                            }
                        }
                    }

                    Method (PX03, 1, NotSerialized)
                    {
                        CreateWordField (ATPB, Zero, SSZE)
                        CreateWordField (ATPB, 0x02, DPSW)
                        Store (0x04, SSZE)
                        And (Arg0, One, DPSW)
                    }

                    Method (PX04, 1, NotSerialized)
                    {
                        Store (0xE4, P80H)
                        CreateWordField (ATPB, Zero, SSZE)
                        CreateWordField (ATPB, 0x02, ICSW)
                        Store (0x04, SSZE)
                        And (Arg0, One, ICSW)
                    }

                    Method (PX08, 0, NotSerialized)
                    {
                        Store (0xE8, P80H)
                        CreateWordField (ATPB, Zero, CNUM)
                        CreateWordField (ATPB, 0x02, CSSZ)
                        Store (0x0A, CNUM)
                        Store (0x05, CSSZ)
                        CreateField (ATPB, 0x20, 0x28, CTI0)
                        Store (CNT0, CTI0)
                        CreateField (ATPB, 0x48, 0x28, CTI1)
                        Store (CNT1, CTI1)
                        CreateField (ATPB, 0x70, 0x28, CTI2)
                        CreateByteField (CNT2, Zero, FLG2)
                        If (LEqual (LPTY, One))
                        {
                            If (LEqual (M92D, One))
                            {
                                Store (Zero, FLG2)
                            }

                            If (LEqual (M92D, 0x02))
                            {
                                Store (0x07, FLG2)
                            }
                        }

                        Store (CNT2, CTI2)
                        CreateField (ATPB, 0x98, 0x28, CTI3)
                        CreateByteField (CNT3, Zero, FLG3)
                        If (LEqual (LPTY, Zero))
                        {
                            Store (0x07, FLG3)
                        }

                        If (LEqual (LPTY, One))
                        {
                            Store (Zero, FLG3)
                        }

                        If (LEqual (LPTY, 0x02))
                        {
                            Store (Zero, FLG3)
                        }

                        If (LEqual (M92D, 0x02))
                        {
                            Store (0x07, FLG3)
                        }

                        Store (CNT3, CTI3)
                        CreateField (ATPB, 0xC0, 0x28, CTI4)
                        Store (CNT4, CTI4)
                        CreateField (ATPB, 0xE8, 0x28, CTI5)
                        Store (CNT5, CTI5)
                        CreateField (ATPB, 0x0110, 0x28, CTI6)
                        Store (CNT6, CTI6)
                        CreateField (ATPB, 0x0138, 0x28, CTI7)
                        CreateByteField (CNT7, Zero, FLG7)
                        If (LEqual (LPTY, One))
                        {
                            If (LEqual (M92D, One))
                            {
                                Store (Zero, FLG7)
                            }

                            If (LEqual (M92D, 0x02))
                            {
                                Store (Zero, FLG7)
                            }
                        }

                        Store (CNT7, CTI7)
                        CreateField (ATPB, 0x0160, 0x28, CTI8)
                        CreateByteField (CNT8, Zero, FLG8)
                        If (LEqual (LPTY, Zero))
                        {
                            Store (0x07, FLG8)
                        }

                        If (LEqual (LPTY, One))
                        {
                            Store (Zero, FLG8)
                        }

                        If (LEqual (LPTY, 0x02))
                        {
                            Store (Zero, FLG8)
                        }

                        If (LEqual (M92D, 0x02))
                        {
                            Store (0x07, FLG8)
                        }

                        Store (CNT8, CTI8)
                        CreateField (ATPB, 0x0188, 0x28, CTI9)
                        CreateByteField (CNT9, Zero, FLG9)
                        If (LEqual (M92D, 0x02))
                        {
                            Store (0x07, FLG9)
                        }

                        Store (CNT9, CTI9)
                        Return (ATPB)
                    }

                    Method (PX09, 0, NotSerialized)
                    {
                        Store (0xE9, P80H)
                        CreateWordField (ATPB, Zero, CNUM)
                        CreateWordField (ATPB, 0x02, CSSZ)
                        Store (Zero, CNUM)
                        Store (Zero, CSSZ)
                        CreateByteField (ATPB, 0x04, ATI0)
                        CreateByteField (ATPB, 0x05, HPD0)
                        CreateByteField (ATPB, 0x06, DDC0)
                        Store (Zero, ATI0)
                        Store (Zero, HPD0)
                        Store (Zero, DDC0)
                        CreateByteField (ATPB, 0x07, ATI1)
                        CreateByteField (ATPB, 0x08, HPD1)
                        CreateByteField (ATPB, 0x09, DDC1)
                        Store (Zero, ATI1)
                        Store (Zero, HPD1)
                        Store (Zero, DDC1)
                        Return (ATPB)
                    }
                }

                Name (AT00, Buffer (0xFF) {})
                Name (AT01, Buffer (0x03) {})
                Method (ATCS, 2, Serialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        ATC0 ()
                    }

                    If (LEqual (Arg0, One))
                    {
                        ATC1 ()
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        ATC2 (Arg1)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        ATC3 ()
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        ATC4 (Arg1)
                    }

                    Return (AT00)
                }

                Method (ATC0, 0, NotSerialized)
                {
                    CreateWordField (AT00, Zero, SZZE)
                    CreateWordField (AT00, 0x02, INTF)
                    CreateDWordField (AT00, 0x04, SUPP)
                    Store (0x08, SZZE)
                    Store (One, INTF)
                    Store (0x0F, SUPP)
                }

                Method (ATC1, 0, Serialized)
                {
                    CreateWordField (AT00, Zero, SZZE)
                    CreateDWordField (AT00, 0x02, VFMK)
                    CreateDWordField (AT00, 0x06, FLAG)
                    CreateField (AT00, 0x30, One, DOCK)
                    Store (0x0A, SZZE)
                    Store (One, VFMK)
                    Store (Zero, FLAG)
                    Store (One, DOCK)
                }

                Method (ATC2, 1, Serialized)
                {
                    CreateField (Arg0, 0x10, 0x03, FUCC)
                    CreateField (Arg0, 0x13, 0x06, DEVV)
                    CreateByteField (Arg0, 0x03, BUSS)
                    CreateDWordField (Arg0, 0x04, VFMK)
                    CreateDWordField (Arg0, 0x06, FLAG)
                    CreateField (Arg0, 0x30, One, ADVC)
                    CreateField (Arg0, 0x31, One, WFCM)
                    CreateByteField (Arg0, 0x08, RQST)
                    CreateByteField (Arg0, 0x09, PFRQ)
                    CreateWordField (AT00, Zero, SZZE)
                    CreateByteField (AT00, 0x02, RETV)
                    Store (0x03, SZZE)
                    Store (One, RETV)
                    Store (ALIB (0x02, Arg0), AT00)
                }

                Method (ATC3, 0, Serialized)
                {
                    CreateWordField (AT00, Zero, SZZE)
                    CreateByteField (AT00, 0x02, RETV)
                    CreateWordField (AT01, Zero, SZZB)
                    CreateByteField (AT01, 0x02, PSPP)
                    Store (0x03, SZZE)
                    Store (One, RETV)
                    Store (0x03, SZZB)
                    Store (One, PSPP)
                    Store (ALIB (0x03, AT01), AT00)
                }

                Method (ATC4, 1, Serialized)
                {
                    CreateField (Arg0, 0x10, 0x03, FUCC)
                    CreateField (Arg0, 0x13, 0x06, DEVV)
                    CreateByteField (Arg0, 0x03, BUSS)
                    CreateByteField (Arg0, 0x04, NULN)
                    CreateWordField (AT00, Zero, SZZE)
                    CreateByteField (AT00, 0x02, NULM)
                    Store (0x03, SZZE)
                    Store (One, NULM)
                    Store (ALIB (0x04, Arg0), AT00)
                }
            }

            Device (PB2)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Name (PR02, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKB, 
                        Zero
                    }
                })
                Name (AR02, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x11
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR02)
                    }

                    Return (PR02)
                }

                OperationRegion (XPEX, SystemMemory, 0xF8010100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x18), 
                        ,   3, 
                    PDC8,   1, 
                        ,   2, 
                    PDS8,   1, 
                    Offset (0x19), 
                    HPC8,   1, 
                    Offset (0x1A), 
                        ,   3, 
                    PDC2,   1, 
                        ,   2, 
                    PDS2,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                OperationRegion (PCFG, PCI_Config, Zero, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    If (And (VC0S, 0x00020000))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Mutex (XPPM, 0x00)
                Method (XPRD, 1, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    Store (Arg0, XPIR)
                    Store (XPID, Local0)
                    Store (Zero, XPIR)
                    Release (XPPM)
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    Store (Arg0, XPIR)
                    Store (Arg1, XPID)
                    Store (Zero, XPIR)
                    Release (XPPM)
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Store (XPRD (0xA2), Local0)
                    And (Local0, 0xFFFFFFF8, Local0)
                    ShiftRight (Local0, 0x04, Local1)
                    And (Local1, 0x07, Local1)
                    Or (Local0, Local1, Local0)
                    Or (Local0, 0x0100, Local0)
                    XPWR (0xA2, Local0)
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Store (LKCN, Local0)
                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    Or (Local0, 0x20, Local0)
                    Store (Local0, LKCN)
                    Store (0x64, Local1)
                    Store (One, Local2)
                    While (LAnd (Local1, Local2))
                    {
                        Sleep (One)
                        Store (LKST, Local3)
                        If (And (Local3, 0x0800))
                        {
                            Decrement (Local1)
                        }
                        Else
                        {
                            Store (Zero, Local2)
                        }
                    }

                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    If (LNot (Local2))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Store (_ADR, Local0)
                    Store (ShiftRight (Local0, 0x10), Local1)
                    Store (ShiftLeft (Local1, 0x03), Local1)
                    Store (And (Local0, 0x0F), Local2)
                    Store (Or (Local1, Local2), Local3)
                    Return (Local3)
                }

                Method (XPPR, 1, NotSerialized)
                {
                    Name (HPOK, Zero)
                    Store (Zero, HPOK)
                    Store (ShiftLeft (XPPB (), 0x03), Local0)
                    If (Arg0)
                    {
                        XPLL (Local0, One)
                        XPLP (Local0, One)
                        Sleep (0xC8)
                        XPTR (Local0, One)
                        Store (0x0F, Local5)
                        While (LAnd (LNot (HPOK), LGreater (Local5, Zero)))
                        {
                            Store (One, PDC2)
                            Store (0x28, Local1)
                            While (LAnd (LNot (HPOK), LGreater (Local1, Zero)))
                            {
                                Store (XPRD (0xA5), Local2)
                                If (LEqual (And (Local2, 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LGreaterEqual (And (Local2, 0xFF), 0x04))
                                {
                                    Store (One, HPOK)
                                }

                                Decrement (Local1)
                            }

                            If (HPOK)
                            {
                                Store (And (XPRD (0xA5), 0xFF), Local2)
                                Store (And (ShiftRight (XPRD (0xA2), 0x04), 0x07), Local3)
                                If (LAnd (LEqual (Local2, 0x06), LAnd (LGreater (Local3, One), LLess (
                                    Local3, 0x05))))
                                {
                                    Store (Zero, HPOK)
                                }
                            }

                            If (HPOK)
                            {
                                Store (0x07D0, Local1)
                                Store (Zero, HPOK)
                                While (LAnd (LNot (HPOK), Local1))
                                {
                                    Store (And (XPRD (0xA5), 0xFF), Local2)
                                    If (LEqual (Local2, 0x07))
                                    {
                                        Store (One, Local1)
                                        Store (XPDL (), Local4)
                                        If (Local4)
                                        {
                                            XPRT ()
                                            Decrement (Local5)
                                        }
                                    }

                                    If (LEqual (Local2, 0x10))
                                    {
                                        Store (One, HPOK)
                                    }

                                    Sleep (One)
                                    Decrement (Local1)
                                }
                            }
                        }
                    }

                    If (HPOK)
                    {
                        XPTR (Local0, Zero)
                        XPLP (Local0, Zero)
                        XPLL (Local0, Zero)
                    }

                    Return (Ones)
                }

                Device (VGA)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0x50)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        Offset (0x2C), 
                        SVID,   32, 
                        Offset (0x4C), 
                        SMID,   32
                    }

                    Name (DOSA, Zero)
                    Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                    {
                        Store (Arg0, DOSA)
                    }

                    Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                    {
                        Name (DODL, Package (0x05)
                        {
                            0x00010100, 
                            0x00010110, 
                            0x0200, 
                            0x00010210, 
                            0x00010220
                        })
                        Return (DODL)
                    }

                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)  // _ADR: Address
                        Name (BRLV, Package (0x12)
                        {
                            0x4E, 
                            0x18, 
                            One, 
                            0x06, 
                            0x0C, 
                            0x12, 
                            0x18, 
                            0x1E, 
                            0x24, 
                            0x2A, 
                            0x30, 
                            0x36, 
                            0x3C, 
                            0x42, 
                            0x48, 
                            0x4E, 
                            0x54, 
                            0x64
                        })
                        Name (BRTB, Package (0x10) {})
                        Name (BRL2, Package (0x67)
                        {
                            0x46, 
                            0x1E, 
                            Zero, 
                            One, 
                            0x02, 
                            0x03, 
                            0x04, 
                            0x05, 
                            0x06, 
                            0x07, 
                            0x08, 
                            0x09, 
                            0x0A, 
                            0x0B, 
                            0x0C, 
                            0x0D, 
                            0x0E, 
                            0x0F, 
                            0x10, 
                            0x11, 
                            0x12, 
                            0x13, 
                            0x14, 
                            0x15, 
                            0x16, 
                            0x17, 
                            0x18, 
                            0x19, 
                            0x1A, 
                            0x1B, 
                            0x1C, 
                            0x1D, 
                            0x1E, 
                            0x1F, 
                            0x20, 
                            0x21, 
                            0x22, 
                            0x23, 
                            0x24, 
                            0x25, 
                            0x26, 
                            0x27, 
                            0x28, 
                            0x29, 
                            0x2A, 
                            0x2B, 
                            0x2C, 
                            0x2D, 
                            0x2E, 
                            0x2F, 
                            0x30, 
                            0x31, 
                            0x32, 
                            0x33, 
                            0x34, 
                            0x35, 
                            0x36, 
                            0x37, 
                            0x38, 
                            0x39, 
                            0x3A, 
                            0x3B, 
                            0x3C, 
                            0x3D, 
                            0x3E, 
                            0x3F, 
                            0x40, 
                            0x41, 
                            0x42, 
                            0x43, 
                            0x44, 
                            0x45, 
                            0x46, 
                            0x47, 
                            0x48, 
                            0x49, 
                            0x4A, 
                            0x4B, 
                            0x4C, 
                            0x4D, 
                            0x4E, 
                            0x4F, 
                            0x50, 
                            0x51, 
                            0x52, 
                            0x53, 
                            0x54, 
                            0x55, 
                            0x56, 
                            0x57, 
                            0x58, 
                            0x59, 
                            0x5A, 
                            0x5B, 
                            0x5C, 
                            0x5D, 
                            0x5E, 
                            0x5F, 
                            0x60, 
                            0x61, 
                            0x62, 
                            0x63, 
                            0x64
                        })
                        Name (BRL3, Package (0x0D)
                        {
                            0x64, 
                            0x43, 
                            One, 
                            0x02, 
                            0x03, 
                            0x05, 
                            0x08, 
                            0x0C, 
                            0x12, 
                            0x1B, 
                            0x27, 
                            0x43, 
                            0x64
                        })
                        Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
                        {
                            If (LEqual (^^^^LPC0.EC0.OSTY, 0x02))
                            {
                                Return (BRL3)
                            }

                            If (LEqual (^^^^LPC0.EC0.OSTY, 0x04))
                            {
                                Return (BRL2)
                            }
                            Else
                            {
                                Return (BRLV)
                            }
                        }

                        Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
                        {
                            If (LEqual (^^^^VGA.AF7E, 0x80000001))
                            {
                                Divide (Multiply (Arg0, 0xFF), 0x64, Local1, Local0)
                                If (LEqual (^^^^LPC0.EC0.OSTY, 0x04))
                                {
                                    If (LEqual (Arg0, Zero))
                                    {
                                        Store (One, Arg0)
                                    }

                                    Store (Arg0, ^^^^LPC0.EC0.BRTS)
                                }

                                If (LEqual (^^^^LPC0.EC0.OSTY, 0x03))
                                {
                                    Store (^^^^VGA.LCD.LVLS (Arg0), Local1)
                                    Store (Local1, ^^^^LPC0.EC0.BRTS)
                                    Notify (^^^^LPC0.EC0.VPC0, 0x80)
                                }

                                ^^^^AFN7 (Local0)
                            }
                            Else
                            {
                                Acquire (^^^^LPC0.PSMX, 0xFFFF)
                                Store (^^^^VGA.LCD.LVLS (Arg0), Local1)
                                Store (Local1, ^^^^LPC0.EC0.BRTS)
                                Store (DerefOf (Index (^^^^VGA.LCD.BRTB, Local1)), Local2)
                                Store (Local2, BRTL)
                                Store (0x72, BCMD)
                                BSMI (Zero)
                                Notify (^^^^LPC0.EC0.VPC0, 0x80)
                                Release (^^^^LPC0.PSMX)
                            }
                        }

                        Method (LVLS, 1, NotSerialized)
                        {
                            Store (One, Local0)
                            Store (Zero, Local1)
                            While (Local0)
                            {
                                Add (Local1, 0x02, Local2)
                                Store (DerefOf (Index (BRLV, Local2)), Local3)
                                And (Arg0, 0xFF, Local4)
                                If (LEqual (Local4, Local3))
                                {
                                    Store (Zero, Local0)
                                }

                                If (LGreaterEqual (Local1, 0x0F))
                                {
                                    Store (Zero, Local0)
                                }

                                If (Local0)
                                {
                                    Add (One, Local1, Local1)
                                }
                            }

                            Return (Local1)
                        }
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (Zero)
                    }

                    Name (ATIB, Buffer (0x0100) {})
                    Method (ATIF, 2, Serialized)
                    {
                        If (LEqual (Arg0, Zero))
                        {
                            Return (AF00 ())
                        }

                        If (LEqual (Arg0, One))
                        {
                            Return (AF01 ())
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            Return (AF02 ())
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            Return (AF03 (DerefOf (Index (Arg1, 0x02)), DerefOf (Index (Arg1, 
                                0x04))))
                        }

                        If (LEqual (Arg0, 0x0F))
                        {
                            Return (AF15 ())
                        }
                        Else
                        {
                            CreateWordField (ATIB, Zero, SSZE)
                            CreateWordField (ATIB, 0x02, VERN)
                            CreateDWordField (ATIB, 0x04, NMSK)
                            CreateDWordField (ATIB, 0x08, SFUN)
                            Store (Zero, SSZE)
                            Store (Zero, VERN)
                            Store (Zero, NMSK)
                            Store (Zero, SFUN)
                            Return (ATIB)
                        }
                    }

                    Method (AF00, 0, NotSerialized)
                    {
                        And (^^^VGA.AZPS, 0xC0000001, ^^^VGA.AZPS)
                        CreateWordField (ATIB, Zero, SSZE)
                        CreateWordField (ATIB, 0x02, VERN)
                        CreateDWordField (ATIB, 0x04, NMSK)
                        CreateDWordField (ATIB, 0x08, SFUN)
                        Store (0x0C, SSZE)
                        Store (One, VERN)
                        If (LEqual (^^^VGA.PXEN, 0x80000000))
                        {
                            Store (0x11, NMSK)
                        }
                        Else
                        {
                            Store (0x51, NMSK)
                        }

                        If (LEqual (^^^VGA.AF7E, 0x80000001))
                        {
                            Or (NMSK, 0x80, NMSK)
                        }

                        Store (NMSK, MSKN)
                        Store (0x4007, SFUN)
                        Return (ATIB)
                    }

                    Method (AF01, 0, NotSerialized)
                    {
                        CreateWordField (ATIB, Zero, SSZE)
                        CreateDWordField (ATIB, 0x02, VMSK)
                        CreateDWordField (ATIB, 0x06, FLGS)
                        Store (0x0A, SSZE)
                        Store (0x03, VMSK)
                        Store (One, FLGS)
                        Return (ATIB)
                    }

                    Name (PSBR, Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0x00
                    })
                    Name (MSKN, Zero)
                    Name (SEXM, Zero)
                    Name (STHG, Zero)
                    Name (STHI, Zero)
                    Name (SFPG, Zero)
                    Name (SFPI, Zero)
                    Name (SSPS, Zero)
                    Name (SSDM, 0x0A)
                    Name (SCDY, Zero)
                    Name (SACT, Buffer (0x07)
                    {
                         0x01, 0x02, 0x08, 0x80, 0x03, 0x09, 0x81
                    })
                    Method (AF02, 0, NotSerialized)
                    {
                        CreateBitField (PSBR, Zero, PDSW)
                        CreateBitField (PSBR, One, PEXM)
                        CreateBitField (PSBR, 0x02, PTHR)
                        CreateBitField (PSBR, 0x03, PFPS)
                        CreateBitField (PSBR, 0x04, PSPS)
                        CreateBitField (PSBR, 0x05, PDCC)
                        CreateBitField (PSBR, 0x06, PXPS)
                        CreateBitField (PSBR, 0x07, PBRT)
                        CreateWordField (ATIB, Zero, SSZE)
                        CreateDWordField (ATIB, 0x02, PSBI)
                        CreateByteField (ATIB, 0x06, EXPM)
                        CreateByteField (ATIB, 0x07, THRM)
                        CreateByteField (ATIB, 0x08, THID)
                        CreateByteField (ATIB, 0x09, FPWR)
                        CreateByteField (ATIB, 0x0A, FPID)
                        CreateByteField (ATIB, 0x0B, SPWR)
                        CreateByteField (ATIB, 0x0C, BRTL)
                        Store (0x0D, SSZE)
                        Store (PSBR, PSBI)
                        If (PDSW)
                        {
                            Store (Zero, PDSW)
                        }

                        If (PEXM)
                        {
                            Store (SEXM, EXPM)
                            Store (Zero, SEXM)
                            Store (Zero, PEXM)
                        }

                        If (PTHR)
                        {
                            Store (STHG, THRM)
                            Store (STHI, THID)
                            Store (Zero, STHG)
                            Store (Zero, STHI)
                            Store (Zero, PTHR)
                        }

                        If (PFPS)
                        {
                            Store (SFPG, FPWR)
                            Store (SFPI, FPWR)
                            Store (Zero, SFPG)
                            Store (Zero, SFPI)
                            Store (Zero, PFPS)
                        }

                        If (PSPS)
                        {
                            Store (SSPS, SPWR)
                            Store (Zero, PSPS)
                        }

                        If (PXPS)
                        {
                            Store (Zero, PXPS)
                        }

                        If (PBRT)
                        {
                            Store (0xF7, P80H)
                            Store (Zero, PBRT)
                        }

                        Return (ATIB)
                    }

                    Method (AF03, 2, NotSerialized)
                    {
                        CreateWordField (ATIB, Zero, SSZE)
                        CreateWordField (ATIB, 0x02, SSDP)
                        CreateWordField (ATIB, 0x04, SCDP)
                        Store (Arg0, SSDP)
                        Store (Arg1, SCDP)
                        Name (NXTD, 0x06)
                        Name (CIDX, 0x06)
                        Store (SSDP, Local1)
                        And (Local1, 0x8B, Local1)
                        Store (SCDP, Local2)
                        If (CondRefOf (\_SB.LID._LID, Local4))
                        {
                            And (Local2, 0xFFFFFFFE, Local2)
                            Or (Local2, ^^^^LID._LID (), Local2)
                        }
                        Else
                        {
                            Or (Local2, One, Local2)
                        }

                        Store (Local2, P80H)
                        Store (Zero, Local0)
                        While (LLess (Local0, SizeOf (SACT)))
                        {
                            Store (DerefOf (Index (SACT, Local0)), Local3)
                            If (LEqual (Local3, Local1))
                            {
                                Store (Local0, CIDX)
                                Store (SizeOf (SACT), Local0)
                            }
                            Else
                            {
                                Increment (Local0)
                            }
                        }

                        Store (CIDX, Local0)
                        While (LLess (Local0, SizeOf (SACT)))
                        {
                            Increment (Local0)
                            If (LEqual (Local0, SizeOf (SACT)))
                            {
                                Store (Zero, Local0)
                            }

                            Store (DerefOf (Index (SACT, Local0)), Local3)
                            If (LEqual (And (Local3, Local2), Local3))
                            {
                                Store (Local0, NXTD)
                                Store (SizeOf (SACT), Local0)
                            }
                        }

                        If (LEqual (NXTD, SizeOf (SACT)))
                        {
                            Store (Zero, SSDP)
                        }
                        Else
                        {
                            Store (NXTD, Local0)
                            Store (DerefOf (Index (SACT, Local0)), Local3)
                            And (SSDP, 0xFFFFFFF4, SSDP)
                            Or (SSDP, Local3, SSDP)
                        }

                        Store (0x04, SSZE)
                        Store (SSDP, P80H)
                        Return (ATIB)
                    }

                    Method (AFN0, 0, Serialized)
                    {
                        If (And (MSKN, One))
                        {
                            CreateBitField (PSBR, Zero, PDSW)
                            Store (One, PDSW)
                            Notify (VGA, 0x81)
                        }
                    }

                    Method (AFN3, 2, Serialized)
                    {
                        If (And (MSKN, 0x08))
                        {
                            Store (Arg0, Local0)
                            Store (Local0, SFPI)
                            Store (Arg1, Local0)
                            Store (And (Local0, 0x03, Local0), SFPG)
                            CreateBitField (PSBR, 0x03, PFPS)
                            Store (One, PFPS)
                            Notify (VGA, 0x81)
                        }
                    }

                    Method (AFN4, 1, Serialized)
                    {
                        If (And (MSKN, 0x10))
                        {
                            Store (Arg0, Local0)
                            Store (SSPS, Local1)
                            Store (Local0, SSPS)
                            If (LEqual (Local0, Local1)) {}
                            Else
                            {
                                CreateBitField (PSBR, 0x04, PSPS)
                                Store (One, PSPS)
                                Notify (VGA, 0x81)
                            }
                        }
                    }

                    Method (AFN5, 0, Serialized)
                    {
                        If (And (MSKN, 0x20))
                        {
                            CreateBitField (PSBR, 0x05, PDCC)
                            Store (One, PDCC)
                            Notify (VGA, 0x81)
                        }
                    }

                    Method (AFN6, 0, Serialized)
                    {
                        If (And (MSKN, 0x40))
                        {
                            CreateBitField (PSBR, 0x06, PXPS)
                            Store (One, PXPS)
                            Notify (VGA, 0x81)
                        }
                    }

                    Method (AFN7, 1, Serialized)
                    {
                        If (And (MSKN, 0x80))
                        {
                            CreateBitField (PSBR, 0x07, PBRT)
                            Store (One, PBRT)
                            CreateByteField (ATIB, 0x0C, BRTL)
                            Store (Arg0, BRTL)
                            Notify (VGA, 0x81)
                        }
                    }

                    Method (AF15, 0, NotSerialized)
                    {
                        Store (0xFF, P80H)
                        CreateWordField (ATIB, Zero, DNUM)
                        CreateWordField (ATIB, 0x02, DSZE)
                        CreateDWordField (ATIB, 0x04, FLAG)
                        CreateWordField (ATIB, 0x08, BUSN)
                        CreateWordField (ATIB, 0x0A, DEVN)
                        Store (0x08, DSZE)
                        Store (One, DNUM)
                        Store (0x04, FLAG)
                        Store (Zero, BUSN)
                        Store (One, DEVN)
                        Return (ATIB)
                    }

                    Name (AT00, Buffer (0xFF) {})
                    Name (AT01, Buffer (0x03) {})
                    Method (ATCS, 2, Serialized)
                    {
                        If (LEqual (Arg0, Zero))
                        {
                            ATC0 ()
                        }

                        If (LEqual (Arg0, One))
                        {
                            ATC1 ()
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            ATC2 (Arg1)
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            ATC3 ()
                        }

                        If (LEqual (Arg0, 0x04))
                        {
                            ATC4 (Arg1)
                        }

                        Return (AT00)
                    }

                    Method (ATC0, 0, NotSerialized)
                    {
                        CreateWordField (AT00, Zero, SZZE)
                        CreateWordField (AT00, 0x02, INTF)
                        CreateDWordField (AT00, 0x04, SUPP)
                        Store (0x08, SZZE)
                        Store (One, INTF)
                        Store (0x0F, SUPP)
                    }

                    Method (ATC1, 0, Serialized)
                    {
                        CreateWordField (AT00, Zero, SZZE)
                        CreateDWordField (AT00, 0x02, VFMK)
                        CreateDWordField (AT00, 0x06, FLAG)
                        CreateField (AT00, 0x30, One, DOCK)
                        Store (0x0A, SZZE)
                        Store (One, VFMK)
                        Store (Zero, FLAG)
                        Store (One, DOCK)
                    }

                    Method (ATC2, 1, Serialized)
                    {
                        CreateField (Arg0, 0x10, 0x03, FUCC)
                        CreateField (Arg0, 0x13, 0x06, DEVV)
                        CreateByteField (Arg0, 0x03, BUSS)
                        CreateDWordField (Arg0, 0x04, VFMK)
                        CreateDWordField (Arg0, 0x06, FLAG)
                        CreateField (Arg0, 0x30, One, ADVC)
                        CreateField (Arg0, 0x31, One, WFCM)
                        CreateByteField (Arg0, 0x08, RQST)
                        CreateByteField (Arg0, 0x09, PFRQ)
                        CreateWordField (AT00, Zero, SZZE)
                        CreateByteField (AT00, 0x02, RETV)
                        Store (0x03, SZZE)
                        Store (One, RETV)
                        Store (ALIB (0x02, Arg0), AT00)
                    }

                    Method (ATC3, 0, Serialized)
                    {
                        CreateWordField (AT00, Zero, SZZE)
                        CreateByteField (AT00, 0x02, RETV)
                        CreateWordField (AT01, Zero, SZZB)
                        CreateByteField (AT01, 0x02, PSPP)
                        Store (0x03, SZZE)
                        Store (One, RETV)
                        Store (0x03, SZZB)
                        Store (One, PSPP)
                        Store (ALIB (0x03, AT01), AT00)
                    }

                    Method (ATC4, 1, Serialized)
                    {
                        CreateField (Arg0, 0x10, 0x03, FUCC)
                        CreateField (Arg0, 0x13, 0x06, DEVV)
                        CreateByteField (Arg0, 0x03, BUSS)
                        CreateByteField (Arg0, 0x04, NULN)
                        CreateWordField (AT00, Zero, SZZE)
                        CreateByteField (AT00, 0x02, NULM)
                        Store (0x03, SZZE)
                        Store (One, NULM)
                        Store (ALIB (0x04, Arg0), AT00)
                    }
                }

                Device (HDAU)
                {
                    Name (_ADR, One)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0x50)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        Offset (0x2C), 
                        SVID,   32, 
                        Offset (0x4C), 
                        SMID,   32
                    }
                }
            }

            Device (PB3)
            {
                Name (_ADR, 0x00030000)  // _ADR: Address
                Name (PR03, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKC, 
                        Zero
                    }
                })
                Name (AR03, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x12
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR03)
                    }

                    Return (PR03)
                }

                OperationRegion (XPEX, SystemMemory, 0xF8018100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x18), 
                        ,   3, 
                    PDC8,   1, 
                        ,   2, 
                    PDS8,   1, 
                    Offset (0x19), 
                    HPC8,   1, 
                    Offset (0x1A), 
                        ,   3, 
                    PDC2,   1, 
                        ,   2, 
                    PDS2,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                OperationRegion (PCFG, PCI_Config, Zero, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    If (And (VC0S, 0x00020000))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Mutex (XPPM, 0x00)
                Method (XPRD, 1, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    Store (Arg0, XPIR)
                    Store (XPID, Local0)
                    Store (Zero, XPIR)
                    Release (XPPM)
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    Store (Arg0, XPIR)
                    Store (Arg1, XPID)
                    Store (Zero, XPIR)
                    Release (XPPM)
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Store (XPRD (0xA2), Local0)
                    And (Local0, 0xFFFFFFF8, Local0)
                    ShiftRight (Local0, 0x04, Local1)
                    And (Local1, 0x07, Local1)
                    Or (Local0, Local1, Local0)
                    Or (Local0, 0x0100, Local0)
                    XPWR (0xA2, Local0)
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Store (LKCN, Local0)
                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    Or (Local0, 0x20, Local0)
                    Store (Local0, LKCN)
                    Store (0x64, Local1)
                    Store (One, Local2)
                    While (LAnd (Local1, Local2))
                    {
                        Sleep (One)
                        Store (LKST, Local3)
                        If (And (Local3, 0x0800))
                        {
                            Decrement (Local1)
                        }
                        Else
                        {
                            Store (Zero, Local2)
                        }
                    }

                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    If (LNot (Local2))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Store (_ADR, Local0)
                    Store (ShiftRight (Local0, 0x10), Local1)
                    Store (ShiftLeft (Local1, 0x03), Local1)
                    Store (And (Local0, 0x0F), Local2)
                    Store (Or (Local1, Local2), Local3)
                    Return (Local3)
                }

                Method (XPPR, 1, NotSerialized)
                {
                    Name (HPOK, Zero)
                    Store (Zero, HPOK)
                    Store (ShiftLeft (XPPB (), 0x03), Local0)
                    If (Arg0)
                    {
                        XPLL (Local0, One)
                        XPLP (Local0, One)
                        Sleep (0xC8)
                        XPTR (Local0, One)
                        Store (0x0F, Local5)
                        While (LAnd (LNot (HPOK), LGreater (Local5, Zero)))
                        {
                            Store (One, PDC2)
                            Store (0x28, Local1)
                            While (LAnd (LNot (HPOK), LGreater (Local1, Zero)))
                            {
                                Store (XPRD (0xA5), Local2)
                                If (LEqual (And (Local2, 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LGreaterEqual (And (Local2, 0xFF), 0x04))
                                {
                                    Store (One, HPOK)
                                }

                                Decrement (Local1)
                            }

                            If (HPOK)
                            {
                                Store (And (XPRD (0xA5), 0xFF), Local2)
                                Store (And (ShiftRight (XPRD (0xA2), 0x04), 0x07), Local3)
                                If (LAnd (LEqual (Local2, 0x06), LAnd (LGreater (Local3, One), LLess (
                                    Local3, 0x05))))
                                {
                                    Store (Zero, HPOK)
                                }
                            }

                            If (HPOK)
                            {
                                Store (0x07D0, Local1)
                                Store (Zero, HPOK)
                                While (LAnd (LNot (HPOK), Local1))
                                {
                                    Store (And (XPRD (0xA5), 0xFF), Local2)
                                    If (LEqual (Local2, 0x07))
                                    {
                                        Store (One, Local1)
                                        Store (XPDL (), Local4)
                                        If (Local4)
                                        {
                                            XPRT ()
                                            Decrement (Local5)
                                        }
                                    }

                                    If (LEqual (Local2, 0x10))
                                    {
                                        Store (One, HPOK)
                                    }

                                    Sleep (One)
                                    Decrement (Local1)
                                }
                            }
                        }
                    }

                    If (HPOK)
                    {
                        XPTR (Local0, Zero)
                        XPLP (Local0, Zero)
                        XPLL (Local0, Zero)
                    }

                    Return (Ones)
                }

                Device (VGA)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0x50)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        Offset (0x2C), 
                        SVID,   32, 
                        Offset (0x4C), 
                        SMID,   32
                    }

                    Name (DOSA, Zero)
                    Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                    {
                        Store (Arg0, DOSA)
                    }

                    Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                    {
                        Name (DODL, Package (0x05)
                        {
                            0x00010100, 
                            0x00010110, 
                            0x0200, 
                            0x00010210, 
                            0x00010220
                        })
                        Return (DODL)
                    }

                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)  // _ADR: Address
                        Name (BRLV, Package (0x12)
                        {
                            0x4E, 
                            0x18, 
                            One, 
                            0x06, 
                            0x0C, 
                            0x12, 
                            0x18, 
                            0x1E, 
                            0x24, 
                            0x2A, 
                            0x30, 
                            0x36, 
                            0x3C, 
                            0x42, 
                            0x48, 
                            0x4E, 
                            0x54, 
                            0x64
                        })
                        Name (BRTB, Package (0x10) {})
                        Name (BRL2, Package (0x67)
                        {
                            0x46, 
                            0x1E, 
                            Zero, 
                            One, 
                            0x02, 
                            0x03, 
                            0x04, 
                            0x05, 
                            0x06, 
                            0x07, 
                            0x08, 
                            0x09, 
                            0x0A, 
                            0x0B, 
                            0x0C, 
                            0x0D, 
                            0x0E, 
                            0x0F, 
                            0x10, 
                            0x11, 
                            0x12, 
                            0x13, 
                            0x14, 
                            0x15, 
                            0x16, 
                            0x17, 
                            0x18, 
                            0x19, 
                            0x1A, 
                            0x1B, 
                            0x1C, 
                            0x1D, 
                            0x1E, 
                            0x1F, 
                            0x20, 
                            0x21, 
                            0x22, 
                            0x23, 
                            0x24, 
                            0x25, 
                            0x26, 
                            0x27, 
                            0x28, 
                            0x29, 
                            0x2A, 
                            0x2B, 
                            0x2C, 
                            0x2D, 
                            0x2E, 
                            0x2F, 
                            0x30, 
                            0x31, 
                            0x32, 
                            0x33, 
                            0x34, 
                            0x35, 
                            0x36, 
                            0x37, 
                            0x38, 
                            0x39, 
                            0x3A, 
                            0x3B, 
                            0x3C, 
                            0x3D, 
                            0x3E, 
                            0x3F, 
                            0x40, 
                            0x41, 
                            0x42, 
                            0x43, 
                            0x44, 
                            0x45, 
                            0x46, 
                            0x47, 
                            0x48, 
                            0x49, 
                            0x4A, 
                            0x4B, 
                            0x4C, 
                            0x4D, 
                            0x4E, 
                            0x4F, 
                            0x50, 
                            0x51, 
                            0x52, 
                            0x53, 
                            0x54, 
                            0x55, 
                            0x56, 
                            0x57, 
                            0x58, 
                            0x59, 
                            0x5A, 
                            0x5B, 
                            0x5C, 
                            0x5D, 
                            0x5E, 
                            0x5F, 
                            0x60, 
                            0x61, 
                            0x62, 
                            0x63, 
                            0x64
                        })
                        Name (BRL3, Package (0x0D)
                        {
                            0x64, 
                            0x43, 
                            One, 
                            0x02, 
                            0x03, 
                            0x05, 
                            0x08, 
                            0x0C, 
                            0x12, 
                            0x1B, 
                            0x27, 
                            0x43, 
                            0x64
                        })
                        Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
                        {
                            If (LEqual (^^^^LPC0.EC0.OSTY, 0x02))
                            {
                                Return (BRL3)
                            }

                            If (LEqual (^^^^LPC0.EC0.OSTY, 0x04))
                            {
                                Return (BRL2)
                            }
                            Else
                            {
                                Return (BRLV)
                            }
                        }

                        Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
                        {
                            If (LEqual (^^^^VGA.AF7E, 0x80000001))
                            {
                                Divide (Multiply (Arg0, 0xFF), 0x64, Local1, Local0)
                                If (LEqual (^^^^LPC0.EC0.OSTY, 0x04))
                                {
                                    If (LEqual (Arg0, Zero))
                                    {
                                        Store (One, Arg0)
                                    }

                                    Store (Arg0, ^^^^LPC0.EC0.BRTS)
                                }

                                If (LEqual (^^^^LPC0.EC0.OSTY, 0x03))
                                {
                                    Store (^^^^VGA.LCD.LVLS (Arg0), Local1)
                                    Store (Local1, ^^^^LPC0.EC0.BRTS)
                                    Notify (^^^^LPC0.EC0.VPC0, 0x80)
                                }

                                ^^^^AFN7 (Local0)
                            }
                            Else
                            {
                                Acquire (^^^^LPC0.PSMX, 0xFFFF)
                                Store (^^^^VGA.LCD.LVLS (Arg0), Local1)
                                Store (Local1, ^^^^LPC0.EC0.BRTS)
                                Store (DerefOf (Index (^^^^VGA.LCD.BRTB, Local1)), Local2)
                                Store (Local2, BRTL)
                                Store (0x72, BCMD)
                                BSMI (Zero)
                                Notify (^^^^LPC0.EC0.VPC0, 0x80)
                                Release (^^^^LPC0.PSMX)
                            }
                        }

                        Method (LVLS, 1, NotSerialized)
                        {
                            Store (One, Local0)
                            Store (Zero, Local1)
                            While (Local0)
                            {
                                Add (Local1, 0x02, Local2)
                                Store (DerefOf (Index (BRLV, Local2)), Local3)
                                And (Arg0, 0xFF, Local4)
                                If (LEqual (Local4, Local3))
                                {
                                    Store (Zero, Local0)
                                }

                                If (LGreaterEqual (Local1, 0x0F))
                                {
                                    Store (Zero, Local0)
                                }

                                If (Local0)
                                {
                                    Add (One, Local1, Local1)
                                }
                            }

                            Return (Local1)
                        }
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (Zero)
                    }

                    Name (ATIB, Buffer (0x0100) {})
                    Method (ATIF, 2, Serialized)
                    {
                        If (LEqual (Arg0, Zero))
                        {
                            Return (AF00 ())
                        }

                        If (LEqual (Arg0, One))
                        {
                            Return (AF01 ())
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            Return (AF02 ())
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            Return (AF03 (DerefOf (Index (Arg1, 0x02)), DerefOf (Index (Arg1, 
                                0x04))))
                        }

                        If (LEqual (Arg0, 0x0F))
                        {
                            Return (AF15 ())
                        }
                        Else
                        {
                            CreateWordField (ATIB, Zero, SSZE)
                            CreateWordField (ATIB, 0x02, VERN)
                            CreateDWordField (ATIB, 0x04, NMSK)
                            CreateDWordField (ATIB, 0x08, SFUN)
                            Store (Zero, SSZE)
                            Store (Zero, VERN)
                            Store (Zero, NMSK)
                            Store (Zero, SFUN)
                            Return (ATIB)
                        }
                    }

                    Method (AF00, 0, NotSerialized)
                    {
                        And (^^^VGA.AZPS, 0xC0000001, ^^^VGA.AZPS)
                        CreateWordField (ATIB, Zero, SSZE)
                        CreateWordField (ATIB, 0x02, VERN)
                        CreateDWordField (ATIB, 0x04, NMSK)
                        CreateDWordField (ATIB, 0x08, SFUN)
                        Store (0x0C, SSZE)
                        Store (One, VERN)
                        If (LEqual (^^^VGA.PXEN, 0x80000000))
                        {
                            Store (0x11, NMSK)
                        }
                        Else
                        {
                            Store (0x51, NMSK)
                        }

                        If (LEqual (^^^VGA.AF7E, 0x80000001))
                        {
                            Or (NMSK, 0x80, NMSK)
                        }

                        Store (NMSK, MSKN)
                        Store (0x4007, SFUN)
                        Return (ATIB)
                    }

                    Method (AF01, 0, NotSerialized)
                    {
                        CreateWordField (ATIB, Zero, SSZE)
                        CreateDWordField (ATIB, 0x02, VMSK)
                        CreateDWordField (ATIB, 0x06, FLGS)
                        Store (0x0A, SSZE)
                        Store (0x03, VMSK)
                        Store (One, FLGS)
                        Return (ATIB)
                    }

                    Name (PSBR, Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0x00
                    })
                    Name (MSKN, Zero)
                    Name (SEXM, Zero)
                    Name (STHG, Zero)
                    Name (STHI, Zero)
                    Name (SFPG, Zero)
                    Name (SFPI, Zero)
                    Name (SSPS, Zero)
                    Name (SSDM, 0x0A)
                    Name (SCDY, Zero)
                    Name (SACT, Buffer (0x07)
                    {
                         0x01, 0x02, 0x08, 0x80, 0x03, 0x09, 0x81
                    })
                    Method (AF02, 0, NotSerialized)
                    {
                        CreateBitField (PSBR, Zero, PDSW)
                        CreateBitField (PSBR, One, PEXM)
                        CreateBitField (PSBR, 0x02, PTHR)
                        CreateBitField (PSBR, 0x03, PFPS)
                        CreateBitField (PSBR, 0x04, PSPS)
                        CreateBitField (PSBR, 0x05, PDCC)
                        CreateBitField (PSBR, 0x06, PXPS)
                        CreateBitField (PSBR, 0x07, PBRT)
                        CreateWordField (ATIB, Zero, SSZE)
                        CreateDWordField (ATIB, 0x02, PSBI)
                        CreateByteField (ATIB, 0x06, EXPM)
                        CreateByteField (ATIB, 0x07, THRM)
                        CreateByteField (ATIB, 0x08, THID)
                        CreateByteField (ATIB, 0x09, FPWR)
                        CreateByteField (ATIB, 0x0A, FPID)
                        CreateByteField (ATIB, 0x0B, SPWR)
                        CreateByteField (ATIB, 0x0C, BRTL)
                        Store (0x0D, SSZE)
                        Store (PSBR, PSBI)
                        If (PDSW)
                        {
                            Store (Zero, PDSW)
                        }

                        If (PEXM)
                        {
                            Store (SEXM, EXPM)
                            Store (Zero, SEXM)
                            Store (Zero, PEXM)
                        }

                        If (PTHR)
                        {
                            Store (STHG, THRM)
                            Store (STHI, THID)
                            Store (Zero, STHG)
                            Store (Zero, STHI)
                            Store (Zero, PTHR)
                        }

                        If (PFPS)
                        {
                            Store (SFPG, FPWR)
                            Store (SFPI, FPWR)
                            Store (Zero, SFPG)
                            Store (Zero, SFPI)
                            Store (Zero, PFPS)
                        }

                        If (PSPS)
                        {
                            Store (SSPS, SPWR)
                            Store (Zero, PSPS)
                        }

                        If (PXPS)
                        {
                            Store (Zero, PXPS)
                        }

                        If (PBRT)
                        {
                            Store (0xF7, P80H)
                            Store (Zero, PBRT)
                        }

                        Return (ATIB)
                    }

                    Method (AF03, 2, NotSerialized)
                    {
                        CreateWordField (ATIB, Zero, SSZE)
                        CreateWordField (ATIB, 0x02, SSDP)
                        CreateWordField (ATIB, 0x04, SCDP)
                        Store (Arg0, SSDP)
                        Store (Arg1, SCDP)
                        Name (NXTD, 0x06)
                        Name (CIDX, 0x06)
                        Store (SSDP, Local1)
                        And (Local1, 0x8B, Local1)
                        Store (SCDP, Local2)
                        If (CondRefOf (\_SB.LID._LID, Local4))
                        {
                            And (Local2, 0xFFFFFFFE, Local2)
                            Or (Local2, ^^^^LID._LID (), Local2)
                        }
                        Else
                        {
                            Or (Local2, One, Local2)
                        }

                        Store (Local2, P80H)
                        Store (Zero, Local0)
                        While (LLess (Local0, SizeOf (SACT)))
                        {
                            Store (DerefOf (Index (SACT, Local0)), Local3)
                            If (LEqual (Local3, Local1))
                            {
                                Store (Local0, CIDX)
                                Store (SizeOf (SACT), Local0)
                            }
                            Else
                            {
                                Increment (Local0)
                            }
                        }

                        Store (CIDX, Local0)
                        While (LLess (Local0, SizeOf (SACT)))
                        {
                            Increment (Local0)
                            If (LEqual (Local0, SizeOf (SACT)))
                            {
                                Store (Zero, Local0)
                            }

                            Store (DerefOf (Index (SACT, Local0)), Local3)
                            If (LEqual (And (Local3, Local2), Local3))
                            {
                                Store (Local0, NXTD)
                                Store (SizeOf (SACT), Local0)
                            }
                        }

                        If (LEqual (NXTD, SizeOf (SACT)))
                        {
                            Store (Zero, SSDP)
                        }
                        Else
                        {
                            Store (NXTD, Local0)
                            Store (DerefOf (Index (SACT, Local0)), Local3)
                            And (SSDP, 0xFFFFFFF4, SSDP)
                            Or (SSDP, Local3, SSDP)
                        }

                        Store (0x04, SSZE)
                        Store (SSDP, P80H)
                        Return (ATIB)
                    }

                    Method (AFN0, 0, Serialized)
                    {
                        If (And (MSKN, One))
                        {
                            CreateBitField (PSBR, Zero, PDSW)
                            Store (One, PDSW)
                            Notify (VGA, 0x81)
                        }
                    }

                    Method (AFN3, 2, Serialized)
                    {
                        If (And (MSKN, 0x08))
                        {
                            Store (Arg0, Local0)
                            Store (Local0, SFPI)
                            Store (Arg1, Local0)
                            Store (And (Local0, 0x03, Local0), SFPG)
                            CreateBitField (PSBR, 0x03, PFPS)
                            Store (One, PFPS)
                            Notify (VGA, 0x81)
                        }
                    }

                    Method (AFN4, 1, Serialized)
                    {
                        If (And (MSKN, 0x10))
                        {
                            Store (Arg0, Local0)
                            Store (SSPS, Local1)
                            Store (Local0, SSPS)
                            If (LEqual (Local0, Local1)) {}
                            Else
                            {
                                CreateBitField (PSBR, 0x04, PSPS)
                                Store (One, PSPS)
                                Notify (VGA, 0x81)
                            }
                        }
                    }

                    Method (AFN5, 0, Serialized)
                    {
                        If (And (MSKN, 0x20))
                        {
                            CreateBitField (PSBR, 0x05, PDCC)
                            Store (One, PDCC)
                            Notify (VGA, 0x81)
                        }
                    }

                    Method (AFN6, 0, Serialized)
                    {
                        If (And (MSKN, 0x40))
                        {
                            CreateBitField (PSBR, 0x06, PXPS)
                            Store (One, PXPS)
                            Notify (VGA, 0x81)
                        }
                    }

                    Method (AFN7, 1, Serialized)
                    {
                        If (And (MSKN, 0x80))
                        {
                            CreateBitField (PSBR, 0x07, PBRT)
                            Store (One, PBRT)
                            CreateByteField (ATIB, 0x0C, BRTL)
                            Store (Arg0, BRTL)
                            Notify (VGA, 0x81)
                        }
                    }

                    Method (AF15, 0, NotSerialized)
                    {
                        Store (0xFF, P80H)
                        CreateWordField (ATIB, Zero, DNUM)
                        CreateWordField (ATIB, 0x02, DSZE)
                        CreateDWordField (ATIB, 0x04, FLAG)
                        CreateWordField (ATIB, 0x08, BUSN)
                        CreateWordField (ATIB, 0x0A, DEVN)
                        Store (0x08, DSZE)
                        Store (One, DNUM)
                        Store (0x04, FLAG)
                        Store (Zero, BUSN)
                        Store (One, DEVN)
                        Return (ATIB)
                    }

                    Name (AT00, Buffer (0xFF) {})
                    Name (AT01, Buffer (0x03) {})
                    Method (ATCS, 2, Serialized)
                    {
                        If (LEqual (Arg0, Zero))
                        {
                            ATC0 ()
                        }

                        If (LEqual (Arg0, One))
                        {
                            ATC1 ()
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            ATC2 (Arg1)
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            ATC3 ()
                        }

                        If (LEqual (Arg0, 0x04))
                        {
                            ATC4 (Arg1)
                        }

                        Return (AT00)
                    }

                    Method (ATC0, 0, NotSerialized)
                    {
                        CreateWordField (AT00, Zero, SZZE)
                        CreateWordField (AT00, 0x02, INTF)
                        CreateDWordField (AT00, 0x04, SUPP)
                        Store (0x08, SZZE)
                        Store (One, INTF)
                        Store (0x0F, SUPP)
                    }

                    Method (ATC1, 0, Serialized)
                    {
                        CreateWordField (AT00, Zero, SZZE)
                        CreateDWordField (AT00, 0x02, VFMK)
                        CreateDWordField (AT00, 0x06, FLAG)
                        CreateField (AT00, 0x30, One, DOCK)
                        Store (0x0A, SZZE)
                        Store (One, VFMK)
                        Store (Zero, FLAG)
                        Store (One, DOCK)
                    }

                    Method (ATC2, 1, Serialized)
                    {
                        CreateField (Arg0, 0x10, 0x03, FUCC)
                        CreateField (Arg0, 0x13, 0x06, DEVV)
                        CreateByteField (Arg0, 0x03, BUSS)
                        CreateDWordField (Arg0, 0x04, VFMK)
                        CreateDWordField (Arg0, 0x06, FLAG)
                        CreateField (Arg0, 0x30, One, ADVC)
                        CreateField (Arg0, 0x31, One, WFCM)
                        CreateByteField (Arg0, 0x08, RQST)
                        CreateByteField (Arg0, 0x09, PFRQ)
                        CreateWordField (AT00, Zero, SZZE)
                        CreateByteField (AT00, 0x02, RETV)
                        Store (0x03, SZZE)
                        Store (One, RETV)
                        Store (ALIB (0x02, Arg0), AT00)
                    }

                    Method (ATC3, 0, Serialized)
                    {
                        CreateWordField (AT00, Zero, SZZE)
                        CreateByteField (AT00, 0x02, RETV)
                        CreateWordField (AT01, Zero, SZZB)
                        CreateByteField (AT01, 0x02, PSPP)
                        Store (0x03, SZZE)
                        Store (One, RETV)
                        Store (0x03, SZZB)
                        Store (One, PSPP)
                        Store (ALIB (0x03, AT01), AT00)
                    }

                    Method (ATC4, 1, Serialized)
                    {
                        CreateField (Arg0, 0x10, 0x03, FUCC)
                        CreateField (Arg0, 0x13, 0x06, DEVV)
                        CreateByteField (Arg0, 0x03, BUSS)
                        CreateByteField (Arg0, 0x04, NULN)
                        CreateWordField (AT00, Zero, SZZE)
                        CreateByteField (AT00, 0x02, NULM)
                        Store (0x03, SZZE)
                        Store (One, NULM)
                        Store (ALIB (0x04, Arg0), AT00)
                    }
                }

                Device (HDAU)
                {
                    Name (_ADR, One)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0x50)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        Offset (0x2C), 
                        SVID,   32, 
                        Offset (0x4C), 
                        SMID,   32
                    }
                }
            }

            Device (PB4)
            {
                Name (_ADR, 0x00040000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If (LEqual (WKPM, One))
                    {
                        Return (GPRW (0x08, 0x03))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }

                Name (PR04, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }
                })
                Name (AR04, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR04)
                    }

                    Return (PR04)
                }

                OperationRegion (XPEX, SystemMemory, 0xF8020100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x18), 
                        ,   3, 
                    PDC8,   1, 
                        ,   2, 
                    PDS8,   1, 
                    Offset (0x19), 
                    HPC8,   1, 
                    Offset (0x1A), 
                        ,   3, 
                    PDC2,   1, 
                        ,   2, 
                    PDS2,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                OperationRegion (PCFG, PCI_Config, Zero, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    If (And (VC0S, 0x00020000))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Mutex (XPPM, 0x00)
                Method (XPRD, 1, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    Store (Arg0, XPIR)
                    Store (XPID, Local0)
                    Store (Zero, XPIR)
                    Release (XPPM)
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    Store (Arg0, XPIR)
                    Store (Arg1, XPID)
                    Store (Zero, XPIR)
                    Release (XPPM)
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Store (XPRD (0xA2), Local0)
                    And (Local0, 0xFFFFFFF8, Local0)
                    ShiftRight (Local0, 0x04, Local1)
                    And (Local1, 0x07, Local1)
                    Or (Local0, Local1, Local0)
                    Or (Local0, 0x0100, Local0)
                    XPWR (0xA2, Local0)
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Store (LKCN, Local0)
                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    Or (Local0, 0x20, Local0)
                    Store (Local0, LKCN)
                    Store (0x64, Local1)
                    Store (One, Local2)
                    While (LAnd (Local1, Local2))
                    {
                        Sleep (One)
                        Store (LKST, Local3)
                        If (And (Local3, 0x0800))
                        {
                            Decrement (Local1)
                        }
                        Else
                        {
                            Store (Zero, Local2)
                        }
                    }

                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    If (LNot (Local2))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Store (_ADR, Local0)
                    Store (ShiftRight (Local0, 0x10), Local1)
                    Store (ShiftLeft (Local1, 0x03), Local1)
                    Store (And (Local0, 0x0F), Local2)
                    Store (Or (Local1, Local2), Local3)
                    Return (Local3)
                }

                Method (XPPR, 1, NotSerialized)
                {
                    Name (HPOK, Zero)
                    Store (Zero, HPOK)
                    Store (ShiftLeft (XPPB (), 0x03), Local0)
                    If (Arg0)
                    {
                        XPLL (Local0, One)
                        XPLP (Local0, One)
                        Sleep (0xC8)
                        XPTR (Local0, One)
                        Store (0x0F, Local5)
                        While (LAnd (LNot (HPOK), LGreater (Local5, Zero)))
                        {
                            Store (One, PDC2)
                            Store (0x28, Local1)
                            While (LAnd (LNot (HPOK), LGreater (Local1, Zero)))
                            {
                                Store (XPRD (0xA5), Local2)
                                If (LEqual (And (Local2, 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LGreaterEqual (And (Local2, 0xFF), 0x04))
                                {
                                    Store (One, HPOK)
                                }

                                Decrement (Local1)
                            }

                            If (HPOK)
                            {
                                Store (And (XPRD (0xA5), 0xFF), Local2)
                                Store (And (ShiftRight (XPRD (0xA2), 0x04), 0x07), Local3)
                                If (LAnd (LEqual (Local2, 0x06), LAnd (LGreater (Local3, One), LLess (
                                    Local3, 0x05))))
                                {
                                    Store (Zero, HPOK)
                                }
                            }

                            If (HPOK)
                            {
                                Store (0x07D0, Local1)
                                Store (Zero, HPOK)
                                While (LAnd (LNot (HPOK), Local1))
                                {
                                    Store (And (XPRD (0xA5), 0xFF), Local2)
                                    If (LEqual (Local2, 0x07))
                                    {
                                        Store (One, Local1)
                                        Store (XPDL (), Local4)
                                        If (Local4)
                                        {
                                            XPRT ()
                                            Decrement (Local5)
                                        }
                                    }

                                    If (LEqual (Local2, 0x10))
                                    {
                                        Store (One, HPOK)
                                    }

                                    Sleep (One)
                                    Decrement (Local1)
                                }
                            }
                        }
                    }

                    If (HPOK)
                    {
                        XPTR (Local0, Zero)
                        XPLP (Local0, Zero)
                        XPLL (Local0, Zero)
                    }

                    Return (Ones)
                }

                Device (XPDV)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0x08)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32
                    }
                }
            }

            Device (PB5)
            {
                Name (_ADR, 0x00050000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If (LEqual (WKPM, One))
                    {
                        Return (GPRW (0x08, 0x05))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }

                Name (PR05, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKA, 
                        Zero
                    }
                })
                Name (AR05, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x10
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR05)
                    }

                    Return (PR05)
                }

                OperationRegion (XPEX, SystemMemory, 0xF8028100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x18), 
                        ,   3, 
                    PDC8,   1, 
                        ,   2, 
                    PDS8,   1, 
                    Offset (0x19), 
                    HPC8,   1, 
                    Offset (0x1A), 
                        ,   3, 
                    PDC2,   1, 
                        ,   2, 
                    PDS2,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                OperationRegion (PCFG, PCI_Config, Zero, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    If (And (VC0S, 0x00020000))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Mutex (XPPM, 0x00)
                Method (XPRD, 1, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    Store (Arg0, XPIR)
                    Store (XPID, Local0)
                    Store (Zero, XPIR)
                    Release (XPPM)
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    Store (Arg0, XPIR)
                    Store (Arg1, XPID)
                    Store (Zero, XPIR)
                    Release (XPPM)
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Store (XPRD (0xA2), Local0)
                    And (Local0, 0xFFFFFFF8, Local0)
                    ShiftRight (Local0, 0x04, Local1)
                    And (Local1, 0x07, Local1)
                    Or (Local0, Local1, Local0)
                    Or (Local0, 0x0100, Local0)
                    XPWR (0xA2, Local0)
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Store (LKCN, Local0)
                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    Or (Local0, 0x20, Local0)
                    Store (Local0, LKCN)
                    Store (0x64, Local1)
                    Store (One, Local2)
                    While (LAnd (Local1, Local2))
                    {
                        Sleep (One)
                        Store (LKST, Local3)
                        If (And (Local3, 0x0800))
                        {
                            Decrement (Local1)
                        }
                        Else
                        {
                            Store (Zero, Local2)
                        }
                    }

                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    If (LNot (Local2))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Store (_ADR, Local0)
                    Store (ShiftRight (Local0, 0x10), Local1)
                    Store (ShiftLeft (Local1, 0x03), Local1)
                    Store (And (Local0, 0x0F), Local2)
                    Store (Or (Local1, Local2), Local3)
                    Return (Local3)
                }

                Method (XPPR, 1, NotSerialized)
                {
                    Name (HPOK, Zero)
                    Store (Zero, HPOK)
                    Store (ShiftLeft (XPPB (), 0x03), Local0)
                    If (Arg0)
                    {
                        XPLL (Local0, One)
                        XPLP (Local0, One)
                        Sleep (0xC8)
                        XPTR (Local0, One)
                        Store (0x0F, Local5)
                        While (LAnd (LNot (HPOK), LGreater (Local5, Zero)))
                        {
                            Store (One, PDC2)
                            Store (0x28, Local1)
                            While (LAnd (LNot (HPOK), LGreater (Local1, Zero)))
                            {
                                Store (XPRD (0xA5), Local2)
                                If (LEqual (And (Local2, 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LGreaterEqual (And (Local2, 0xFF), 0x04))
                                {
                                    Store (One, HPOK)
                                }

                                Decrement (Local1)
                            }

                            If (HPOK)
                            {
                                Store (And (XPRD (0xA5), 0xFF), Local2)
                                Store (And (ShiftRight (XPRD (0xA2), 0x04), 0x07), Local3)
                                If (LAnd (LEqual (Local2, 0x06), LAnd (LGreater (Local3, One), LLess (
                                    Local3, 0x05))))
                                {
                                    Store (Zero, HPOK)
                                }
                            }

                            If (HPOK)
                            {
                                Store (0x07D0, Local1)
                                Store (Zero, HPOK)
                                While (LAnd (LNot (HPOK), Local1))
                                {
                                    Store (And (XPRD (0xA5), 0xFF), Local2)
                                    If (LEqual (Local2, 0x07))
                                    {
                                        Store (One, Local1)
                                        Store (XPDL (), Local4)
                                        If (Local4)
                                        {
                                            XPRT ()
                                            Decrement (Local5)
                                        }
                                    }

                                    If (LEqual (Local2, 0x10))
                                    {
                                        Store (One, HPOK)
                                    }

                                    Sleep (One)
                                    Decrement (Local1)
                                }
                            }
                        }
                    }

                    If (HPOK)
                    {
                        XPTR (Local0, Zero)
                        XPLP (Local0, Zero)
                        XPLL (Local0, Zero)
                    }

                    Return (Ones)
                }

                Device (XPDV)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0x08)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32
                    }
                }
            }

            Device (PB6)
            {
                Name (_ADR, 0x00060000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If (LEqual (WKPM, One))
                    {
                        Return (GPRW (0x08, 0x05))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }

                Name (PR06, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKB, 
                        Zero
                    }
                })
                Name (AR06, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x11
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR06)
                    }

                    Return (PR06)
                }

                OperationRegion (XPEX, SystemMemory, 0xF9030100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x18), 
                        ,   3, 
                    PDC8,   1, 
                        ,   2, 
                    PDS8,   1, 
                    Offset (0x19), 
                    HPC8,   1, 
                    Offset (0x1A), 
                        ,   3, 
                    PDC2,   1, 
                        ,   2, 
                    PDS2,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                OperationRegion (PCFG, PCI_Config, Zero, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    If (And (VC0S, 0x00020000))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Mutex (XPPM, 0x00)
                Method (XPRD, 1, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    Store (Arg0, XPIR)
                    Store (XPID, Local0)
                    Store (Zero, XPIR)
                    Release (XPPM)
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    Store (Arg0, XPIR)
                    Store (Arg1, XPID)
                    Store (Zero, XPIR)
                    Release (XPPM)
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Store (XPRD (0xA2), Local0)
                    And (Local0, 0xFFFFFFF8, Local0)
                    ShiftRight (Local0, 0x04, Local1)
                    And (Local1, 0x07, Local1)
                    Or (Local0, Local1, Local0)
                    Or (Local0, 0x0100, Local0)
                    XPWR (0xA2, Local0)
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Store (LKCN, Local0)
                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    Or (Local0, 0x20, Local0)
                    Store (Local0, LKCN)
                    Store (0x64, Local1)
                    Store (One, Local2)
                    While (LAnd (Local1, Local2))
                    {
                        Sleep (One)
                        Store (LKST, Local3)
                        If (And (Local3, 0x0800))
                        {
                            Decrement (Local1)
                        }
                        Else
                        {
                            Store (Zero, Local2)
                        }
                    }

                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    If (LNot (Local2))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Store (_ADR, Local0)
                    Store (ShiftRight (Local0, 0x10), Local1)
                    Store (ShiftLeft (Local1, 0x03), Local1)
                    Store (And (Local0, 0x0F), Local2)
                    Store (Or (Local1, Local2), Local3)
                    Return (Local3)
                }

                Method (XPPR, 1, NotSerialized)
                {
                    Name (HPOK, Zero)
                    Store (Zero, HPOK)
                    Store (ShiftLeft (XPPB (), 0x03), Local0)
                    If (Arg0)
                    {
                        XPLL (Local0, One)
                        XPLP (Local0, One)
                        Sleep (0xC8)
                        XPTR (Local0, One)
                        Store (0x0F, Local5)
                        While (LAnd (LNot (HPOK), LGreater (Local5, Zero)))
                        {
                            Store (One, PDC2)
                            Store (0x28, Local1)
                            While (LAnd (LNot (HPOK), LGreater (Local1, Zero)))
                            {
                                Store (XPRD (0xA5), Local2)
                                If (LEqual (And (Local2, 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LGreaterEqual (And (Local2, 0xFF), 0x04))
                                {
                                    Store (One, HPOK)
                                }

                                Decrement (Local1)
                            }

                            If (HPOK)
                            {
                                Store (And (XPRD (0xA5), 0xFF), Local2)
                                Store (And (ShiftRight (XPRD (0xA2), 0x04), 0x07), Local3)
                                If (LAnd (LEqual (Local2, 0x06), LAnd (LGreater (Local3, One), LLess (
                                    Local3, 0x05))))
                                {
                                    Store (Zero, HPOK)
                                }
                            }

                            If (HPOK)
                            {
                                Store (0x07D0, Local1)
                                Store (Zero, HPOK)
                                While (LAnd (LNot (HPOK), Local1))
                                {
                                    Store (And (XPRD (0xA5), 0xFF), Local2)
                                    If (LEqual (Local2, 0x07))
                                    {
                                        Store (One, Local1)
                                        Store (XPDL (), Local4)
                                        If (Local4)
                                        {
                                            XPRT ()
                                            Decrement (Local5)
                                        }
                                    }

                                    If (LEqual (Local2, 0x10))
                                    {
                                        Store (One, HPOK)
                                    }

                                    Sleep (One)
                                    Decrement (Local1)
                                }
                            }
                        }
                    }

                    If (HPOK)
                    {
                        XPTR (Local0, Zero)
                        XPLP (Local0, Zero)
                        XPLL (Local0, Zero)
                    }

                    Return (Ones)
                }

                Device (XPDV)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0xFF)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32, 
                        Offset (0xCA), 
                        RGCA,   8, 
                        DISF,   8, 
                        FIFO,   8
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x09)
                    }
                }

                Device (XPD3)
                {
                    Name (_ADR, 0x03)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0xFF)
                    Field (PCFG, ByteAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32, 
                        Offset (0xAC), 
                        VDID,   32, 
                        Offset (0xE1), 
                        MISC,   8, 
                        Offset (0xFD), 
                        PLLM,   8
                    }
                }
            }

            Device (PB7)
            {
                Name (_ADR, 0x00070000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If (LEqual (WKPM, One))
                    {
                        Return (GPRW (0x08, 0x05))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }

                Name (PR07, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKC, 
                        Zero
                    }
                })
                Name (AR07, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x12
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR07)
                    }

                    Return (PR07)
                }

                OperationRegion (XPEX, SystemMemory, 0xF8038100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x18), 
                        ,   3, 
                    PDC8,   1, 
                        ,   2, 
                    PDS8,   1, 
                    Offset (0x19), 
                    HPC8,   1, 
                    Offset (0x1A), 
                        ,   3, 
                    PDC2,   1, 
                        ,   2, 
                    PDS2,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                OperationRegion (PCFG, PCI_Config, Zero, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    If (And (VC0S, 0x00020000))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Mutex (XPPM, 0x00)
                Method (XPRD, 1, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    Store (Arg0, XPIR)
                    Store (XPID, Local0)
                    Store (Zero, XPIR)
                    Release (XPPM)
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    Acquire (XPPM, 0xFFFF)
                    Store (Arg0, XPIR)
                    Store (Arg1, XPID)
                    Store (Zero, XPIR)
                    Release (XPPM)
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Store (XPRD (0xA2), Local0)
                    And (Local0, 0xFFFFFFF8, Local0)
                    ShiftRight (Local0, 0x04, Local1)
                    And (Local1, 0x07, Local1)
                    Or (Local0, Local1, Local0)
                    Or (Local0, 0x0100, Local0)
                    XPWR (0xA2, Local0)
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Store (LKCN, Local0)
                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    Or (Local0, 0x20, Local0)
                    Store (Local0, LKCN)
                    Store (0x64, Local1)
                    Store (One, Local2)
                    While (LAnd (Local1, Local2))
                    {
                        Sleep (One)
                        Store (LKST, Local3)
                        If (And (Local3, 0x0800))
                        {
                            Decrement (Local1)
                        }
                        Else
                        {
                            Store (Zero, Local2)
                        }
                    }

                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN)
                    If (LNot (Local2))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Store (_ADR, Local0)
                    Store (ShiftRight (Local0, 0x10), Local1)
                    Store (ShiftLeft (Local1, 0x03), Local1)
                    Store (And (Local0, 0x0F), Local2)
                    Store (Or (Local1, Local2), Local3)
                    Return (Local3)
                }

                Method (XPPR, 1, NotSerialized)
                {
                    Name (HPOK, Zero)
                    Store (Zero, HPOK)
                    Store (ShiftLeft (XPPB (), 0x03), Local0)
                    If (Arg0)
                    {
                        XPLL (Local0, One)
                        XPLP (Local0, One)
                        Sleep (0xC8)
                        XPTR (Local0, One)
                        Store (0x0F, Local5)
                        While (LAnd (LNot (HPOK), LGreater (Local5, Zero)))
                        {
                            Store (One, PDC2)
                            Store (0x28, Local1)
                            While (LAnd (LNot (HPOK), LGreater (Local1, Zero)))
                            {
                                Store (XPRD (0xA5), Local2)
                                If (LEqual (And (Local2, 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LEqual (And (ShiftRight (Local2, 0x08), 0xFF), 0x3F))
                                {
                                    Store (One, Local1)
                                }

                                If (LGreaterEqual (And (Local2, 0xFF), 0x04))
                                {
                                    Store (One, HPOK)
                                }

                                Decrement (Local1)
                            }

                            If (HPOK)
                            {
                                Store (And (XPRD (0xA5), 0xFF), Local2)
                                Store (And (ShiftRight (XPRD (0xA2), 0x04), 0x07), Local3)
                                If (LAnd (LEqual (Local2, 0x06), LAnd (LGreater (Local3, One), LLess (
                                    Local3, 0x05))))
                                {
                                    Store (Zero, HPOK)
                                }
                            }

                            If (HPOK)
                            {
                                Store (0x07D0, Local1)
                                Store (Zero, HPOK)
                                While (LAnd (LNot (HPOK), Local1))
                                {
                                    Store (And (XPRD (0xA5), 0xFF), Local2)
                                    If (LEqual (Local2, 0x07))
                                    {
                                        Store (One, Local1)
                                        Store (XPDL (), Local4)
                                        If (Local4)
                                        {
                                            XPRT ()
                                            Decrement (Local5)
                                        }
                                    }

                                    If (LEqual (Local2, 0x10))
                                    {
                                        Store (One, HPOK)
                                    }

                                    Sleep (One)
                                    Decrement (Local1)
                                }
                            }
                        }
                    }

                    If (HPOK)
                    {
                        XPTR (Local0, Zero)
                        XPLP (Local0, Zero)
                        XPLL (Local0, Zero)
                    }

                    Return (Ones)
                }

                Device (XPDV)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0x08)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32
                    }
                }
            }

            Device (SPB0)
            {
                Name (_ADR, 0x00150000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Name (PR0A, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }
                })
                Name (AR0A, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR0A)
                    }

                    Return (PR0A)
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Store (_ADR, Local0)
                    Store (ShiftRight (Local0, 0x10), Local1)
                    Store (ShiftLeft (Local1, 0x03), Local2)
                    Store (And (Local0, 0x0F), Local1)
                    Store (Or (Local1, Local2), Local3)
                    Return (Local3)
                }

                OperationRegion (PCFG, PCI_Config, Zero, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                Device (XPDV)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0x08)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32
                    }
                }
            }

            Device (SPB1)
            {
                Name (_ADR, 0x00150001)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Name (PR0B, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKA, 
                        Zero
                    }
                })
                Name (AR0B, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x10
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR0B)
                    }

                    Return (PR0B)
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Store (_ADR, Local0)
                    Store (ShiftRight (Local0, 0x10), Local1)
                    Store (ShiftLeft (Local1, 0x03), Local2)
                    Store (And (Local0, 0x0F), Local1)
                    Store (Or (Local1, Local2), Local3)
                    Return (Local3)
                }

                OperationRegion (PCFG, PCI_Config, Zero, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                Device (XPDV)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0x08)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32
                    }
                }
            }

            Device (SPB2)
            {
                Name (_ADR, 0x00150002)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Name (PR0C, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKB, 
                        Zero
                    }
                })
                Name (AR0C, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x11
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR0C)
                    }

                    Return (PR0C)
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Store (_ADR, Local0)
                    Store (ShiftRight (Local0, 0x10), Local1)
                    Store (ShiftLeft (Local1, 0x03), Local2)
                    Store (And (Local0, 0x0F), Local1)
                    Store (Or (Local1, Local2), Local3)
                    Return (Local3)
                }

                OperationRegion (PCFG, PCI_Config, Zero, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                Device (XPDV)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0x08)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32
                    }
                }
            }

            Device (SPB3)
            {
                Name (_ADR, 0x00150003)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Name (PR0D, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKC, 
                        Zero
                    }
                })
                Name (AR0D, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x12
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR0D)
                    }

                    Return (PR0D)
                }

                OperationRegion (PCFG, PCI_Config, Zero, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                Device (XPDV)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, Zero, 0x08)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32
                    }
                }
            }

            Device (HPET)
            {
                Name (_HID, EisaId ("PNP0103"))  // _HID: Hardware ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (LEqual (And (HPAD, 0x03), 0x03))
                    {
                        If (LGreaterEqual (OSTB, 0x40))
                        {
                            Return (0x0F)
                        }

                        Store (And (HPAD, 0xFFFFFFE0), HPAD)
                        Return (One)
                    }

                    Return (One)
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Name (BUF0, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {0}
                        IRQNoFlags ()
                            {8}
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            _Y04)
                    })
                    CreateDWordField (BUF0, \_SB.PCI0.HPET._CRS._Y04._BAS, HPEB)  // _BAS: Base Address
                    Store (HPAD, Local0)
                    And (Local0, 0xFFFFFC00, HPEB)
                    Return (BUF0)
                }
            }

            Device (AZAL)
            {
                Name (_ADR, 0x00140002)  // _ADR: Address
                OperationRegion (PCI, PCI_Config, Zero, 0x0100)
                Field (PCI, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x42), 
                    DNSP,   1, 
                    DNSO,   1, 
                    ENSR,   1
                }
            }

            Device (GEC)
            {
                Name (_ADR, 0x00140006)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x1A, 
                    0x04
                })
            }

            Device (OHC1)
            {
                Name (_ADR, 0x00120000)  // _ADR: Address
                OperationRegion (O1CS, PCI_Config, 0xC4, 0x04)
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x04))
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)  // _S4D: S4 Device State
                {
                    Return (0x02)
                }
            }

            Device (OHC2)
            {
                Name (_ADR, 0x00130000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x04))
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)  // _S4D: S4 Device State
                {
                    Return (0x02)
                }
            }

            Device (OHC3)
            {
                Name (_ADR, 0x00160000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x04))
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)  // _S4D: S4 Device State
                {
                    Return (0x02)
                }
            }

            Device (OHC4)
            {
                Name (_ADR, 0x00140005)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x04))
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)  // _S4D: S4 Device State
                {
                    Return (0x02)
                }
            }

            Device (EHC1)
            {
                Name (_ADR, 0x00120002)  // _ADR: Address
                OperationRegion (PCFG, PCI_Config, 0xA0, 0x04)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    OSOW,   32
                }

                Method (STOS, 0, NotSerialized)
                {
                    Or (OSOW, 0x01000000, OSOW)
                }
            }

            Device (EHC2)
            {
                Name (_ADR, 0x00130002)  // _ADR: Address
                OperationRegion (PCFG, PCI_Config, 0xA0, 0x04)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    OSOW,   32
                }

                Method (STOS, 0, NotSerialized)
                {
                    Or (OSOW, 0x01000000, OSOW)
                }
            }

            Device (EHC3)
            {
                Name (_ADR, 0x00160002)  // _ADR: Address
                OperationRegion (PCFG, PCI_Config, 0xA0, 0x04)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    OSOW,   32
                }

                Method (STOS, 0, NotSerialized)
                {
                    Or (OSOW, 0x01000000, OSOW)
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x04))
                }
            }

            Device (XHC0)
            {
                Name (_ADR, 0x00100000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x04))
                }
            }

            Device (XHC1)
            {
                Name (_ADR, 0x00100001)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x18, 0x04))
                }
            }

            Device (SMBS)
            {
                Name (_ADR, 0x00140000)  // _ADR: Address
                OperationRegion (IRQF, PCI_Config, Zero, 0x0100)
                Field (IRQF, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x08), 
                    RVID,   8
                }

                OperationRegion (ERMM, SystemMemory, MMSO, 0x1000)
                Field (ERMM, AnyAcc, NoLock, Preserve)
                {
                    Offset (0xFF), 
                        ,   5, 
                    E000,   1, 
                    O000,   1, 
                    I000,   1, 
                        ,   5, 
                    E001,   1, 
                    O001,   1, 
                    I001,   1, 
                    Offset (0x105), 
                        ,   5, 
                    E006,   1, 
                    O006,   1, 
                    I006,   1, 
                        ,   5, 
                    E007,   1, 
                    O007,   1, 
                    I007,   1, 
                    Offset (0x10A), 
                        ,   5, 
                    E011,   1, 
                    O011,   1, 
                    I011,   1, 
                        ,   5, 
                    E012,   1, 
                    O012,   1, 
                    I012,   1, 
                        ,   5, 
                    E013,   1, 
                    O013,   1, 
                    I013,   1, 
                        ,   5, 
                    E014,   1, 
                    O014,   1, 
                    I014,   1, 
                        ,   5, 
                    E015,   1, 
                    O015,   1, 
                    I015,   1, 
                        ,   5, 
                    E016,   1, 
                    O016,   1, 
                    I016,   1, 
                    Offset (0x113), 
                        ,   5, 
                    E020,   1, 
                    O020,   1, 
                    I020,   1, 
                        ,   5, 
                    E021,   1, 
                    O021,   1, 
                    I021,   1, 
                        ,   5, 
                    E022,   1, 
                    O022,   1, 
                    I022,   1, 
                        ,   5, 
                    E023,   1, 
                    O023,   1, 
                    I023,   1, 
                        ,   5, 
                    E024,   1, 
                    O024,   1, 
                    I024,   1, 
                        ,   5, 
                    E025,   1, 
                    O025,   1, 
                    I025,   1, 
                    Offset (0x11A), 
                        ,   5, 
                    E027,   1, 
                    O027,   1, 
                    I027,   1, 
                        ,   5, 
                    E028,   1, 
                    O028,   1, 
                    I028,   1, 
                    Offset (0x11F), 
                        ,   5, 
                    E032,   1, 
                    O032,   1, 
                    I032,   1, 
                    Offset (0x122), 
                        ,   5, 
                    E035,   1, 
                    O035,   1, 
                    I035,   1, 
                    Offset (0x128), 
                        ,   1, 
                    H041,   1, 
                    S041,   1, 
                    U041,   1, 
                    D041,   1, 
                    E041,   1, 
                    O041,   1, 
                    I041,   1, 
                    Offset (0x12B), 
                        ,   5, 
                    E044,   1, 
                    O044,   1, 
                    I044,   1, 
                        ,   5, 
                    E045,   1, 
                    O045,   1, 
                    I045,   1, 
                        ,   1, 
                    H046,   1, 
                    S046,   1, 
                    U046,   1, 
                    D046,   1, 
                    E046,   1, 
                    O046,   1, 
                    I046,   1, 
                    Offset (0x132), 
                        ,   5, 
                    E051,   1, 
                    O051,   1, 
                    I051,   1, 
                    Offset (0x134), 
                        ,   5, 
                    E053,   1, 
                    O053,   1, 
                    I053,   1, 
                        ,   5, 
                    E054,   1, 
                    O054,   1, 
                    I054,   1, 
                        ,   5, 
                    E055,   1, 
                    O055,   1, 
                    I055,   1, 
                        ,   5, 
                    E056,   1, 
                    O056,   1, 
                    I056,   1, 
                        ,   5, 
                    E057,   1, 
                    O057,   1, 
                    I057,   1, 
                        ,   5, 
                    E058,   1, 
                    O058,   1, 
                    I058,   1, 
                        ,   5, 
                    E059,   1, 
                    O059,   1, 
                    I059,   1, 
                    Offset (0x13C), 
                        ,   1, 
                    H061,   1, 
                    S061,   1, 
                    U061,   1, 
                    D061,   1, 
                    E061,   1, 
                    O061,   1, 
                    I061,   1, 
                        ,   1, 
                    H062,   1, 
                    S062,   1, 
                    U062,   1, 
                    D062,   1, 
                    E062,   1, 
                    O062,   1, 
                    I062,   1, 
                        ,   1, 
                    H063,   1, 
                    S063,   1, 
                    U063,   1, 
                    D063,   1, 
                    E063,   1, 
                    O063,   1, 
                    I063,   1, 
                        ,   1, 
                    H064,   1, 
                    S064,   1, 
                    U064,   1, 
                    D064,   1, 
                    E064,   1, 
                    O064,   1, 
                    I064,   1, 
                    Offset (0x141), 
                        ,   5, 
                    E066,   1, 
                    O066,   1, 
                    I066,   1, 
                    Offset (0x162), 
                        ,   7, 
                    GE03,   1, 
                        ,   7, 
                    GE04,   1, 
                        ,   7, 
                    GE05,   1, 
                        ,   7, 
                    GE06,   1, 
                    Offset (0x16A), 
                        ,   7, 
                    GE09,   1, 
                        ,   7, 
                    GE12,   1, 
                        ,   7, 
                    GE13,   1, 
                        ,   7, 
                    GE14,   1, 
                        ,   7, 
                    GE15,   1, 
                        ,   7, 
                    GE16,   1, 
                    Offset (0x175), 
                        ,   7, 
                    GE22,   1, 
                    Offset (0x1A5), 
                        ,   5, 
                    E166,   1, 
                    O166,   1, 
                    I166,   1, 
                    Offset (0x1A9), 
                        ,   5, 
                    E170,   1, 
                    O170,   1, 
                    I170,   1, 
                        ,   5, 
                    E171,   1, 
                    O171,   1, 
                    I171,   1, 
                    Offset (0x1AE), 
                        ,   5, 
                    E175,   1, 
                    O175,   1, 
                    I175,   1, 
                        ,   5, 
                    E176,   1, 
                    O176,   1, 
                    I176,   1, 
                        ,   5, 
                    E177,   1, 
                    O177,   1, 
                    I177,   1, 
                        ,   5, 
                    E178,   1, 
                    O178,   1, 
                    I178,   1, 
                        ,   5, 
                    E179,   1, 
                    O179,   1, 
                    I179,   1, 
                        ,   5, 
                    E180,   1, 
                    O180,   1, 
                    I180,   1, 
                        ,   5, 
                    E181,   1, 
                    O181,   1, 
                    I181,   1, 
                        ,   5, 
                    E182,   1, 
                    O182,   1, 
                    I182,   1, 
                    Offset (0x1B7), 
                        ,   3, 
                    U184,   1, 
                    D184,   1, 
                    E184,   1, 
                    O184,   1, 
                    I184,   1, 
                    Offset (0x1BE), 
                        ,   5, 
                    E191,   1, 
                    O191,   1, 
                    I191,   1, 
                        ,   5, 
                    E192,   1, 
                    O192,   1, 
                    I192,   1, 
                    Offset (0x1C4), 
                        ,   5, 
                    E197,   1, 
                    O197,   1, 
                    I197,   1, 
                    Offset (0x1C6), 
                        ,   5, 
                    E199,   1, 
                    O199,   1, 
                    I199,   1, 
                        ,   5, 
                    E200,   1, 
                    O200,   1, 
                    I200,   1, 
                    Offset (0x1FF), 
                        ,   1, 
                    G01S,   1, 
                        ,   3, 
                    G05S,   1, 
                        ,   8, 
                    G14S,   1, 
                    G15S,   1, 
                    G16S,   1, 
                        ,   5, 
                    G22S,   1, 
                    G23S,   1, 
                    Offset (0x203), 
                        ,   1, 
                    G01E,   1, 
                        ,   3, 
                    G05E,   1, 
                        ,   8, 
                    G14E,   1, 
                    G15E,   1, 
                    G16E,   1, 
                        ,   5, 
                    G22E,   1, 
                    G23E,   1, 
                    Offset (0x207), 
                        ,   1, 
                    G01T,   1, 
                        ,   3, 
                    G05T,   1, 
                    G06T,   1, 
                        ,   6, 
                    G13T,   1, 
                    G14T,   1, 
                    G15T,   1, 
                    G16T,   1, 
                        ,   5, 
                    G22T,   1, 
                    G23T,   1, 
                    Offset (0x20B), 
                        ,   1, 
                    G01L,   1, 
                        ,   3, 
                    G05L,   1, 
                        ,   9, 
                    G15L,   1, 
                    G16L,   1, 
                        ,   5, 
                    G22L,   1, 
                    G23L,   1, 
                    Offset (0x287), 
                        ,   1, 
                    CLPS,   1, 
                    Offset (0x298), 
                        ,   7, 
                    G15A,   1, 
                    Offset (0x2AF), 
                        ,   2, 
                    SLPS,   2, 
                    Offset (0x32B), 
                    SM0E,   1, 
                    Offset (0x32D), 
                        ,   1, 
                    SM0S,   2, 
                    Offset (0x361), 
                        ,   6, 
                    MT3A,   1, 
                    Offset (0x376), 
                    EPNM,   1, 
                    DPPF,   1, 
                    Offset (0x3BA), 
                        ,   6, 
                    PWDE,   1, 
                    Offset (0x3BD), 
                        ,   5, 
                    ALLS,   1, 
                    Offset (0x3C7), 
                        ,   2, 
                    TFTE,   1, 
                    Offset (0x3DE), 
                    BLNK,   2, 
                    Offset (0x3EF), 
                    PHYD,   1, 
                    Offset (0x3FF), 
                    F0CT,   8, 
                    F0MS,   8, 
                    F0FQ,   8, 
                    F0LD,   8, 
                    F0MD,   8, 
                    F0MP,   8, 
                    LT0L,   8, 
                    LT0H,   8, 
                    MT0L,   8, 
                    MT0H,   8, 
                    HT0L,   8, 
                    HT0H,   8, 
                    LRG0,   8, 
                    LHC0,   8, 
                    Offset (0x40F), 
                    F1CT,   8, 
                    F1MS,   8, 
                    F1FQ,   8, 
                    F1LD,   8, 
                    F1MD,   8, 
                    F1MP,   8, 
                    LT1L,   8, 
                    LT1H,   8, 
                    MT1L,   8, 
                    MT1H,   8, 
                    HT1L,   8, 
                    HT1H,   8, 
                    LRG1,   8, 
                    LHC1,   8, 
                    Offset (0x41F), 
                    F2CT,   8, 
                    F2MS,   8, 
                    F2FQ,   8, 
                    F2LD,   8, 
                    F2MD,   8, 
                    F2MP,   8, 
                    LT2L,   8, 
                    LT2H,   8, 
                    MT2L,   8, 
                    MT2H,   8, 
                    HT2L,   8, 
                    HT2H,   8, 
                    LRG2,   8, 
                    LHC2,   8, 
                    Offset (0x42F), 
                    F3CT,   8, 
                    F3MS,   8, 
                    F3FQ,   8, 
                    F3LD,   8, 
                    F3MD,   8, 
                    F3MP,   8, 
                    LT3L,   8, 
                    LT3H,   8, 
                    MT3L,   8, 
                    MT3H,   8, 
                    HT3L,   8, 
                    HT3H,   8, 
                    LRG3,   8, 
                    LHC3,   8, 
                    Offset (0x6FF), 
                    SEC,    8, 
                    Offset (0x701), 
                    MIN,    8, 
                    Offset (0xD06), 
                    MX07,   8, 
                    Offset (0xD0E), 
                    MX15,   8, 
                    MX16,   8, 
                    Offset (0xD14), 
                    MX21,   8, 
                    MX22,   8, 
                    MX23,   8, 
                    Offset (0xD1A), 
                    MX27,   8, 
                    MX28,   8, 
                    Offset (0xD1F), 
                    MX32,   8, 
                    Offset (0xD2B), 
                    MX44,   8, 
                    Offset (0xD32), 
                    MX51,   8, 
                    Offset (0xD34), 
                    MX53,   8, 
                    Offset (0xD38), 
                    MX57,   8, 
                    MX58,   8, 
                    MX59,   8, 
                    Offset (0xD41), 
                    MX66,   8, 
                    Offset (0xD65), 
                    M102,   8, 
                    Offset (0xD6D), 
                    M110,   8, 
                    Offset (0xDA9), 
                    M170,   8, 
                    Offset (0xDAE), 
                    M175,   8, 
                    M176,   8, 
                    M177,   8, 
                    Offset (0xDB3), 
                    M180,   8, 
                    Offset (0xDB5), 
                    M182,   8, 
                    Offset (0xDC4), 
                    M197,   8, 
                    Offset (0xDC7), 
                    M200,   8, 
                    Offset (0xDFF), 
                    MS00,   8, 
                    MS01,   8, 
                    GCK4,   4, 
                    GCK5,   4, 
                    MS03,   8, 
                    MS04,   8, 
                    Offset (0xE3F), 
                    MS40,   8, 
                    Offset (0xE80), 
                        ,   2, 
                    ECES,   1
                }

                OperationRegion (ERM1, SystemMemory, MMSO, 0x1000)
                Field (ERM1, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x100), 
                        ,   5, 
                    P01E,   1, 
                    P01O,   1, 
                    P01I,   1, 
                    Offset (0x105), 
                        ,   5, 
                    P06E,   1, 
                    P06O,   1, 
                    P06I,   1, 
                        ,   5, 
                    P07E,   1, 
                    P07O,   1, 
                    P07I,   1, 
                    Offset (0x10A), 
                        ,   5, 
                    P0BE,   1, 
                    P0BO,   1, 
                    P0BI,   1, 
                        ,   5, 
                    P0CE,   1, 
                    P0CO,   1, 
                    P0CI,   1, 
                        ,   5, 
                    P0DE,   1, 
                    P0DO,   1, 
                    P0DI,   1, 
                        ,   5, 
                    P0EE,   1, 
                    P0EO,   1, 
                    P0EI,   1, 
                        ,   5, 
                    P0FE,   1, 
                    P0FO,   1, 
                    P0FI,   1, 
                        ,   5, 
                    P10E,   1, 
                    P10O,   1, 
                    P10I,   1, 
                    Offset (0x113), 
                        ,   5, 
                    P14E,   1, 
                    P14O,   1, 
                    P14I,   1, 
                        ,   5, 
                    P15E,   1, 
                    P15O,   1, 
                    P15I,   1, 
                    Offset (0x11A), 
                        ,   5, 
                    P1BE,   1, 
                    P1BO,   1, 
                    P1BI,   1, 
                    Offset (0x11F), 
                        ,   5, 
                    P20E,   1, 
                    P20O,   1, 
                    P20I,   1, 
                        ,   5, 
                    P21E,   1, 
                    P21O,   1, 
                    P21I,   1, 
                        ,   5, 
                    P22E,   1, 
                    P22O,   1, 
                    P22I,   1, 
                        ,   5, 
                    P23E,   1, 
                    P23O,   1, 
                    P23I,   1, 
                    Offset (0x128), 
                        ,   5, 
                    P29E,   1, 
                    P29O,   1, 
                    P29I,   1, 
                    Offset (0x12B), 
                        ,   5, 
                    P2CE,   1, 
                    P2CO,   1, 
                    P2CI,   1, 
                        ,   5, 
                    P2DE,   1, 
                    P2DO,   1, 
                    P2DI,   1, 
                    PO2E,   8, 
                    Offset (0x132), 
                        ,   5, 
                    P33E,   1, 
                    P33O,   1, 
                    P33I,   1, 
                    Offset (0x134), 
                        ,   5, 
                    P35E,   1, 
                    P35O,   1, 
                    P35I,   1, 
                    Offset (0x136), 
                        ,   5, 
                    P37E,   1, 
                    P37O,   1, 
                    P37I,   1, 
                    Offset (0x138), 
                        ,   5, 
                    P39E,   1, 
                    P39O,   1, 
                    P39I,   1, 
                    Offset (0x13A), 
                        ,   5, 
                    P3BE,   1, 
                    P3BO,   1, 
                    P3BI,   1, 
                    Offset (0x13C), 
                    PO3D,   8, 
                    PO3E,   8, 
                    PO3F,   8, 
                    PO40,   8, 
                    Offset (0x164), 
                        ,   7, 
                    Offset (0x165), 
                        ,   5, 
                    P66E,   1, 
                    P66O,   1, 
                    P66I,   1, 
                    Offset (0x16A), 
                    Offset (0x16B), 
                        ,   5, 
                    P6CE,   1, 
                    P6CO,   1, 
                    P6CI,   1, 
                    Offset (0x16E), 
                        ,   7, 
                    Offset (0x16F), 
                        ,   7, 
                    Offset (0x170), 
                    Offset (0x174), 
                    Offset (0x175), 
                        ,   7, 
                    Offset (0x176), 
                    Offset (0x1A5), 
                    POA6,   8, 
                    Offset (0x1A9), 
                        ,   5, 
                    PAAE,   1, 
                    PAAO,   1, 
                    PAAI,   1, 
                    Offset (0x1AE), 
                        ,   5, 
                    PAFE,   1, 
                    PAFO,   1, 
                    PAFI,   1, 
                        ,   5, 
                    PB0E,   1, 
                    PB0O,   1, 
                    PB0I,   1, 
                        ,   5, 
                    PB1E,   1, 
                    PB1O,   1, 
                    PB1I,   1, 
                        ,   5, 
                    PB2E,   1, 
                    PB2O,   1, 
                    PB2I,   1, 
                        ,   5, 
                    PB3E,   1, 
                    PB3O,   1, 
                    PB3I,   1, 
                        ,   5, 
                    PB4E,   1, 
                    PB4O,   1, 
                    PB4I,   1, 
                        ,   5, 
                    PB5E,   1, 
                    PB5O,   1, 
                    PB5I,   1, 
                        ,   5, 
                    PB6E,   1, 
                    PB6O,   1, 
                    PB6I,   1, 
                    Offset (0x1C6), 
                        ,   5, 
                    PC7E,   1, 
                    PC7O,   1, 
                    PC7I,   1, 
                        ,   5, 
                    PC8E,   1, 
                    PC8O,   1, 
                    PC8I,   1, 
                    Offset (0x207), 
                        ,   1, 
                        ,   1, 
                        ,   3, 
                        ,   1, 
                        ,   9, 
                    Offset (0x209), 
                        ,   1, 
                        ,   5, 
                        ,   1, 
                        ,   3, 
                    E26C,   1, 
                    Offset (0xD00), 
                    MX01,   8, 
                    Offset (0xD1F), 
                    Offset (0xD20), 
                    MX33,   8, 
                    MX34,   8, 
                    Offset (0xD28), 
                    MX41,   8, 
                    Offset (0xDA9), 
                    Offset (0xDB3), 
                    Offset (0xDB4), 
                    M181,   8, 
                    Offset (0xDB6), 
                    Offset (0xDC6), 
                    M199,   8, 
                    Offset (0xDFF)
                }

                Mutex (SBX0, 0x00)
                OperationRegion (SMB0, SystemIO, 0x0B00, 0x10)
                Field (SMB0, ByteAcc, NoLock, Preserve)
                {
                    HST0,   8, 
                    SLV0,   8, 
                    CNT0,   8, 
                    CMD0,   8, 
                    ADD0,   8, 
                    DT00,   8, 
                    DT10,   8, 
                    BLK0,   8
                }

                Method (WBD0, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    Store (Zero, Local2)
                    Store (HST0, Local3)
                    Store (And (Local3, 0x80), Local1)
                    While (LNotEqual (Local1, 0x80))
                    {
                        If (LLess (Local0, 0x0A))
                        {
                            Store (0x18, Local2)
                            Store (Zero, Local1)
                        }
                        Else
                        {
                            Sleep (0x0A)
                            Subtract (Local0, 0x0A, Local0)
                            Store (HST0, Local3)
                            Store (And (Local3, 0x80), Local1)
                        }
                    }

                    If (LNotEqual (Local2, 0x18))
                    {
                        Store (And (HST0, 0x1C), Local1)
                        If (Local1)
                        {
                            Store (0x07, Local2)
                        }
                    }

                    Return (Local2)
                }

                Method (WTC0, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    Store (0x07, Local2)
                    Store (One, Local1)
                    While (LEqual (Local1, One))
                    {
                        Store (And (HST0, 0x1D), Local3)
                        If (LNotEqual (Local3, Zero))
                        {
                            If (LEqual (Local3, One))
                            {
                                If (LLess (Local0, 0x0A))
                                {
                                    Store (0x18, Local2)
                                    Store (Zero, Local1)
                                }
                                Else
                                {
                                    Sleep (0x0A)
                                    Subtract (Local0, 0x0A, Local0)
                                }
                            }
                            Else
                            {
                                Store (0x07, Local2)
                                Store (Zero, Local1)
                            }
                        }
                        Else
                        {
                            Store (Zero, Local2)
                            Store (Zero, Local1)
                        }
                    }

                    Store (Or (HST0, 0x1F), HST0)
                    Return (Local2)
                }

                Method (SBR0, 3, NotSerialized)
                {
                    Store (Package (0x03)
                        {
                            0x07, 
                            Zero, 
                            Zero
                        }, Local0)
                    Store (And (Arg0, 0x5F), Local4)
                    If (LNotEqual (Local4, 0x03))
                    {
                        If (LNotEqual (Local4, 0x05))
                        {
                            If (LNotEqual (Local4, 0x07))
                            {
                                If (LNotEqual (Local4, 0x09))
                                {
                                    If (LNotEqual (Local4, 0x0B))
                                    {
                                        Store (0x19, Index (Local0, Zero))
                                        Return (Local0)
                                    }
                                }
                            }
                        }
                    }

                    If (LEqual (Acquire (SBX0, 0xFFFF), Zero))
                    {
                        Store (Or (ShiftLeft (Arg1, One), One), ADD0)
                        Store (Arg2, CMD0)
                        Store (Or (HST0, 0x1F), HST0)
                        Store (And (Arg0, 0xA0), Local1)
                        Store (Or (And (CNT0, 0x5F), Local1), CNT0)
                        If (LEqual (Local4, 0x03))
                        {
                            Store (Or (And (CNT0, 0xA0), 0x40), CNT0)
                        }

                        If (LEqual (Local4, 0x05))
                        {
                            Store (Or (And (CNT0, 0xA0), 0x44), CNT0)
                        }

                        If (LEqual (Local4, 0x07))
                        {
                            Store (Or (And (CNT0, 0xA0), 0x48), CNT0)
                        }

                        If (LEqual (Local4, 0x09))
                        {
                            Store (Or (And (CNT0, 0xA0), 0x4C), CNT0)
                        }

                        If (LEqual (Local4, 0x0B))
                        {
                            Store (Or (HST0, 0x80), HST0)
                            Store (Zero, DT00)
                            Store (Or (And (CNT0, 0xA0), 0x54), CNT0)
                        }

                        Store (WTC0 (0x03E8), Local1)
                        Store (Local1, Index (Local0, Zero))
                        If (LEqual (Local1, Zero))
                        {
                            If (LEqual (Local4, 0x05))
                            {
                                Store (One, Index (Local0, One))
                                Store (DT00, Index (Local0, 0x02))
                            }

                            If (LEqual (Local4, 0x07))
                            {
                                Store (One, Index (Local0, One))
                                Store (DT00, Index (Local0, 0x02))
                            }

                            If (LEqual (Local4, 0x09))
                            {
                                Store (0x02, Index (Local0, One))
                                Store (DT10, Local2)
                                ShiftLeft (Local2, 0x08, Local2)
                                Add (Local2, DT00, Local2)
                                Store (Local2, Index (Local0, 0x02))
                            }

                            If (LEqual (Local4, 0x0B))
                            {
                                Store (WBD0 (0x01F4), Local1)
                                If (LNotEqual (Local1, Zero))
                                {
                                    Store (Local1, Index (Local0, Zero))
                                }
                                Else
                                {
                                    Store (DT00, Index (Local0, One))
                                    Store (DT00, Local1)
                                    Store (CNT0, Local2)
                                    Store (Zero, Local2)
                                    While (LLess (Local2, Local1))
                                    {
                                        Add (0x02, Local2, Local3)
                                        Store (BLK0, Index (Local0, Local3))
                                        Add (One, Local2, Local2)
                                    }

                                    Store (Or (HST0, 0x80), HST0)
                                }
                            }
                        }

                        Store (And (CNT0, 0x5F), CNT0)
                        Release (SBX0)
                    }

                    Return (Local0)
                }

                Method (SBW0, 5, NotSerialized)
                {
                    Store (Package (0x01)
                        {
                            0x07
                        }, Local0)
                    Store (And (Arg0, 0x5F), Local4)
                    If (LNotEqual (Local4, 0x02))
                    {
                        If (LNotEqual (Local4, 0x04))
                        {
                            If (LNotEqual (Local4, 0x06))
                            {
                                If (LNotEqual (Local4, 0x08))
                                {
                                    If (LNotEqual (Local4, 0x0A))
                                    {
                                        Store (0x19, Index (Local0, Zero))
                                        Return (Local0)
                                    }
                                }
                            }
                        }
                    }

                    If (LEqual (Acquire (SBX0, 0xFFFF), Zero))
                    {
                        Store (ShiftLeft (Arg1, One), ADD0)
                        Store (Arg2, CMD0)
                        Store (Or (HST0, 0x1F), HST0)
                        Store (And (Arg0, 0xA0), Local1)
                        Store (Or (And (CNT0, 0x5F), Local1), CNT0)
                        If (LEqual (Local4, 0x02))
                        {
                            Store (Or (And (CNT0, 0xA0), 0x40), CNT0)
                        }

                        If (LEqual (Local4, 0x04))
                        {
                            Store (Or (And (CNT0, 0xA0), 0x44), CNT0)
                        }

                        If (LEqual (Local4, 0x06))
                        {
                            Store (Arg4, DT00)
                            Store (Or (And (CNT0, 0xA0), 0x48), CNT0)
                        }

                        If (LEqual (Local4, 0x08))
                        {
                            And (Arg4, 0xFF, DT00)
                            ShiftRight (Arg4, 0x08, DT10)
                            Store (Or (And (CNT0, 0xA0), 0x4C), CNT0)
                        }

                        If (LEqual (Local4, 0x0A))
                        {
                            Store (Or (HST0, 0x80), HST0)
                            Store (CNT0, Local1)
                            Store (Arg3, DT00)
                            Store (Zero, Local2)
                            While (LLess (Local2, Arg3))
                            {
                                Store (Index (Arg4, Local2), BLK0)
                                Add (One, Local2, Local2)
                            }

                            Store (Or (And (CNT0, 0xA0), 0x54), CNT0)
                        }

                        Store (WTC0 (0x03E8), Index (Local0, Zero))
                        Store (And (CNT0, 0x5F), CNT0)
                        Release (SBX0)
                    }

                    Return (Local0)
                }
            }

            Device (MSSE)
            {
                Name (_HID, "SMB0001")  // _HID: Hardware ID
                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                {
                    IO (Decode16,
                        0x0B20,             // Range Minimum
                        0x0B20,             // Range Maximum
                        0x20,               // Alignment
                        0x20,               // Length
                        )
                    IRQ (Level, ActiveLow, Shared, )
                        {7}
                })
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (LEqual (TPDF, 0x07))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
            }

            Device (LPC0)
            {
                Name (_ADR, 0x00140003)  // _ADR: Address
                Mutex (PSMX, 0x00)
                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        DMA (Compatibility, NotBusMaster, Transfer8_16, )
                            {4}
                    })
                }

                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))  // _HID: Hardware ID
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        If (LEqual (And (HPAD, 0x03), 0x03))
                        {
                            Return (BUF0)
                        }

                        Return (BUF1)
                    }
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (TMR)
                {
                    Name (_HID, EisaId ("PNP0100"))  // _HID: Hardware ID
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        If (LEqual (And (HPAD, 0x03), 0x03))
                        {
                            Return (BUF0)
                        }

                        Return (BUF1)
                    }
                }

                Device (KBC0)
                {
                    Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
                    {
                        If (_OSI ("Windows 2012"))
                        {
                            Return (0x01006636)
                        }
                        Else
                        {
                            Return (0x0303D041)
                        }
                    }

                    Name (_CID, EisaId ("PNP0303"))  // _CID: Compatible ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                }

                Device (MSSG)
                {
                    Name (_HID, EisaId ("ETD061B"))  // _HID: Hardware ID
                    Name (_CID, Package (0x02)  // _CID: Compatible ID
                    {
                        EisaId ("ETD0001"), 
                        EisaId ("PNP0F13")
                    })
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LEqual (TPDF, 0x0A))
                        {
                            Return (0x0F)
                        }

                        Return (Zero)
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                }

                Device (MSSH)
                {
                    Name (_HID, EisaId ("SYN2B20"))  // _HID: Hardware ID
                    Name (_CID, Package (0x03)  // _CID: Compatible ID
                    {
                        EisaId ("SYN2B00"), 
                        EisaId ("SYN0002"), 
                        EisaId ("PNP0F13")
                    })
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LEqual (TPDF, 0x05))
                        {
                            Return (0x0F)
                        }

                        Return (Zero)
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                }

                Device (MSSI)
                {
                    Name (_HID, EisaId ("SYN2B21"))  // _HID: Hardware ID
                    Name (_CID, Package (0x03)  // _CID: Compatible ID
                    {
                        EisaId ("SYN2B00"), 
                        EisaId ("SYN0002"), 
                        EisaId ("PNP0F13")
                    })
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LEqual (TPDF, 0x06))
                        {
                            Return (0x0F)
                        }

                        Return (Zero)
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                }

                Device (MSSX)
                {
                    Name (_HID, EisaId ("PNP0F13"))  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP0F13"))  // _CID: Compatible ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LEqual (TPDF, 0xFF))
                        {
                            Return (0x0F)
                        }

                        Return (Zero)
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                }

                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x002E,             // Range Minimum
                            0x002E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0092,             // Range Minimum
                            0x0092,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0400,             // Range Minimum
                            0x0400,             // Range Maximum
                            0x01,               // Alignment
                            0xD0,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D6,             // Range Minimum
                            0x04D6,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0680,             // Range Minimum
                            0x0680,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x077A,             // Range Minimum
                            0x077A,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C00,             // Range Minimum
                            0x0C00,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0C14,             // Range Minimum
                            0x0C14,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C50,             // Range Minimum
                            0x0C50,             // Range Maximum
                            0x01,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0C6C,             // Range Minimum
                            0x0C6C,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C6F,             // Range Minimum
                            0x0C6F,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0CD0,             // Range Minimum
                            0x0CD0,             // Range Maximum
                            0x01,               // Alignment
                            0x0C,               // Length
                            )
                        IO (Decode16,
                            0x0840,             // Range Minimum
                            0x0840,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                    })
                }

                Device (MEM)
                {
                    Name (_HID, EisaId ("PNP0C01"))  // _HID: Hardware ID
                    Name (MSRC, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0x000E0000,         // Address Base
                            0x00020000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFFF00000,         // Address Base
                            0x00100000,         // Address Length
                            _Y05)
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y05._LEN, PSIZ)  // _LEN: Length
                        CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y05._BAS, PBAS)  // _BAS: Base Address
                        Store (ROMS, PSIZ)
                        Subtract (ROMS, One, Local0)
                        Subtract (Ones, Local0, PBAS)
                        Return (MSRC)
                    }
                }

                OperationRegion (LCLM, SystemIO, 0x0C50, 0x03)
                Field (LCLM, ByteAcc, NoLock, Preserve)
                {
                    CLMI,   8, 
                    CLMD,   8, 
                    CLGP,   8
                }

                IndexField (CLMI, CLMD, ByteAcc, NoLock, Preserve)
                {
                    IDRG,   8, 
                    Offset (0x02), 
                    TSTS,   8, 
                    TINT,   8, 
                    Offset (0x12), 
                    I2CC,   8, 
                    GPIO,   8
                }

                Method (RGPM, 0, NotSerialized)
                {
                    Store (GPIO, Local0)
                    And (Local0, 0xFFFFFF3F, Local0)
                    Store (Local0, GPIO)
                    Store (CLGP, Local1)
                    Return (Local1)
                }
            }

            Device (P2P)
            {
                Name (_ADR, 0x00140004)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If (LEqual (WKPM, One))
                    {
                        Return (GPRW (0x04, 0x05))
                    }
                    Else
                    {
                        Return (GPRW (0x04, Zero))
                    }
                }

                OperationRegion (PCPC, PCI_Config, Zero, 0xFF)
                Field (PCPC, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x04), 
                    PCMD,   8, 
                    Offset (0x1C), 
                    IOW1,   8, 
                    IOW2,   8, 
                    Offset (0x48), 
                    PR48,   8, 
                    PR49,   8, 
                    PR4A,   8, 
                    PR4B,   8
                }

                Name (PR09, Package (0x08)
                {
                    Package (0x04)
                    {
                        0x0004FFFF, 
                        Zero, 
                        LNKF, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0004FFFF, 
                        One, 
                        LNKG, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0004FFFF, 
                        0x02, 
                        LNKH, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0004FFFF, 
                        0x03, 
                        LNKE, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0005FFFF, 
                        Zero, 
                        LNKE, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0005FFFF, 
                        One, 
                        LNKF, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0005FFFF, 
                        0x02, 
                        LNKG, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0x0005FFFF, 
                        0x03, 
                        LNKH, 
                        Zero
                    }
                })
                Name (AR09, Package (0x08)
                {
                    Package (0x04)
                    {
                        0x0004FFFF, 
                        Zero, 
                        Zero, 
                        0x15
                    }, 

                    Package (0x04)
                    {
                        0x0004FFFF, 
                        One, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0x0004FFFF, 
                        0x02, 
                        Zero, 
                        0x17
                    }, 

                    Package (0x04)
                    {
                        0x0004FFFF, 
                        0x03, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0x0005FFFF, 
                        Zero, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0x0005FFFF, 
                        One, 
                        Zero, 
                        0x15
                    }, 

                    Package (0x04)
                    {
                        0x0005FFFF, 
                        0x02, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0x0005FFFF, 
                        0x03, 
                        Zero, 
                        0x17
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR09)
                    }

                    Return (PR09)
                }
            }

            Device (SATA)
            {
                Name (_ADR, 0x00110000)  // _ADR: Address
                Name (B5EN, Zero)
                Name (BA_5, Zero)
                Name (SBAR, 0xF024E000)
                OperationRegion (SATX, PCI_Config, Zero, 0x44)
                Field (SATX, AnyAcc, NoLock, Preserve)
                {
                    VIDI,   32, 
                    Offset (0x0A), 
                    STCL,   16, 
                    Offset (0x24), 
                    BA05,   32, 
                    Offset (0x40), 
                    WTEN,   1, 
                    Offset (0x42), 
                    DIS0,   1, 
                    DIS1,   1, 
                    DIS2,   1, 
                    DIS3,   1, 
                    DIS4,   1, 
                    DIS5,   1
                }

                Field (SATX, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x42), 
                    DISP,   6
                }

                Method (GBAA, 0, Serialized)
                {
                    Store (BA05, BA_5)
                    If (LOr (LEqual (BA_5, Ones), LNotEqual (STCL, 0x0101)))
                    {
                        Store (Zero, B5EN)
                        Return (SBAR)
                    }
                    Else
                    {
                        Store (One, B5EN)
                        Return (BA_5)
                    }
                }

                OperationRegion (BAR5, SystemMemory, GBAA (), 0x1000)
                Field (BAR5, AnyAcc, NoLock, Preserve)
                {
                    NOPT,   5, 
                    Offset (0x0C), 
                    PTI0,   1, 
                    PTI1,   1, 
                    PTI2,   1, 
                    PTI3,   1, 
                    PTI4,   1, 
                    PTI5,   1, 
                    PTI6,   1, 
                    PTI7,   1, 
                    Offset (0x118), 
                    CST0,   1, 
                    Offset (0x120), 
                        ,   7, 
                    BSY0,   1, 
                    Offset (0x128), 
                    DET0,   4, 
                    Offset (0x129), 
                    IPM0,   4, 
                    Offset (0x12C), 
                    DDI0,   4, 
                    Offset (0x198), 
                    CST1,   1, 
                    Offset (0x1A0), 
                        ,   7, 
                    BSY1,   1, 
                    Offset (0x1A8), 
                    DET1,   4, 
                    Offset (0x1A9), 
                    IPM1,   4, 
                    Offset (0x1AC), 
                    DDI1,   4, 
                    Offset (0x218), 
                    CST2,   1, 
                    Offset (0x220), 
                        ,   7, 
                    BSY2,   1, 
                    Offset (0x228), 
                    DET2,   4, 
                    Offset (0x229), 
                    IPM2,   4, 
                    Offset (0x22C), 
                    DDI2,   4, 
                    Offset (0x298), 
                    CST3,   1, 
                    Offset (0x2A0), 
                        ,   7, 
                    BSY3,   1, 
                    Offset (0x2A8), 
                    DET3,   4, 
                    Offset (0x2A9), 
                    IPM3,   4, 
                    Offset (0x2AC), 
                    DDI3,   4, 
                    Offset (0x318), 
                    CST4,   1, 
                    Offset (0x320), 
                        ,   7, 
                    BSY4,   1, 
                    Offset (0x328), 
                    DET4,   4, 
                    Offset (0x329), 
                    IPM4,   4, 
                    Offset (0x32C), 
                    DDI4,   4, 
                    Offset (0x398), 
                    CST5,   1, 
                    Offset (0x3A0), 
                        ,   7, 
                    BSY5,   1, 
                    Offset (0x3A8), 
                    DET5,   4, 
                    Offset (0x3A9), 
                    IPM5,   4, 
                    Offset (0x3AC), 
                    DDI5,   4
                }

                Field (BAR5, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x0C), 
                    PTI,    6
                }

                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    GBAA ()
                }

                Device (PRID)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (SPTM, Buffer (0x14)
                    {
                        /* 0000 */   0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,
                        /* 0008 */   0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,
                        /* 0010 */   0x1F, 0x00, 0x00, 0x00
                    })
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Return (SPTM)
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Store (Arg0, SPTM)
                    }

                    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                    {
                        GBAA ()
                        If (LAnd (LOr (LGreaterEqual (TPOS, 0x40), LEqual (TPOS, 0x04)), 
                            B5EN))
                        {
                            If (IPM0)
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (BSY0, One), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }

                            If (IPM2)
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (BSY2, One), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }
                        }
                    }

                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            GBAA ()
                            If (LEqual (B5EN, Zero))
                            {
                                Return (Zero)
                            }

                            If (LEqual (DET0, 0x03))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Name (S12P, Zero)
                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            GBAA ()
                            If (LAnd (LAnd (LLess (TPOS, 0x40), LNotEqual (TPOS, 0x04)), 
                                B5EN))
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (BSY0, One), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                        }

                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Store (Buffer (0x07)
                                {
                                     0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            GBAA ()
                            If (LEqual (B5EN, Zero))
                            {
                                Return (Zero)
                            }

                            If (LEqual (DET2, 0x03))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Name (S12P, Zero)
                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            GBAA ()
                            If (LAnd (LAnd (LLess (TPOS, 0x40), LNotEqual (TPOS, 0x04)), 
                                B5EN))
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (BSY2, One), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                        }

                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Store (Buffer (0x07)
                                {
                                     0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Name (SPTM, Buffer (0x14)
                    {
                        /* 0000 */   0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,
                        /* 0008 */   0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,
                        /* 0010 */   0x1F, 0x00, 0x00, 0x00
                    })
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Return (SPTM)
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Store (Arg0, SPTM)
                    }

                    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                    {
                        GBAA ()
                        If (LAnd (LOr (LGreaterEqual (TPOS, 0x40), LEqual (TPOS, 0x04)), 
                            B5EN))
                        {
                            If (IPM1)
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (BSY1, One), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }

                            If (IPM3)
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (BSY3, One), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }
                        }
                    }

                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            GBAA ()
                            If (LEqual (B5EN, Zero))
                            {
                                Return (Zero)
                            }

                            If (LEqual (DET1, 0x03))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            GBAA ()
                            If (LAnd (LAnd (LLess (TPOS, 0x40), LNotEqual (TPOS, 0x04)), 
                                B5EN))
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (BSY1, One), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                        }

                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Store (Buffer (0x07)
                                {
                                     0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            GBAA ()
                            If (LEqual (B5EN, Zero))
                            {
                                Return (Zero)
                            }

                            If (LEqual (DET3, 0x03))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            GBAA ()
                            If (LAnd (LAnd (LLess (TPOS, 0x40), LNotEqual (TPOS, 0x04)), 
                                B5EN))
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (BSY3, One), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                        }

                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Store (Buffer (0x07)
                                {
                                     0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }
                }

                Method (ENP, 2, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Not (Arg1), DIS0)
                    }
                    Else
                    {
                        If (LEqual (Arg0, One))
                        {
                            Store (Not (Arg1), DIS1)
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x02))
                            {
                                Store (Not (Arg1), DIS2)
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x03))
                                {
                                    Store (Not (Arg1), DIS3)
                                }
                                Else
                                {
                                    If (LEqual (Arg0, 0x04))
                                    {
                                        Store (Not (Arg1), DIS4)
                                    }
                                    Else
                                    {
                                        If (LEqual (Arg0, 0x05))
                                        {
                                            Store (Not (Arg1), DIS5)
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Store (One, WTEN)
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Arg1, PTI0)
                    }
                    Else
                    {
                        If (LEqual (Arg0, One))
                        {
                            Store (Arg1, PTI1)
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x02))
                            {
                                Store (Arg1, PTI2)
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x03))
                                {
                                    Store (Arg1, PTI3)
                                }
                                Else
                                {
                                    If (LEqual (Arg0, 0x04))
                                    {
                                        Store (Arg1, PTI4)
                                    }
                                    Else
                                    {
                                        If (LEqual (Arg0, 0x05))
                                        {
                                            Store (Arg1, PTI5)
                                        }
                                    }
                                }
                            }
                        }
                    }

                    If (LEqual (DISP, 0x3F))
                    {
                        Store (One, PTI0)
                    }
                    Else
                    {
                        If (LAnd (DIS0, XOr (And (DISP, 0x3E), 0x3E)))
                        {
                            Store (Zero, PTI0)
                        }
                    }

                    Store (PTI, Local0)
                    Store (Zero, Local1)
                    While (Local0)
                    {
                        If (And (Local0, One))
                        {
                            Increment (Local1)
                        }

                        ShiftRight (Local0, One, Local0)
                    }

                    Store (Decrement (Local1), NOPT)
                    Store (Zero, WTEN)
                }

                Device (PRT1)
                {
                    Name (_ADR, 0x02)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LEqual (ODZC, One))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

                    Method (DIS, 0, NotSerialized)
                    {
                        ENP (One, Zero)
                    }

                    Method (ENA, 0, NotSerialized)
                    {
                        ENP (One, One)
                    }

                    Device (ODD)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                    }
                }

                Device (ODDZ)
                {
                    Name (_ADR, 0x02)  // _ADR: Address
                    Name (ODPS, Zero)
                    Name (ODDB, Zero)
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LAnd (LEqual (ODZC, One), LEqual (^^^SMBS.GE16, Zero)))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }

                    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                    {
                        Store (0xDF00, P80H)
                        If (LAnd (LEqual (ODZC, One), LEqual (^^^SMBS.GE16, Zero)))
                        {
                            If (LOr (LEqual (ODDB, One), LAnd (LEqual (ODDB, Zero), 
                                LNotEqual (IPM1, Zero))))
                            {
                                If (LOr (LEqual (VIDI, 0x78041022), LEqual (VIDI, 0x78011022)))
                                {
                                    Store (Zero, DIS1)
                                    Sleep (0x28)
                                    Store (One, ^^^SMBS.O171)
                                    Store (Zero, ^^^SMBS.E171)
                                    Sleep (0x28)
                                    Store (Zero, CST1)
                                    Sleep (One)
                                    Store (One, DDI1)
                                    Sleep (One)
                                    Store (Zero, DDI1)
                                }

                                If (LOr (LEqual (VIDI, 0x78031022), LEqual (VIDI, 0x78021022)))
                                {
                                    Store (Zero, DIS1)
                                    Sleep (0x28)
                                    Store (One, ^^^SMBS.O171)
                                    Store (Zero, ^^^SMBS.E171)
                                    Sleep (0x28)
                                    Store (Zero, CST1)
                                    Sleep (One)
                                    Store (One, DDI1)
                                    Sleep (One)
                                    Store (Zero, DDI1)
                                }
                            }
                        }

                        Store (One, ODDB)
                        Store (Zero, ODPS)
                    }

                    Name (WDSW, One)
                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                        Store (0xDF03, P80H)
                        If (LAnd (LEqual (ODZC, One), LEqual (^^^SMBS.GE16, Zero)))
                        {
                            If (LAnd (LOr (LEqual (VIDI, 0x78041022), LEqual (VIDI, 0x78011022)), WDSW))
                            {
                                Sleep (0x28)
                                Store (Zero, ^^^SMBS.O171)
                                Store (Zero, ^^^SMBS.E171)
                                Sleep (0x28)
                                Store (One, DIS1)
                            }

                            If (LOr (LEqual (VIDI, 0x78031022), LEqual (VIDI, 0x78021022)))
                            {
                                Sleep (0x28)
                                Store (Zero, ^^^SMBS.O171)
                                Store (Zero, ^^^SMBS.E171)
                                Sleep (0x28)
                                Store (One, DIS1)
                            }

                            Store (Not (^^^SMBS.GE06), ^^^SMBS.G06T)
                        }

                        Store (0x03, ODPS)
                    }

                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                    {
                        _PS3 ()
                        ^^PRT1.DIS ()
                    }

                    Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                    {
                        Return (ODPS)
                    }

                    Method (_DSW, 3, NotSerialized)  // _DSW: Device Sleep Wake
                    {
                        If (Arg0)
                        {
                            Store (One, WDSW)
                        }
                        Else
                        {
                            Store (Zero, WDSW)
                        }
                    }
                }

                Device (PRT3)
                {
                    Name (_ADR, 0x03)  // _ADR: Address
                    Device (ESAT)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                    }
                }
            }

            Device (IDE)
            {
                Name (_ADR, 0x00140001)  // _ADR: Address
                Name (UDMT, Package (0x08)
                {
                    0x78, 
                    0x5A, 
                    0x3C, 
                    0x2D, 
                    0x1E, 
                    0x14, 
                    Zero, 
                    Zero
                })
                Name (PIOT, Package (0x06)
                {
                    0x0258, 
                    0x0186, 
                    0x010E, 
                    0xB4, 
                    0x78, 
                    Zero
                })
                Name (PITR, Package (0x06)
                {
                    0x99, 
                    0x47, 
                    0x34, 
                    0x22, 
                    0x20, 
                    0x99
                })
                Name (MDMT, Package (0x04)
                {
                    0x01E0, 
                    0x96, 
                    0x78, 
                    Zero
                })
                Name (MDTR, Package (0x04)
                {
                    0x77, 
                    0x21, 
                    0x20, 
                    0xFF
                })
                OperationRegion (IDE, PCI_Config, 0x40, 0x20)
                Field (IDE, WordAcc, NoLock, Preserve)
                {
                    PPIT,   16, 
                    SPIT,   16, 
                    PMDT,   16, 
                    SMDT,   16, 
                    PPIC,   8, 
                    SPIC,   8, 
                    PPIM,   8, 
                    SPIM,   8, 
                    Offset (0x14), 
                    PUDC,   2, 
                    SUDC,   2, 
                    Offset (0x16), 
                    PUDM,   8, 
                    SUDM,   8
                }

                Method (GETT, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x0F), Local0)
                    Store (ShiftRight (Arg0, 0x04), Local1)
                    Return (Multiply (0x1E, Add (Add (Local0, One), Add (Local1, 
                        One))))
                }

                Method (GTM, 1, NotSerialized)
                {
                    CreateByteField (Arg0, Zero, PIT1)
                    CreateByteField (Arg0, One, PIT0)
                    CreateByteField (Arg0, 0x02, MDT1)
                    CreateByteField (Arg0, 0x03, MDT0)
                    CreateByteField (Arg0, 0x04, PICX)
                    CreateByteField (Arg0, 0x05, UDCX)
                    CreateByteField (Arg0, 0x06, UDMX)
                    Name (BUF, Buffer (0x14)
                    {
                        /* 0000 */   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
                        /* 0008 */   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
                        /* 0010 */   0x00, 0x00, 0x00, 0x00
                    })
                    CreateDWordField (BUF, Zero, PIO0)
                    CreateDWordField (BUF, 0x04, DMA0)
                    CreateDWordField (BUF, 0x08, PIO1)
                    CreateDWordField (BUF, 0x0C, DMA1)
                    CreateDWordField (BUF, 0x10, FLAG)
                    If (And (PICX, One))
                    {
                        Return (BUF)
                    }

                    Store (GETT (PIT0), PIO0)
                    Store (GETT (PIT1), PIO1)
                    If (And (UDCX, One))
                    {
                        Or (FLAG, One, FLAG)
                        Store (DerefOf (Index (UDMT, And (UDMX, 0x0F))), DMA0)
                    }
                    Else
                    {
                        If (LNotEqual (MDT0, 0xFF))
                        {
                            Store (GETT (MDT0), DMA0)
                        }
                    }

                    If (And (UDCX, 0x02))
                    {
                        Or (FLAG, 0x04, FLAG)
                        Store (DerefOf (Index (UDMT, ShiftRight (UDMX, 0x04))), DMA1)
                    }
                    Else
                    {
                        If (LNotEqual (MDT1, 0xFF))
                        {
                            Store (GETT (MDT1), DMA1)
                        }
                    }

                    Or (FLAG, 0x1A, FLAG)
                    Return (BUF)
                }

                Method (STM, 3, NotSerialized)
                {
                    CreateDWordField (Arg0, Zero, PIO0)
                    CreateDWordField (Arg0, 0x04, DMA0)
                    CreateDWordField (Arg0, 0x08, PIO1)
                    CreateDWordField (Arg0, 0x0C, DMA1)
                    CreateDWordField (Arg0, 0x10, FLAG)
                    Name (BUF, Buffer (0x07)
                    {
                         0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                    })
                    CreateByteField (BUF, Zero, PIT1)
                    CreateByteField (BUF, One, PIT0)
                    CreateByteField (BUF, 0x02, MDT1)
                    CreateByteField (BUF, 0x03, MDT0)
                    CreateByteField (BUF, 0x04, PIMX)
                    CreateByteField (BUF, 0x05, UDCX)
                    CreateByteField (BUF, 0x06, UDMX)
                    Store (Match (PIOT, MLE, PIO0, MTR, Zero, Zero), Local0)
                    Divide (Local0, 0x05, Local0)
                    Store (Match (PIOT, MLE, PIO1, MTR, Zero, Zero), Local1)
                    Divide (Local1, 0x05, Local1)
                    Store (Or (ShiftLeft (Local1, 0x04), Local0), PIMX)
                    Store (DerefOf (Index (PITR, Local0)), PIT0)
                    Store (DerefOf (Index (PITR, Local1)), PIT1)
                    If (And (FLAG, One))
                    {
                        Store (Match (UDMT, MLE, DMA0, MTR, Zero, Zero), Local0)
                        Divide (Local0, 0x06, Local0)
                        Or (UDMX, Local0, UDMX)
                        Or (UDCX, One, UDCX)
                    }
                    Else
                    {
                        If (LNotEqual (DMA0, Ones))
                        {
                            Store (Match (MDMT, MLE, DMA0, MTR, Zero, Zero), Local0)
                            Store (DerefOf (Index (MDTR, Local0)), MDT0)
                        }
                    }

                    If (And (FLAG, 0x04))
                    {
                        Store (Match (UDMT, MLE, DMA1, MTR, Zero, Zero), Local0)
                        Divide (Local0, 0x06, Local0)
                        Or (UDMX, ShiftLeft (Local0, 0x04), UDMX)
                        Or (UDCX, 0x02, UDCX)
                    }
                    Else
                    {
                        If (LNotEqual (DMA1, Ones))
                        {
                            Store (Match (MDMT, MLE, DMA1, MTR, Zero, Zero), Local0)
                            Store (DerefOf (Index (MDTR, Local0)), MDT1)
                        }
                    }

                    Return (BUF)
                }

                Method (GTF, 2, NotSerialized)
                {
                    CreateByteField (Arg1, Zero, MDT1)
                    CreateByteField (Arg1, One, MDT0)
                    CreateByteField (Arg1, 0x02, PIMX)
                    CreateByteField (Arg1, 0x03, UDCX)
                    CreateByteField (Arg1, 0x04, UDMX)
                    If (LEqual (Arg0, 0xA0))
                    {
                        Store (And (PIMX, 0x0F), Local0)
                        Store (MDT0, Local1)
                        And (UDCX, One, Local2)
                        Store (And (UDMX, 0x0F), Local3)
                    }
                    Else
                    {
                        Store (ShiftRight (PIMX, 0x04), Local0)
                        Store (MDT1, Local1)
                        And (UDCX, 0x02, Local2)
                        Store (ShiftRight (UDMX, 0x04), Local3)
                    }

                    Name (BUF, Buffer (0x0E)
                    {
                        /* 0000 */   0x03, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xEF, 0x03,
                        /* 0008 */   0x00, 0x00, 0x00, 0x00, 0xFF, 0xEF
                    })
                    CreateByteField (BUF, One, PMOD)
                    CreateByteField (BUF, 0x08, DMOD)
                    CreateByteField (BUF, 0x05, CMDA)
                    CreateByteField (BUF, 0x0C, CMDB)
                    Store (Arg0, CMDA)
                    Store (Arg0, CMDB)
                    Or (Local0, 0x08, PMOD)
                    If (Local2)
                    {
                        Or (Local3, 0x40, DMOD)
                    }
                    Else
                    {
                        If (LNotEqual (Local1, 0xFF))
                        {
                            Store (Match (MDMT, MLE, GETT (Local1), MTR, Zero, Zero), Local4)
                            If (LLess (Local4, 0x03))
                            {
                                Or (0x20, Local4, DMOD)
                            }
                        }
                    }

                    Return (BUF)
                }

                Device (PRID)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Name (BUF, Buffer (0x07)
                        {
                             0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, Zero, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIC)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (PPIT, VPIT)
                        Store (PMDT, VMDT)
                        Store (PPIC, VPIC)
                        Store (PUDC, VUDC)
                        Store (PUDM, VUDM)
                        Return (GTM (BUF))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Name (BUF, Buffer (0x07)
                        {
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, Zero, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIM)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (STM (Arg0, Arg1, Arg2), BUF)
                        Store (VPIT, PPIT)
                        Store (VMDT, PMDT)
                        Store (VPIM, PPIM)
                        Store (VUDC, PUDC)
                        Store (VUDM, PUDM)
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                 0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, Zero, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (PMDT, VMDT)
                            Store (PPIM, VPIM)
                            Store (PUDC, VUDC)
                            Store (PUDM, VUDM)
                            Return (GTF (0xA0, BUF))
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                 0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, Zero, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (PMDT, VMDT)
                            Store (PPIM, VPIM)
                            Store (PUDC, VUDC)
                            Store (PUDM, VUDM)
                            Return (GTF (0xB0, BUF))
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Name (BUF, Buffer (0x07)
                        {
                             0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, Zero, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIC)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (SPIT, VPIT)
                        Store (SMDT, VMDT)
                        Store (SPIC, VPIC)
                        Store (SUDC, VUDC)
                        Store (SUDM, VUDM)
                        Return (GTM (BUF))
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Name (BUF, Buffer (0x07)
                        {
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, Zero, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIM)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (STM (Arg0, Arg1, Arg2), BUF)
                        Store (VPIT, SPIT)
                        Store (VMDT, SMDT)
                        Store (VPIM, SPIM)
                        Store (VUDC, SUDC)
                        Store (VUDM, SUDM)
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                 0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, Zero, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (SMDT, VMDT)
                            Store (SPIM, VPIM)
                            Store (SUDC, VUDC)
                            Store (SUDM, VUDM)
                            Return (GTF (0xA0, BUF))
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                 0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, Zero, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (SMDT, VMDT)
                            Store (SPIM, VPIM)
                            Store (SUDC, VUDC)
                            Store (SUDM, VUDM)
                            Return (GTF (0xB0, BUF))
                        }
                    }
                }
            }

            Name (AFCB, Buffer (0xB8) {})
            Name (CALB, Buffer (0x05) {})
            Name (XUPC, Package (0x04)
            {
                0xFF, 
                0xFF, 
                Zero, 
                Zero
            })
            Name (XPLD, Buffer (0x10)
            {
                /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0008 */   0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            Scope (OHC1)
            {
                Device (RHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                    }

                    Device (PRT3)
                    {
                        Name (_ADR, 0x03)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Return (XUPC)
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Return (XPLD)
                        }
                    }

                    Device (PRT4)
                    {
                        Name (_ADR, 0x04)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Return (XUPC)
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Return (XPLD)
                        }
                    }

                    Device (PRT5)
                    {
                        Name (_ADR, 0x05)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Return (XUPC)
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Return (XPLD)
                        }
                    }
                }
            }

            Scope (EHC1)
            {
                Device (RHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                    }

                    Device (PRT3)
                    {
                        Name (_ADR, 0x03)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Return (XUPC)
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Return (XPLD)
                        }
                    }

                    Device (UBC4)
                    {
                        Name (_ADR, 0x04)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10)
                            {
                                /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0xB0, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                                /*           Revision : 02     */
                                /*        IgnoreColor : 01     */
                                /*              Color : 000000 */
                                /*              Width : 0000   */
                                /*             Height : 0000   */
                                /*        UserVisible : 00     */
                                /*               Dock : 00     */
                                /*                Lid : 00     */
                                /*              Panel : 06     */
                                /*   VerticalPosition : 02     */
                                /* HorizontalPosition : 01     */
                                /*              Shape : 06     */
                                /*   GroupOrientation : 00     */
                                /*         GroupToken : 00     */
                                /*      GroupPosition : 00     */
                                /*                Bay : 00     */
                                /*          Ejectable : 00     */
                                /*  OspmEjectRequired : 00     */
                                /*      CabinetNumber : 00     */
                                /*     CardCageNumber : 00     */
                                /*          Reference : 00     */
                                /*           Rotation : 00     */
                                /*              Order : 00     */
                                /*     VerticalOffset : 0000   */
                                /*   HorizontalOffset : 0000   */
                            }
                        })
                        Device (PRT4)
                        {
                            Name (_ADR, 0x04)  // _ADR: Address
                            Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x64, 0x00, 0x64, 0x00,
                                    /* 0008 */   0x24, 0x41, 0x80, 0x01, 0x00, 0x00, 0x04, 0x00,
                                    /* 0010 */   0x00, 0x03, 0xAB, 0x02
                                    /*           Revision : 02     */
                                    /*        IgnoreColor : 01     */
                                    /*              Color : 000000 */
                                    /*              Width : 0064   */
                                    /*             Height : 0064   */
                                    /*        UserVisible : 00     */
                                    /*               Dock : 00     */
                                    /*                Lid : 01     */
                                    /*              Panel : 04     */
                                    /*   VerticalPosition : 00     */
                                    /* HorizontalPosition : 01     */
                                    /*              Shape : 00     */
                                    /*   GroupOrientation : 01     */
                                    /*         GroupToken : 00     */
                                    /*      GroupPosition : 03     */
                                    /*                Bay : 00     */
                                    /*          Ejectable : 00     */
                                    /*  OspmEjectRequired : 00     */
                                    /*      CabinetNumber : 00     */
                                    /*     CardCageNumber : 00     */
                                    /*          Reference : 01     */
                                    /*           Rotation : 00     */
                                    /*              Order : 00     */
                                    /*     VerticalOffset : 0300   */
                                    /*   HorizontalOffset : 02AB   */
                                }
                            })
                        }
                    }

                    Device (PRT5)
                    {
                        Name (_ADR, 0x05)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Return (XUPC)
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Return (XPLD)
                        }
                    }
                }
            }

            Scope (OHC2)
            {
                Device (RHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Return (XUPC)
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Return (XPLD)
                        }
                    }
                }
            }

            Scope (EHC2)
            {
                Device (RHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Return (XUPC)
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Return (XPLD)
                        }
                    }
                }
            }

            Scope (OHC4)
            {
                Device (RHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Return (XUPC)
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Return (XPLD)
                        }
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Return (XUPC)
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Return (XPLD)
                        }
                    }
                }
            }

            Scope (XHC1)
            {
                Device (RHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                    }
                }
            }
        }

        OperationRegion (PIRQ, SystemIO, 0x0C00, 0x02)
        Field (PIRQ, ByteAcc, NoLock, Preserve)
        {
            PIDX,   8, 
            PDAT,   8
        }

        IndexField (PIDX, PDAT, ByteAcc, NoLock, Preserve)
        {
            PIRA,   8, 
            PIRB,   8, 
            PIRC,   8, 
            PIRD,   8, 
            PIRE,   8, 
            PIRF,   8, 
            PIRG,   8, 
            PIRH,   8, 
            Offset (0x10), 
            PIRS,   8, 
            Offset (0x13), 
            HDAD,   8, 
            Offset (0x15), 
            GEC,    8, 
            Offset (0x30), 
            USB1,   8, 
            USB2,   8, 
            USB3,   8, 
            USB4,   8, 
            USB5,   8, 
            USB6,   8, 
            USB7,   8, 
            Offset (0x40), 
            IDE,    8, 
            SATA,   8, 
            Offset (0x50), 
            GPP0,   8, 
            GPP1,   8, 
            GPP2,   8, 
            GPP3,   8
        }

        OperationRegion (KBDD, SystemIO, 0x64, One)
        Field (KBDD, ByteAcc, NoLock, Preserve)
        {
            PD64,   8
        }

        Method (DSPI, 0, NotSerialized)
        {
            INTA (0x1F)
            INTB (0x1F)
            INTC (0x1F)
            INTD (0x1F)
            Store (PD64, Local1)
            Store (0x1F, PIRE)
            Store (0x1F, PIRF)
            Store (0x1F, PIRG)
            Store (0x1F, PIRH)
        }

        Method (INTA, 1, NotSerialized)
        {
            Store (Arg0, PIRA)
            If (PICM)
            {
                Store (Arg0, HDAD)
                Store (Arg0, GEC)
                Store (Arg0, GPP0)
                Store (Arg0, GPP0)
            }
        }

        Method (INTB, 1, NotSerialized)
        {
            Store (Arg0, PIRB)
            If (PICM)
            {
                Store (Arg0, USB2)
                Store (Arg0, USB4)
                Store (Arg0, USB6)
                Store (Arg0, GPP1)
                Store (Arg0, IDE)
            }
        }

        Method (INTC, 1, NotSerialized)
        {
            Store (Arg0, PIRC)
            If (PICM)
            {
                Store (Arg0, USB1)
                Store (Arg0, USB3)
                Store (Arg0, USB5)
                Store (Arg0, USB7)
                Store (Arg0, GPP2)
            }
        }

        Method (INTD, 1, NotSerialized)
        {
            Store (Arg0, PIRD)
            If (PICM)
            {
                Store (Arg0, SATA)
                Store (Arg0, GPP3)
            }
        }

        Name (PRS1, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {3,4,5,7,10,11,12,14,15}
        })
        Name (BUFA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {15}
        })
        Name (IPRA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5,10,11}
        })
        Name (IPRB, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5,10,11}
        })
        Name (IPRC, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5,10,11}
        })
        Name (IPRD, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5,10,11}
        })
        Device (LNKA)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRA)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTA (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRA, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRA)
            }
        }

        Device (LNKB)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRB)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTB (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRB, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRB)
            }
        }

        Device (LNKC)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRC)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTC (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRC, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRC)
            }
        }

        Device (LNKD)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRD)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTD (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRD, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRD)
            }
        }

        Device (LNKE)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRE)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (0x1F, PIRE)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRE, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRE)
            }
        }

        Device (LNKF)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x06)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRF)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (0x1F, PIRF)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRF, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRF)
            }
        }

        Device (LNKG)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x07)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRG)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (0x1F, PIRG)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRG, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRG)
            }
        }

        Device (LNKH)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x08)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (PIRH)
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1)
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (0x1F, PIRH)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRH, IRQX)
                Return (BUFA)
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRH)
            }
        }

        Method (GSMI, 1, NotSerialized)
        {
            Store (Arg0, APMD)
            Store (0xE4, APMC)
            Stall (0xFF)
            Stall (0xFF)
            Stall (0xFF)
            Stall (0xFF)
            Stall (0xFF)
            Stall (0xFF)
        }

        Method (S80H, 1, NotSerialized)
        {
            Store (Arg0, APMD)
            Store (0xE5, APMC)
            Stall (0xFF)
            Stall (0xFF)
            Stall (0xFF)
            Stall (0xFF)
            Stall (0xFF)
            Stall (0xFF)
        }

        Method (BSMI, 1, NotSerialized)
        {
            Store (Arg0, APMD)
            Store (0xBE, APMC)
            Stall (0xFF)
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (Zero)
            }
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))  // _HID: Hardware ID
            Method (_LID, 0, NotSerialized)  // _LID: Lid Status
            {
                Store (And (^^PCI0.SMBS.GE22, One), Local0)
                If (And (Local0, One))
                {
                    Store (Zero, ^^PCI0.SMBS.G22T)
                }
                Else
                {
                    Store (One, ^^PCI0.SMBS.G22T)
                }

                Return (Local0)
            }

            Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
            {
                0x16, 
                0x04
            })
            Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
            {
            }
        }

        Scope (\_GPE)
        {
            Method (_L16, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Sleep (0x14)
                Store (And (\_SB.PCI0.SMBS.GE22, One), Local0)
                If (And (Local0, One))
                {
                    Store (Zero, \_SB.PCI0.SMBS.G22T)
                    Store (0xC001, P80H)
                }
                Else
                {
                    Store (One, \_SB.PCI0.SMBS.G22T)
                    Store (0xC000, P80H)
                }

                Notify (\_SB.LID, 0x80)
            }
        }

        Scope (\_SB)
        {
            Method (ALIC, 2, NotSerialized)
            {
                If (LEqual (Arg0, 0x07))
                {
                    If (LEqual (Arg1, Zero))
                    {
                        Store (Zero, ^PCI0.SMBS.O053)
                        Store (Zero, ^PCI0.SMBS.E053)
                    }
                    Else
                    {
                        Store (One, ^PCI0.SMBS.O053)
                        Store (Zero, ^PCI0.SMBS.E053)
                    }
                }

                If (LEqual (Arg0, 0x04))
                {
                    If (LEqual (Arg1, Zero))
                    {
                        Store (Zero, ^PCI0.SMBS.O025)
                        Store (Zero, ^PCI0.SMBS.E025)
                    }
                    Else
                    {
                        Store (One, ^PCI0.SMBS.O025)
                        Store (Zero, ^PCI0.SMBS.E025)
                    }
                }

                If (LEqual (Arg0, 0x05))
                {
                    If (LEqual (Arg1, Zero))
                    {
                        Store (Zero, ^PCI0.SMBS.O000)
                        Store (Zero, ^PCI0.SMBS.E000)
                    }
                    Else
                    {
                        Store (One, ^PCI0.SMBS.O000)
                        Store (Zero, ^PCI0.SMBS.E000)
                    }
                }

                If (LEqual (Arg0, 0x06))
                {
                    If (LEqual (Arg1, Zero))
                    {
                        Store (Zero, ^PCI0.SMBS.O027)
                        Store (Zero, ^PCI0.SMBS.E027)
                    }
                    Else
                    {
                        Store (One, ^PCI0.SMBS.O027)
                        Store (Zero, ^PCI0.SMBS.E027)
                    }
                }
            }
        }
    }

    Scope (\)
    {
        OperationRegion (COMP, SystemMemory, 0xAFBBEC98, 0x00000200)
        Field (COMP, AnyAcc, Lock, Preserve)
        {
            IDMN,   16, 
            IDPC,   16, 
            BDID,   8, 
            CPFB,   8, 
            PBTI,   8, 
            BRLV,   8, 
            CAVR,   8, 
            TJMA,   16, 
            CORE,   8, 
            CG12,   8, 
            CG13,   8, 
            CG14,   8, 
            CG15,   8, 
            CG16,   8, 
            CG17,   8, 
            CG18,   8, 
            CG19,   8, 
            CG20,   8, 
            CG21,   8, 
            CG22,   8, 
            CG23,   8, 
            CG24,   8, 
            CG25,   8, 
            CG26,   8, 
            CG27,   8, 
            CG28,   8, 
            CG29,   8, 
            CG30,   8, 
            CG31,   8, 
            SFNO,   16, 
            STDT,   16, 
            BFDT,   1024, 
            RSV1,   736, 
            IDFD,   1024, 
            RSV2,   1024
        }
    }

    Scope (_SB.PCI0.LPC0)
    {
        Method (ECOK, 0, NotSerialized)
        {
            If (LEqual (^EC0.OKEC, One))
            {
                Return (One)
            }
            Else
            {
                Return (Zero)
            }
        }

        Device (EC0)
        {
            Name (_HID, EisaId ("PNP0C09"))  // _HID: Hardware ID
            Name (_GPE, 0x03)  // _GPE: General Purpose Events
            Name (OKEC, One)
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IO (Decode16,
                    0x0062,             // Range Minimum
                    0x0062,             // Range Maximum
                    0x01,               // Alignment
                    0x01,               // Length
                    )
                IO (Decode16,
                    0x0066,             // Range Minimum
                    0x0066,             // Range Maximum
                    0x01,               // Alignment
                    0x01,               // Length
                    )
            })
            Method (_REG, 2, NotSerialized)  // _REG: Region Availability
            {
                If (LEqual (Arg0, 0x03))
                {
                    Store (Arg1, OKEC)
                }
            }

            OperationRegion (ECMM, SystemMemory, 0xFF000000, 0x1000)
            Field (ECMM, AnyAcc, Lock, Preserve)
            {
                Offset (0x800), 
                Offset (0x803), 
                KLEN,   1, 
                KLEX,   1, 
                UCEN,   1, 
                UCEX,   1, 
                Offset (0x804), 
                SBOV,   1, 
                SBIL,   1, 
                SBPF,   1, 
                    ,   2, 
                SBBD,   1, 
                Offset (0x805), 
                Offset (0x807), 
                BTOV,   1, 
                BTIL,   1, 
                BTPF,   1, 
                BTSG,   1, 
                LEDF,   1, 
                MBBD,   1, 
                AUTO,   1, 
                FCGM,   1, 
                Offset (0x80A), 
                EDCC,   1, 
                ALSC,   1, 
                CDMB,   1, 
                CCSB,   1, 
                BTSM,   1, 
                BTCM,   1, 
                LBTM,   1, 
                CSBM,   1, 
                HYMS,   1, 
                Offset (0x80C), 
                ODPO,   1, 
                EODD,   1, 
                ODPK,   1, 
                CMEX,   1, 
                    ,   1, 
                SODD,   1, 
                ODFB,   1, 
                EODS,   1, 
                Offset (0x810), 
                    ,   5, 
                QTMD,   1, 
                Offset (0x811), 
                BFUC,   2, 
                Offset (0x812), 
                FUSL,   8, 
                FUSH,   8, 
                BMIL,   8, 
                BMIH,   8, 
                HIDL,   8, 
                HIDH,   8, 
                FMVL,   8, 
                FMVH,   8, 
                DAVL,   8, 
                DAVH,   8, 
                Offset (0x81D), 
                BFFW,   1, 
                Offset (0x82D), 
                GPUF,   1, 
                Offset (0x82E), 
                VGAT,   1, 
                Offset (0x890), 
                BMFN,   72, 
                BATD,   56, 
                AATL,   1, 
                AACL,   1, 
                AAST,   1, 
                AARW,   1, 
                AAEN,   1, 
                AAEW,   1, 
                AAND,   1, 
                Offset (0x8A1), 
                    ,   1, 
                VIDO,   1, 
                TOUP,   1, 
                Offset (0x8A2), 
                ODTS,   8, 
                OSTY,   3, 
                    ,   4, 
                ADPT,   1, 
                PWAK,   1, 
                MWAK,   1, 
                LWAK,   1, 
                RWAK,   1, 
                WWAK,   1, 
                UWAK,   1, 
                KWAK,   1, 
                TWAK,   1, 
                CCAC,   1, 
                AOAC,   1, 
                BLAC,   1, 
                PSRC,   1, 
                BOAC,   1, 
                LCAC,   1, 
                AAAC,   1, 
                ACAC,   1, 
                S3ST,   1, 
                S3RM,   1, 
                S4ST,   1, 
                S4RM,   1, 
                S5ST,   1, 
                S5RM,   1, 
                Offset (0x8A7), 
                OSTT,   8, 
                OSST,   8, 
                THLT,   8, 
                TCNL,   8, 
                MODE,   1, 
                    ,   2, 
                INIT,   1, 
                FAN1,   1, 
                FAN2,   1, 
                FANT,   1, 
                SKNM,   1, 
                SDTM,   8, 
                FSSN,   4, 
                FANU,   4, 
                PCVL,   4, 
                    ,   2, 
                SWTO,   1, 
                TTHR,   1, 
                TTHM,   1, 
                THTL,   1, 
                    ,   1, 
                CTDP,   1, 
                NPST,   4, 
                CTMP,   8, 
                CTML,   8, 
                SKTA,   8, 
                SKTB,   8, 
                SKTC,   8, 
                Offset (0x8B6), 
                NTMP,   8, 
                    ,   1, 
                SKEY,   1, 
                DIGM,   1, 
                CDLE,   1, 
                Offset (0x8B8), 
                    ,   1, 
                LIDF,   1, 
                PMEE,   1, 
                PWBE,   1, 
                RNGE,   1, 
                BTWE,   1, 
                Offset (0x8B9), 
                BRTS,   8, 
                IAOC,   1, 
                SL35,   1, 
                IFSS,   1, 
                Offset (0x8BB), 
                WLAT,   1, 
                BTAT,   1, 
                WLEX,   1, 
                BTEX,   1, 
                KLSW,   1, 
                WLOK,   1, 
                AT3G,   1, 
                EX3G,   1, 
                PJID,   8, 
                CPUJ,   3, 
                CPNM,   3, 
                GATY,   2, 
                BOL0,   1, 
                BOL1,   1, 
                    ,   2, 
                BCC0,   1, 
                BCC1,   1, 
                Offset (0x8BF), 
                BPU0,   1, 
                BPU1,   1, 
                    ,   2, 
                BOS0,   1, 
                BOS1,   1, 
                Offset (0x8C0), 
                BTY0,   1, 
                BAM0,   1, 
                BAL0,   1, 
                    ,   1, 
                BMF0,   3, 
                Offset (0x8C1), 
                BST0,   8, 
                BRC0,   16, 
                BSN0,   16, 
                BPV0,   16, 
                BDV0,   16, 
                BDC0,   16, 
                BFC0,   16, 
                GAU0,   8, 
                CYC0,   8, 
                BPC0,   16, 
                BAC0,   16, 
                BTW0,   8, 
                BVL0,   8, 
                BTM0,   8, 
                BAT0,   8, 
                BCG0,   16, 
                BCT0,   8, 
                BCI0,   8, 
                BCM0,   8, 
                BOT0,   8, 
                BSSB,   16, 
                BOV0,   8, 
                BCF0,   8, 
                BAD0,   8, 
                BCV1,   16, 
                BCV2,   16, 
                BCV3,   16, 
                BCV4,   16, 
                Offset (0x8ED), 
                BFCB,   16, 
                Offset (0x8F1), 
                    ,   6, 
                ORRF,   1, 
                Offset (0x8F4), 
                BMD0,   16, 
                BACV,   16, 
                BDN0,   8, 
                BTPB,   16, 
                Offset (0x8FC)
            }

            OperationRegion (ECMP, SystemMemory, 0xFF000000, 0x1000)
            Field (ECMP, AnyAcc, Lock, Preserve)
            {
            }

            OperationRegion (ERAM, EmbeddedControl, Zero, 0xFF)
            Field (ERAM, ByteAcc, Lock, Preserve)
            {
                Offset (0x5A), 
                AASD,   8, 
                Offset (0x5C), 
                Offset (0x5D), 
                ENIB,   16, 
                ENDD,   8, 
                SMPR,   8, 
                SMST,   8, 
                SMAD,   8, 
                SMCM,   8, 
                SMD0,   256, 
                BCNT,   8, 
                SMAA,   24, 
                Offset (0x89)
            }

            OperationRegion (ECPR, EmbeddedControl, Zero, 0xFF)
            Field (ECPR, ByteAcc, Lock, Preserve)
            {
            }

            OperationRegion (CCLK, SystemIO, 0x0410, 0x04)
            Field (CCLK, DWordAcc, NoLock, Preserve)
            {
                    ,   1, 
                DUTY,   3, 
                THEN,   1, 
                Offset (0x01), 
                FTT,    1, 
                    ,   8, 
                TSTS,   1
            }

            OperationRegion (ECRM, EmbeddedControl, Zero, 0xFF)
            Field (ECRM, ByteAcc, Lock, Preserve)
            {
                Offset (0x5D), 
                ERIB,   16, 
                ERBD,   8, 
                Offset (0xAA), 
                Offset (0xAB), 
                Offset (0xAD), 
                    ,   4, 
                Offset (0xAE), 
                PTVL,   4, 
                Offset (0xB0), 
                Offset (0xB1), 
                Offset (0xB2), 
                Offset (0xB3), 
                Offset (0xB4), 
                Offset (0xB5), 
                Offset (0xBC), 
                Offset (0xBD)
            }

            Mutex (FAMX, 0x00)
            Method (FANG, 1, NotSerialized)
            {
                Acquire (FAMX, 0xFFFF)
                Store (Arg0, ERIB)
                Store (ERBD, Local0)
                Release (FAMX)
                Return (Local0)
            }

            Method (FANW, 2, NotSerialized)
            {
                Acquire (FAMX, 0xFFFF)
                Store (Arg0, ERIB)
                Store (Arg1, ERBD)
                Release (FAMX)
                Return (Arg1)
            }

            Method (TUVR, 1, NotSerialized)
            {
                Return (0x03)
            }

            Method (THRO, 1, NotSerialized)
            {
                ATHR (Arg0)
            }

            Method (CLCK, 1, NotSerialized)
            {
                Return (Zero)
            }

            Method (PCLK, 0, NotSerialized)
            {
                APCL ()
            }

            Method (ATHR, 1, NotSerialized)
            {
                If (LEqual (Arg0, Zero))
                {
                    If (LEqual (\_PR.C000._PPC, Zero))
                    {
                        Return (One)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
                Else
                {
                    If (LEqual (Arg0, One))
                    {
                        Return (\_PR.C000._PPC)
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x02))
                        {
                            Return (TTHR)
                        }
                        Else
                        {
                            Return (0xFF)
                        }
                    }
                }
            }

            Method (APCL, 0, NotSerialized)
            {
                Store (PTVL, Local0)
                Store (Local0, \_PR.C000.PPCV)
                Notify (\_PR.C000, 0x80)
            }

            Name (CMFP, Package (0x0E)
            {
                0x11, 
                0x12, 
                0x13, 
                0x14, 
                0x15, 
                0x16, 
                0x60, 
                0x61, 
                0x62, 
                0x63, 
                0x64, 
                0x20, 
                0x21, 
                0x22
            })
            Mutex (CFMX, 0x00)
            Method (CFUN, 4, Serialized)
            {
                Name (ESRC, 0x05)
                If (LNotEqual (Match (CMFP, MEQ, DerefOf (Index (Arg0, Zero
                    )), MTR, Zero, Zero), Ones))
                {
                    Acquire (CFMX, 0xFFFF)
                    Store (Arg0, APMD)
                    Store (Arg1, SFNO)
                    Store (Arg2, BFDT)
                    Store (0xCE, APMC)
                    Release (CFMX)
                }
                Else
                {
                    If (LEqual (DerefOf (Index (Arg0, Zero)), 0x10))
                    {
                        If (LEqual (DerefOf (Index (Arg1, Zero)), One))
                        {
                            CreateByteField (Arg2, Zero, CAPV)
                            Store (CAPV, CAVR)
                            Store (One, STDT)
                        }
                        Else
                        {
                            If (LEqual (DerefOf (Index (Arg1, Zero)), 0x02))
                            {
                                Store (Buffer (0x80) {}, Local0)
                                CreateByteField (Local0, Zero, BFD0)
                                Store (0x08, BFD0)
                                Store (One, STDT)
                                Store (Local0, BFDT)
                            }
                            Else
                            {
                                Store (Zero, STDT)
                            }
                        }
                    }
                    Else
                    {
                        If (LEqual (DerefOf (Index (Arg0, Zero)), 0x18))
                        {
                            Acquire (CFMX, 0xFFFF)
                            If (LEqual (DerefOf (Index (Arg1, Zero)), 0x02))
                            {
                                Store (Zero, SMD0)
                                Store (DerefOf (Index (Arg2, One)), SMAD)
                                Store (DerefOf (Index (Arg2, 0x02)), SMCM)
                                Store (DerefOf (Index (Arg2, Zero)), SMPR)
                                While (LAnd (Not (LEqual (ESRC, Zero)), Not (LEqual (And (
                                    SMST, 0x80), 0x80))))
                                {
                                    Sleep (0x14)
                                    Subtract (ESRC, One, ESRC)
                                }

                                Store (SMST, Local2)
                                If (LEqual (And (Local2, 0x80), 0x80))
                                {
                                    Store (Buffer (0x80) {}, Local1)
                                    Store (Local2, Index (Local1, Zero))
                                    If (LEqual (Local2, 0x80))
                                    {
                                        Store (0xC4, P80H)
                                        Store (BCNT, Index (Local1, One))
                                        Store (SMD0, Local3)
                                        Store (DerefOf (Index (Local3, Zero)), Index (Local1, 0x02))
                                        Store (DerefOf (Index (Local3, One)), Index (Local1, 0x03))
                                        Store (DerefOf (Index (Local3, 0x02)), Index (Local1, 0x04))
                                        Store (DerefOf (Index (Local3, 0x03)), Index (Local1, 0x05))
                                        Store (DerefOf (Index (Local3, 0x04)), Index (Local1, 0x06))
                                        Store (DerefOf (Index (Local3, 0x05)), Index (Local1, 0x07))
                                        Store (DerefOf (Index (Local3, 0x06)), Index (Local1, 0x08))
                                        Store (DerefOf (Index (Local3, 0x07)), Index (Local1, 0x09))
                                        Store (DerefOf (Index (Local3, 0x08)), Index (Local1, 0x0A))
                                        Store (DerefOf (Index (Local3, 0x09)), Index (Local1, 0x0B))
                                        Store (DerefOf (Index (Local3, 0x0A)), Index (Local1, 0x0C))
                                        Store (DerefOf (Index (Local3, 0x0B)), Index (Local1, 0x0D))
                                        Store (DerefOf (Index (Local3, 0x0C)), Index (Local1, 0x0E))
                                        Store (DerefOf (Index (Local3, 0x0D)), Index (Local1, 0x0F))
                                        Store (DerefOf (Index (Local3, 0x0E)), Index (Local1, 0x10))
                                        Store (DerefOf (Index (Local3, 0x0F)), Index (Local1, 0x11))
                                        Store (DerefOf (Index (Local3, 0x10)), Index (Local1, 0x12))
                                        Store (DerefOf (Index (Local3, 0x11)), Index (Local1, 0x13))
                                        Store (DerefOf (Index (Local3, 0x12)), Index (Local1, 0x14))
                                        Store (DerefOf (Index (Local3, 0x13)), Index (Local1, 0x15))
                                        Store (DerefOf (Index (Local3, 0x14)), Index (Local1, 0x16))
                                        Store (DerefOf (Index (Local3, 0x15)), Index (Local1, 0x17))
                                        Store (DerefOf (Index (Local3, 0x16)), Index (Local1, 0x18))
                                        Store (DerefOf (Index (Local3, 0x17)), Index (Local1, 0x19))
                                        Store (DerefOf (Index (Local3, 0x18)), Index (Local1, 0x1A))
                                        Store (DerefOf (Index (Local3, 0x19)), Index (Local1, 0x1B))
                                        Store (DerefOf (Index (Local3, 0x1A)), Index (Local1, 0x1C))
                                        Store (DerefOf (Index (Local3, 0x1B)), Index (Local1, 0x1D))
                                        Store (DerefOf (Index (Local3, 0x1C)), Index (Local1, 0x1E))
                                        Store (DerefOf (Index (Local3, 0x1D)), Index (Local1, 0x1F))
                                        Store (DerefOf (Index (Local3, 0x1E)), Index (Local1, 0x20))
                                        Store (DerefOf (Index (Local3, 0x1F)), Index (Local1, 0x21))
                                    }

                                    Store (Local1, BFDT)
                                    Store (One, STDT)
                                }
                                Else
                                {
                                    Store (0xC5, P80H)
                                    Store (Zero, STDT)
                                }
                            }
                            Else
                            {
                                Store (0xC6, P80H)
                                Store (Zero, STDT)
                            }

                            Release (CFMX)
                        }
                        Else
                        {
                            Store (Zero, STDT)
                        }
                    }
                }
            }

            Mutex (PFMX, 0x00)
            Method (PFUN, 4, Serialized)
            {
                Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
                While (One)
                {
                    Store (ToInteger (Arg0), _T_0)
                    If (LNotEqual (Match (Package (0x04)
                                    {
                                        0x80, 
                                        0x81, 
                                        0x82, 
                                        0x83
                                    }, MEQ, _T_0, MTR, Zero, Zero), Ones))
                    {
                        Acquire (PFMX, 0xFFFF)
                        Store (Arg0, APMD)
                        Store (Arg1, SFNO)
                        Store (Arg2, BFDT)
                        Store (0xCE, APMC)
                        Release (PFMX)
                    }
                    Else
                    {
                        Store (Zero, STDT)
                    }

                    Break
                }
            }

            Method (CMFC, 4, Serialized)
            {
                Name (RTVL, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                If (LEqual (ObjectType (Arg0), One))
                {
                    Store (0x8000, Index (RTVL, Zero))
                }
                Else
                {
                    If (LLess (DerefOf (Index (Arg0, Zero)), 0xFE))
                    {
                        Store (Buffer (0x82) {}, Local1)
                        CreateWordField (Local1, Zero, RTST)
                        CreateField (Local1, 0x10, 0x0400, RTDT)
                        If (LLessEqual (ToInteger (Arg0), 0x7F))
                        {
                            CFUN (Arg0, Arg1, Arg2, Arg3)
                        }
                        Else
                        {
                            PFUN (Arg0, Arg1, Arg2, Arg3)
                        }

                        Store (STDT, RTST)
                        Store (BFDT, RTDT)
                        Return (Local1)
                    }
                    Else
                    {
                        Store (0x8000, Index (RTVL, Zero))
                    }
                }

                Return (RTVL)
            }

            Method (_Q11, 0, NotSerialized)  // _Qxx: EC Query
            {
                Store (0x11, P80H)
                If (LEqual (BRTS, Zero))
                {
                    Notify (VPC0, 0x80)
                }

                Notify (^^^VGA.LCD, 0x87)
            }

            Method (_Q12, 0, NotSerialized)  // _Qxx: EC Query
            {
                Store (0x12, P80H)
                If (LEqual (BRTS, 0x0F))
                {
                    Notify (VPC0, 0x80)
                }

                Notify (^^^VGA.LCD, 0x86)
            }

            Method (_Q1D, 0, NotSerialized)  // _Qxx: EC Query
            {
                Store (0x1D, P80H)
                Sleep (0x03E8)
                PCLK ()
                Sleep (0x1E)
            }

            Method (_Q1E, 0, NotSerialized)  // _Qxx: EC Query
            {
                Store (0x1E, P80H)
                ^^^VGA.AFN4 (0x03)
                Store (One, VGAT)
                ^^^VGA.LCD._BCM (One)
            }

            Method (_Q1F, 0, NotSerialized)  // _Qxx: EC Query
            {
                Store (0x1F, P80H)
                Store (ADPT, Local0)
                If (LEqual (Local0, One))
                {
                    ^^^VGA.AFN4 (One)
                }
                Else
                {
                    ^^^VGA.AFN4 (0x02)
                }

                Store (Zero, VGAT)
            }

            Method (_Q22, 0, NotSerialized)  // _Qxx: EC Query
            {
                Notify (BAT1, 0x80)
            }

            Method (_Q24, 0, NotSerialized)  // _Qxx: EC Query
            {
                Store (0x24, P80H)
                Store ("=====QUERY_24=====", Debug)
                Sleep (0x03E8)
                Notify (BAT1, 0x80)
            }

            Method (_Q25, 0, NotSerialized)  // _Qxx: EC Query
            {
                Store (0x25, P80H)
                Notify (BAT1, 0x81)
                Sleep (0x03E8)
                Notify (BAT1, 0x80)
            }

            Method (_Q1C, 0, NotSerialized)  // _Qxx: EC Query
            {
                Store (0x1C, P80H)
                AFN0 ()
            }

            Method (_Q37, 0, NotSerialized)  // _Qxx: EC Query
            {
                Store (0x37, P80H)
                Store (One, PWRS)
                Notify (ACAD, 0x80)
                Sleep (0x03E8)
                Notify (BAT1, 0x80)
                If (LEqual (PRYA, One))
                {
                    If (LEqual (^^^SMBS.O171, Zero))
                    {
                        Store (One, ^^^SMBS.O171)
                        Store (Zero, ^^^SMBS.E171)
                        Notify (^^^SATA.PRT1, One)
                        Store (One, ODFB)
                    }
                }
            }

            Method (_Q38, 0, NotSerialized)  // _Qxx: EC Query
            {
                Store (0x38, P80H)
                Store (Zero, PWRS)
                Notify (ACAD, 0x80)
                Sleep (0x03E8)
                Notify (BAT1, 0x80)
            }

            Mutex (Q53X, 0x00)
            Method (_Q53, 0, NotSerialized)  // _Qxx: EC Query
            {
                If (LEqual (PRYA, One))
                {
                    If (LEqual (^^^SMBS.O171, Zero))
                    {
                        Acquire (Q53X, 0xFFFF)
                        Notify (VPC0, 0x80)
                        Store (One, ^^^SMBS.O171)
                        Store (One, EODD)
                        Notify (^^^SATA.PRT1, One)
                        Release (Q53X)
                    }
                    Else
                    {
                        Store (One, EODS)
                    }
                }
            }

            Method (_Q55, 0, NotSerialized)  // _Qxx: EC Query
            {
                Store (0x55, P80H)
                Sleep (0x01F4)
                Notify (BAT1, 0x81)
                Sleep (0x01F4)
                Notify (BAT1, 0x80)
            }

            Method (_Q65, 0, NotSerialized)  // _Qxx: EC Query
            {
                Store (0x65, P80H)
                If (And (LEqual (WLEX, One), LEqual (WLAT, One)))
                {
                    Store (Zero, ^^^SMBS.E057)
                    Store (One, ^^^SMBS.O057)
                }
                Else
                {
                    Store (Zero, ^^^SMBS.E057)
                    Store (Zero, ^^^SMBS.O057)
                }

                If (And (LEqual (BTEX, One), LEqual (BTAT, One)))
                {
                    Store (Zero, ^^^SMBS.E054)
                    Store (Zero, ^^^SMBS.O054)
                    Store (Zero, ^^^SMBS.E056)
                    Store (One, ^^^SMBS.O056)
                }
                Else
                {
                    Store (Zero, ^^^SMBS.E054)
                    Store (One, ^^^SMBS.O054)
                    Store (Zero, ^^^SMBS.E056)
                    Store (Zero, ^^^SMBS.O056)
                }
            }

            OperationRegion (ECF2, EmbeddedControl, Zero, 0xFF)
            Field (ECF2, ByteAcc, Lock, Preserve)
            {
                VCMD,   8, 
                VDAT,   8, 
                VSTA,   8
            }

            Device (VPC0)
            {
                Name (_HID, "VPC2004")  // _HID: Hardware ID
                Name (_UID, Zero)  // _UID: Unique ID
                Name (_VPC, Zero)
                Name (VPCD, Zero)
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Method (_CFG, 0, NotSerialized)
                {
                    Store (_VPC, Local0)
                    And (Local0, 0xFFFF, Local0)
                    Store (Zero, Local1)
                    Or (Local0, 0xE000, Local0)
                    Or (Local0, 0x0200, Local0)
                    Or (Local0, 0x0800, Local0)
                    Or (Local0, 0x1000, Local0)
                    And (Local0, 0xFFFB, Local0)
                    Or (Local0, 0x0A, Local0)
                    If (ECOK ())
                    {
                        If (LEqual (BTEX, One))
                        {
                            Or (Local1, One, Local1)
                        }
                        Else
                        {
                            And (Local1, 0xFE, Local1)
                        }

                        If (LEqual (WLEX, One))
                        {
                            Or (Local1, 0x04, Local1)
                        }
                        Else
                        {
                            And (Local1, 0xFB, Local1)
                        }

                        If (LEqual (CMEX, One))
                        {
                            Or (Local1, 0x08, Local1)
                        }
                        Else
                        {
                            And (Local1, 0xF7, Local1)
                        }
                    }

                    ShiftLeft (0x07, 0x04, Local2)
                    Or (Local1, Local2, Local1)
                    And (Local1, 0x7F, Local1)
                    Multiply (Local1, 0x00010000, Local1)
                    Add (Local1, Local0, Local0)
                    Store (Local0, _VPC)
                    Return (_VPC)
                }

                Method (VPCR, 1, Serialized)
                {
                    If (LEqual (Arg0, One))
                    {
                        Store (VCMD, VPCD)
                    }
                    Else
                    {
                        Store (VDAT, VPCD)
                    }

                    Return (VPCD)
                }

                Method (VPCW, 2, Serialized)
                {
                    If (LEqual (Arg0, One))
                    {
                        Store (Arg1, VCMD)
                    }
                    Else
                    {
                        Store (Arg1, VDAT)
                    }

                    If (LLess (TPOS, 0x40))
                    {
                        If (LEqual (Arg0, One))
                        {
                            If (LEqual (Arg1, 0x13))
                            {
                                Sleep (0x1E)
                                Multiply (BRTS, 0x09, Local0)
                                Add (0x0A, Local0, Local0)
                                Store (One, SBFN)
                                Store (Local0, BRTL)
                                Store (0x8A, BCMD)
                                BSMI (Zero)
                            }
                        }
                    }

                    Return (Zero)
                }

                Name (TBSL, Package (0x10)
                {
                    One, 
                    0x06, 
                    0x0C, 
                    0x12, 
                    0x18, 
                    0x1E, 
                    0x24, 
                    0x2A, 
                    0x30, 
                    0x36, 
                    0x3C, 
                    0x42, 
                    0x48, 
                    0x4E, 
                    0x54, 
                    0x64
                })
                Name (TBS2, Package (0x65)
                {
                    Zero, 
                    One, 
                    0x02, 
                    0x03, 
                    0x04, 
                    0x05, 
                    0x06, 
                    0x07, 
                    0x08, 
                    0x09, 
                    0x0A, 
                    0x0B, 
                    0x0C, 
                    0x0D, 
                    0x0E, 
                    0x0F, 
                    0x10, 
                    0x11, 
                    0x12, 
                    0x13, 
                    0x14, 
                    0x15, 
                    0x16, 
                    0x17, 
                    0x18, 
                    0x19, 
                    0x1A, 
                    0x1B, 
                    0x1C, 
                    0x1D, 
                    0x1E, 
                    0x1F, 
                    0x20, 
                    0x21, 
                    0x22, 
                    0x23, 
                    0x24, 
                    0x25, 
                    0x26, 
                    0x27, 
                    0x28, 
                    0x29, 
                    0x2A, 
                    0x2B, 
                    0x2C, 
                    0x2D, 
                    0x2E, 
                    0x2F, 
                    0x30, 
                    0x31, 
                    0x32, 
                    0x33, 
                    0x34, 
                    0x35, 
                    0x36, 
                    0x37, 
                    0x38, 
                    0x39, 
                    0x3A, 
                    0x3B, 
                    0x3C, 
                    0x3D, 
                    0x3E, 
                    0x3F, 
                    0x40, 
                    0x41, 
                    0x42, 
                    0x43, 
                    0x44, 
                    0x45, 
                    0x46, 
                    0x47, 
                    0x48, 
                    0x49, 
                    0x4A, 
                    0x4B, 
                    0x4C, 
                    0x4D, 
                    0x4E, 
                    0x4F, 
                    0x50, 
                    0x51, 
                    0x52, 
                    0x53, 
                    0x54, 
                    0x55, 
                    0x56, 
                    0x57, 
                    0x58, 
                    0x59, 
                    0x5A, 
                    0x5B, 
                    0x5C, 
                    0x5D, 
                    0x5E, 
                    0x5F, 
                    0x60, 
                    0x61, 
                    0x62, 
                    0x63, 
                    0x64
                })
                Method (DBSL, 0, NotSerialized)
                {
                    If (LEqual (OSTY, 0x04))
                    {
                        Return (TBS2)
                    }
                    Else
                    {
                        Return (TBSL)
                    }
                }

                Method (HALS, 0, NotSerialized)
                {
                    Return (Zero)
                }

                Method (SALS, 1, Serialized)
                {
                    If (LEqual (Arg0, One)) {}
                    Else
                    {
                    }

                    If (LEqual (Arg0, 0x08))
                    {
                        If (LEqual (PRYA, One))
                        {
                            Store (One, KLEN)
                        }
                    }

                    If (LEqual (Arg0, 0x09))
                    {
                        If (LEqual (PRYA, One))
                        {
                            Store (Zero, KLEN)
                        }
                    }

                    If (LEqual (Arg0, 0x0A)) {}
                    If (LEqual (Arg0, 0x0B)) {}
                    Return (Zero)
                }

                Method (HODD, 0, NotSerialized)
                {
                    Return (0xFF)
                }

                Method (SODD, 1, Serialized)
                {
                    Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
                    While (One)
                    {
                        Store (ToInteger (Arg0), _T_0)
                        If (LEqual (_T_0, Zero))
                        {
                            Store (Zero, ^^^^SMBS.O171)
                            Store (Zero, ^^^^SMBS.E171)
                            Notify (^^^^SATA.PRT1, One)
                        }
                        Else
                        {
                            If (LEqual (_T_0, One))
                            {
                                Store (One, ^^^^SMBS.O171)
                                Store (Zero, ^^^^SMBS.E171)
                                Notify (^^^^SATA.PRT1, One)
                            }
                            Else
                            {
                            }
                        }

                        Break
                    }
                }

                Method (STHT, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Return (Zero)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Return (Zero)
                    }

                    Return (Zero)
                }

                Method (BASL, 1, Serialized)
                {
                    Return (Zero)
                }

                Method (GBMD, 0, NotSerialized)
                {
                    Store (0x10000000, Local0)
                    If (LEqual (One, CDMB))
                    {
                        Or (Local0, One, Local0)
                    }

                    If (LEqual (One, BTSM))
                    {
                        Or (Local0, 0x02, Local0)
                    }

                    If (LEqual (One, FCGM))
                    {
                        Or (Local0, 0x04, Local0)
                    }

                    If (LEqual (One, MBBD))
                    {
                        Or (Local0, 0x08, Local0)
                    }

                    If (LEqual (One, LBTM))
                    {
                        And (Local0, 0xFFFFFFDF, Local0)
                    }

                    If (LEqual (One, BTIL))
                    {
                        Or (Local0, 0x80, Local0)
                    }

                    If (LEqual (One, BTPF))
                    {
                        Or (Local0, 0x0100, Local0)
                    }

                    If (LEqual (Zero, BTCM))
                    {
                        Or (Local0, 0x0200, Local0)
                    }
                    Else
                    {
                        Or (Local0, 0x20, Local0)
                        And (Local0, 0xFFFFFDFF, Local0)
                    }

                    If (LEqual (One, BTOV))
                    {
                        Or (Local0, 0x0800, Local0)
                    }

                    Return (Local0)
                }

                Method (SBMC, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Zero, CDMB)
                        Store (One, EDCC)
                        Return (Zero)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (Zero, EDCC)
                        Store (One, CDMB)
                        Return (Zero)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Store (One, CCSB)
                        Return (Zero)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Store (Zero, BTSM)
                        Store (One, BTCM)
                        Store (Zero, LBTM)
                        Return (Zero)
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        Store (Zero, BTSM)
                        Store (One, BTCM)
                        Store (Zero, LBTM)
                        Return (Zero)
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        Store (Zero, BTSM)
                        Store (Zero, BTCM)
                        Store (One, LBTM)
                        Return (Zero)
                    }

                    If (LEqual (Arg0, 0x06))
                    {
                        Store (One, CSBM)
                        Return (Zero)
                    }

                    Return (Zero)
                }

                Method (SVCR, 1, NotSerialized)
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Zero, QTMD)
                    }

                    If (LEqual (Arg0, One))
                    {
                        Store (One, QTMD)
                    }

                    Return (Zero)
                }

                Method (MHCF, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    And (Local0, 0x60)
                    ShiftRight (Local0, 0x05, Local0)
                    Store (Local0, BFUC)
                    If (LEqual (BFUC, One))
                    {
                        Store (Zero, BFFW)
                    }

                    Sleep (0x14)
                    Return (Local0)
                }

                Method (MHPF, 1, NotSerialized)
                {
                    Name (BFWB, Buffer (0x25) {})
                    CreateByteField (BFWB, Zero, FB0)
                    CreateByteField (BFWB, One, FB1)
                    CreateByteField (BFWB, 0x02, FB2)
                    CreateByteField (BFWB, 0x03, FB3)
                    CreateField (BFWB, 0x20, 0x0100, FB4)
                    CreateByteField (BFWB, 0x24, FB5)
                    If (LLessEqual (SizeOf (Arg0), 0x25))
                    {
                        If (LNotEqual (SMPR, Zero))
                        {
                            Store (SMST, FB1)
                        }
                        Else
                        {
                            Store (Arg0, BFWB)
                            Store (FB2, SMAD)
                            Store (FB3, SMCM)
                            Store (FB5, BCNT)
                            Store (FB0, Local0)
                            If (LEqual (And (Local0, One), Zero))
                            {
                                Store (FB4, SMD0)
                            }

                            Store (Zero, SMST)
                            Store (FB0, SMPR)
                            Store (0x64, Local1)
                            While (Local1)
                            {
                                Sleep (0x0A)
                                Decrement (Local1)
                                If (LAnd (SMST, 0x80))
                                {
                                    Break
                                }
                            }

                            Store (FB0, Local0)
                            If (LNotEqual (And (Local0, One), Zero))
                            {
                                Store (SMD0, FB4)
                            }

                            Store (SMST, FB1)
                            If (LEqual (Local1, Zero))
                            {
                                Store (Zero, SMPR)
                                Store (0x92, FB1)
                            }
                        }

                        Sleep (0x14)
                        Return (BFWB)
                    }
                }

                Method (MHIF, 1, NotSerialized)
                {
                    Name (RETB, Buffer (0x0A) {})
                    While (LEqual (BFFW, Zero))
                    {
                        Sleep (0xC8)
                    }

                    If (LEqual (Arg0, Zero))
                    {
                        Store (FUSL, Index (RETB, Zero))
                        Store (FUSH, Index (RETB, One))
                        Store (BMIL, Index (RETB, 0x02))
                        Store (BMIH, Index (RETB, 0x03))
                        Store (HIDL, Index (RETB, 0x04))
                        Store (HIDH, Index (RETB, 0x05))
                        Store (FMVL, Index (RETB, 0x06))
                        Store (FMVH, Index (RETB, 0x07))
                        Store (DAVL, Index (RETB, 0x08))
                        Store (DAVH, Index (RETB, 0x09))
                    }

                    Return (RETB)
                }
            }

            Method (_Q44, 0, NotSerialized)  // _Qxx: EC Query
            {
                If (LEqual (OKEC, One))
                {
                    If (LLess (TPOS, 0x40))
                    {
                        Multiply (BRTS, 0x09, Local0)
                        Add (0x0A, Local0, Local0)
                        Store (One, SBFN)
                        Store (Local0, BRTL)
                        Store (0x8A, BCMD)
                        BSMI (Zero)
                    }

                    Notify (VPC0, 0x80)
                }
            }
        }

        Scope (EC0)
        {
            Method (BSHK, 0, NotSerialized)
            {
                If (ECOK ())
                {
                    If (_OSI ("Windows 2006"))
                    {
                        Store (One, OSTY)
                    }

                    If (_OSI ("Windows 2006 SP1"))
                    {
                        Store (One, OSTY)
                    }

                    If (_OSI ("Windows 2009"))
                    {
                        Store (0x03, OSTY)
                    }

                    If (_OSI ("Windows 2012"))
                    {
                        Store (0x04, OSTY)
                        Store (One, WLAT)
                    }

                    If (_OSI ("Linux"))
                    {
                        Store (0x02, OSTY)
                    }
                }
            }

            Method (GUBT, 0, NotSerialized)
            {
                Store ("Li-Ion", Local0)
                Return (Local0)
            }

            Method (GUBI, 0, NotSerialized)
            {
                If (ECOK ())
                {
                    Store (BMF0, Local0)
                    If (LEqual (Local0, One))
                    {
                        Return ("SANYO ")
                    }
                    Else
                    {
                        If (LEqual (Local0, 0x02))
                        {
                            Return ("SONY ")
                        }
                        Else
                        {
                            If (LEqual (Local0, 0x03))
                            {
                                Return ("LG ")
                            }
                            Else
                            {
                                If (LEqual (Local0, 0x04))
                                {
                                    Return ("PANASONIC ")
                                }
                                Else
                                {
                                    If (LEqual (Local0, 0x05))
                                    {
                                        Return ("SAMSUNG ")
                                    }
                                    Else
                                    {
                                        If (LEqual (Local0, 0x06))
                                        {
                                            Return ("CPT ")
                                        }
                                        Else
                                        {
                                            If (LEqual (Local0, 0x07))
                                            {
                                                Return ("SIMPLO ")
                                            }
                                            Else
                                            {
                                                Return ("LENOVO ")
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                Else
                {
                    Return ("UNKNOWN ")
                }
            }
        }

        Device (BAT1)
        {
            Name (_HID, EisaId ("PNP0C0A"))  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                _SB
            })
            Name (BMDL, Zero)
            Name (BASC, One)
            Name (BFFW, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                ^^EC0.BSHK ()
                If (ECOK ())
                {
                    If (^^EC0.BOL0)
                    {
                        Sleep (Zero)
                        Return (0x1F)
                    }
                    Else
                    {
                        Sleep (Zero)
                        Return (0x0F)
                    }
                }
                Else
                {
                    Sleep (Zero)
                    Return (0x1F)
                }
            }

            Method (XBIF, 0, NotSerialized)
            {
                Return (BIFX (Zero))
            }

            Method (_BIX, 0, NotSerialized)  // _BIX: Battery Information Extended
            {
                Return (BIFX (One))
            }

            Method (BIFX, 1, NotSerialized)
            {
                Name (STAX, Package (0x14)
                {
                    Zero, 
                    One, 
                    0x1770, 
                    0x1770, 
                    One, 
                    0x2A30, 
                    0x0258, 
                    0xB4, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x0108, 
                    0x0EC4, 
                    "PABAS0241231", 
                    "41167", 
                    "Li-Ion", 
                    "LENOVO "
                })
                Name (STAF, Package (0x0D)
                {
                    One, 
                    0x1770, 
                    0x1770, 
                    One, 
                    0x2A30, 
                    0x0258, 
                    0xB4, 
                    0x0108, 
                    0x0EC4, 
                    "PABAS0241231", 
                    "41167", 
                    "Li-Ion", 
                    "LENOVO "
                })
                Store (^^EC0.GUBT (), Index (STAX, 0x12))
                Store (^^EC0.GUBI (), Index (STAX, 0x13))
                If (ECOK ())
                {
                    If (LEqual (^^EC0.BAM0, Zero))
                    {
                        Store (0x0A, BASC)
                    }

                    Store (^^EC0.BAM0, Index (STAX, One))
                    Store (^^EC0.BDN0, Local0)
                    Store (Local0, BMDL)
                    Store (Multiply (^^EC0.BDC0, BASC), Index (STAX, 0x02))
                    Sleep (Zero)
                    Store (^^EC0.BDV0, Index (STAX, 0x05))
                    Sleep (Zero)
                    If (LEqual (BFFW, One))
                    {
                        Store (^^EC0.BFCB, Local2)
                    }
                    Else
                    {
                        Store (^^EC0.BFC0, Local2)
                    }

                    Store (Multiply (Local2, BASC), Local2)
                    Sleep (Zero)
                    Store (Local2, Index (STAX, 0x03))
                    Divide (Local2, 0x64, Local0, Local1)
                    Multiply (Local1, 0x0A, Local1)
                    Store (Local1, Index (STAX, 0x06))
                    Divide (Local2, 0x64, Local0, Local1)
                    Multiply (Local1, 0x03, Local1)
                    Store (Local1, Index (STAX, 0x07))
                    Store (DerefOf (Index (STAX, One)), Index (STAF, Zero))
                    Store (DerefOf (Index (STAX, 0x02)), Index (STAF, One))
                    Store (DerefOf (Index (STAX, 0x03)), Index (STAF, 0x02))
                    Store (DerefOf (Index (STAX, 0x04)), Index (STAF, 0x03))
                    Store (DerefOf (Index (STAX, 0x05)), Index (STAF, 0x04))
                    Store (DerefOf (Index (STAX, 0x06)), Index (STAF, 0x05))
                    Store (DerefOf (Index (STAX, 0x07)), Index (STAF, 0x06))
                    Store (DerefOf (Index (STAX, 0x0E)), Index (STAF, 0x07))
                    Store (DerefOf (Index (STAX, 0x0F)), Index (STAF, 0x08))
                    Store (DerefOf (Index (STAX, 0x10)), Index (STAF, 0x09))
                    Store (DerefOf (Index (STAX, 0x11)), Index (STAF, 0x0A))
                    Store (DerefOf (Index (STAX, 0x12)), Index (STAF, 0x0B))
                    Store (DerefOf (Index (STAX, 0x13)), Index (STAF, 0x0C))
                    If (LEqual (Arg0, One))
                    {
                        Return (STAX)
                    }
                    Else
                    {
                        Return (STAF)
                    }
                }
            }

            Method (_BST, 0, NotSerialized)  // _BST: Battery Status
            {
                Name (PBST, Package (0x04)
                {
                    Zero, 
                    Ones, 
                    Ones, 
                    0x1770
                })
                If (ECOK ())
                {
                    Store (^^EC0.BST0, Index (PBST, Zero))
                    Sleep (Zero)
                    Store (^^EC0.BAC0, Local4)
                    If (LEqual (^^EC0.ADPT, Zero))
                    {
                        Subtract (0xFFFF, Local4, Local4)
                    }

                    If (LEqual (^^EC0.BAM0, Zero))
                    {
                        Divide (Multiply (Local4, ^^EC0.BPV0), 0x03E8, , Local4)
                    }

                    Store (Local4, Index (PBST, One))
                    Sleep (Zero)
                    If (LEqual (BFFW, One))
                    {
                        Multiply (^^EC0.BFCB, BASC, Local4)
                        Multiply (^^EC0.GAU0, Local4, Local2)
                        Divide (Local2, 0x64, Local4, Local2)
                        Store (Local2, Index (PBST, 0x02))
                        Sleep (Zero)
                    }
                    Else
                    {
                        Store (Multiply (^^EC0.BRC0, BASC), Index (PBST, 0x02))
                        Sleep (Zero)
                    }

                    Store (^^EC0.BPV0, Index (PBST, 0x03))
                    Sleep (Zero)
                    If (LNotEqual (^^EC0.BDN0, BMDL))
                    {
                        Notify (BAT1, 0x81)
                    }
                }

                Return (PBST)
            }

            Method (_BTP, 1, NotSerialized)  // _BTP: Battery Trip Point
            {
                Divide (Arg0, BASC, , Local0)
                Store (Local0, ^^EC0.BTPB)
            }
        }

        Device (ACAD)
        {
            Name (_HID, "ACPI0003")  // _HID: Hardware ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                _SB
            })
            Name (XX00, Buffer (0x03) {})
            Method (_PSR, 0, NotSerialized)  // _PSR: Power Source
            {
                CreateWordField (XX00, Zero, SSZE)
                CreateByteField (XX00, 0x02, ACST)
                Store (0x03, SSZE)
                Store (^^EC0.ADPT, Local0)
                If (LEqual (Local0, One))
                {
                    Store (Zero, ACST)
                }
                Else
                {
                    Store (One, ACST)
                }

                ALIB (One, XX00)
                Return (Local0)
            }
        }
    }
}

