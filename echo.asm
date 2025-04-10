
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int i;

  for(i = 1; i < argc; i++)
   9:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  10:	00 
  11:	eb 4b                	jmp    5e <main+0x5e>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  13:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  17:	83 c0 01             	add    $0x1,%eax
  1a:	3b 45 08             	cmp    0x8(%ebp),%eax
  1d:	7d 07                	jge    26 <main+0x26>
  1f:	b8 3b 09 00 00       	mov    $0x93b,%eax
  24:	eb 05                	jmp    2b <main+0x2b>
  26:	b8 3d 09 00 00       	mov    $0x93d,%eax
  2b:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  2f:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
  36:	8b 55 0c             	mov    0xc(%ebp),%edx
  39:	01 ca                	add    %ecx,%edx
  3b:	8b 12                	mov    (%edx),%edx
  3d:	89 44 24 0c          	mov    %eax,0xc(%esp)
  41:	89 54 24 08          	mov    %edx,0x8(%esp)
  45:	c7 44 24 04 3f 09 00 	movl   $0x93f,0x4(%esp)
  4c:	00 
  4d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  54:	e8 16 05 00 00       	call   56f <printf>
  for(i = 1; i < argc; i++)
  59:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  5e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  62:	3b 45 08             	cmp    0x8(%ebp),%eax
  65:	7c ac                	jl     13 <main+0x13>
  exit();
  67:	e8 7b 03 00 00       	call   3e7 <exit>

0000006c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  6c:	55                   	push   %ebp
  6d:	89 e5                	mov    %esp,%ebp
  6f:	57                   	push   %edi
  70:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  71:	8b 4d 08             	mov    0x8(%ebp),%ecx
  74:	8b 55 10             	mov    0x10(%ebp),%edx
  77:	8b 45 0c             	mov    0xc(%ebp),%eax
  7a:	89 cb                	mov    %ecx,%ebx
  7c:	89 df                	mov    %ebx,%edi
  7e:	89 d1                	mov    %edx,%ecx
  80:	fc                   	cld    
  81:	f3 aa                	rep stos %al,%es:(%edi)
  83:	89 ca                	mov    %ecx,%edx
  85:	89 fb                	mov    %edi,%ebx
  87:	89 5d 08             	mov    %ebx,0x8(%ebp)
  8a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  8d:	5b                   	pop    %ebx
  8e:	5f                   	pop    %edi
  8f:	5d                   	pop    %ebp
  90:	c3                   	ret    

00000091 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  91:	55                   	push   %ebp
  92:	89 e5                	mov    %esp,%ebp
  94:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  97:	8b 45 08             	mov    0x8(%ebp),%eax
  9a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  9d:	90                   	nop
  9e:	8b 45 08             	mov    0x8(%ebp),%eax
  a1:	8d 50 01             	lea    0x1(%eax),%edx
  a4:	89 55 08             	mov    %edx,0x8(%ebp)
  a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  aa:	8d 4a 01             	lea    0x1(%edx),%ecx
  ad:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  b0:	0f b6 12             	movzbl (%edx),%edx
  b3:	88 10                	mov    %dl,(%eax)
  b5:	0f b6 00             	movzbl (%eax),%eax
  b8:	84 c0                	test   %al,%al
  ba:	75 e2                	jne    9e <strcpy+0xd>
    ;
  return os;
  bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  bf:	c9                   	leave  
  c0:	c3                   	ret    

000000c1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  c1:	55                   	push   %ebp
  c2:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  c4:	eb 08                	jmp    ce <strcmp+0xd>
    p++, q++;
  c6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  ca:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  ce:	8b 45 08             	mov    0x8(%ebp),%eax
  d1:	0f b6 00             	movzbl (%eax),%eax
  d4:	84 c0                	test   %al,%al
  d6:	74 10                	je     e8 <strcmp+0x27>
  d8:	8b 45 08             	mov    0x8(%ebp),%eax
  db:	0f b6 10             	movzbl (%eax),%edx
  de:	8b 45 0c             	mov    0xc(%ebp),%eax
  e1:	0f b6 00             	movzbl (%eax),%eax
  e4:	38 c2                	cmp    %al,%dl
  e6:	74 de                	je     c6 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  e8:	8b 45 08             	mov    0x8(%ebp),%eax
  eb:	0f b6 00             	movzbl (%eax),%eax
  ee:	0f b6 d0             	movzbl %al,%edx
  f1:	8b 45 0c             	mov    0xc(%ebp),%eax
  f4:	0f b6 00             	movzbl (%eax),%eax
  f7:	0f b6 c0             	movzbl %al,%eax
  fa:	29 c2                	sub    %eax,%edx
  fc:	89 d0                	mov    %edx,%eax
}
  fe:	5d                   	pop    %ebp
  ff:	c3                   	ret    

00000100 <strlen>:

uint
strlen(const char *s)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 106:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 10d:	eb 04                	jmp    113 <strlen+0x13>
 10f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 113:	8b 55 fc             	mov    -0x4(%ebp),%edx
 116:	8b 45 08             	mov    0x8(%ebp),%eax
 119:	01 d0                	add    %edx,%eax
 11b:	0f b6 00             	movzbl (%eax),%eax
 11e:	84 c0                	test   %al,%al
 120:	75 ed                	jne    10f <strlen+0xf>
    ;
  return n;
 122:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 125:	c9                   	leave  
 126:	c3                   	ret    

00000127 <memset>:

void*
memset(void *dst, int c, uint n)
{
 127:	55                   	push   %ebp
 128:	89 e5                	mov    %esp,%ebp
 12a:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 12d:	8b 45 10             	mov    0x10(%ebp),%eax
 130:	89 44 24 08          	mov    %eax,0x8(%esp)
 134:	8b 45 0c             	mov    0xc(%ebp),%eax
 137:	89 44 24 04          	mov    %eax,0x4(%esp)
 13b:	8b 45 08             	mov    0x8(%ebp),%eax
 13e:	89 04 24             	mov    %eax,(%esp)
 141:	e8 26 ff ff ff       	call   6c <stosb>
  return dst;
 146:	8b 45 08             	mov    0x8(%ebp),%eax
}
 149:	c9                   	leave  
 14a:	c3                   	ret    

0000014b <strchr>:

char*
strchr(const char *s, char c)
{
 14b:	55                   	push   %ebp
 14c:	89 e5                	mov    %esp,%ebp
 14e:	83 ec 04             	sub    $0x4,%esp
 151:	8b 45 0c             	mov    0xc(%ebp),%eax
 154:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 157:	eb 14                	jmp    16d <strchr+0x22>
    if(*s == c)
 159:	8b 45 08             	mov    0x8(%ebp),%eax
 15c:	0f b6 00             	movzbl (%eax),%eax
 15f:	3a 45 fc             	cmp    -0x4(%ebp),%al
 162:	75 05                	jne    169 <strchr+0x1e>
      return (char*)s;
 164:	8b 45 08             	mov    0x8(%ebp),%eax
 167:	eb 13                	jmp    17c <strchr+0x31>
  for(; *s; s++)
 169:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16d:	8b 45 08             	mov    0x8(%ebp),%eax
 170:	0f b6 00             	movzbl (%eax),%eax
 173:	84 c0                	test   %al,%al
 175:	75 e2                	jne    159 <strchr+0xe>
  return 0;
 177:	b8 00 00 00 00       	mov    $0x0,%eax
}
 17c:	c9                   	leave  
 17d:	c3                   	ret    

0000017e <gets>:

char*
gets(char *buf, int max)
{
 17e:	55                   	push   %ebp
 17f:	89 e5                	mov    %esp,%ebp
 181:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 184:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 18b:	eb 4c                	jmp    1d9 <gets+0x5b>
    cc = read(0, &c, 1);
 18d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 194:	00 
 195:	8d 45 ef             	lea    -0x11(%ebp),%eax
 198:	89 44 24 04          	mov    %eax,0x4(%esp)
 19c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1a3:	e8 57 02 00 00       	call   3ff <read>
 1a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1ab:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1af:	7f 02                	jg     1b3 <gets+0x35>
      break;
 1b1:	eb 31                	jmp    1e4 <gets+0x66>
    buf[i++] = c;
 1b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1b6:	8d 50 01             	lea    0x1(%eax),%edx
 1b9:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1bc:	89 c2                	mov    %eax,%edx
 1be:	8b 45 08             	mov    0x8(%ebp),%eax
 1c1:	01 c2                	add    %eax,%edx
 1c3:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c7:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1c9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1cd:	3c 0a                	cmp    $0xa,%al
 1cf:	74 13                	je     1e4 <gets+0x66>
 1d1:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d5:	3c 0d                	cmp    $0xd,%al
 1d7:	74 0b                	je     1e4 <gets+0x66>
  for(i=0; i+1 < max; ){
 1d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1dc:	83 c0 01             	add    $0x1,%eax
 1df:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1e2:	7c a9                	jl     18d <gets+0xf>
      break;
  }
  buf[i] = '\0';
 1e4:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1e7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ea:	01 d0                	add    %edx,%eax
 1ec:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1ef:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1f2:	c9                   	leave  
 1f3:	c3                   	ret    

000001f4 <stat>:

int
stat(const char *n, struct stat *st)
{
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1fa:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 201:	00 
 202:	8b 45 08             	mov    0x8(%ebp),%eax
 205:	89 04 24             	mov    %eax,(%esp)
 208:	e8 1a 02 00 00       	call   427 <open>
 20d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 210:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 214:	79 07                	jns    21d <stat+0x29>
    return -1;
 216:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 21b:	eb 23                	jmp    240 <stat+0x4c>
  r = fstat(fd, st);
 21d:	8b 45 0c             	mov    0xc(%ebp),%eax
 220:	89 44 24 04          	mov    %eax,0x4(%esp)
 224:	8b 45 f4             	mov    -0xc(%ebp),%eax
 227:	89 04 24             	mov    %eax,(%esp)
 22a:	e8 10 02 00 00       	call   43f <fstat>
 22f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 232:	8b 45 f4             	mov    -0xc(%ebp),%eax
 235:	89 04 24             	mov    %eax,(%esp)
 238:	e8 d2 01 00 00       	call   40f <close>
  return r;
 23d:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 240:	c9                   	leave  
 241:	c3                   	ret    

00000242 <atoi>:

int
atoi(const char *s)
{
 242:	55                   	push   %ebp
 243:	89 e5                	mov    %esp,%ebp
 245:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 248:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 24f:	eb 25                	jmp    276 <atoi+0x34>
    n = n*10 + *s++ - '0';
 251:	8b 55 fc             	mov    -0x4(%ebp),%edx
 254:	89 d0                	mov    %edx,%eax
 256:	c1 e0 02             	shl    $0x2,%eax
 259:	01 d0                	add    %edx,%eax
 25b:	01 c0                	add    %eax,%eax
 25d:	89 c1                	mov    %eax,%ecx
 25f:	8b 45 08             	mov    0x8(%ebp),%eax
 262:	8d 50 01             	lea    0x1(%eax),%edx
 265:	89 55 08             	mov    %edx,0x8(%ebp)
 268:	0f b6 00             	movzbl (%eax),%eax
 26b:	0f be c0             	movsbl %al,%eax
 26e:	01 c8                	add    %ecx,%eax
 270:	83 e8 30             	sub    $0x30,%eax
 273:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 276:	8b 45 08             	mov    0x8(%ebp),%eax
 279:	0f b6 00             	movzbl (%eax),%eax
 27c:	3c 2f                	cmp    $0x2f,%al
 27e:	7e 0a                	jle    28a <atoi+0x48>
 280:	8b 45 08             	mov    0x8(%ebp),%eax
 283:	0f b6 00             	movzbl (%eax),%eax
 286:	3c 39                	cmp    $0x39,%al
 288:	7e c7                	jle    251 <atoi+0xf>
  return n;
 28a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 28d:	c9                   	leave  
 28e:	c3                   	ret    

0000028f <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 28f:	55                   	push   %ebp
 290:	89 e5                	mov    %esp,%ebp
 292:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 295:	8b 45 08             	mov    0x8(%ebp),%eax
 298:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 29b:	8b 45 0c             	mov    0xc(%ebp),%eax
 29e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2a1:	eb 17                	jmp    2ba <memmove+0x2b>
    *dst++ = *src++;
 2a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2a6:	8d 50 01             	lea    0x1(%eax),%edx
 2a9:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2ac:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2af:	8d 4a 01             	lea    0x1(%edx),%ecx
 2b2:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2b5:	0f b6 12             	movzbl (%edx),%edx
 2b8:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2ba:	8b 45 10             	mov    0x10(%ebp),%eax
 2bd:	8d 50 ff             	lea    -0x1(%eax),%edx
 2c0:	89 55 10             	mov    %edx,0x10(%ebp)
 2c3:	85 c0                	test   %eax,%eax
 2c5:	7f dc                	jg     2a3 <memmove+0x14>
  return vdst;
 2c7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2ca:	c9                   	leave  
 2cb:	c3                   	ret    

000002cc <ps>:

void
ps() {
 2cc:	55                   	push   %ebp
 2cd:	89 e5                	mov    %esp,%ebp
 2cf:	57                   	push   %edi
 2d0:	56                   	push   %esi
 2d1:	53                   	push   %ebx
 2d2:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  int i = 0;
 2d8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  printf(1, "PID	TKTS	TCKS	STAT	NAME\n");
 2df:	c7 44 24 04 44 09 00 	movl   $0x944,0x4(%esp)
 2e6:	00 
 2e7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2ee:	e8 7c 02 00 00       	call   56f <printf>
  getpinfo(&pstat);
 2f3:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 2f9:	89 04 24             	mov    %eax,(%esp)
 2fc:	e8 86 01 00 00       	call   487 <getpinfo>
  while (pstat[i].pid != 0) {
 301:	e9 ad 00 00 00       	jmp    3b3 <ps+0xe7>
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
	pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 306:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 30c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 30f:	89 d0                	mov    %edx,%eax
 311:	c1 e0 03             	shl    $0x3,%eax
 314:	01 d0                	add    %edx,%eax
 316:	c1 e0 02             	shl    $0x2,%eax
 319:	83 c0 10             	add    $0x10,%eax
 31c:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 31f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 322:	89 d0                	mov    %edx,%eax
 324:	c1 e0 03             	shl    $0x3,%eax
 327:	01 d0                	add    %edx,%eax
 329:	c1 e0 02             	shl    $0x2,%eax
 32c:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 32f:	01 d8                	add    %ebx,%eax
 331:	2d e4 08 00 00       	sub    $0x8e4,%eax
 336:	0f b6 00             	movzbl (%eax),%eax
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
 339:	0f be f0             	movsbl %al,%esi
 33c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 33f:	89 d0                	mov    %edx,%eax
 341:	c1 e0 03             	shl    $0x3,%eax
 344:	01 d0                	add    %edx,%eax
 346:	c1 e0 02             	shl    $0x2,%eax
 349:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 34c:	01 c8                	add    %ecx,%eax
 34e:	2d f8 08 00 00       	sub    $0x8f8,%eax
 353:	8b 18                	mov    (%eax),%ebx
 355:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 358:	89 d0                	mov    %edx,%eax
 35a:	c1 e0 03             	shl    $0x3,%eax
 35d:	01 d0                	add    %edx,%eax
 35f:	c1 e0 02             	shl    $0x2,%eax
 362:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 365:	01 c8                	add    %ecx,%eax
 367:	2d 00 09 00 00       	sub    $0x900,%eax
 36c:	8b 08                	mov    (%eax),%ecx
 36e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 371:	89 d0                	mov    %edx,%eax
 373:	c1 e0 03             	shl    $0x3,%eax
 376:	01 d0                	add    %edx,%eax
 378:	c1 e0 02             	shl    $0x2,%eax
 37b:	8d 55 e8             	lea    -0x18(%ebp),%edx
 37e:	01 d0                	add    %edx,%eax
 380:	2d fc 08 00 00       	sub    $0x8fc,%eax
 385:	8b 00                	mov    (%eax),%eax
 387:	89 7c 24 18          	mov    %edi,0x18(%esp)
 38b:	89 74 24 14          	mov    %esi,0x14(%esp)
 38f:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 393:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 397:	89 44 24 08          	mov    %eax,0x8(%esp)
 39b:	c7 44 24 04 5d 09 00 	movl   $0x95d,0x4(%esp)
 3a2:	00 
 3a3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3aa:	e8 c0 01 00 00       	call   56f <printf>
      i++;
 3af:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  while (pstat[i].pid != 0) {
 3b3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3b6:	89 d0                	mov    %edx,%eax
 3b8:	c1 e0 03             	shl    $0x3,%eax
 3bb:	01 d0                	add    %edx,%eax
 3bd:	c1 e0 02             	shl    $0x2,%eax
 3c0:	8d 75 e8             	lea    -0x18(%ebp),%esi
 3c3:	01 f0                	add    %esi,%eax
 3c5:	2d fc 08 00 00       	sub    $0x8fc,%eax
 3ca:	8b 00                	mov    (%eax),%eax
 3cc:	85 c0                	test   %eax,%eax
 3ce:	0f 85 32 ff ff ff    	jne    306 <ps+0x3a>
  }
}
 3d4:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 3da:	5b                   	pop    %ebx
 3db:	5e                   	pop    %esi
 3dc:	5f                   	pop    %edi
 3dd:	5d                   	pop    %ebp
 3de:	c3                   	ret    

000003df <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3df:	b8 01 00 00 00       	mov    $0x1,%eax
 3e4:	cd 40                	int    $0x40
 3e6:	c3                   	ret    

000003e7 <exit>:
SYSCALL(exit)
 3e7:	b8 02 00 00 00       	mov    $0x2,%eax
 3ec:	cd 40                	int    $0x40
 3ee:	c3                   	ret    

000003ef <wait>:
SYSCALL(wait)
 3ef:	b8 03 00 00 00       	mov    $0x3,%eax
 3f4:	cd 40                	int    $0x40
 3f6:	c3                   	ret    

000003f7 <pipe>:
SYSCALL(pipe)
 3f7:	b8 04 00 00 00       	mov    $0x4,%eax
 3fc:	cd 40                	int    $0x40
 3fe:	c3                   	ret    

000003ff <read>:
SYSCALL(read)
 3ff:	b8 05 00 00 00       	mov    $0x5,%eax
 404:	cd 40                	int    $0x40
 406:	c3                   	ret    

00000407 <write>:
SYSCALL(write)
 407:	b8 10 00 00 00       	mov    $0x10,%eax
 40c:	cd 40                	int    $0x40
 40e:	c3                   	ret    

0000040f <close>:
SYSCALL(close)
 40f:	b8 15 00 00 00       	mov    $0x15,%eax
 414:	cd 40                	int    $0x40
 416:	c3                   	ret    

00000417 <kill>:
SYSCALL(kill)
 417:	b8 06 00 00 00       	mov    $0x6,%eax
 41c:	cd 40                	int    $0x40
 41e:	c3                   	ret    

0000041f <exec>:
SYSCALL(exec)
 41f:	b8 07 00 00 00       	mov    $0x7,%eax
 424:	cd 40                	int    $0x40
 426:	c3                   	ret    

00000427 <open>:
SYSCALL(open)
 427:	b8 0f 00 00 00       	mov    $0xf,%eax
 42c:	cd 40                	int    $0x40
 42e:	c3                   	ret    

0000042f <mknod>:
SYSCALL(mknod)
 42f:	b8 11 00 00 00       	mov    $0x11,%eax
 434:	cd 40                	int    $0x40
 436:	c3                   	ret    

00000437 <unlink>:
SYSCALL(unlink)
 437:	b8 12 00 00 00       	mov    $0x12,%eax
 43c:	cd 40                	int    $0x40
 43e:	c3                   	ret    

0000043f <fstat>:
SYSCALL(fstat)
 43f:	b8 08 00 00 00       	mov    $0x8,%eax
 444:	cd 40                	int    $0x40
 446:	c3                   	ret    

00000447 <link>:
SYSCALL(link)
 447:	b8 13 00 00 00       	mov    $0x13,%eax
 44c:	cd 40                	int    $0x40
 44e:	c3                   	ret    

0000044f <mkdir>:
SYSCALL(mkdir)
 44f:	b8 14 00 00 00       	mov    $0x14,%eax
 454:	cd 40                	int    $0x40
 456:	c3                   	ret    

00000457 <chdir>:
SYSCALL(chdir)
 457:	b8 09 00 00 00       	mov    $0x9,%eax
 45c:	cd 40                	int    $0x40
 45e:	c3                   	ret    

0000045f <dup>:
SYSCALL(dup)
 45f:	b8 0a 00 00 00       	mov    $0xa,%eax
 464:	cd 40                	int    $0x40
 466:	c3                   	ret    

00000467 <getpid>:
SYSCALL(getpid)
 467:	b8 0b 00 00 00       	mov    $0xb,%eax
 46c:	cd 40                	int    $0x40
 46e:	c3                   	ret    

0000046f <sbrk>:
SYSCALL(sbrk)
 46f:	b8 0c 00 00 00       	mov    $0xc,%eax
 474:	cd 40                	int    $0x40
 476:	c3                   	ret    

00000477 <sleep>:
SYSCALL(sleep)
 477:	b8 0d 00 00 00       	mov    $0xd,%eax
 47c:	cd 40                	int    $0x40
 47e:	c3                   	ret    

0000047f <uptime>:
SYSCALL(uptime)
 47f:	b8 0e 00 00 00       	mov    $0xe,%eax
 484:	cd 40                	int    $0x40
 486:	c3                   	ret    

00000487 <getpinfo>:
SYSCALL(getpinfo)
 487:	b8 16 00 00 00       	mov    $0x16,%eax
 48c:	cd 40                	int    $0x40
 48e:	c3                   	ret    

0000048f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 48f:	55                   	push   %ebp
 490:	89 e5                	mov    %esp,%ebp
 492:	83 ec 18             	sub    $0x18,%esp
 495:	8b 45 0c             	mov    0xc(%ebp),%eax
 498:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 49b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4a2:	00 
 4a3:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 4aa:	8b 45 08             	mov    0x8(%ebp),%eax
 4ad:	89 04 24             	mov    %eax,(%esp)
 4b0:	e8 52 ff ff ff       	call   407 <write>
}
 4b5:	c9                   	leave  
 4b6:	c3                   	ret    

000004b7 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4b7:	55                   	push   %ebp
 4b8:	89 e5                	mov    %esp,%ebp
 4ba:	56                   	push   %esi
 4bb:	53                   	push   %ebx
 4bc:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4bf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4c6:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4ca:	74 17                	je     4e3 <printint+0x2c>
 4cc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4d0:	79 11                	jns    4e3 <printint+0x2c>
    neg = 1;
 4d2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4d9:	8b 45 0c             	mov    0xc(%ebp),%eax
 4dc:	f7 d8                	neg    %eax
 4de:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4e1:	eb 06                	jmp    4e9 <printint+0x32>
  } else {
    x = xx;
 4e3:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4e9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4f0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4f3:	8d 41 01             	lea    0x1(%ecx),%eax
 4f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4f9:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4ff:	ba 00 00 00 00       	mov    $0x0,%edx
 504:	f7 f3                	div    %ebx
 506:	89 d0                	mov    %edx,%eax
 508:	0f b6 80 e8 0b 00 00 	movzbl 0xbe8(%eax),%eax
 50f:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 513:	8b 75 10             	mov    0x10(%ebp),%esi
 516:	8b 45 ec             	mov    -0x14(%ebp),%eax
 519:	ba 00 00 00 00       	mov    $0x0,%edx
 51e:	f7 f6                	div    %esi
 520:	89 45 ec             	mov    %eax,-0x14(%ebp)
 523:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 527:	75 c7                	jne    4f0 <printint+0x39>
  if(neg)
 529:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 52d:	74 10                	je     53f <printint+0x88>
    buf[i++] = '-';
 52f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 532:	8d 50 01             	lea    0x1(%eax),%edx
 535:	89 55 f4             	mov    %edx,-0xc(%ebp)
 538:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 53d:	eb 1f                	jmp    55e <printint+0xa7>
 53f:	eb 1d                	jmp    55e <printint+0xa7>
    putc(fd, buf[i]);
 541:	8d 55 dc             	lea    -0x24(%ebp),%edx
 544:	8b 45 f4             	mov    -0xc(%ebp),%eax
 547:	01 d0                	add    %edx,%eax
 549:	0f b6 00             	movzbl (%eax),%eax
 54c:	0f be c0             	movsbl %al,%eax
 54f:	89 44 24 04          	mov    %eax,0x4(%esp)
 553:	8b 45 08             	mov    0x8(%ebp),%eax
 556:	89 04 24             	mov    %eax,(%esp)
 559:	e8 31 ff ff ff       	call   48f <putc>
  while(--i >= 0)
 55e:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 562:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 566:	79 d9                	jns    541 <printint+0x8a>
}
 568:	83 c4 30             	add    $0x30,%esp
 56b:	5b                   	pop    %ebx
 56c:	5e                   	pop    %esi
 56d:	5d                   	pop    %ebp
 56e:	c3                   	ret    

0000056f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 56f:	55                   	push   %ebp
 570:	89 e5                	mov    %esp,%ebp
 572:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 575:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 57c:	8d 45 0c             	lea    0xc(%ebp),%eax
 57f:	83 c0 04             	add    $0x4,%eax
 582:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 585:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 58c:	e9 7c 01 00 00       	jmp    70d <printf+0x19e>
    c = fmt[i] & 0xff;
 591:	8b 55 0c             	mov    0xc(%ebp),%edx
 594:	8b 45 f0             	mov    -0x10(%ebp),%eax
 597:	01 d0                	add    %edx,%eax
 599:	0f b6 00             	movzbl (%eax),%eax
 59c:	0f be c0             	movsbl %al,%eax
 59f:	25 ff 00 00 00       	and    $0xff,%eax
 5a4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5a7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5ab:	75 2c                	jne    5d9 <printf+0x6a>
      if(c == '%'){
 5ad:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5b1:	75 0c                	jne    5bf <printf+0x50>
        state = '%';
 5b3:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5ba:	e9 4a 01 00 00       	jmp    709 <printf+0x19a>
      } else {
        putc(fd, c);
 5bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5c2:	0f be c0             	movsbl %al,%eax
 5c5:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c9:	8b 45 08             	mov    0x8(%ebp),%eax
 5cc:	89 04 24             	mov    %eax,(%esp)
 5cf:	e8 bb fe ff ff       	call   48f <putc>
 5d4:	e9 30 01 00 00       	jmp    709 <printf+0x19a>
      }
    } else if(state == '%'){
 5d9:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5dd:	0f 85 26 01 00 00    	jne    709 <printf+0x19a>
      if(c == 'd'){
 5e3:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5e7:	75 2d                	jne    616 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5e9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5ec:	8b 00                	mov    (%eax),%eax
 5ee:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5f5:	00 
 5f6:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5fd:	00 
 5fe:	89 44 24 04          	mov    %eax,0x4(%esp)
 602:	8b 45 08             	mov    0x8(%ebp),%eax
 605:	89 04 24             	mov    %eax,(%esp)
 608:	e8 aa fe ff ff       	call   4b7 <printint>
        ap++;
 60d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 611:	e9 ec 00 00 00       	jmp    702 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 616:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 61a:	74 06                	je     622 <printf+0xb3>
 61c:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 620:	75 2d                	jne    64f <printf+0xe0>
        printint(fd, *ap, 16, 0);
 622:	8b 45 e8             	mov    -0x18(%ebp),%eax
 625:	8b 00                	mov    (%eax),%eax
 627:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 62e:	00 
 62f:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 636:	00 
 637:	89 44 24 04          	mov    %eax,0x4(%esp)
 63b:	8b 45 08             	mov    0x8(%ebp),%eax
 63e:	89 04 24             	mov    %eax,(%esp)
 641:	e8 71 fe ff ff       	call   4b7 <printint>
        ap++;
 646:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 64a:	e9 b3 00 00 00       	jmp    702 <printf+0x193>
      } else if(c == 's'){
 64f:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 653:	75 45                	jne    69a <printf+0x12b>
        s = (char*)*ap;
 655:	8b 45 e8             	mov    -0x18(%ebp),%eax
 658:	8b 00                	mov    (%eax),%eax
 65a:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 65d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 661:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 665:	75 09                	jne    670 <printf+0x101>
          s = "(null)";
 667:	c7 45 f4 6d 09 00 00 	movl   $0x96d,-0xc(%ebp)
        while(*s != 0){
 66e:	eb 1e                	jmp    68e <printf+0x11f>
 670:	eb 1c                	jmp    68e <printf+0x11f>
          putc(fd, *s);
 672:	8b 45 f4             	mov    -0xc(%ebp),%eax
 675:	0f b6 00             	movzbl (%eax),%eax
 678:	0f be c0             	movsbl %al,%eax
 67b:	89 44 24 04          	mov    %eax,0x4(%esp)
 67f:	8b 45 08             	mov    0x8(%ebp),%eax
 682:	89 04 24             	mov    %eax,(%esp)
 685:	e8 05 fe ff ff       	call   48f <putc>
          s++;
 68a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 68e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 691:	0f b6 00             	movzbl (%eax),%eax
 694:	84 c0                	test   %al,%al
 696:	75 da                	jne    672 <printf+0x103>
 698:	eb 68                	jmp    702 <printf+0x193>
        }
      } else if(c == 'c'){
 69a:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 69e:	75 1d                	jne    6bd <printf+0x14e>
        putc(fd, *ap);
 6a0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6a3:	8b 00                	mov    (%eax),%eax
 6a5:	0f be c0             	movsbl %al,%eax
 6a8:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ac:	8b 45 08             	mov    0x8(%ebp),%eax
 6af:	89 04 24             	mov    %eax,(%esp)
 6b2:	e8 d8 fd ff ff       	call   48f <putc>
        ap++;
 6b7:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6bb:	eb 45                	jmp    702 <printf+0x193>
      } else if(c == '%'){
 6bd:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6c1:	75 17                	jne    6da <printf+0x16b>
        putc(fd, c);
 6c3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6c6:	0f be c0             	movsbl %al,%eax
 6c9:	89 44 24 04          	mov    %eax,0x4(%esp)
 6cd:	8b 45 08             	mov    0x8(%ebp),%eax
 6d0:	89 04 24             	mov    %eax,(%esp)
 6d3:	e8 b7 fd ff ff       	call   48f <putc>
 6d8:	eb 28                	jmp    702 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6da:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6e1:	00 
 6e2:	8b 45 08             	mov    0x8(%ebp),%eax
 6e5:	89 04 24             	mov    %eax,(%esp)
 6e8:	e8 a2 fd ff ff       	call   48f <putc>
        putc(fd, c);
 6ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6f0:	0f be c0             	movsbl %al,%eax
 6f3:	89 44 24 04          	mov    %eax,0x4(%esp)
 6f7:	8b 45 08             	mov    0x8(%ebp),%eax
 6fa:	89 04 24             	mov    %eax,(%esp)
 6fd:	e8 8d fd ff ff       	call   48f <putc>
      }
      state = 0;
 702:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 709:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 70d:	8b 55 0c             	mov    0xc(%ebp),%edx
 710:	8b 45 f0             	mov    -0x10(%ebp),%eax
 713:	01 d0                	add    %edx,%eax
 715:	0f b6 00             	movzbl (%eax),%eax
 718:	84 c0                	test   %al,%al
 71a:	0f 85 71 fe ff ff    	jne    591 <printf+0x22>
    }
  }
}
 720:	c9                   	leave  
 721:	c3                   	ret    

00000722 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 722:	55                   	push   %ebp
 723:	89 e5                	mov    %esp,%ebp
 725:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 728:	8b 45 08             	mov    0x8(%ebp),%eax
 72b:	83 e8 08             	sub    $0x8,%eax
 72e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 731:	a1 04 0c 00 00       	mov    0xc04,%eax
 736:	89 45 fc             	mov    %eax,-0x4(%ebp)
 739:	eb 24                	jmp    75f <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 73b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73e:	8b 00                	mov    (%eax),%eax
 740:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 743:	77 12                	ja     757 <free+0x35>
 745:	8b 45 f8             	mov    -0x8(%ebp),%eax
 748:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 74b:	77 24                	ja     771 <free+0x4f>
 74d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 750:	8b 00                	mov    (%eax),%eax
 752:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 755:	77 1a                	ja     771 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 757:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75a:	8b 00                	mov    (%eax),%eax
 75c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 75f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 762:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 765:	76 d4                	jbe    73b <free+0x19>
 767:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76a:	8b 00                	mov    (%eax),%eax
 76c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 76f:	76 ca                	jbe    73b <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 771:	8b 45 f8             	mov    -0x8(%ebp),%eax
 774:	8b 40 04             	mov    0x4(%eax),%eax
 777:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 77e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 781:	01 c2                	add    %eax,%edx
 783:	8b 45 fc             	mov    -0x4(%ebp),%eax
 786:	8b 00                	mov    (%eax),%eax
 788:	39 c2                	cmp    %eax,%edx
 78a:	75 24                	jne    7b0 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 78c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78f:	8b 50 04             	mov    0x4(%eax),%edx
 792:	8b 45 fc             	mov    -0x4(%ebp),%eax
 795:	8b 00                	mov    (%eax),%eax
 797:	8b 40 04             	mov    0x4(%eax),%eax
 79a:	01 c2                	add    %eax,%edx
 79c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 79f:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a5:	8b 00                	mov    (%eax),%eax
 7a7:	8b 10                	mov    (%eax),%edx
 7a9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ac:	89 10                	mov    %edx,(%eax)
 7ae:	eb 0a                	jmp    7ba <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b3:	8b 10                	mov    (%eax),%edx
 7b5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b8:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bd:	8b 40 04             	mov    0x4(%eax),%eax
 7c0:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ca:	01 d0                	add    %edx,%eax
 7cc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7cf:	75 20                	jne    7f1 <free+0xcf>
    p->s.size += bp->s.size;
 7d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d4:	8b 50 04             	mov    0x4(%eax),%edx
 7d7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7da:	8b 40 04             	mov    0x4(%eax),%eax
 7dd:	01 c2                	add    %eax,%edx
 7df:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e8:	8b 10                	mov    (%eax),%edx
 7ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ed:	89 10                	mov    %edx,(%eax)
 7ef:	eb 08                	jmp    7f9 <free+0xd7>
  } else
    p->s.ptr = bp;
 7f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f4:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7f7:	89 10                	mov    %edx,(%eax)
  freep = p;
 7f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fc:	a3 04 0c 00 00       	mov    %eax,0xc04
}
 801:	c9                   	leave  
 802:	c3                   	ret    

00000803 <morecore>:

static Header*
morecore(uint nu)
{
 803:	55                   	push   %ebp
 804:	89 e5                	mov    %esp,%ebp
 806:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 809:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 810:	77 07                	ja     819 <morecore+0x16>
    nu = 4096;
 812:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 819:	8b 45 08             	mov    0x8(%ebp),%eax
 81c:	c1 e0 03             	shl    $0x3,%eax
 81f:	89 04 24             	mov    %eax,(%esp)
 822:	e8 48 fc ff ff       	call   46f <sbrk>
 827:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 82a:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 82e:	75 07                	jne    837 <morecore+0x34>
    return 0;
 830:	b8 00 00 00 00       	mov    $0x0,%eax
 835:	eb 22                	jmp    859 <morecore+0x56>
  hp = (Header*)p;
 837:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 83d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 840:	8b 55 08             	mov    0x8(%ebp),%edx
 843:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 846:	8b 45 f0             	mov    -0x10(%ebp),%eax
 849:	83 c0 08             	add    $0x8,%eax
 84c:	89 04 24             	mov    %eax,(%esp)
 84f:	e8 ce fe ff ff       	call   722 <free>
  return freep;
 854:	a1 04 0c 00 00       	mov    0xc04,%eax
}
 859:	c9                   	leave  
 85a:	c3                   	ret    

0000085b <malloc>:

void*
malloc(uint nbytes)
{
 85b:	55                   	push   %ebp
 85c:	89 e5                	mov    %esp,%ebp
 85e:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 861:	8b 45 08             	mov    0x8(%ebp),%eax
 864:	83 c0 07             	add    $0x7,%eax
 867:	c1 e8 03             	shr    $0x3,%eax
 86a:	83 c0 01             	add    $0x1,%eax
 86d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 870:	a1 04 0c 00 00       	mov    0xc04,%eax
 875:	89 45 f0             	mov    %eax,-0x10(%ebp)
 878:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 87c:	75 23                	jne    8a1 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 87e:	c7 45 f0 fc 0b 00 00 	movl   $0xbfc,-0x10(%ebp)
 885:	8b 45 f0             	mov    -0x10(%ebp),%eax
 888:	a3 04 0c 00 00       	mov    %eax,0xc04
 88d:	a1 04 0c 00 00       	mov    0xc04,%eax
 892:	a3 fc 0b 00 00       	mov    %eax,0xbfc
    base.s.size = 0;
 897:	c7 05 00 0c 00 00 00 	movl   $0x0,0xc00
 89e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a4:	8b 00                	mov    (%eax),%eax
 8a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ac:	8b 40 04             	mov    0x4(%eax),%eax
 8af:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8b2:	72 4d                	jb     901 <malloc+0xa6>
      if(p->s.size == nunits)
 8b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b7:	8b 40 04             	mov    0x4(%eax),%eax
 8ba:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8bd:	75 0c                	jne    8cb <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c2:	8b 10                	mov    (%eax),%edx
 8c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c7:	89 10                	mov    %edx,(%eax)
 8c9:	eb 26                	jmp    8f1 <malloc+0x96>
      else {
        p->s.size -= nunits;
 8cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ce:	8b 40 04             	mov    0x4(%eax),%eax
 8d1:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8d4:	89 c2                	mov    %eax,%edx
 8d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8df:	8b 40 04             	mov    0x4(%eax),%eax
 8e2:	c1 e0 03             	shl    $0x3,%eax
 8e5:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8eb:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8ee:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f4:	a3 04 0c 00 00       	mov    %eax,0xc04
      return (void*)(p + 1);
 8f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8fc:	83 c0 08             	add    $0x8,%eax
 8ff:	eb 38                	jmp    939 <malloc+0xde>
    }
    if(p == freep)
 901:	a1 04 0c 00 00       	mov    0xc04,%eax
 906:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 909:	75 1b                	jne    926 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 90b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 90e:	89 04 24             	mov    %eax,(%esp)
 911:	e8 ed fe ff ff       	call   803 <morecore>
 916:	89 45 f4             	mov    %eax,-0xc(%ebp)
 919:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 91d:	75 07                	jne    926 <malloc+0xcb>
        return 0;
 91f:	b8 00 00 00 00       	mov    $0x0,%eax
 924:	eb 13                	jmp    939 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 926:	8b 45 f4             	mov    -0xc(%ebp),%eax
 929:	89 45 f0             	mov    %eax,-0x10(%ebp)
 92c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 92f:	8b 00                	mov    (%eax),%eax
 931:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 934:	e9 70 ff ff ff       	jmp    8a9 <malloc+0x4e>
}
 939:	c9                   	leave  
 93a:	c3                   	ret    
