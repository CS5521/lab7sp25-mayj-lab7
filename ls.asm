
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 24             	sub    $0x24,%esp
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
   7:	8b 45 08             	mov    0x8(%ebp),%eax
   a:	89 04 24             	mov    %eax,(%esp)
   d:	e8 dd 03 00 00       	call   3ef <strlen>
  12:	8b 55 08             	mov    0x8(%ebp),%edx
  15:	01 d0                	add    %edx,%eax
  17:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1a:	eb 04                	jmp    20 <fmtname+0x20>
  1c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  20:	8b 45 f4             	mov    -0xc(%ebp),%eax
  23:	3b 45 08             	cmp    0x8(%ebp),%eax
  26:	72 0a                	jb     32 <fmtname+0x32>
  28:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2b:	0f b6 00             	movzbl (%eax),%eax
  2e:	3c 2f                	cmp    $0x2f,%al
  30:	75 ea                	jne    1c <fmtname+0x1c>
    ;
  p++;
  32:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  36:	8b 45 f4             	mov    -0xc(%ebp),%eax
  39:	89 04 24             	mov    %eax,(%esp)
  3c:	e8 ae 03 00 00       	call   3ef <strlen>
  41:	83 f8 0d             	cmp    $0xd,%eax
  44:	76 05                	jbe    4b <fmtname+0x4b>
    return p;
  46:	8b 45 f4             	mov    -0xc(%ebp),%eax
  49:	eb 5f                	jmp    aa <fmtname+0xaa>
  memmove(buf, p, strlen(p));
  4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  4e:	89 04 24             	mov    %eax,(%esp)
  51:	e8 99 03 00 00       	call   3ef <strlen>
  56:	89 44 24 08          	mov    %eax,0x8(%esp)
  5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  5d:	89 44 24 04          	mov    %eax,0x4(%esp)
  61:	c7 04 24 88 0f 00 00 	movl   $0xf88,(%esp)
  68:	e8 11 05 00 00       	call   57e <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  70:	89 04 24             	mov    %eax,(%esp)
  73:	e8 77 03 00 00       	call   3ef <strlen>
  78:	ba 0e 00 00 00       	mov    $0xe,%edx
  7d:	89 d3                	mov    %edx,%ebx
  7f:	29 c3                	sub    %eax,%ebx
  81:	8b 45 f4             	mov    -0xc(%ebp),%eax
  84:	89 04 24             	mov    %eax,(%esp)
  87:	e8 63 03 00 00       	call   3ef <strlen>
  8c:	05 88 0f 00 00       	add    $0xf88,%eax
  91:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  95:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  9c:	00 
  9d:	89 04 24             	mov    %eax,(%esp)
  a0:	e8 71 03 00 00       	call   416 <memset>
  return buf;
  a5:	b8 88 0f 00 00       	mov    $0xf88,%eax
}
  aa:	83 c4 24             	add    $0x24,%esp
  ad:	5b                   	pop    %ebx
  ae:	5d                   	pop    %ebp
  af:	c3                   	ret    

000000b0 <ls>:

void
ls(char *path)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	57                   	push   %edi
  b4:	56                   	push   %esi
  b5:	53                   	push   %ebx
  b6:	81 ec 5c 02 00 00    	sub    $0x25c,%esp
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
  bc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  c3:	00 
  c4:	8b 45 08             	mov    0x8(%ebp),%eax
  c7:	89 04 24             	mov    %eax,(%esp)
  ca:	e8 47 06 00 00       	call   716 <open>
  cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  d2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  d6:	79 20                	jns    f8 <ls+0x48>
    printf(2, "ls: cannot open %s\n", path);
  d8:	8b 45 08             	mov    0x8(%ebp),%eax
  db:	89 44 24 08          	mov    %eax,0x8(%esp)
  df:	c7 44 24 04 32 0c 00 	movl   $0xc32,0x4(%esp)
  e6:	00 
  e7:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  ee:	e8 73 07 00 00       	call   866 <printf>
    return;
  f3:	e9 01 02 00 00       	jmp    2f9 <ls+0x249>
  }

  if(fstat(fd, &st) < 0){
  f8:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
  fe:	89 44 24 04          	mov    %eax,0x4(%esp)
 102:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 105:	89 04 24             	mov    %eax,(%esp)
 108:	e8 21 06 00 00       	call   72e <fstat>
 10d:	85 c0                	test   %eax,%eax
 10f:	79 2b                	jns    13c <ls+0x8c>
    printf(2, "ls: cannot stat %s\n", path);
 111:	8b 45 08             	mov    0x8(%ebp),%eax
 114:	89 44 24 08          	mov    %eax,0x8(%esp)
 118:	c7 44 24 04 46 0c 00 	movl   $0xc46,0x4(%esp)
 11f:	00 
 120:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 127:	e8 3a 07 00 00       	call   866 <printf>
    close(fd);
 12c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 12f:	89 04 24             	mov    %eax,(%esp)
 132:	e8 c7 05 00 00       	call   6fe <close>
    return;
 137:	e9 bd 01 00 00       	jmp    2f9 <ls+0x249>
  }

  switch(st.type){
 13c:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 143:	98                   	cwtl   
 144:	83 f8 01             	cmp    $0x1,%eax
 147:	74 53                	je     19c <ls+0xec>
 149:	83 f8 02             	cmp    $0x2,%eax
 14c:	0f 85 9c 01 00 00    	jne    2ee <ls+0x23e>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 152:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 158:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 15e:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 165:	0f bf d8             	movswl %ax,%ebx
 168:	8b 45 08             	mov    0x8(%ebp),%eax
 16b:	89 04 24             	mov    %eax,(%esp)
 16e:	e8 8d fe ff ff       	call   0 <fmtname>
 173:	89 7c 24 14          	mov    %edi,0x14(%esp)
 177:	89 74 24 10          	mov    %esi,0x10(%esp)
 17b:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 17f:	89 44 24 08          	mov    %eax,0x8(%esp)
 183:	c7 44 24 04 5a 0c 00 	movl   $0xc5a,0x4(%esp)
 18a:	00 
 18b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 192:	e8 cf 06 00 00       	call   866 <printf>
    break;
 197:	e9 52 01 00 00       	jmp    2ee <ls+0x23e>

  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 19c:	8b 45 08             	mov    0x8(%ebp),%eax
 19f:	89 04 24             	mov    %eax,(%esp)
 1a2:	e8 48 02 00 00       	call   3ef <strlen>
 1a7:	83 c0 10             	add    $0x10,%eax
 1aa:	3d 00 02 00 00       	cmp    $0x200,%eax
 1af:	76 19                	jbe    1ca <ls+0x11a>
      printf(1, "ls: path too long\n");
 1b1:	c7 44 24 04 67 0c 00 	movl   $0xc67,0x4(%esp)
 1b8:	00 
 1b9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1c0:	e8 a1 06 00 00       	call   866 <printf>
      break;
 1c5:	e9 24 01 00 00       	jmp    2ee <ls+0x23e>
    }
    strcpy(buf, path);
 1ca:	8b 45 08             	mov    0x8(%ebp),%eax
 1cd:	89 44 24 04          	mov    %eax,0x4(%esp)
 1d1:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1d7:	89 04 24             	mov    %eax,(%esp)
 1da:	e8 a1 01 00 00       	call   380 <strcpy>
    p = buf+strlen(buf);
 1df:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1e5:	89 04 24             	mov    %eax,(%esp)
 1e8:	e8 02 02 00 00       	call   3ef <strlen>
 1ed:	8d 95 e0 fd ff ff    	lea    -0x220(%ebp),%edx
 1f3:	01 d0                	add    %edx,%eax
 1f5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    *p++ = '/';
 1f8:	8b 45 e0             	mov    -0x20(%ebp),%eax
 1fb:	8d 50 01             	lea    0x1(%eax),%edx
 1fe:	89 55 e0             	mov    %edx,-0x20(%ebp)
 201:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 204:	e9 be 00 00 00       	jmp    2c7 <ls+0x217>
      if(de.inum == 0)
 209:	0f b7 85 d0 fd ff ff 	movzwl -0x230(%ebp),%eax
 210:	66 85 c0             	test   %ax,%ax
 213:	75 05                	jne    21a <ls+0x16a>
        continue;
 215:	e9 ad 00 00 00       	jmp    2c7 <ls+0x217>
      memmove(p, de.name, DIRSIZ);
 21a:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
 221:	00 
 222:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 228:	83 c0 02             	add    $0x2,%eax
 22b:	89 44 24 04          	mov    %eax,0x4(%esp)
 22f:	8b 45 e0             	mov    -0x20(%ebp),%eax
 232:	89 04 24             	mov    %eax,(%esp)
 235:	e8 44 03 00 00       	call   57e <memmove>
      p[DIRSIZ] = 0;
 23a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 23d:	83 c0 0e             	add    $0xe,%eax
 240:	c6 00 00             	movb   $0x0,(%eax)
      if(stat(buf, &st) < 0){
 243:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
 249:	89 44 24 04          	mov    %eax,0x4(%esp)
 24d:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 253:	89 04 24             	mov    %eax,(%esp)
 256:	e8 88 02 00 00       	call   4e3 <stat>
 25b:	85 c0                	test   %eax,%eax
 25d:	79 20                	jns    27f <ls+0x1cf>
        printf(1, "ls: cannot stat %s\n", buf);
 25f:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 265:	89 44 24 08          	mov    %eax,0x8(%esp)
 269:	c7 44 24 04 46 0c 00 	movl   $0xc46,0x4(%esp)
 270:	00 
 271:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 278:	e8 e9 05 00 00       	call   866 <printf>
        continue;
 27d:	eb 48                	jmp    2c7 <ls+0x217>
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 27f:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 285:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 28b:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 292:	0f bf d8             	movswl %ax,%ebx
 295:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 29b:	89 04 24             	mov    %eax,(%esp)
 29e:	e8 5d fd ff ff       	call   0 <fmtname>
 2a3:	89 7c 24 14          	mov    %edi,0x14(%esp)
 2a7:	89 74 24 10          	mov    %esi,0x10(%esp)
 2ab:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 2af:	89 44 24 08          	mov    %eax,0x8(%esp)
 2b3:	c7 44 24 04 5a 0c 00 	movl   $0xc5a,0x4(%esp)
 2ba:	00 
 2bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2c2:	e8 9f 05 00 00       	call   866 <printf>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 2c7:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 2ce:	00 
 2cf:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 2d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 2d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2dc:	89 04 24             	mov    %eax,(%esp)
 2df:	e8 0a 04 00 00       	call   6ee <read>
 2e4:	83 f8 10             	cmp    $0x10,%eax
 2e7:	0f 84 1c ff ff ff    	je     209 <ls+0x159>
    }
    break;
 2ed:	90                   	nop
  }
  close(fd);
 2ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2f1:	89 04 24             	mov    %eax,(%esp)
 2f4:	e8 05 04 00 00       	call   6fe <close>
}
 2f9:	81 c4 5c 02 00 00    	add    $0x25c,%esp
 2ff:	5b                   	pop    %ebx
 300:	5e                   	pop    %esi
 301:	5f                   	pop    %edi
 302:	5d                   	pop    %ebp
 303:	c3                   	ret    

00000304 <main>:

int
main(int argc, char *argv[])
{
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	83 e4 f0             	and    $0xfffffff0,%esp
 30a:	83 ec 20             	sub    $0x20,%esp
  int i;

  if(argc < 2){
 30d:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 311:	7f 11                	jg     324 <main+0x20>
    ls(".");
 313:	c7 04 24 7a 0c 00 00 	movl   $0xc7a,(%esp)
 31a:	e8 91 fd ff ff       	call   b0 <ls>
    exit();
 31f:	e8 b2 03 00 00       	call   6d6 <exit>
  }
  for(i=1; i<argc; i++)
 324:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 32b:	00 
 32c:	eb 1f                	jmp    34d <main+0x49>
    ls(argv[i]);
 32e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 332:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 339:	8b 45 0c             	mov    0xc(%ebp),%eax
 33c:	01 d0                	add    %edx,%eax
 33e:	8b 00                	mov    (%eax),%eax
 340:	89 04 24             	mov    %eax,(%esp)
 343:	e8 68 fd ff ff       	call   b0 <ls>
  for(i=1; i<argc; i++)
 348:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 34d:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 351:	3b 45 08             	cmp    0x8(%ebp),%eax
 354:	7c d8                	jl     32e <main+0x2a>
  exit();
 356:	e8 7b 03 00 00       	call   6d6 <exit>

0000035b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 35b:	55                   	push   %ebp
 35c:	89 e5                	mov    %esp,%ebp
 35e:	57                   	push   %edi
 35f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 360:	8b 4d 08             	mov    0x8(%ebp),%ecx
 363:	8b 55 10             	mov    0x10(%ebp),%edx
 366:	8b 45 0c             	mov    0xc(%ebp),%eax
 369:	89 cb                	mov    %ecx,%ebx
 36b:	89 df                	mov    %ebx,%edi
 36d:	89 d1                	mov    %edx,%ecx
 36f:	fc                   	cld    
 370:	f3 aa                	rep stos %al,%es:(%edi)
 372:	89 ca                	mov    %ecx,%edx
 374:	89 fb                	mov    %edi,%ebx
 376:	89 5d 08             	mov    %ebx,0x8(%ebp)
 379:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 37c:	5b                   	pop    %ebx
 37d:	5f                   	pop    %edi
 37e:	5d                   	pop    %ebp
 37f:	c3                   	ret    

00000380 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 386:	8b 45 08             	mov    0x8(%ebp),%eax
 389:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 38c:	90                   	nop
 38d:	8b 45 08             	mov    0x8(%ebp),%eax
 390:	8d 50 01             	lea    0x1(%eax),%edx
 393:	89 55 08             	mov    %edx,0x8(%ebp)
 396:	8b 55 0c             	mov    0xc(%ebp),%edx
 399:	8d 4a 01             	lea    0x1(%edx),%ecx
 39c:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 39f:	0f b6 12             	movzbl (%edx),%edx
 3a2:	88 10                	mov    %dl,(%eax)
 3a4:	0f b6 00             	movzbl (%eax),%eax
 3a7:	84 c0                	test   %al,%al
 3a9:	75 e2                	jne    38d <strcpy+0xd>
    ;
  return os;
 3ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3ae:	c9                   	leave  
 3af:	c3                   	ret    

000003b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 3b3:	eb 08                	jmp    3bd <strcmp+0xd>
    p++, q++;
 3b5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3b9:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 3bd:	8b 45 08             	mov    0x8(%ebp),%eax
 3c0:	0f b6 00             	movzbl (%eax),%eax
 3c3:	84 c0                	test   %al,%al
 3c5:	74 10                	je     3d7 <strcmp+0x27>
 3c7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ca:	0f b6 10             	movzbl (%eax),%edx
 3cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d0:	0f b6 00             	movzbl (%eax),%eax
 3d3:	38 c2                	cmp    %al,%dl
 3d5:	74 de                	je     3b5 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 3d7:	8b 45 08             	mov    0x8(%ebp),%eax
 3da:	0f b6 00             	movzbl (%eax),%eax
 3dd:	0f b6 d0             	movzbl %al,%edx
 3e0:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e3:	0f b6 00             	movzbl (%eax),%eax
 3e6:	0f b6 c0             	movzbl %al,%eax
 3e9:	29 c2                	sub    %eax,%edx
 3eb:	89 d0                	mov    %edx,%eax
}
 3ed:	5d                   	pop    %ebp
 3ee:	c3                   	ret    

000003ef <strlen>:

uint
strlen(const char *s)
{
 3ef:	55                   	push   %ebp
 3f0:	89 e5                	mov    %esp,%ebp
 3f2:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3f5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3fc:	eb 04                	jmp    402 <strlen+0x13>
 3fe:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 402:	8b 55 fc             	mov    -0x4(%ebp),%edx
 405:	8b 45 08             	mov    0x8(%ebp),%eax
 408:	01 d0                	add    %edx,%eax
 40a:	0f b6 00             	movzbl (%eax),%eax
 40d:	84 c0                	test   %al,%al
 40f:	75 ed                	jne    3fe <strlen+0xf>
    ;
  return n;
 411:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 414:	c9                   	leave  
 415:	c3                   	ret    

00000416 <memset>:

void*
memset(void *dst, int c, uint n)
{
 416:	55                   	push   %ebp
 417:	89 e5                	mov    %esp,%ebp
 419:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 41c:	8b 45 10             	mov    0x10(%ebp),%eax
 41f:	89 44 24 08          	mov    %eax,0x8(%esp)
 423:	8b 45 0c             	mov    0xc(%ebp),%eax
 426:	89 44 24 04          	mov    %eax,0x4(%esp)
 42a:	8b 45 08             	mov    0x8(%ebp),%eax
 42d:	89 04 24             	mov    %eax,(%esp)
 430:	e8 26 ff ff ff       	call   35b <stosb>
  return dst;
 435:	8b 45 08             	mov    0x8(%ebp),%eax
}
 438:	c9                   	leave  
 439:	c3                   	ret    

0000043a <strchr>:

char*
strchr(const char *s, char c)
{
 43a:	55                   	push   %ebp
 43b:	89 e5                	mov    %esp,%ebp
 43d:	83 ec 04             	sub    $0x4,%esp
 440:	8b 45 0c             	mov    0xc(%ebp),%eax
 443:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 446:	eb 14                	jmp    45c <strchr+0x22>
    if(*s == c)
 448:	8b 45 08             	mov    0x8(%ebp),%eax
 44b:	0f b6 00             	movzbl (%eax),%eax
 44e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 451:	75 05                	jne    458 <strchr+0x1e>
      return (char*)s;
 453:	8b 45 08             	mov    0x8(%ebp),%eax
 456:	eb 13                	jmp    46b <strchr+0x31>
  for(; *s; s++)
 458:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 45c:	8b 45 08             	mov    0x8(%ebp),%eax
 45f:	0f b6 00             	movzbl (%eax),%eax
 462:	84 c0                	test   %al,%al
 464:	75 e2                	jne    448 <strchr+0xe>
  return 0;
 466:	b8 00 00 00 00       	mov    $0x0,%eax
}
 46b:	c9                   	leave  
 46c:	c3                   	ret    

0000046d <gets>:

char*
gets(char *buf, int max)
{
 46d:	55                   	push   %ebp
 46e:	89 e5                	mov    %esp,%ebp
 470:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 473:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 47a:	eb 4c                	jmp    4c8 <gets+0x5b>
    cc = read(0, &c, 1);
 47c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 483:	00 
 484:	8d 45 ef             	lea    -0x11(%ebp),%eax
 487:	89 44 24 04          	mov    %eax,0x4(%esp)
 48b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 492:	e8 57 02 00 00       	call   6ee <read>
 497:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 49a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 49e:	7f 02                	jg     4a2 <gets+0x35>
      break;
 4a0:	eb 31                	jmp    4d3 <gets+0x66>
    buf[i++] = c;
 4a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4a5:	8d 50 01             	lea    0x1(%eax),%edx
 4a8:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4ab:	89 c2                	mov    %eax,%edx
 4ad:	8b 45 08             	mov    0x8(%ebp),%eax
 4b0:	01 c2                	add    %eax,%edx
 4b2:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4b6:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 4b8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4bc:	3c 0a                	cmp    $0xa,%al
 4be:	74 13                	je     4d3 <gets+0x66>
 4c0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4c4:	3c 0d                	cmp    $0xd,%al
 4c6:	74 0b                	je     4d3 <gets+0x66>
  for(i=0; i+1 < max; ){
 4c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4cb:	83 c0 01             	add    $0x1,%eax
 4ce:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4d1:	7c a9                	jl     47c <gets+0xf>
      break;
  }
  buf[i] = '\0';
 4d3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4d6:	8b 45 08             	mov    0x8(%ebp),%eax
 4d9:	01 d0                	add    %edx,%eax
 4db:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4de:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4e1:	c9                   	leave  
 4e2:	c3                   	ret    

000004e3 <stat>:

int
stat(const char *n, struct stat *st)
{
 4e3:	55                   	push   %ebp
 4e4:	89 e5                	mov    %esp,%ebp
 4e6:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4e9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4f0:	00 
 4f1:	8b 45 08             	mov    0x8(%ebp),%eax
 4f4:	89 04 24             	mov    %eax,(%esp)
 4f7:	e8 1a 02 00 00       	call   716 <open>
 4fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 4ff:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 503:	79 07                	jns    50c <stat+0x29>
    return -1;
 505:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 50a:	eb 23                	jmp    52f <stat+0x4c>
  r = fstat(fd, st);
 50c:	8b 45 0c             	mov    0xc(%ebp),%eax
 50f:	89 44 24 04          	mov    %eax,0x4(%esp)
 513:	8b 45 f4             	mov    -0xc(%ebp),%eax
 516:	89 04 24             	mov    %eax,(%esp)
 519:	e8 10 02 00 00       	call   72e <fstat>
 51e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 521:	8b 45 f4             	mov    -0xc(%ebp),%eax
 524:	89 04 24             	mov    %eax,(%esp)
 527:	e8 d2 01 00 00       	call   6fe <close>
  return r;
 52c:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 52f:	c9                   	leave  
 530:	c3                   	ret    

00000531 <atoi>:

int
atoi(const char *s)
{
 531:	55                   	push   %ebp
 532:	89 e5                	mov    %esp,%ebp
 534:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 537:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 53e:	eb 25                	jmp    565 <atoi+0x34>
    n = n*10 + *s++ - '0';
 540:	8b 55 fc             	mov    -0x4(%ebp),%edx
 543:	89 d0                	mov    %edx,%eax
 545:	c1 e0 02             	shl    $0x2,%eax
 548:	01 d0                	add    %edx,%eax
 54a:	01 c0                	add    %eax,%eax
 54c:	89 c1                	mov    %eax,%ecx
 54e:	8b 45 08             	mov    0x8(%ebp),%eax
 551:	8d 50 01             	lea    0x1(%eax),%edx
 554:	89 55 08             	mov    %edx,0x8(%ebp)
 557:	0f b6 00             	movzbl (%eax),%eax
 55a:	0f be c0             	movsbl %al,%eax
 55d:	01 c8                	add    %ecx,%eax
 55f:	83 e8 30             	sub    $0x30,%eax
 562:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 565:	8b 45 08             	mov    0x8(%ebp),%eax
 568:	0f b6 00             	movzbl (%eax),%eax
 56b:	3c 2f                	cmp    $0x2f,%al
 56d:	7e 0a                	jle    579 <atoi+0x48>
 56f:	8b 45 08             	mov    0x8(%ebp),%eax
 572:	0f b6 00             	movzbl (%eax),%eax
 575:	3c 39                	cmp    $0x39,%al
 577:	7e c7                	jle    540 <atoi+0xf>
  return n;
 579:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 57c:	c9                   	leave  
 57d:	c3                   	ret    

0000057e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 57e:	55                   	push   %ebp
 57f:	89 e5                	mov    %esp,%ebp
 581:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 584:	8b 45 08             	mov    0x8(%ebp),%eax
 587:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 58a:	8b 45 0c             	mov    0xc(%ebp),%eax
 58d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 590:	eb 17                	jmp    5a9 <memmove+0x2b>
    *dst++ = *src++;
 592:	8b 45 fc             	mov    -0x4(%ebp),%eax
 595:	8d 50 01             	lea    0x1(%eax),%edx
 598:	89 55 fc             	mov    %edx,-0x4(%ebp)
 59b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 59e:	8d 4a 01             	lea    0x1(%edx),%ecx
 5a1:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 5a4:	0f b6 12             	movzbl (%edx),%edx
 5a7:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 5a9:	8b 45 10             	mov    0x10(%ebp),%eax
 5ac:	8d 50 ff             	lea    -0x1(%eax),%edx
 5af:	89 55 10             	mov    %edx,0x10(%ebp)
 5b2:	85 c0                	test   %eax,%eax
 5b4:	7f dc                	jg     592 <memmove+0x14>
  return vdst;
 5b6:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5b9:	c9                   	leave  
 5ba:	c3                   	ret    

000005bb <ps>:

void
ps() {
 5bb:	55                   	push   %ebp
 5bc:	89 e5                	mov    %esp,%ebp
 5be:	57                   	push   %edi
 5bf:	56                   	push   %esi
 5c0:	53                   	push   %ebx
 5c1:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  int i = 0;
 5c7:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  printf(1, "PID	TKTS	TCKS	STAT	NAME\n");
 5ce:	c7 44 24 04 7c 0c 00 	movl   $0xc7c,0x4(%esp)
 5d5:	00 
 5d6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5dd:	e8 84 02 00 00       	call   866 <printf>
  getpinfo(&pstat);
 5e2:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 5e8:	89 04 24             	mov    %eax,(%esp)
 5eb:	e8 86 01 00 00       	call   776 <getpinfo>
  while (pstat[i].pid != 0) {
 5f0:	e9 ad 00 00 00       	jmp    6a2 <ps+0xe7>
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
	pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 5f5:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 5fb:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 5fe:	89 d0                	mov    %edx,%eax
 600:	c1 e0 03             	shl    $0x3,%eax
 603:	01 d0                	add    %edx,%eax
 605:	c1 e0 02             	shl    $0x2,%eax
 608:	83 c0 10             	add    $0x10,%eax
 60b:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 60e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 611:	89 d0                	mov    %edx,%eax
 613:	c1 e0 03             	shl    $0x3,%eax
 616:	01 d0                	add    %edx,%eax
 618:	c1 e0 02             	shl    $0x2,%eax
 61b:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 61e:	01 d8                	add    %ebx,%eax
 620:	2d e4 08 00 00       	sub    $0x8e4,%eax
 625:	0f b6 00             	movzbl (%eax),%eax
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
 628:	0f be f0             	movsbl %al,%esi
 62b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 62e:	89 d0                	mov    %edx,%eax
 630:	c1 e0 03             	shl    $0x3,%eax
 633:	01 d0                	add    %edx,%eax
 635:	c1 e0 02             	shl    $0x2,%eax
 638:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 63b:	01 c8                	add    %ecx,%eax
 63d:	2d f8 08 00 00       	sub    $0x8f8,%eax
 642:	8b 18                	mov    (%eax),%ebx
 644:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 647:	89 d0                	mov    %edx,%eax
 649:	c1 e0 03             	shl    $0x3,%eax
 64c:	01 d0                	add    %edx,%eax
 64e:	c1 e0 02             	shl    $0x2,%eax
 651:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 654:	01 c8                	add    %ecx,%eax
 656:	2d 00 09 00 00       	sub    $0x900,%eax
 65b:	8b 08                	mov    (%eax),%ecx
 65d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 660:	89 d0                	mov    %edx,%eax
 662:	c1 e0 03             	shl    $0x3,%eax
 665:	01 d0                	add    %edx,%eax
 667:	c1 e0 02             	shl    $0x2,%eax
 66a:	8d 55 e8             	lea    -0x18(%ebp),%edx
 66d:	01 d0                	add    %edx,%eax
 66f:	2d fc 08 00 00       	sub    $0x8fc,%eax
 674:	8b 00                	mov    (%eax),%eax
 676:	89 7c 24 18          	mov    %edi,0x18(%esp)
 67a:	89 74 24 14          	mov    %esi,0x14(%esp)
 67e:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 682:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 686:	89 44 24 08          	mov    %eax,0x8(%esp)
 68a:	c7 44 24 04 95 0c 00 	movl   $0xc95,0x4(%esp)
 691:	00 
 692:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 699:	e8 c8 01 00 00       	call   866 <printf>
      i++;
 69e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  while (pstat[i].pid != 0) {
 6a2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 6a5:	89 d0                	mov    %edx,%eax
 6a7:	c1 e0 03             	shl    $0x3,%eax
 6aa:	01 d0                	add    %edx,%eax
 6ac:	c1 e0 02             	shl    $0x2,%eax
 6af:	8d 75 e8             	lea    -0x18(%ebp),%esi
 6b2:	01 f0                	add    %esi,%eax
 6b4:	2d fc 08 00 00       	sub    $0x8fc,%eax
 6b9:	8b 00                	mov    (%eax),%eax
 6bb:	85 c0                	test   %eax,%eax
 6bd:	0f 85 32 ff ff ff    	jne    5f5 <ps+0x3a>
  }
}
 6c3:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 6c9:	5b                   	pop    %ebx
 6ca:	5e                   	pop    %esi
 6cb:	5f                   	pop    %edi
 6cc:	5d                   	pop    %ebp
 6cd:	c3                   	ret    

000006ce <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6ce:	b8 01 00 00 00       	mov    $0x1,%eax
 6d3:	cd 40                	int    $0x40
 6d5:	c3                   	ret    

000006d6 <exit>:
SYSCALL(exit)
 6d6:	b8 02 00 00 00       	mov    $0x2,%eax
 6db:	cd 40                	int    $0x40
 6dd:	c3                   	ret    

000006de <wait>:
SYSCALL(wait)
 6de:	b8 03 00 00 00       	mov    $0x3,%eax
 6e3:	cd 40                	int    $0x40
 6e5:	c3                   	ret    

000006e6 <pipe>:
SYSCALL(pipe)
 6e6:	b8 04 00 00 00       	mov    $0x4,%eax
 6eb:	cd 40                	int    $0x40
 6ed:	c3                   	ret    

000006ee <read>:
SYSCALL(read)
 6ee:	b8 05 00 00 00       	mov    $0x5,%eax
 6f3:	cd 40                	int    $0x40
 6f5:	c3                   	ret    

000006f6 <write>:
SYSCALL(write)
 6f6:	b8 10 00 00 00       	mov    $0x10,%eax
 6fb:	cd 40                	int    $0x40
 6fd:	c3                   	ret    

000006fe <close>:
SYSCALL(close)
 6fe:	b8 15 00 00 00       	mov    $0x15,%eax
 703:	cd 40                	int    $0x40
 705:	c3                   	ret    

00000706 <kill>:
SYSCALL(kill)
 706:	b8 06 00 00 00       	mov    $0x6,%eax
 70b:	cd 40                	int    $0x40
 70d:	c3                   	ret    

0000070e <exec>:
SYSCALL(exec)
 70e:	b8 07 00 00 00       	mov    $0x7,%eax
 713:	cd 40                	int    $0x40
 715:	c3                   	ret    

00000716 <open>:
SYSCALL(open)
 716:	b8 0f 00 00 00       	mov    $0xf,%eax
 71b:	cd 40                	int    $0x40
 71d:	c3                   	ret    

0000071e <mknod>:
SYSCALL(mknod)
 71e:	b8 11 00 00 00       	mov    $0x11,%eax
 723:	cd 40                	int    $0x40
 725:	c3                   	ret    

00000726 <unlink>:
SYSCALL(unlink)
 726:	b8 12 00 00 00       	mov    $0x12,%eax
 72b:	cd 40                	int    $0x40
 72d:	c3                   	ret    

0000072e <fstat>:
SYSCALL(fstat)
 72e:	b8 08 00 00 00       	mov    $0x8,%eax
 733:	cd 40                	int    $0x40
 735:	c3                   	ret    

00000736 <link>:
SYSCALL(link)
 736:	b8 13 00 00 00       	mov    $0x13,%eax
 73b:	cd 40                	int    $0x40
 73d:	c3                   	ret    

0000073e <mkdir>:
SYSCALL(mkdir)
 73e:	b8 14 00 00 00       	mov    $0x14,%eax
 743:	cd 40                	int    $0x40
 745:	c3                   	ret    

00000746 <chdir>:
SYSCALL(chdir)
 746:	b8 09 00 00 00       	mov    $0x9,%eax
 74b:	cd 40                	int    $0x40
 74d:	c3                   	ret    

0000074e <dup>:
SYSCALL(dup)
 74e:	b8 0a 00 00 00       	mov    $0xa,%eax
 753:	cd 40                	int    $0x40
 755:	c3                   	ret    

00000756 <getpid>:
SYSCALL(getpid)
 756:	b8 0b 00 00 00       	mov    $0xb,%eax
 75b:	cd 40                	int    $0x40
 75d:	c3                   	ret    

0000075e <sbrk>:
SYSCALL(sbrk)
 75e:	b8 0c 00 00 00       	mov    $0xc,%eax
 763:	cd 40                	int    $0x40
 765:	c3                   	ret    

00000766 <sleep>:
SYSCALL(sleep)
 766:	b8 0d 00 00 00       	mov    $0xd,%eax
 76b:	cd 40                	int    $0x40
 76d:	c3                   	ret    

0000076e <uptime>:
SYSCALL(uptime)
 76e:	b8 0e 00 00 00       	mov    $0xe,%eax
 773:	cd 40                	int    $0x40
 775:	c3                   	ret    

00000776 <getpinfo>:
SYSCALL(getpinfo)
 776:	b8 16 00 00 00       	mov    $0x16,%eax
 77b:	cd 40                	int    $0x40
 77d:	c3                   	ret    

0000077e <settickets>:
SYSCALL(settickets)
 77e:	b8 17 00 00 00       	mov    $0x17,%eax
 783:	cd 40                	int    $0x40
 785:	c3                   	ret    

00000786 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 786:	55                   	push   %ebp
 787:	89 e5                	mov    %esp,%ebp
 789:	83 ec 18             	sub    $0x18,%esp
 78c:	8b 45 0c             	mov    0xc(%ebp),%eax
 78f:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 792:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 799:	00 
 79a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 79d:	89 44 24 04          	mov    %eax,0x4(%esp)
 7a1:	8b 45 08             	mov    0x8(%ebp),%eax
 7a4:	89 04 24             	mov    %eax,(%esp)
 7a7:	e8 4a ff ff ff       	call   6f6 <write>
}
 7ac:	c9                   	leave  
 7ad:	c3                   	ret    

000007ae <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 7ae:	55                   	push   %ebp
 7af:	89 e5                	mov    %esp,%ebp
 7b1:	56                   	push   %esi
 7b2:	53                   	push   %ebx
 7b3:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 7b6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 7bd:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 7c1:	74 17                	je     7da <printint+0x2c>
 7c3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 7c7:	79 11                	jns    7da <printint+0x2c>
    neg = 1;
 7c9:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 7d0:	8b 45 0c             	mov    0xc(%ebp),%eax
 7d3:	f7 d8                	neg    %eax
 7d5:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7d8:	eb 06                	jmp    7e0 <printint+0x32>
  } else {
    x = xx;
 7da:	8b 45 0c             	mov    0xc(%ebp),%eax
 7dd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 7e0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 7e7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 7ea:	8d 41 01             	lea    0x1(%ecx),%eax
 7ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7f0:	8b 5d 10             	mov    0x10(%ebp),%ebx
 7f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7f6:	ba 00 00 00 00       	mov    $0x0,%edx
 7fb:	f7 f3                	div    %ebx
 7fd:	89 d0                	mov    %edx,%eax
 7ff:	0f b6 80 74 0f 00 00 	movzbl 0xf74(%eax),%eax
 806:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 80a:	8b 75 10             	mov    0x10(%ebp),%esi
 80d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 810:	ba 00 00 00 00       	mov    $0x0,%edx
 815:	f7 f6                	div    %esi
 817:	89 45 ec             	mov    %eax,-0x14(%ebp)
 81a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 81e:	75 c7                	jne    7e7 <printint+0x39>
  if(neg)
 820:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 824:	74 10                	je     836 <printint+0x88>
    buf[i++] = '-';
 826:	8b 45 f4             	mov    -0xc(%ebp),%eax
 829:	8d 50 01             	lea    0x1(%eax),%edx
 82c:	89 55 f4             	mov    %edx,-0xc(%ebp)
 82f:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 834:	eb 1f                	jmp    855 <printint+0xa7>
 836:	eb 1d                	jmp    855 <printint+0xa7>
    putc(fd, buf[i]);
 838:	8d 55 dc             	lea    -0x24(%ebp),%edx
 83b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83e:	01 d0                	add    %edx,%eax
 840:	0f b6 00             	movzbl (%eax),%eax
 843:	0f be c0             	movsbl %al,%eax
 846:	89 44 24 04          	mov    %eax,0x4(%esp)
 84a:	8b 45 08             	mov    0x8(%ebp),%eax
 84d:	89 04 24             	mov    %eax,(%esp)
 850:	e8 31 ff ff ff       	call   786 <putc>
  while(--i >= 0)
 855:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 859:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 85d:	79 d9                	jns    838 <printint+0x8a>
}
 85f:	83 c4 30             	add    $0x30,%esp
 862:	5b                   	pop    %ebx
 863:	5e                   	pop    %esi
 864:	5d                   	pop    %ebp
 865:	c3                   	ret    

00000866 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 866:	55                   	push   %ebp
 867:	89 e5                	mov    %esp,%ebp
 869:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 86c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 873:	8d 45 0c             	lea    0xc(%ebp),%eax
 876:	83 c0 04             	add    $0x4,%eax
 879:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 87c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 883:	e9 7c 01 00 00       	jmp    a04 <printf+0x19e>
    c = fmt[i] & 0xff;
 888:	8b 55 0c             	mov    0xc(%ebp),%edx
 88b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 88e:	01 d0                	add    %edx,%eax
 890:	0f b6 00             	movzbl (%eax),%eax
 893:	0f be c0             	movsbl %al,%eax
 896:	25 ff 00 00 00       	and    $0xff,%eax
 89b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 89e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8a2:	75 2c                	jne    8d0 <printf+0x6a>
      if(c == '%'){
 8a4:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 8a8:	75 0c                	jne    8b6 <printf+0x50>
        state = '%';
 8aa:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 8b1:	e9 4a 01 00 00       	jmp    a00 <printf+0x19a>
      } else {
        putc(fd, c);
 8b6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8b9:	0f be c0             	movsbl %al,%eax
 8bc:	89 44 24 04          	mov    %eax,0x4(%esp)
 8c0:	8b 45 08             	mov    0x8(%ebp),%eax
 8c3:	89 04 24             	mov    %eax,(%esp)
 8c6:	e8 bb fe ff ff       	call   786 <putc>
 8cb:	e9 30 01 00 00       	jmp    a00 <printf+0x19a>
      }
    } else if(state == '%'){
 8d0:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 8d4:	0f 85 26 01 00 00    	jne    a00 <printf+0x19a>
      if(c == 'd'){
 8da:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 8de:	75 2d                	jne    90d <printf+0xa7>
        printint(fd, *ap, 10, 1);
 8e0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8e3:	8b 00                	mov    (%eax),%eax
 8e5:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 8ec:	00 
 8ed:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 8f4:	00 
 8f5:	89 44 24 04          	mov    %eax,0x4(%esp)
 8f9:	8b 45 08             	mov    0x8(%ebp),%eax
 8fc:	89 04 24             	mov    %eax,(%esp)
 8ff:	e8 aa fe ff ff       	call   7ae <printint>
        ap++;
 904:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 908:	e9 ec 00 00 00       	jmp    9f9 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 90d:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 911:	74 06                	je     919 <printf+0xb3>
 913:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 917:	75 2d                	jne    946 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 919:	8b 45 e8             	mov    -0x18(%ebp),%eax
 91c:	8b 00                	mov    (%eax),%eax
 91e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 925:	00 
 926:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 92d:	00 
 92e:	89 44 24 04          	mov    %eax,0x4(%esp)
 932:	8b 45 08             	mov    0x8(%ebp),%eax
 935:	89 04 24             	mov    %eax,(%esp)
 938:	e8 71 fe ff ff       	call   7ae <printint>
        ap++;
 93d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 941:	e9 b3 00 00 00       	jmp    9f9 <printf+0x193>
      } else if(c == 's'){
 946:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 94a:	75 45                	jne    991 <printf+0x12b>
        s = (char*)*ap;
 94c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 94f:	8b 00                	mov    (%eax),%eax
 951:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 954:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 958:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 95c:	75 09                	jne    967 <printf+0x101>
          s = "(null)";
 95e:	c7 45 f4 a5 0c 00 00 	movl   $0xca5,-0xc(%ebp)
        while(*s != 0){
 965:	eb 1e                	jmp    985 <printf+0x11f>
 967:	eb 1c                	jmp    985 <printf+0x11f>
          putc(fd, *s);
 969:	8b 45 f4             	mov    -0xc(%ebp),%eax
 96c:	0f b6 00             	movzbl (%eax),%eax
 96f:	0f be c0             	movsbl %al,%eax
 972:	89 44 24 04          	mov    %eax,0x4(%esp)
 976:	8b 45 08             	mov    0x8(%ebp),%eax
 979:	89 04 24             	mov    %eax,(%esp)
 97c:	e8 05 fe ff ff       	call   786 <putc>
          s++;
 981:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 985:	8b 45 f4             	mov    -0xc(%ebp),%eax
 988:	0f b6 00             	movzbl (%eax),%eax
 98b:	84 c0                	test   %al,%al
 98d:	75 da                	jne    969 <printf+0x103>
 98f:	eb 68                	jmp    9f9 <printf+0x193>
        }
      } else if(c == 'c'){
 991:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 995:	75 1d                	jne    9b4 <printf+0x14e>
        putc(fd, *ap);
 997:	8b 45 e8             	mov    -0x18(%ebp),%eax
 99a:	8b 00                	mov    (%eax),%eax
 99c:	0f be c0             	movsbl %al,%eax
 99f:	89 44 24 04          	mov    %eax,0x4(%esp)
 9a3:	8b 45 08             	mov    0x8(%ebp),%eax
 9a6:	89 04 24             	mov    %eax,(%esp)
 9a9:	e8 d8 fd ff ff       	call   786 <putc>
        ap++;
 9ae:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 9b2:	eb 45                	jmp    9f9 <printf+0x193>
      } else if(c == '%'){
 9b4:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 9b8:	75 17                	jne    9d1 <printf+0x16b>
        putc(fd, c);
 9ba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 9bd:	0f be c0             	movsbl %al,%eax
 9c0:	89 44 24 04          	mov    %eax,0x4(%esp)
 9c4:	8b 45 08             	mov    0x8(%ebp),%eax
 9c7:	89 04 24             	mov    %eax,(%esp)
 9ca:	e8 b7 fd ff ff       	call   786 <putc>
 9cf:	eb 28                	jmp    9f9 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 9d1:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 9d8:	00 
 9d9:	8b 45 08             	mov    0x8(%ebp),%eax
 9dc:	89 04 24             	mov    %eax,(%esp)
 9df:	e8 a2 fd ff ff       	call   786 <putc>
        putc(fd, c);
 9e4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 9e7:	0f be c0             	movsbl %al,%eax
 9ea:	89 44 24 04          	mov    %eax,0x4(%esp)
 9ee:	8b 45 08             	mov    0x8(%ebp),%eax
 9f1:	89 04 24             	mov    %eax,(%esp)
 9f4:	e8 8d fd ff ff       	call   786 <putc>
      }
      state = 0;
 9f9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 a00:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 a04:	8b 55 0c             	mov    0xc(%ebp),%edx
 a07:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a0a:	01 d0                	add    %edx,%eax
 a0c:	0f b6 00             	movzbl (%eax),%eax
 a0f:	84 c0                	test   %al,%al
 a11:	0f 85 71 fe ff ff    	jne    888 <printf+0x22>
    }
  }
}
 a17:	c9                   	leave  
 a18:	c3                   	ret    

00000a19 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a19:	55                   	push   %ebp
 a1a:	89 e5                	mov    %esp,%ebp
 a1c:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a1f:	8b 45 08             	mov    0x8(%ebp),%eax
 a22:	83 e8 08             	sub    $0x8,%eax
 a25:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a28:	a1 a0 0f 00 00       	mov    0xfa0,%eax
 a2d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a30:	eb 24                	jmp    a56 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a32:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a35:	8b 00                	mov    (%eax),%eax
 a37:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a3a:	77 12                	ja     a4e <free+0x35>
 a3c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a3f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a42:	77 24                	ja     a68 <free+0x4f>
 a44:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a47:	8b 00                	mov    (%eax),%eax
 a49:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a4c:	77 1a                	ja     a68 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a4e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a51:	8b 00                	mov    (%eax),%eax
 a53:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a56:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a59:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a5c:	76 d4                	jbe    a32 <free+0x19>
 a5e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a61:	8b 00                	mov    (%eax),%eax
 a63:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a66:	76 ca                	jbe    a32 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a68:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a6b:	8b 40 04             	mov    0x4(%eax),%eax
 a6e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 a75:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a78:	01 c2                	add    %eax,%edx
 a7a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a7d:	8b 00                	mov    (%eax),%eax
 a7f:	39 c2                	cmp    %eax,%edx
 a81:	75 24                	jne    aa7 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 a83:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a86:	8b 50 04             	mov    0x4(%eax),%edx
 a89:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a8c:	8b 00                	mov    (%eax),%eax
 a8e:	8b 40 04             	mov    0x4(%eax),%eax
 a91:	01 c2                	add    %eax,%edx
 a93:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a96:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 a99:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a9c:	8b 00                	mov    (%eax),%eax
 a9e:	8b 10                	mov    (%eax),%edx
 aa0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 aa3:	89 10                	mov    %edx,(%eax)
 aa5:	eb 0a                	jmp    ab1 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 aa7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aaa:	8b 10                	mov    (%eax),%edx
 aac:	8b 45 f8             	mov    -0x8(%ebp),%eax
 aaf:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 ab1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ab4:	8b 40 04             	mov    0x4(%eax),%eax
 ab7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 abe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ac1:	01 d0                	add    %edx,%eax
 ac3:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 ac6:	75 20                	jne    ae8 <free+0xcf>
    p->s.size += bp->s.size;
 ac8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 acb:	8b 50 04             	mov    0x4(%eax),%edx
 ace:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ad1:	8b 40 04             	mov    0x4(%eax),%eax
 ad4:	01 c2                	add    %eax,%edx
 ad6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ad9:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 adc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 adf:	8b 10                	mov    (%eax),%edx
 ae1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ae4:	89 10                	mov    %edx,(%eax)
 ae6:	eb 08                	jmp    af0 <free+0xd7>
  } else
    p->s.ptr = bp;
 ae8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aeb:	8b 55 f8             	mov    -0x8(%ebp),%edx
 aee:	89 10                	mov    %edx,(%eax)
  freep = p;
 af0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 af3:	a3 a0 0f 00 00       	mov    %eax,0xfa0
}
 af8:	c9                   	leave  
 af9:	c3                   	ret    

00000afa <morecore>:

static Header*
morecore(uint nu)
{
 afa:	55                   	push   %ebp
 afb:	89 e5                	mov    %esp,%ebp
 afd:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 b00:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 b07:	77 07                	ja     b10 <morecore+0x16>
    nu = 4096;
 b09:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 b10:	8b 45 08             	mov    0x8(%ebp),%eax
 b13:	c1 e0 03             	shl    $0x3,%eax
 b16:	89 04 24             	mov    %eax,(%esp)
 b19:	e8 40 fc ff ff       	call   75e <sbrk>
 b1e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 b21:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 b25:	75 07                	jne    b2e <morecore+0x34>
    return 0;
 b27:	b8 00 00 00 00       	mov    $0x0,%eax
 b2c:	eb 22                	jmp    b50 <morecore+0x56>
  hp = (Header*)p;
 b2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b31:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 b34:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b37:	8b 55 08             	mov    0x8(%ebp),%edx
 b3a:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 b3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b40:	83 c0 08             	add    $0x8,%eax
 b43:	89 04 24             	mov    %eax,(%esp)
 b46:	e8 ce fe ff ff       	call   a19 <free>
  return freep;
 b4b:	a1 a0 0f 00 00       	mov    0xfa0,%eax
}
 b50:	c9                   	leave  
 b51:	c3                   	ret    

00000b52 <malloc>:

void*
malloc(uint nbytes)
{
 b52:	55                   	push   %ebp
 b53:	89 e5                	mov    %esp,%ebp
 b55:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b58:	8b 45 08             	mov    0x8(%ebp),%eax
 b5b:	83 c0 07             	add    $0x7,%eax
 b5e:	c1 e8 03             	shr    $0x3,%eax
 b61:	83 c0 01             	add    $0x1,%eax
 b64:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 b67:	a1 a0 0f 00 00       	mov    0xfa0,%eax
 b6c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b6f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 b73:	75 23                	jne    b98 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 b75:	c7 45 f0 98 0f 00 00 	movl   $0xf98,-0x10(%ebp)
 b7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b7f:	a3 a0 0f 00 00       	mov    %eax,0xfa0
 b84:	a1 a0 0f 00 00       	mov    0xfa0,%eax
 b89:	a3 98 0f 00 00       	mov    %eax,0xf98
    base.s.size = 0;
 b8e:	c7 05 9c 0f 00 00 00 	movl   $0x0,0xf9c
 b95:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b98:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b9b:	8b 00                	mov    (%eax),%eax
 b9d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 ba0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ba3:	8b 40 04             	mov    0x4(%eax),%eax
 ba6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 ba9:	72 4d                	jb     bf8 <malloc+0xa6>
      if(p->s.size == nunits)
 bab:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bae:	8b 40 04             	mov    0x4(%eax),%eax
 bb1:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 bb4:	75 0c                	jne    bc2 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 bb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bb9:	8b 10                	mov    (%eax),%edx
 bbb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bbe:	89 10                	mov    %edx,(%eax)
 bc0:	eb 26                	jmp    be8 <malloc+0x96>
      else {
        p->s.size -= nunits;
 bc2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bc5:	8b 40 04             	mov    0x4(%eax),%eax
 bc8:	2b 45 ec             	sub    -0x14(%ebp),%eax
 bcb:	89 c2                	mov    %eax,%edx
 bcd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bd0:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 bd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bd6:	8b 40 04             	mov    0x4(%eax),%eax
 bd9:	c1 e0 03             	shl    $0x3,%eax
 bdc:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 bdf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 be2:	8b 55 ec             	mov    -0x14(%ebp),%edx
 be5:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 be8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 beb:	a3 a0 0f 00 00       	mov    %eax,0xfa0
      return (void*)(p + 1);
 bf0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bf3:	83 c0 08             	add    $0x8,%eax
 bf6:	eb 38                	jmp    c30 <malloc+0xde>
    }
    if(p == freep)
 bf8:	a1 a0 0f 00 00       	mov    0xfa0,%eax
 bfd:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 c00:	75 1b                	jne    c1d <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 c02:	8b 45 ec             	mov    -0x14(%ebp),%eax
 c05:	89 04 24             	mov    %eax,(%esp)
 c08:	e8 ed fe ff ff       	call   afa <morecore>
 c0d:	89 45 f4             	mov    %eax,-0xc(%ebp)
 c10:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 c14:	75 07                	jne    c1d <malloc+0xcb>
        return 0;
 c16:	b8 00 00 00 00       	mov    $0x0,%eax
 c1b:	eb 13                	jmp    c30 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c20:	89 45 f0             	mov    %eax,-0x10(%ebp)
 c23:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c26:	8b 00                	mov    (%eax),%eax
 c28:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 c2b:	e9 70 ff ff ff       	jmp    ba0 <malloc+0x4e>
}
 c30:	c9                   	leave  
 c31:	c3                   	ret    
