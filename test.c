#include <stdio.h>
#include <string.h>

void caesar(char *message, int shift, int mode) {
    int i = 0;
    char ch;
    while ((ch = message[i]) != '\0') {
        if (ch >= 'A' && ch <= 'Z') {
            message[i] = (ch - 'A' + shift * mode + 26) % 26 + 'A';
        } else if (ch >= 'a' && ch <= 'z') {
            message[i] = (ch - 'a' + shift * mode + 26) % 26 + 'a';
        }
        i++;
    }
}
int main() {
    char message[100];
    int shift;
    printf("Enter a message: ");
    fgets(message, sizeof(message), stdin);
    message[strcspn(message, "\n")] = 0; // Remove newline character if any
    printf("Enter shift value: ");
    scanf("%d", &shift);
    caesar(message, shift, 1); // Encrypt
    printf("Encrypted message: %s\n", message);
    caesar(message, -shift, 1); // Decrypt
    printf("Decrypted message: %s\n", message);
    return 0;
}