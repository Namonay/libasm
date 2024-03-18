#include <string.h>
#include <strings.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
#include <errno.h>
#include <stdlib.h>

extern ssize_t ft_write(int fd, const void *buf, size_t count);

extern int ft_strcmp(const char *s1, const char *s2);

extern char *ft_strcpy(char *dest, const char *src);

extern size_t ft_strlen(const char *s);

extern ssize_t ft_read(int fd, void *buf, size_t count); 

extern char *ft_strdup(const char *s);

void Test_read(char *filename, int len)
{
    char buffer[100] = {0};
    int errnosave;

    int fd = open(filename, O_RDONLY);
    printf("READ : %ld | ", read(fd, buffer, len));
    errnosave = errno;
    printf("%s\n", buffer);
    close(fd);
    bzero(buffer, len);

    fd = open(filename, O_RDONLY);
    printf("READ : %ld | ", ft_read(fd, buffer, len));
    printf("%s\n", buffer);
    close(fd);
    printf("READ : %s\n", (errnosave == errno) ? "OK" : "KO");
}

void Test_write(char *buffer, int len)
{
    printf(" | WRITE : %ld\n", write(1, buffer, len));
    printf(" | WRITE : %ld\n", ft_write(1, buffer, len));
}

void Test_strdup(char *buffer)
{
    char *newbuffer;

    newbuffer = strdup(buffer);
    printf("STRDUP : %s\n", newbuffer);
    free(newbuffer);
    
    newbuffer = ft_strdup(buffer);
    printf("FT_STRDUP : %s\n", newbuffer);
    free(newbuffer);
}

void Test_strlen(char *str)
{
    int len = strlen(str);
    int ft_len = ft_strlen(str);

    printf("STRLEN : %s\n", (len == ft_len) ? "OK" : "KO");
}

void Test_strcpy(char *buffer)
{
    char cpybuffer[strlen(buffer) + 1];

    bzero(cpybuffer, strlen(buffer) + 1);
    strcpy(cpybuffer, buffer);
    printf("STRCPY : %s\n", cpybuffer);

    bzero(cpybuffer, strlen(buffer) + 1);
    ft_strcpy(cpybuffer, buffer);
    printf("FT_STRCPY : %s\n", cpybuffer);
}

void Test_strcmp(char *str1, char *str2)
{
    int res1 = strcmp(str1, str2);
    int res2 = ft_strcmp(str1, str2);

    printf("STRCMP : %d FT_STRCMP : %d | %s\n", res1, res2, (res1 == res2) ? "OK" : "KO");
}

int main()
{
    int returnval[2];
    int fd = open("mauvaisdavid.txt", O_RDONLY);
    char buffer[100] = {0};

    Test_strlen("clafete");

    Test_read("mauvaisdavid.txt", 3);

    Test_write("youpipouic", 10);

    Test_strcpy("jesuislevilainbebe");

    Test_strdup("youpilolololol");

    Test_strcmp(buffer, "123");
}