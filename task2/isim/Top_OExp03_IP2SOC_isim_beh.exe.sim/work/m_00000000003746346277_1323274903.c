/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/task2/Code/MYCPU/mux.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static int ng3[] = {2, 0};
static int ng4[] = {3, 0};



static void Always_11_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;

LAB0:    t1 = (t0 + 3416U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(11, ng0);
    t2 = (t0 + 3736);
    *((int *)t2) = 1;
    t3 = (t0 + 3448);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(12, ng0);
    t4 = (t0 + 2096U);
    t5 = *((char **)t4);

LAB5:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 1, t4, 32);
    if (t6 == 1)
        goto LAB6;

LAB7:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 1, t2, 32);
    if (t6 == 1)
        goto LAB8;

LAB9:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 1, t2, 32);
    if (t6 == 1)
        goto LAB10;

LAB11:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 1, t2, 32);
    if (t6 == 1)
        goto LAB12;

LAB13:
LAB15:
LAB14:    xsi_set_current_line(17, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2496);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB16:    goto LAB2;

LAB6:    xsi_set_current_line(13, ng0);
    t7 = (t0 + 1456U);
    t8 = *((char **)t7);
    t7 = (t0 + 2496);
    xsi_vlogvar_assign_value(t7, t8, 0, 0, 32);
    goto LAB16;

LAB8:    xsi_set_current_line(14, ng0);
    t3 = (t0 + 1616U);
    t4 = *((char **)t3);
    t3 = (t0 + 2496);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 32);
    goto LAB16;

LAB10:    xsi_set_current_line(15, ng0);
    t3 = (t0 + 1776U);
    t4 = *((char **)t3);
    t3 = (t0 + 2496);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 32);
    goto LAB16;

LAB12:    xsi_set_current_line(16, ng0);
    t3 = (t0 + 1936U);
    t4 = *((char **)t3);
    t3 = (t0 + 2496);
    xsi_vlogvar_assign_value(t3, t4, 0, 0, 32);
    goto LAB16;

}


extern void work_m_00000000003746346277_1323274903_init()
{
	static char *pe[] = {(void *)Always_11_0};
	xsi_register_didat("work_m_00000000003746346277_1323274903", "isim/Top_OExp03_IP2SOC_isim_beh.exe.sim/work/m_00000000003746346277_1323274903.didat");
	xsi_register_executes(pe);
}
