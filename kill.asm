
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int i;

  if(argc < 2){
   9:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
   d:	7f 19                	jg     28 <main+0x28>
    printf(2, "usage: kill pid...\n");
   f:	c7 44 24 04 36 09 00 	movl   $0x936,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 47 05 00 00       	call   56a <printf>
    exit();
  23:	e8 ba 03 00 00       	call   3e2 <exit>
  }
  for(i=1; i<argc; i++)
  28:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  2f:	00 
  30:	eb 27                	jmp    59 <main+0x59>
    kill(atoi(argv[i]));
  32:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  36:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  40:	01 d0                	add    %edx,%eax
  42:	8b 00                	mov    (%eax),%eax
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 f1 01 00 00       	call   23d <atoi>
  4c:	89 04 24             	mov    %eax,(%esp)
  4f:	e8 be 03 00 00       	call   412 <kill>
  for(i=1; i<argc; i++)
  54:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  59:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  5d:	3b 45 08             	cmp    0x8(%ebp),%eax
  60:	7c d0                	jl     32 <main+0x32>
  exit();
  62:	e8 7b 03 00 00       	call   3e2 <exit>

00000067 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  67:	55                   	push   %ebp
  68:	89 e5                	mov    %esp,%ebp
  6a:	57                   	push   %edi
  6b:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  6c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  6f:	8b 55 10             	mov    0x10(%ebp),%edx
  72:	8b 45 0c             	mov    0xc(%ebp),%eax
  75:	89 cb                	mov    %ecx,%ebx
  77:	89 df                	mov    %ebx,%edi
  79:	89 d1                	mov    %edx,%ecx
  7b:	fc                   	cld    
  7c:	f3 aa                	rep stos %al,%es:(%edi)
  7e:	89 ca                	mov    %ecx,%edx
  80:	89 fb                	mov    %edi,%ebx
  82:	89 5d 08             	mov    %ebx,0x8(%ebp)
  85:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  88:	5b                   	pop    %ebx
  89:	5f                   	pop    %edi
  8a:	5d                   	pop    %ebp
  8b:	c3                   	ret    

0000008c <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  8c:	55                   	push   %ebp
  8d:	89 e5                	mov    %esp,%ebp
  8f:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  92:	8b 45 08             	mov    0x8(%ebp),%eax
  95:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  98:	90                   	nop
  99:	8b 45 08             	mov    0x8(%ebp),%eax
  9c:	8d 50 01             	lea    0x1(%eax),%edx
  9f:	89 55 08             	mov    %edx,0x8(%ebp)
  a2:	8b 55 0c             	mov    0xc(%ebp),%edx
  a5:	8d 4a 01             	lea    0x1(%edx),%ecx
  a8:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  ab:	0f b6 12             	movzbl (%edx),%edx
  ae:	88 10                	mov    %dl,(%eax)
  b0:	0f b6 00             	movzbl (%eax),%eax
  b3:	84 c0                	test   %al,%al
  b5:	75 e2                	jne    99 <strcpy+0xd>
    ;
  return os;
  b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  ba:	c9                   	leave  
  bb:	c3                   	ret    

000000bc <strcmp>:

int
strcmp(const char *p, const char *q)
{
  bc:	55                   	push   %ebp
  bd:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  bf:	eb 08                	jmp    c9 <strcmp+0xd>
    p++, q++;
  c1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  c5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  c9:	8b 45 08             	mov    0x8(%ebp),%eax
  cc:	0f b6 00             	movzbl (%eax),%eax
  cf:	84 c0                	test   %al,%al
  d1:	74 10                	je     e3 <strcmp+0x27>
  d3:	8b 45 08             	mov    0x8(%ebp),%eax
  d6:	0f b6 10             	movzbl (%eax),%edx
  d9:	8b 45 0c             	mov    0xc(%ebp),%eax
  dc:	0f b6 00             	movzbl (%eax),%eax
  df:	38 c2                	cmp    %al,%dl
  e1:	74 de                	je     c1 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  e3:	8b 45 08             	mov    0x8(%ebp),%eax
  e6:	0f b6 00             	movzbl (%eax),%eax
  e9:	0f b6 d0             	movzbl %al,%edx
  ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  ef:	0f b6 00             	movzbl (%eax),%eax
  f2:	0f b6 c0             	movzbl %al,%eax
  f5:	29 c2                	sub    %eax,%edx
  f7:	89 d0                	mov    %edx,%eax
}
  f9:	5d                   	pop    %ebp
  fa:	c3                   	ret    

000000fb <strlen>:

uint
strlen(const char *s)
{
  fb:	55                   	push   %ebp
  fc:	89 e5                	mov    %esp,%ebp
  fe:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 101:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 108:	eb 04                	jmp    10e <strlen+0x13>
 10a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 10e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 111:	8b 45 08             	mov    0x8(%ebp),%eax
 114:	01 d0                	add    %edx,%eax
 116:	0f b6 00             	movzbl (%eax),%eax
 119:	84 c0                	test   %al,%al
 11b:	75 ed                	jne    10a <strlen+0xf>
    ;
  return n;
 11d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 120:	c9                   	leave  
 121:	c3                   	ret    

00000122 <memset>:

void*
memset(void *dst, int c, uint n)
{
 122:	55                   	push   %ebp
 123:	89 e5                	mov    %esp,%ebp
 125:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 128:	8b 45 10             	mov    0x10(%ebp),%eax
 12b:	89 44 24 08          	mov    %eax,0x8(%esp)
 12f:	8b 45 0c             	mov    0xc(%ebp),%eax
 132:	89 44 24 04          	mov    %eax,0x4(%esp)
 136:	8b 45 08             	mov    0x8(%ebp),%eax
 139:	89 04 24             	mov    %eax,(%esp)
 13c:	e8 26 ff ff ff       	call   67 <stosb>
  return dst;
 141:	8b 45 08             	mov    0x8(%ebp),%eax
}
 144:	c9                   	leave  
 145:	c3                   	ret    

00000146 <strchr>:

char*
strchr(const char *s, char c)
{
 146:	55                   	push   %ebp
 147:	89 e5                	mov    %esp,%ebp
 149:	83 ec 04             	sub    $0x4,%esp
 14c:	8b 45 0c             	mov    0xc(%ebp),%eax
 14f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 152:	eb 14                	jmp    168 <strchr+0x22>
    if(*s == c)
 154:	8b 45 08             	mov    0x8(%ebp),%eax
 157:	0f b6 00             	movzbl (%eax),%eax
 15a:	3a 45 fc             	cmp    -0x4(%ebp),%al
 15d:	75 05                	jne    164 <strchr+0x1e>
      return (char*)s;
 15f:	8b 45 08             	mov    0x8(%ebp),%eax
 162:	eb 13                	jmp    177 <strchr+0x31>
  for(; *s; s++)
 164:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 168:	8b 45 08             	mov    0x8(%ebp),%eax
 16b:	0f b6 00             	movzbl (%eax),%eax
 16e:	84 c0                	test   %al,%al
 170:	75 e2                	jne    154 <strchr+0xe>
  return 0;
 172:	b8 00 00 00 00       	mov    $0x0,%eax
}
 177:	c9                   	leave  
 178:	c3                   	ret    

00000179 <gets>:

char*
gets(char *buf, int max)
{
 179:	55                   	push   %ebp
 17a:	89 e5                	mov    %esp,%ebp
 17c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 17f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 186:	eb 4c                	jmp    1d4 <gets+0x5b>
    cc = read(0, &c, 1);
 188:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 18f:	00 
 190:	8d 45 ef             	lea    -0x11(%ebp),%eax
 193:	89 44 24 04          	mov    %eax,0x4(%esp)
 197:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 19e:	e8 57 02 00 00       	call   3fa <read>
 1a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1a6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1aa:	7f 02                	jg     1ae <gets+0x35>
      break;
 1ac:	eb 31                	jmp    1df <gets+0x66>
    buf[i++] = c;
 1ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1b1:	8d 50 01             	lea    0x1(%eax),%edx
 1b4:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1b7:	89 c2                	mov    %eax,%edx
 1b9:	8b 45 08             	mov    0x8(%ebp),%eax
 1bc:	01 c2                	add    %eax,%edx
 1be:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c2:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1c4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c8:	3c 0a                	cmp    $0xa,%al
 1ca:	74 13                	je     1df <gets+0x66>
 1cc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d0:	3c 0d                	cmp    $0xd,%al
 1d2:	74 0b                	je     1df <gets+0x66>
  for(i=0; i+1 < max; ){
 1d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d7:	83 c0 01             	add    $0x1,%eax
 1da:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1dd:	7c a9                	jl     188 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 1df:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1e2:	8b 45 08             	mov    0x8(%ebp),%eax
 1e5:	01 d0                	add    %edx,%eax
 1e7:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1ea:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ed:	c9                   	leave  
 1ee:	c3                   	ret    

000001ef <stat>:

int
stat(const char *n, struct stat *st)
{
 1ef:	55                   	push   %ebp
 1f0:	89 e5                	mov    %esp,%ebp
 1f2:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1fc:	00 
 1fd:	8b 45 08             	mov    0x8(%ebp),%eax
 200:	89 04 24             	mov    %eax,(%esp)
 203:	e8 1a 02 00 00       	call   422 <open>
 208:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 20b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 20f:	79 07                	jns    218 <stat+0x29>
    return -1;
 211:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 216:	eb 23                	jmp    23b <stat+0x4c>
  r = fstat(fd, st);
 218:	8b 45 0c             	mov    0xc(%ebp),%eax
 21b:	89 44 24 04          	mov    %eax,0x4(%esp)
 21f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 222:	89 04 24             	mov    %eax,(%esp)
 225:	e8 10 02 00 00       	call   43a <fstat>
 22a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 22d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 230:	89 04 24             	mov    %eax,(%esp)
 233:	e8 d2 01 00 00       	call   40a <close>
  return r;
 238:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 23b:	c9                   	leave  
 23c:	c3                   	ret    

0000023d <atoi>:

int
atoi(const char *s)
{
 23d:	55                   	push   %ebp
 23e:	89 e5                	mov    %esp,%ebp
 240:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 243:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 24a:	eb 25                	jmp    271 <atoi+0x34>
    n = n*10 + *s++ - '0';
 24c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 24f:	89 d0                	mov    %edx,%eax
 251:	c1 e0 02             	shl    $0x2,%eax
 254:	01 d0                	add    %edx,%eax
 256:	01 c0                	add    %eax,%eax
 258:	89 c1                	mov    %eax,%ecx
 25a:	8b 45 08             	mov    0x8(%ebp),%eax
 25d:	8d 50 01             	lea    0x1(%eax),%edx
 260:	89 55 08             	mov    %edx,0x8(%ebp)
 263:	0f b6 00             	movzbl (%eax),%eax
 266:	0f be c0             	movsbl %al,%eax
 269:	01 c8                	add    %ecx,%eax
 26b:	83 e8 30             	sub    $0x30,%eax
 26e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 271:	8b 45 08             	mov    0x8(%ebp),%eax
 274:	0f b6 00             	movzbl (%eax),%eax
 277:	3c 2f                	cmp    $0x2f,%al
 279:	7e 0a                	jle    285 <atoi+0x48>
 27b:	8b 45 08             	mov    0x8(%ebp),%eax
 27e:	0f b6 00             	movzbl (%eax),%eax
 281:	3c 39                	cmp    $0x39,%al
 283:	7e c7                	jle    24c <atoi+0xf>
  return n;
 285:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 288:	c9                   	leave  
 289:	c3                   	ret    

0000028a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 28a:	55                   	push   %ebp
 28b:	89 e5                	mov    %esp,%ebp
 28d:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 290:	8b 45 08             	mov    0x8(%ebp),%eax
 293:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 296:	8b 45 0c             	mov    0xc(%ebp),%eax
 299:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 29c:	eb 17                	jmp    2b5 <memmove+0x2b>
    *dst++ = *src++;
 29e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2a1:	8d 50 01             	lea    0x1(%eax),%edx
 2a4:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2a7:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2aa:	8d 4a 01             	lea    0x1(%edx),%ecx
 2ad:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2b0:	0f b6 12             	movzbl (%edx),%edx
 2b3:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2b5:	8b 45 10             	mov    0x10(%ebp),%eax
 2b8:	8d 50 ff             	lea    -0x1(%eax),%edx
 2bb:	89 55 10             	mov    %edx,0x10(%ebp)
 2be:	85 c0                	test   %eax,%eax
 2c0:	7f dc                	jg     29e <memmove+0x14>
  return vdst;
 2c2:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c5:	c9                   	leave  
 2c6:	c3                   	ret    

000002c7 <ps>:

void
ps() {
 2c7:	55                   	push   %ebp
 2c8:	89 e5                	mov    %esp,%ebp
 2ca:	57                   	push   %edi
 2cb:	56                   	push   %esi
 2cc:	53                   	push   %ebx
 2cd:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  int i = 0;
 2d3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  printf(1, "PID	TKTS	TCKS	STAT	NAME\n");
 2da:	c7 44 24 04 4a 09 00 	movl   $0x94a,0x4(%esp)
 2e1:	00 
 2e2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2e9:	e8 7c 02 00 00       	call   56a <printf>
  getpinfo(&pstat);
 2ee:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 2f4:	89 04 24             	mov    %eax,(%esp)
 2f7:	e8 86 01 00 00       	call   482 <getpinfo>
  while (pstat[i].pid != 0) {
 2fc:	e9 ad 00 00 00       	jmp    3ae <ps+0xe7>
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
	pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 301:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 307:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 30a:	89 d0                	mov    %edx,%eax
 30c:	c1 e0 03             	shl    $0x3,%eax
 30f:	01 d0                	add    %edx,%eax
 311:	c1 e0 02             	shl    $0x2,%eax
 314:	83 c0 10             	add    $0x10,%eax
 317:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 31a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 31d:	89 d0                	mov    %edx,%eax
 31f:	c1 e0 03             	shl    $0x3,%eax
 322:	01 d0                	add    %edx,%eax
 324:	c1 e0 02             	shl    $0x2,%eax
 327:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 32a:	01 d8                	add    %ebx,%eax
 32c:	2d e4 08 00 00       	sub    $0x8e4,%eax
 331:	0f b6 00             	movzbl (%eax),%eax
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
 334:	0f be f0             	movsbl %al,%esi
 337:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 33a:	89 d0                	mov    %edx,%eax
 33c:	c1 e0 03             	shl    $0x3,%eax
 33f:	01 d0                	add    %edx,%eax
 341:	c1 e0 02             	shl    $0x2,%eax
 344:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 347:	01 c8                	add    %ecx,%eax
 349:	2d f8 08 00 00       	sub    $0x8f8,%eax
 34e:	8b 18                	mov    (%eax),%ebx
 350:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 353:	89 d0                	mov    %edx,%eax
 355:	c1 e0 03             	shl    $0x3,%eax
 358:	01 d0                	add    %edx,%eax
 35a:	c1 e0 02             	shl    $0x2,%eax
 35d:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 360:	01 c8                	add    %ecx,%eax
 362:	2d 00 09 00 00       	sub    $0x900,%eax
 367:	8b 08                	mov    (%eax),%ecx
 369:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 36c:	89 d0                	mov    %edx,%eax
 36e:	c1 e0 03             	shl    $0x3,%eax
 371:	01 d0                	add    %edx,%eax
 373:	c1 e0 02             	shl    $0x2,%eax
 376:	8d 55 e8             	lea    -0x18(%ebp),%edx
 379:	01 d0                	add    %edx,%eax
 37b:	2d fc 08 00 00       	sub    $0x8fc,%eax
 380:	8b 00                	mov    (%eax),%eax
 382:	89 7c 24 18          	mov    %edi,0x18(%esp)
 386:	89 74 24 14          	mov    %esi,0x14(%esp)
 38a:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 38e:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 392:	89 44 24 08          	mov    %eax,0x8(%esp)
 396:	c7 44 24 04 63 09 00 	movl   $0x963,0x4(%esp)
 39d:	00 
 39e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3a5:	e8 c0 01 00 00       	call   56a <printf>
      i++;
 3aa:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  while (pstat[i].pid != 0) {
 3ae:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3b1:	89 d0                	mov    %edx,%eax
 3b3:	c1 e0 03             	shl    $0x3,%eax
 3b6:	01 d0                	add    %edx,%eax
 3b8:	c1 e0 02             	shl    $0x2,%eax
 3bb:	8d 75 e8             	lea    -0x18(%ebp),%esi
 3be:	01 f0                	add    %esi,%eax
 3c0:	2d fc 08 00 00       	sub    $0x8fc,%eax
 3c5:	8b 00                	mov    (%eax),%eax
 3c7:	85 c0                	test   %eax,%eax
 3c9:	0f 85 32 ff ff ff    	jne    301 <ps+0x3a>
  }
}
 3cf:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 3d5:	5b                   	pop    %ebx
 3d6:	5e                   	pop    %esi
 3d7:	5f                   	pop    %edi
 3d8:	5d                   	pop    %ebp
 3d9:	c3                   	ret    

000003da <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3da:	b8 01 00 00 00       	mov    $0x1,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <exit>:
SYSCALL(exit)
 3e2:	b8 02 00 00 00       	mov    $0x2,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <wait>:
SYSCALL(wait)
 3ea:	b8 03 00 00 00       	mov    $0x3,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <pipe>:
SYSCALL(pipe)
 3f2:	b8 04 00 00 00       	mov    $0x4,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <read>:
SYSCALL(read)
 3fa:	b8 05 00 00 00       	mov    $0x5,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <write>:
SYSCALL(write)
 402:	b8 10 00 00 00       	mov    $0x10,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <close>:
SYSCALL(close)
 40a:	b8 15 00 00 00       	mov    $0x15,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <kill>:
SYSCALL(kill)
 412:	b8 06 00 00 00       	mov    $0x6,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <exec>:
SYSCALL(exec)
 41a:	b8 07 00 00 00       	mov    $0x7,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <open>:
SYSCALL(open)
 422:	b8 0f 00 00 00       	mov    $0xf,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <mknod>:
SYSCALL(mknod)
 42a:	b8 11 00 00 00       	mov    $0x11,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <unlink>:
SYSCALL(unlink)
 432:	b8 12 00 00 00       	mov    $0x12,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <fstat>:
SYSCALL(fstat)
 43a:	b8 08 00 00 00       	mov    $0x8,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <link>:
SYSCALL(link)
 442:	b8 13 00 00 00       	mov    $0x13,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <mkdir>:
SYSCALL(mkdir)
 44a:	b8 14 00 00 00       	mov    $0x14,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <chdir>:
SYSCALL(chdir)
 452:	b8 09 00 00 00       	mov    $0x9,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <dup>:
SYSCALL(dup)
 45a:	b8 0a 00 00 00       	mov    $0xa,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <getpid>:
SYSCALL(getpid)
 462:	b8 0b 00 00 00       	mov    $0xb,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <sbrk>:
SYSCALL(sbrk)
 46a:	b8 0c 00 00 00       	mov    $0xc,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <sleep>:
SYSCALL(sleep)
 472:	b8 0d 00 00 00       	mov    $0xd,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <uptime>:
SYSCALL(uptime)
 47a:	b8 0e 00 00 00       	mov    $0xe,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <getpinfo>:
SYSCALL(getpinfo)
 482:	b8 16 00 00 00       	mov    $0x16,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 48a:	55                   	push   %ebp
 48b:	89 e5                	mov    %esp,%ebp
 48d:	83 ec 18             	sub    $0x18,%esp
 490:	8b 45 0c             	mov    0xc(%ebp),%eax
 493:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 496:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 49d:	00 
 49e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4a1:	89 44 24 04          	mov    %eax,0x4(%esp)
 4a5:	8b 45 08             	mov    0x8(%ebp),%eax
 4a8:	89 04 24             	mov    %eax,(%esp)
 4ab:	e8 52 ff ff ff       	call   402 <write>
}
 4b0:	c9                   	leave  
 4b1:	c3                   	ret    

000004b2 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4b2:	55                   	push   %ebp
 4b3:	89 e5                	mov    %esp,%ebp
 4b5:	56                   	push   %esi
 4b6:	53                   	push   %ebx
 4b7:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4ba:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4c1:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4c5:	74 17                	je     4de <printint+0x2c>
 4c7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4cb:	79 11                	jns    4de <printint+0x2c>
    neg = 1;
 4cd:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4d4:	8b 45 0c             	mov    0xc(%ebp),%eax
 4d7:	f7 d8                	neg    %eax
 4d9:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4dc:	eb 06                	jmp    4e4 <printint+0x32>
  } else {
    x = xx;
 4de:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4e4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4eb:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4ee:	8d 41 01             	lea    0x1(%ecx),%eax
 4f1:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4f4:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4fa:	ba 00 00 00 00       	mov    $0x0,%edx
 4ff:	f7 f3                	div    %ebx
 501:	89 d0                	mov    %edx,%eax
 503:	0f b6 80 f0 0b 00 00 	movzbl 0xbf0(%eax),%eax
 50a:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 50e:	8b 75 10             	mov    0x10(%ebp),%esi
 511:	8b 45 ec             	mov    -0x14(%ebp),%eax
 514:	ba 00 00 00 00       	mov    $0x0,%edx
 519:	f7 f6                	div    %esi
 51b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 51e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 522:	75 c7                	jne    4eb <printint+0x39>
  if(neg)
 524:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 528:	74 10                	je     53a <printint+0x88>
    buf[i++] = '-';
 52a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 52d:	8d 50 01             	lea    0x1(%eax),%edx
 530:	89 55 f4             	mov    %edx,-0xc(%ebp)
 533:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 538:	eb 1f                	jmp    559 <printint+0xa7>
 53a:	eb 1d                	jmp    559 <printint+0xa7>
    putc(fd, buf[i]);
 53c:	8d 55 dc             	lea    -0x24(%ebp),%edx
 53f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 542:	01 d0                	add    %edx,%eax
 544:	0f b6 00             	movzbl (%eax),%eax
 547:	0f be c0             	movsbl %al,%eax
 54a:	89 44 24 04          	mov    %eax,0x4(%esp)
 54e:	8b 45 08             	mov    0x8(%ebp),%eax
 551:	89 04 24             	mov    %eax,(%esp)
 554:	e8 31 ff ff ff       	call   48a <putc>
  while(--i >= 0)
 559:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 55d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 561:	79 d9                	jns    53c <printint+0x8a>
}
 563:	83 c4 30             	add    $0x30,%esp
 566:	5b                   	pop    %ebx
 567:	5e                   	pop    %esi
 568:	5d                   	pop    %ebp
 569:	c3                   	ret    

0000056a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 56a:	55                   	push   %ebp
 56b:	89 e5                	mov    %esp,%ebp
 56d:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 570:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 577:	8d 45 0c             	lea    0xc(%ebp),%eax
 57a:	83 c0 04             	add    $0x4,%eax
 57d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 580:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 587:	e9 7c 01 00 00       	jmp    708 <printf+0x19e>
    c = fmt[i] & 0xff;
 58c:	8b 55 0c             	mov    0xc(%ebp),%edx
 58f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 592:	01 d0                	add    %edx,%eax
 594:	0f b6 00             	movzbl (%eax),%eax
 597:	0f be c0             	movsbl %al,%eax
 59a:	25 ff 00 00 00       	and    $0xff,%eax
 59f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5a2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5a6:	75 2c                	jne    5d4 <printf+0x6a>
      if(c == '%'){
 5a8:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5ac:	75 0c                	jne    5ba <printf+0x50>
        state = '%';
 5ae:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5b5:	e9 4a 01 00 00       	jmp    704 <printf+0x19a>
      } else {
        putc(fd, c);
 5ba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5bd:	0f be c0             	movsbl %al,%eax
 5c0:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c4:	8b 45 08             	mov    0x8(%ebp),%eax
 5c7:	89 04 24             	mov    %eax,(%esp)
 5ca:	e8 bb fe ff ff       	call   48a <putc>
 5cf:	e9 30 01 00 00       	jmp    704 <printf+0x19a>
      }
    } else if(state == '%'){
 5d4:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5d8:	0f 85 26 01 00 00    	jne    704 <printf+0x19a>
      if(c == 'd'){
 5de:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5e2:	75 2d                	jne    611 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5e4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5e7:	8b 00                	mov    (%eax),%eax
 5e9:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5f0:	00 
 5f1:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5f8:	00 
 5f9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5fd:	8b 45 08             	mov    0x8(%ebp),%eax
 600:	89 04 24             	mov    %eax,(%esp)
 603:	e8 aa fe ff ff       	call   4b2 <printint>
        ap++;
 608:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 60c:	e9 ec 00 00 00       	jmp    6fd <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 611:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 615:	74 06                	je     61d <printf+0xb3>
 617:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 61b:	75 2d                	jne    64a <printf+0xe0>
        printint(fd, *ap, 16, 0);
 61d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 620:	8b 00                	mov    (%eax),%eax
 622:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 629:	00 
 62a:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 631:	00 
 632:	89 44 24 04          	mov    %eax,0x4(%esp)
 636:	8b 45 08             	mov    0x8(%ebp),%eax
 639:	89 04 24             	mov    %eax,(%esp)
 63c:	e8 71 fe ff ff       	call   4b2 <printint>
        ap++;
 641:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 645:	e9 b3 00 00 00       	jmp    6fd <printf+0x193>
      } else if(c == 's'){
 64a:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 64e:	75 45                	jne    695 <printf+0x12b>
        s = (char*)*ap;
 650:	8b 45 e8             	mov    -0x18(%ebp),%eax
 653:	8b 00                	mov    (%eax),%eax
 655:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 658:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 65c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 660:	75 09                	jne    66b <printf+0x101>
          s = "(null)";
 662:	c7 45 f4 73 09 00 00 	movl   $0x973,-0xc(%ebp)
        while(*s != 0){
 669:	eb 1e                	jmp    689 <printf+0x11f>
 66b:	eb 1c                	jmp    689 <printf+0x11f>
          putc(fd, *s);
 66d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 670:	0f b6 00             	movzbl (%eax),%eax
 673:	0f be c0             	movsbl %al,%eax
 676:	89 44 24 04          	mov    %eax,0x4(%esp)
 67a:	8b 45 08             	mov    0x8(%ebp),%eax
 67d:	89 04 24             	mov    %eax,(%esp)
 680:	e8 05 fe ff ff       	call   48a <putc>
          s++;
 685:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 689:	8b 45 f4             	mov    -0xc(%ebp),%eax
 68c:	0f b6 00             	movzbl (%eax),%eax
 68f:	84 c0                	test   %al,%al
 691:	75 da                	jne    66d <printf+0x103>
 693:	eb 68                	jmp    6fd <printf+0x193>
        }
      } else if(c == 'c'){
 695:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 699:	75 1d                	jne    6b8 <printf+0x14e>
        putc(fd, *ap);
 69b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 69e:	8b 00                	mov    (%eax),%eax
 6a0:	0f be c0             	movsbl %al,%eax
 6a3:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a7:	8b 45 08             	mov    0x8(%ebp),%eax
 6aa:	89 04 24             	mov    %eax,(%esp)
 6ad:	e8 d8 fd ff ff       	call   48a <putc>
        ap++;
 6b2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6b6:	eb 45                	jmp    6fd <printf+0x193>
      } else if(c == '%'){
 6b8:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6bc:	75 17                	jne    6d5 <printf+0x16b>
        putc(fd, c);
 6be:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6c1:	0f be c0             	movsbl %al,%eax
 6c4:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c8:	8b 45 08             	mov    0x8(%ebp),%eax
 6cb:	89 04 24             	mov    %eax,(%esp)
 6ce:	e8 b7 fd ff ff       	call   48a <putc>
 6d3:	eb 28                	jmp    6fd <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6d5:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6dc:	00 
 6dd:	8b 45 08             	mov    0x8(%ebp),%eax
 6e0:	89 04 24             	mov    %eax,(%esp)
 6e3:	e8 a2 fd ff ff       	call   48a <putc>
        putc(fd, c);
 6e8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6eb:	0f be c0             	movsbl %al,%eax
 6ee:	89 44 24 04          	mov    %eax,0x4(%esp)
 6f2:	8b 45 08             	mov    0x8(%ebp),%eax
 6f5:	89 04 24             	mov    %eax,(%esp)
 6f8:	e8 8d fd ff ff       	call   48a <putc>
      }
      state = 0;
 6fd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 704:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 708:	8b 55 0c             	mov    0xc(%ebp),%edx
 70b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 70e:	01 d0                	add    %edx,%eax
 710:	0f b6 00             	movzbl (%eax),%eax
 713:	84 c0                	test   %al,%al
 715:	0f 85 71 fe ff ff    	jne    58c <printf+0x22>
    }
  }
}
 71b:	c9                   	leave  
 71c:	c3                   	ret    

0000071d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 71d:	55                   	push   %ebp
 71e:	89 e5                	mov    %esp,%ebp
 720:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 723:	8b 45 08             	mov    0x8(%ebp),%eax
 726:	83 e8 08             	sub    $0x8,%eax
 729:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 72c:	a1 0c 0c 00 00       	mov    0xc0c,%eax
 731:	89 45 fc             	mov    %eax,-0x4(%ebp)
 734:	eb 24                	jmp    75a <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 736:	8b 45 fc             	mov    -0x4(%ebp),%eax
 739:	8b 00                	mov    (%eax),%eax
 73b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 73e:	77 12                	ja     752 <free+0x35>
 740:	8b 45 f8             	mov    -0x8(%ebp),%eax
 743:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 746:	77 24                	ja     76c <free+0x4f>
 748:	8b 45 fc             	mov    -0x4(%ebp),%eax
 74b:	8b 00                	mov    (%eax),%eax
 74d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 750:	77 1a                	ja     76c <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 752:	8b 45 fc             	mov    -0x4(%ebp),%eax
 755:	8b 00                	mov    (%eax),%eax
 757:	89 45 fc             	mov    %eax,-0x4(%ebp)
 75a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 760:	76 d4                	jbe    736 <free+0x19>
 762:	8b 45 fc             	mov    -0x4(%ebp),%eax
 765:	8b 00                	mov    (%eax),%eax
 767:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 76a:	76 ca                	jbe    736 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 76c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76f:	8b 40 04             	mov    0x4(%eax),%eax
 772:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 779:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77c:	01 c2                	add    %eax,%edx
 77e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 781:	8b 00                	mov    (%eax),%eax
 783:	39 c2                	cmp    %eax,%edx
 785:	75 24                	jne    7ab <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 787:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78a:	8b 50 04             	mov    0x4(%eax),%edx
 78d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 790:	8b 00                	mov    (%eax),%eax
 792:	8b 40 04             	mov    0x4(%eax),%eax
 795:	01 c2                	add    %eax,%edx
 797:	8b 45 f8             	mov    -0x8(%ebp),%eax
 79a:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 79d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a0:	8b 00                	mov    (%eax),%eax
 7a2:	8b 10                	mov    (%eax),%edx
 7a4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a7:	89 10                	mov    %edx,(%eax)
 7a9:	eb 0a                	jmp    7b5 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ae:	8b 10                	mov    (%eax),%edx
 7b0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b3:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b8:	8b 40 04             	mov    0x4(%eax),%eax
 7bb:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c5:	01 d0                	add    %edx,%eax
 7c7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7ca:	75 20                	jne    7ec <free+0xcf>
    p->s.size += bp->s.size;
 7cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7cf:	8b 50 04             	mov    0x4(%eax),%edx
 7d2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d5:	8b 40 04             	mov    0x4(%eax),%eax
 7d8:	01 c2                	add    %eax,%edx
 7da:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7dd:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7e0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e3:	8b 10                	mov    (%eax),%edx
 7e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e8:	89 10                	mov    %edx,(%eax)
 7ea:	eb 08                	jmp    7f4 <free+0xd7>
  } else
    p->s.ptr = bp;
 7ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ef:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7f2:	89 10                	mov    %edx,(%eax)
  freep = p;
 7f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f7:	a3 0c 0c 00 00       	mov    %eax,0xc0c
}
 7fc:	c9                   	leave  
 7fd:	c3                   	ret    

000007fe <morecore>:

static Header*
morecore(uint nu)
{
 7fe:	55                   	push   %ebp
 7ff:	89 e5                	mov    %esp,%ebp
 801:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 804:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 80b:	77 07                	ja     814 <morecore+0x16>
    nu = 4096;
 80d:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 814:	8b 45 08             	mov    0x8(%ebp),%eax
 817:	c1 e0 03             	shl    $0x3,%eax
 81a:	89 04 24             	mov    %eax,(%esp)
 81d:	e8 48 fc ff ff       	call   46a <sbrk>
 822:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 825:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 829:	75 07                	jne    832 <morecore+0x34>
    return 0;
 82b:	b8 00 00 00 00       	mov    $0x0,%eax
 830:	eb 22                	jmp    854 <morecore+0x56>
  hp = (Header*)p;
 832:	8b 45 f4             	mov    -0xc(%ebp),%eax
 835:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 838:	8b 45 f0             	mov    -0x10(%ebp),%eax
 83b:	8b 55 08             	mov    0x8(%ebp),%edx
 83e:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 841:	8b 45 f0             	mov    -0x10(%ebp),%eax
 844:	83 c0 08             	add    $0x8,%eax
 847:	89 04 24             	mov    %eax,(%esp)
 84a:	e8 ce fe ff ff       	call   71d <free>
  return freep;
 84f:	a1 0c 0c 00 00       	mov    0xc0c,%eax
}
 854:	c9                   	leave  
 855:	c3                   	ret    

00000856 <malloc>:

void*
malloc(uint nbytes)
{
 856:	55                   	push   %ebp
 857:	89 e5                	mov    %esp,%ebp
 859:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 85c:	8b 45 08             	mov    0x8(%ebp),%eax
 85f:	83 c0 07             	add    $0x7,%eax
 862:	c1 e8 03             	shr    $0x3,%eax
 865:	83 c0 01             	add    $0x1,%eax
 868:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 86b:	a1 0c 0c 00 00       	mov    0xc0c,%eax
 870:	89 45 f0             	mov    %eax,-0x10(%ebp)
 873:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 877:	75 23                	jne    89c <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 879:	c7 45 f0 04 0c 00 00 	movl   $0xc04,-0x10(%ebp)
 880:	8b 45 f0             	mov    -0x10(%ebp),%eax
 883:	a3 0c 0c 00 00       	mov    %eax,0xc0c
 888:	a1 0c 0c 00 00       	mov    0xc0c,%eax
 88d:	a3 04 0c 00 00       	mov    %eax,0xc04
    base.s.size = 0;
 892:	c7 05 08 0c 00 00 00 	movl   $0x0,0xc08
 899:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 89c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89f:	8b 00                	mov    (%eax),%eax
 8a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a7:	8b 40 04             	mov    0x4(%eax),%eax
 8aa:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8ad:	72 4d                	jb     8fc <malloc+0xa6>
      if(p->s.size == nunits)
 8af:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b2:	8b 40 04             	mov    0x4(%eax),%eax
 8b5:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8b8:	75 0c                	jne    8c6 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8bd:	8b 10                	mov    (%eax),%edx
 8bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c2:	89 10                	mov    %edx,(%eax)
 8c4:	eb 26                	jmp    8ec <malloc+0x96>
      else {
        p->s.size -= nunits;
 8c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c9:	8b 40 04             	mov    0x4(%eax),%eax
 8cc:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8cf:	89 c2                	mov    %eax,%edx
 8d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d4:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8da:	8b 40 04             	mov    0x4(%eax),%eax
 8dd:	c1 e0 03             	shl    $0x3,%eax
 8e0:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e6:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8e9:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ef:	a3 0c 0c 00 00       	mov    %eax,0xc0c
      return (void*)(p + 1);
 8f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f7:	83 c0 08             	add    $0x8,%eax
 8fa:	eb 38                	jmp    934 <malloc+0xde>
    }
    if(p == freep)
 8fc:	a1 0c 0c 00 00       	mov    0xc0c,%eax
 901:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 904:	75 1b                	jne    921 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 906:	8b 45 ec             	mov    -0x14(%ebp),%eax
 909:	89 04 24             	mov    %eax,(%esp)
 90c:	e8 ed fe ff ff       	call   7fe <morecore>
 911:	89 45 f4             	mov    %eax,-0xc(%ebp)
 914:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 918:	75 07                	jne    921 <malloc+0xcb>
        return 0;
 91a:	b8 00 00 00 00       	mov    $0x0,%eax
 91f:	eb 13                	jmp    934 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 921:	8b 45 f4             	mov    -0xc(%ebp),%eax
 924:	89 45 f0             	mov    %eax,-0x10(%ebp)
 927:	8b 45 f4             	mov    -0xc(%ebp),%eax
 92a:	8b 00                	mov    (%eax),%eax
 92c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 92f:	e9 70 ff ff ff       	jmp    8a4 <malloc+0x4e>
}
 934:	c9                   	leave  
 935:	c3                   	ret    
