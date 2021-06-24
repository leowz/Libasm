#include "libft.h"
#include <stdio.h>

int     main(void) {

    printf("*************** FT_strlen ***************\n");

    char    *str1 = "sdjkflsjdkfl test 123";
    int     len = 0;
    len = ft_strlen(str1);
    printf("str: %s, len: %d \n", str1, len);

    printf("*************** FT_strcpy ***************\n");

    char    *src= "1234556 test strcpy";
    char    *dst = malloc(64 * sizeof(char));;
    char    *ret = ft_strcpy(dst, src);
    printf("src: %s, dst: %s \n", src, ret);
    
    char    *src1= "1234556 test 11111 jkldskf gjfklsfjaf 0000";
    char    *dst1 = malloc(128 * sizeof(char));;
    char    *ret1 = ft_strcpy(dst1, src1);
    printf("src: %s, ret: %s \n", src1, ret1);
    
    printf("*************** FT_strcmp ***************\n");

    char    *tstr1= "1234556 test strcpy";
    char    *tstr2= "1234556 test strcpy";
    int     tret1 = ft_strcmp(tstr1, tstr2);
    printf("str1: %s, str2: %s , ret %d \n", tstr1, tstr2, tret1);
    

    char    *tstr3= "ajkdlB";
    char    *tstr4= "trcpy";
    int     tret2 = ft_strcmp(tstr3, tstr4);
    printf("str1: %s, str2: %s , ret %d \n", tstr3, tstr4, tret2);

    printf("*************** FT_write ***************\n");

    char    *wrStr= "1234556789\n";
    ft_write(1, wrStr, 12);
    int errRet = ft_write(20, wrStr, 10);
    printf("Error return %d\n", errRet);
    
    printf("*************** FT_read ***************\n");

    char    rStr[20];
    ft_read(1, rStr, 12);
    printf("read %s\n", rStr);
    int errRet1 = ft_write(12, rStr, 10);
    printf("Error return %d\n", errRet1);

    printf("*************** FT_strdup ***************\n");
    
    char  *strToCpy = "a string to copy to another string";
    char *resCpy =  ft_strdup(strToCpy);
    
    printf("strdup result %s\n", resCpy);
    printf("adress %x, %x\n", (unsigned int) strToCpy, (unsigned int) resCpy);
}


