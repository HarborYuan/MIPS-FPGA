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
static const char *ng0 = "D:/task2/Code/MYCPU/EXT.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {65535U, 0U};
static unsigned int ng4[] = {2U, 0U};



static void Always_6_0(char *t0)
{
    char t7[8];
    char t11[8];
    char t12[8];
    char t28[8];
    char t35[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t8;
    char *t9;
    char *t10;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t36;
    char *t37;
    char *t38;

LAB0:    t1 = (t0 + 2528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(6, ng0);
    t2 = (t0 + 2848);
    *((int *)t2) = 1;
    t3 = (t0 + 2560);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(7, ng0);

LAB5:    xsi_set_current_line(8, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t4, 2);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t6 == 1)
        goto LAB11;

LAB12:
LAB14:
LAB13:
LAB15:    goto LAB2;

LAB7:    xsi_set_current_line(9, ng0);
    t8 = (t0 + 1048U);
    t9 = *((char **)t8);
    t8 = ((char*)((ng1)));
    xsi_vlogtype_concat(t7, 32, 32, 2U, t8, 16, t9, 16);
    t10 = (t0 + 1608);
    xsi_vlogvar_assign_value(t10, t7, 0, 0, 32);
    goto LAB15;

LAB9:    xsi_set_current_line(10, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    memset(t12, 0, 8);
    t3 = (t12 + 4);
    t8 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t14 = (t13 >> 15);
    t15 = (t14 & 1);
    *((unsigned int *)t12) = t15;
    t16 = *((unsigned int *)t8);
    t17 = (t16 >> 15);
    t18 = (t17 & 1);
    *((unsigned int *)t3) = t18;
    memset(t11, 0, 8);
    t9 = (t12 + 4);
    t19 = *((unsigned int *)t9);
    t20 = (~(t19));
    t21 = *((unsigned int *)t12);
    t22 = (t21 & t20);
    t23 = (t22 & 1U);
    if (t23 != 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t9) != 0)
        goto LAB18;

LAB19:    t24 = (t11 + 4);
    t25 = *((unsigned int *)t11);
    t26 = *((unsigned int *)t24);
    t27 = (t25 || t26);
    if (t27 > 0)
        goto LAB20;

LAB21:    t31 = *((unsigned int *)t11);
    t32 = (~(t31));
    t33 = *((unsigned int *)t24);
    t34 = (t32 || t33);
    if (t34 > 0)
        goto LAB22;

LAB23:    if (*((unsigned int *)t24) > 0)
        goto LAB24;

LAB25:    if (*((unsigned int *)t11) > 0)
        goto LAB26;

LAB27:    memcpy(t7, t35, 8);

LAB28:    t38 = (t0 + 1608);
    xsi_vlogvar_assign_value(t38, t7, 0, 0, 32);
    goto LAB15;

LAB11:    xsi_set_current_line(11, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1048U);
    t8 = *((char **)t4);
    xsi_vlogtype_concat(t7, 32, 32, 2U, t8, 16, t3, 16);
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t7, 0, 0, 32);
    goto LAB15;

LAB16:    *((unsigned int *)t11) = 1;
    goto LAB19;

LAB18:    t10 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB19;

LAB20:    t29 = (t0 + 1048U);
    t30 = *((char **)t29);
    t29 = ((char*)((ng3)));
    xsi_vlogtype_concat(t28, 32, 32, 2U, t29, 16, t30, 16);
    goto LAB21;

LAB22:    t36 = (t0 + 1048U);
    t37 = *((char **)t36);
    t36 = ((char*)((ng1)));
    xsi_vlogtype_concat(t35, 32, 32, 2U, t36, 16, t37, 16);
    goto LAB23;

LAB24:    xsi_vlog_unsigned_bit_combine(t7, 32, t28, 32, t35, 32);
    goto LAB28;

LAB26:    memcpy(t7, t28, 8);
    goto LAB28;

}


extern void work_m_00000000000176138512_1785967555_init()
{
	static char *pe[] = {(void *)Always_6_0};
	xsi_register_didat("work_m_00000000000176138512_1785967555", "isim/Top_OExp03_IP2SOC_isim_beh.exe.sim/work/m_00000000000176138512_1785967555.didat");
	xsi_register_executes(pe);
}
