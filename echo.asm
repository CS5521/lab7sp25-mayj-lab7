
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
  1f:	b8 43 09 00 00       	mov    $0x943,%eax
  24:	eb 05                	jmp    2b <main+0x2b>
  26:	b8 45 09 00 00       	mov    $0x945,%eax
  2b:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  2f:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
  36:	8b 55 0c             	mov    0xc(%ebp),%edx
  39:	01 ca                	add    %ecx,%edx
  3b:	8b 12                	mov    (%edx),%edx
  3d:	89 44 24 0c          	mov    %eax,0xc(%esp)
  41:	89 54 24 08          	mov    %edx,0x8(%esp)
  45:	c7 44 24 04 47 09 00 	movl   $0x947,0x4(%esp)
  4c:	00 
  4d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  54:	e8 1e 05 00 00       	call   577 <printf>
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
 2df:	c7 44 24 04 4c 09 00 	movl   $0x94c,0x4(%esp)
 2e6:	00 
 2e7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2ee:	e8 84 02 00 00       	call   577 <printf>
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
 39b:	c7 44 24 04 65 09 00 	movl   $0x965,0x4(%esp)
 3a2:	00 
 3a3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3aa:	e8 c8 01 00 00       	call   577 <printf>
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

0000048f <settickets>:
SYSCALL(settickets)
 48f:	b8 17 00 00 00       	mov    $0x17,%eax
 494:	cd 40                	int    $0x40
 496:	c3                   	ret    

00000497 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 497:	55                   	push   %ebp
 498:	89 e5                	mov    %esp,%ebp
 49a:	83 ec 18             	sub    $0x18,%esp
 49d:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a0:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4a3:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4aa:	00 
 4ab:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4ae:	89 44 24 04          	mov    %eax,0x4(%esp)
 4b2:	8b 45 08             	mov    0x8(%ebp),%eax
 4b5:	89 04 24             	mov    %eax,(%esp)
 4b8:	e8 4a ff ff ff       	call   407 <write>
}
 4bd:	c9                   	leave  
 4be:	c3                   	ret    

000004bf <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4bf:	55                   	push   %ebp
 4c0:	89 e5                	mov    %esp,%ebp
 4c2:	56                   	push   %esi
 4c3:	53                   	push   %ebx
 4c4:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4c7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4ce:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4d2:	74 17                	je     4eb <printint+0x2c>
 4d4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4d8:	79 11                	jns    4eb <printint+0x2c>
    neg = 1;
 4da:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4e1:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e4:	f7 d8                	neg    %eax
 4e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4e9:	eb 06                	jmp    4f1 <printint+0x32>
  } else {
    x = xx;
 4eb:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4f1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4f8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4fb:	8d 41 01             	lea    0x1(%ecx),%eax
 4fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
 501:	8b 5d 10             	mov    0x10(%ebp),%ebx
 504:	8b 45 ec             	mov    -0x14(%ebp),%eax
 507:	ba 00 00 00 00       	mov    $0x0,%edx
 50c:	f7 f3                	div    %ebx
 50e:	89 d0                	mov    %edx,%eax
 510:	0f b6 80 f0 0b 00 00 	movzbl 0xbf0(%eax),%eax
 517:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 51b:	8b 75 10             	mov    0x10(%ebp),%esi
 51e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 521:	ba 00 00 00 00       	mov    $0x0,%edx
 526:	f7 f6                	div    %esi
 528:	89 45 ec             	mov    %eax,-0x14(%ebp)
 52b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 52f:	75 c7                	jne    4f8 <printint+0x39>
  if(neg)
 531:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 535:	74 10                	je     547 <printint+0x88>
    buf[i++] = '-';
 537:	8b 45 f4             	mov    -0xc(%ebp),%eax
 53a:	8d 50 01             	lea    0x1(%eax),%edx
 53d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 540:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 545:	eb 1f                	jmp    566 <printint+0xa7>
 547:	eb 1d                	jmp    566 <printint+0xa7>
    putc(fd, buf[i]);
 549:	8d 55 dc             	lea    -0x24(%ebp),%edx
 54c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 54f:	01 d0                	add    %edx,%eax
 551:	0f b6 00             	movzbl (%eax),%eax
 554:	0f be c0             	movsbl %al,%eax
 557:	89 44 24 04          	mov    %eax,0x4(%esp)
 55b:	8b 45 08             	mov    0x8(%ebp),%eax
 55e:	89 04 24             	mov    %eax,(%esp)
 561:	e8 31 ff ff ff       	call   497 <putc>
  while(--i >= 0)
 566:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 56a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 56e:	79 d9                	jns    549 <printint+0x8a>
}
 570:	83 c4 30             	add    $0x30,%esp
 573:	5b                   	pop    %ebx
 574:	5e                   	pop    %esi
 575:	5d                   	pop    %ebp
 576:	c3                   	ret    

00000577 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 577:	55                   	push   %ebp
 578:	89 e5                	mov    %esp,%ebp
 57a:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 57d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 584:	8d 45 0c             	lea    0xc(%ebp),%eax
 587:	83 c0 04             	add    $0x4,%eax
 58a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 58d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 594:	e9 7c 01 00 00       	jmp    715 <printf+0x19e>
    c = fmt[i] & 0xff;
 599:	8b 55 0c             	mov    0xc(%ebp),%edx
 59c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 59f:	01 d0                	add    %edx,%eax
 5a1:	0f b6 00             	movzbl (%eax),%eax
 5a4:	0f be c0             	movsbl %al,%eax
 5a7:	25 ff 00 00 00       	and    $0xff,%eax
 5ac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5af:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5b3:	75 2c                	jne    5e1 <printf+0x6a>
      if(c == '%'){
 5b5:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5b9:	75 0c                	jne    5c7 <printf+0x50>
        state = '%';
 5bb:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5c2:	e9 4a 01 00 00       	jmp    711 <printf+0x19a>
      } else {
        putc(fd, c);
 5c7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5ca:	0f be c0             	movsbl %al,%eax
 5cd:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d1:	8b 45 08             	mov    0x8(%ebp),%eax
 5d4:	89 04 24             	mov    %eax,(%esp)
 5d7:	e8 bb fe ff ff       	call   497 <putc>
 5dc:	e9 30 01 00 00       	jmp    711 <printf+0x19a>
      }
    } else if(state == '%'){
 5e1:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5e5:	0f 85 26 01 00 00    	jne    711 <printf+0x19a>
      if(c == 'd'){
 5eb:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5ef:	75 2d                	jne    61e <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5f1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5f4:	8b 00                	mov    (%eax),%eax
 5f6:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5fd:	00 
 5fe:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 605:	00 
 606:	89 44 24 04          	mov    %eax,0x4(%esp)
 60a:	8b 45 08             	mov    0x8(%ebp),%eax
 60d:	89 04 24             	mov    %eax,(%esp)
 610:	e8 aa fe ff ff       	call   4bf <printint>
        ap++;
 615:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 619:	e9 ec 00 00 00       	jmp    70a <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 61e:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 622:	74 06                	je     62a <printf+0xb3>
 624:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 628:	75 2d                	jne    657 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 62a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 62d:	8b 00                	mov    (%eax),%eax
 62f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 636:	00 
 637:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 63e:	00 
 63f:	89 44 24 04          	mov    %eax,0x4(%esp)
 643:	8b 45 08             	mov    0x8(%ebp),%eax
 646:	89 04 24             	mov    %eax,(%esp)
 649:	e8 71 fe ff ff       	call   4bf <printint>
        ap++;
 64e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 652:	e9 b3 00 00 00       	jmp    70a <printf+0x193>
      } else if(c == 's'){
 657:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 65b:	75 45                	jne    6a2 <printf+0x12b>
        s = (char*)*ap;
 65d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 660:	8b 00                	mov    (%eax),%eax
 662:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 665:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 669:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 66d:	75 09                	jne    678 <printf+0x101>
          s = "(null)";
 66f:	c7 45 f4 75 09 00 00 	movl   $0x975,-0xc(%ebp)
        while(*s != 0){
 676:	eb 1e                	jmp    696 <printf+0x11f>
 678:	eb 1c                	jmp    696 <printf+0x11f>
          putc(fd, *s);
 67a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 67d:	0f b6 00             	movzbl (%eax),%eax
 680:	0f be c0             	movsbl %al,%eax
 683:	89 44 24 04          	mov    %eax,0x4(%esp)
 687:	8b 45 08             	mov    0x8(%ebp),%eax
 68a:	89 04 24             	mov    %eax,(%esp)
 68d:	e8 05 fe ff ff       	call   497 <putc>
          s++;
 692:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 696:	8b 45 f4             	mov    -0xc(%ebp),%eax
 699:	0f b6 00             	movzbl (%eax),%eax
 69c:	84 c0                	test   %al,%al
 69e:	75 da                	jne    67a <printf+0x103>
 6a0:	eb 68                	jmp    70a <printf+0x193>
        }
      } else if(c == 'c'){
 6a2:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6a6:	75 1d                	jne    6c5 <printf+0x14e>
        putc(fd, *ap);
 6a8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6ab:	8b 00                	mov    (%eax),%eax
 6ad:	0f be c0             	movsbl %al,%eax
 6b0:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b4:	8b 45 08             	mov    0x8(%ebp),%eax
 6b7:	89 04 24             	mov    %eax,(%esp)
 6ba:	e8 d8 fd ff ff       	call   497 <putc>
        ap++;
 6bf:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6c3:	eb 45                	jmp    70a <printf+0x193>
      } else if(c == '%'){
 6c5:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6c9:	75 17                	jne    6e2 <printf+0x16b>
        putc(fd, c);
 6cb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6ce:	0f be c0             	movsbl %al,%eax
 6d1:	89 44 24 04          	mov    %eax,0x4(%esp)
 6d5:	8b 45 08             	mov    0x8(%ebp),%eax
 6d8:	89 04 24             	mov    %eax,(%esp)
 6db:	e8 b7 fd ff ff       	call   497 <putc>
 6e0:	eb 28                	jmp    70a <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6e2:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6e9:	00 
 6ea:	8b 45 08             	mov    0x8(%ebp),%eax
 6ed:	89 04 24             	mov    %eax,(%esp)
 6f0:	e8 a2 fd ff ff       	call   497 <putc>
        putc(fd, c);
 6f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6f8:	0f be c0             	movsbl %al,%eax
 6fb:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ff:	8b 45 08             	mov    0x8(%ebp),%eax
 702:	89 04 24             	mov    %eax,(%esp)
 705:	e8 8d fd ff ff       	call   497 <putc>
      }
      state = 0;
 70a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 711:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 715:	8b 55 0c             	mov    0xc(%ebp),%edx
 718:	8b 45 f0             	mov    -0x10(%ebp),%eax
 71b:	01 d0                	add    %edx,%eax
 71d:	0f b6 00             	movzbl (%eax),%eax
 720:	84 c0                	test   %al,%al
 722:	0f 85 71 fe ff ff    	jne    599 <printf+0x22>
    }
  }
}
 728:	c9                   	leave  
 729:	c3                   	ret    

0000072a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 72a:	55                   	push   %ebp
 72b:	89 e5                	mov    %esp,%ebp
 72d:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 730:	8b 45 08             	mov    0x8(%ebp),%eax
 733:	83 e8 08             	sub    $0x8,%eax
 736:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 739:	a1 0c 0c 00 00       	mov    0xc0c,%eax
 73e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 741:	eb 24                	jmp    767 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 743:	8b 45 fc             	mov    -0x4(%ebp),%eax
 746:	8b 00                	mov    (%eax),%eax
 748:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 74b:	77 12                	ja     75f <free+0x35>
 74d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 750:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 753:	77 24                	ja     779 <free+0x4f>
 755:	8b 45 fc             	mov    -0x4(%ebp),%eax
 758:	8b 00                	mov    (%eax),%eax
 75a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 75d:	77 1a                	ja     779 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 75f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 762:	8b 00                	mov    (%eax),%eax
 764:	89 45 fc             	mov    %eax,-0x4(%ebp)
 767:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 76d:	76 d4                	jbe    743 <free+0x19>
 76f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 772:	8b 00                	mov    (%eax),%eax
 774:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 777:	76 ca                	jbe    743 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 779:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77c:	8b 40 04             	mov    0x4(%eax),%eax
 77f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 786:	8b 45 f8             	mov    -0x8(%ebp),%eax
 789:	01 c2                	add    %eax,%edx
 78b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78e:	8b 00                	mov    (%eax),%eax
 790:	39 c2                	cmp    %eax,%edx
 792:	75 24                	jne    7b8 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 794:	8b 45 f8             	mov    -0x8(%ebp),%eax
 797:	8b 50 04             	mov    0x4(%eax),%edx
 79a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79d:	8b 00                	mov    (%eax),%eax
 79f:	8b 40 04             	mov    0x4(%eax),%eax
 7a2:	01 c2                	add    %eax,%edx
 7a4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a7:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ad:	8b 00                	mov    (%eax),%eax
 7af:	8b 10                	mov    (%eax),%edx
 7b1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b4:	89 10                	mov    %edx,(%eax)
 7b6:	eb 0a                	jmp    7c2 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bb:	8b 10                	mov    (%eax),%edx
 7bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c0:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c5:	8b 40 04             	mov    0x4(%eax),%eax
 7c8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d2:	01 d0                	add    %edx,%eax
 7d4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7d7:	75 20                	jne    7f9 <free+0xcf>
    p->s.size += bp->s.size;
 7d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7dc:	8b 50 04             	mov    0x4(%eax),%edx
 7df:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e2:	8b 40 04             	mov    0x4(%eax),%eax
 7e5:	01 c2                	add    %eax,%edx
 7e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ea:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7ed:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f0:	8b 10                	mov    (%eax),%edx
 7f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f5:	89 10                	mov    %edx,(%eax)
 7f7:	eb 08                	jmp    801 <free+0xd7>
  } else
    p->s.ptr = bp;
 7f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fc:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7ff:	89 10                	mov    %edx,(%eax)
  freep = p;
 801:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804:	a3 0c 0c 00 00       	mov    %eax,0xc0c
}
 809:	c9                   	leave  
 80a:	c3                   	ret    

0000080b <morecore>:

static Header*
morecore(uint nu)
{
 80b:	55                   	push   %ebp
 80c:	89 e5                	mov    %esp,%ebp
 80e:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 811:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 818:	77 07                	ja     821 <morecore+0x16>
    nu = 4096;
 81a:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 821:	8b 45 08             	mov    0x8(%ebp),%eax
 824:	c1 e0 03             	shl    $0x3,%eax
 827:	89 04 24             	mov    %eax,(%esp)
 82a:	e8 40 fc ff ff       	call   46f <sbrk>
 82f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 832:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 836:	75 07                	jne    83f <morecore+0x34>
    return 0;
 838:	b8 00 00 00 00       	mov    $0x0,%eax
 83d:	eb 22                	jmp    861 <morecore+0x56>
  hp = (Header*)p;
 83f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 842:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 845:	8b 45 f0             	mov    -0x10(%ebp),%eax
 848:	8b 55 08             	mov    0x8(%ebp),%edx
 84b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 84e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 851:	83 c0 08             	add    $0x8,%eax
 854:	89 04 24             	mov    %eax,(%esp)
 857:	e8 ce fe ff ff       	call   72a <free>
  return freep;
 85c:	a1 0c 0c 00 00       	mov    0xc0c,%eax
}
 861:	c9                   	leave  
 862:	c3                   	ret    

00000863 <malloc>:

void*
malloc(uint nbytes)
{
 863:	55                   	push   %ebp
 864:	89 e5                	mov    %esp,%ebp
 866:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 869:	8b 45 08             	mov    0x8(%ebp),%eax
 86c:	83 c0 07             	add    $0x7,%eax
 86f:	c1 e8 03             	shr    $0x3,%eax
 872:	83 c0 01             	add    $0x1,%eax
 875:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 878:	a1 0c 0c 00 00       	mov    0xc0c,%eax
 87d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 880:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 884:	75 23                	jne    8a9 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 886:	c7 45 f0 04 0c 00 00 	movl   $0xc04,-0x10(%ebp)
 88d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 890:	a3 0c 0c 00 00       	mov    %eax,0xc0c
 895:	a1 0c 0c 00 00       	mov    0xc0c,%eax
 89a:	a3 04 0c 00 00       	mov    %eax,0xc04
    base.s.size = 0;
 89f:	c7 05 08 0c 00 00 00 	movl   $0x0,0xc08
 8a6:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ac:	8b 00                	mov    (%eax),%eax
 8ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b4:	8b 40 04             	mov    0x4(%eax),%eax
 8b7:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8ba:	72 4d                	jb     909 <malloc+0xa6>
      if(p->s.size == nunits)
 8bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8bf:	8b 40 04             	mov    0x4(%eax),%eax
 8c2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8c5:	75 0c                	jne    8d3 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ca:	8b 10                	mov    (%eax),%edx
 8cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8cf:	89 10                	mov    %edx,(%eax)
 8d1:	eb 26                	jmp    8f9 <malloc+0x96>
      else {
        p->s.size -= nunits;
 8d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d6:	8b 40 04             	mov    0x4(%eax),%eax
 8d9:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8dc:	89 c2                	mov    %eax,%edx
 8de:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e7:	8b 40 04             	mov    0x4(%eax),%eax
 8ea:	c1 e0 03             	shl    $0x3,%eax
 8ed:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f3:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8f6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8fc:	a3 0c 0c 00 00       	mov    %eax,0xc0c
      return (void*)(p + 1);
 901:	8b 45 f4             	mov    -0xc(%ebp),%eax
 904:	83 c0 08             	add    $0x8,%eax
 907:	eb 38                	jmp    941 <malloc+0xde>
    }
    if(p == freep)
 909:	a1 0c 0c 00 00       	mov    0xc0c,%eax
 90e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 911:	75 1b                	jne    92e <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 913:	8b 45 ec             	mov    -0x14(%ebp),%eax
 916:	89 04 24             	mov    %eax,(%esp)
 919:	e8 ed fe ff ff       	call   80b <morecore>
 91e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 921:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 925:	75 07                	jne    92e <malloc+0xcb>
        return 0;
 927:	b8 00 00 00 00       	mov    $0x0,%eax
 92c:	eb 13                	jmp    941 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 92e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 931:	89 45 f0             	mov    %eax,-0x10(%ebp)
 934:	8b 45 f4             	mov    -0xc(%ebp),%eax
 937:	8b 00                	mov    (%eax),%eax
 939:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 93c:	e9 70 ff ff ff       	jmp    8b1 <malloc+0x4e>
}
 941:	c9                   	leave  
 942:	c3                   	ret    
