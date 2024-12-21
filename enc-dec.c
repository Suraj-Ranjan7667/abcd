#include <stdio.h>
#include <string.h>
void encrypt(char *message, int shift)
 {
for (int i = 0; message[i] != '\0'; i++) 
{
        char ch = message[i];
        if (ch >= 'A' && ch <= 'Z') {
            message[i] = (ch - 'A' + shift) % 26 + 'A';
        }
        else if (ch >= 'a' && ch <= 'z') {
            message[i] = (ch - 'a' + shift) % 26 + 'a';
        }
    }
}
void decrypt(char *message, int shift)
 {
for (int i = 0; message[i] != '\0'; i++) 
{
        char ch = message[i];
        if (ch >= 'A' && ch <= 'Z') {
            message[i] = (ch - 'A' - shift + 26) % 26 + 'A';
        }
        else if (ch >= 'a' && ch <= 'z') {
            message[i] = (ch - 'a' - shift + 26) % 26 + 'a';
        }
    }
}
int main() 
{
    char message[100];
int shift;
    printf("Enter a message: ");
    fgets(message, sizeof(message), stdin);
    message[strcspn(message, "\n")] = 0; 
    printf("Enter shift value: ");
    scanf("%d", &shift);
    encrypt(message, shift);
    printf("Encrypted message: %s\n", message);
    decrypt(message, shift);
    printf("Decrypted message: %s\n", message);
    return 0;
}