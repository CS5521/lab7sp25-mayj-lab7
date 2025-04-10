
_ln:     file format elf32-i386


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
   6:	83 ec 10             	sub    $0x10,%esp
  if(argc != 3){
   9:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
   d:	74 19                	je     28 <main+0x28>
    printf(2, "Usage: ln old new\n");
   f:	c7 44 24 04 50 09 00 	movl   $0x950,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 61 05 00 00       	call   584 <printf>
    exit();
  23:	e8 cc 03 00 00       	call   3f4 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  28:	8b 45 0c             	mov    0xc(%ebp),%eax
  2b:	83 c0 08             	add    $0x8,%eax
  2e:	8b 10                	mov    (%eax),%edx
  30:	8b 45 0c             	mov    0xc(%ebp),%eax
  33:	83 c0 04             	add    $0x4,%eax
  36:	8b 00                	mov    (%eax),%eax
  38:	89 54 24 04          	mov    %edx,0x4(%esp)
  3c:	89 04 24             	mov    %eax,(%esp)
  3f:	e8 10 04 00 00       	call   454 <link>
  44:	85 c0                	test   %eax,%eax
  46:	79 2c                	jns    74 <main+0x74>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  48:	8b 45 0c             	mov    0xc(%ebp),%eax
  4b:	83 c0 08             	add    $0x8,%eax
  4e:	8b 10                	mov    (%eax),%edx
  50:	8b 45 0c             	mov    0xc(%ebp),%eax
  53:	83 c0 04             	add    $0x4,%eax
  56:	8b 00                	mov    (%eax),%eax
  58:	89 54 24 0c          	mov    %edx,0xc(%esp)
  5c:	89 44 24 08          	mov    %eax,0x8(%esp)
  60:	c7 44 24 04 63 09 00 	movl   $0x963,0x4(%esp)
  67:	00 
  68:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  6f:	e8 10 05 00 00       	call   584 <printf>
  exit();
  74:	e8 7b 03 00 00       	call   3f4 <exit>

00000079 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  79:	55                   	push   %ebp
  7a:	89 e5                	mov    %esp,%ebp
  7c:	57                   	push   %edi
  7d:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  7e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  81:	8b 55 10             	mov    0x10(%ebp),%edx
  84:	8b 45 0c             	mov    0xc(%ebp),%eax
  87:	89 cb                	mov    %ecx,%ebx
  89:	89 df                	mov    %ebx,%edi
  8b:	89 d1                	mov    %edx,%ecx
  8d:	fc                   	cld    
  8e:	f3 aa                	rep stos %al,%es:(%edi)
  90:	89 ca                	mov    %ecx,%edx
  92:	89 fb                	mov    %edi,%ebx
  94:	89 5d 08             	mov    %ebx,0x8(%ebp)
  97:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  9a:	5b                   	pop    %ebx
  9b:	5f                   	pop    %edi
  9c:	5d                   	pop    %ebp
  9d:	c3                   	ret    

0000009e <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  9e:	55                   	push   %ebp
  9f:	89 e5                	mov    %esp,%ebp
  a1:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  a4:	8b 45 08             	mov    0x8(%ebp),%eax
  a7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  aa:	90                   	nop
  ab:	8b 45 08             	mov    0x8(%ebp),%eax
  ae:	8d 50 01             	lea    0x1(%eax),%edx
  b1:	89 55 08             	mov    %edx,0x8(%ebp)
  b4:	8b 55 0c             	mov    0xc(%ebp),%edx
  b7:	8d 4a 01             	lea    0x1(%edx),%ecx
  ba:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  bd:	0f b6 12             	movzbl (%edx),%edx
  c0:	88 10                	mov    %dl,(%eax)
  c2:	0f b6 00             	movzbl (%eax),%eax
  c5:	84 c0                	test   %al,%al
  c7:	75 e2                	jne    ab <strcpy+0xd>
    ;
  return os;
  c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  cc:	c9                   	leave  
  cd:	c3                   	ret    

000000ce <strcmp>:

int
strcmp(const char *p, const char *q)
{
  ce:	55                   	push   %ebp
  cf:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  d1:	eb 08                	jmp    db <strcmp+0xd>
    p++, q++;
  d3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  d7:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  db:	8b 45 08             	mov    0x8(%ebp),%eax
  de:	0f b6 00             	movzbl (%eax),%eax
  e1:	84 c0                	test   %al,%al
  e3:	74 10                	je     f5 <strcmp+0x27>
  e5:	8b 45 08             	mov    0x8(%ebp),%eax
  e8:	0f b6 10             	movzbl (%eax),%edx
  eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  ee:	0f b6 00             	movzbl (%eax),%eax
  f1:	38 c2                	cmp    %al,%dl
  f3:	74 de                	je     d3 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  f5:	8b 45 08             	mov    0x8(%ebp),%eax
  f8:	0f b6 00             	movzbl (%eax),%eax
  fb:	0f b6 d0             	movzbl %al,%edx
  fe:	8b 45 0c             	mov    0xc(%ebp),%eax
 101:	0f b6 00             	movzbl (%eax),%eax
 104:	0f b6 c0             	movzbl %al,%eax
 107:	29 c2                	sub    %eax,%edx
 109:	89 d0                	mov    %edx,%eax
}
 10b:	5d                   	pop    %ebp
 10c:	c3                   	ret    

0000010d <strlen>:

uint
strlen(const char *s)
{
 10d:	55                   	push   %ebp
 10e:	89 e5                	mov    %esp,%ebp
 110:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 113:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 11a:	eb 04                	jmp    120 <strlen+0x13>
 11c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 120:	8b 55 fc             	mov    -0x4(%ebp),%edx
 123:	8b 45 08             	mov    0x8(%ebp),%eax
 126:	01 d0                	add    %edx,%eax
 128:	0f b6 00             	movzbl (%eax),%eax
 12b:	84 c0                	test   %al,%al
 12d:	75 ed                	jne    11c <strlen+0xf>
    ;
  return n;
 12f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 132:	c9                   	leave  
 133:	c3                   	ret    

00000134 <memset>:

void*
memset(void *dst, int c, uint n)
{
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 13a:	8b 45 10             	mov    0x10(%ebp),%eax
 13d:	89 44 24 08          	mov    %eax,0x8(%esp)
 141:	8b 45 0c             	mov    0xc(%ebp),%eax
 144:	89 44 24 04          	mov    %eax,0x4(%esp)
 148:	8b 45 08             	mov    0x8(%ebp),%eax
 14b:	89 04 24             	mov    %eax,(%esp)
 14e:	e8 26 ff ff ff       	call   79 <stosb>
  return dst;
 153:	8b 45 08             	mov    0x8(%ebp),%eax
}
 156:	c9                   	leave  
 157:	c3                   	ret    

00000158 <strchr>:

char*
strchr(const char *s, char c)
{
 158:	55                   	push   %ebp
 159:	89 e5                	mov    %esp,%ebp
 15b:	83 ec 04             	sub    $0x4,%esp
 15e:	8b 45 0c             	mov    0xc(%ebp),%eax
 161:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 164:	eb 14                	jmp    17a <strchr+0x22>
    if(*s == c)
 166:	8b 45 08             	mov    0x8(%ebp),%eax
 169:	0f b6 00             	movzbl (%eax),%eax
 16c:	3a 45 fc             	cmp    -0x4(%ebp),%al
 16f:	75 05                	jne    176 <strchr+0x1e>
      return (char*)s;
 171:	8b 45 08             	mov    0x8(%ebp),%eax
 174:	eb 13                	jmp    189 <strchr+0x31>
  for(; *s; s++)
 176:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 17a:	8b 45 08             	mov    0x8(%ebp),%eax
 17d:	0f b6 00             	movzbl (%eax),%eax
 180:	84 c0                	test   %al,%al
 182:	75 e2                	jne    166 <strchr+0xe>
  return 0;
 184:	b8 00 00 00 00       	mov    $0x0,%eax
}
 189:	c9                   	leave  
 18a:	c3                   	ret    

0000018b <gets>:

char*
gets(char *buf, int max)
{
 18b:	55                   	push   %ebp
 18c:	89 e5                	mov    %esp,%ebp
 18e:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 191:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 198:	eb 4c                	jmp    1e6 <gets+0x5b>
    cc = read(0, &c, 1);
 19a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1a1:	00 
 1a2:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1a5:	89 44 24 04          	mov    %eax,0x4(%esp)
 1a9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1b0:	e8 57 02 00 00       	call   40c <read>
 1b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1b8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1bc:	7f 02                	jg     1c0 <gets+0x35>
      break;
 1be:	eb 31                	jmp    1f1 <gets+0x66>
    buf[i++] = c;
 1c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c3:	8d 50 01             	lea    0x1(%eax),%edx
 1c6:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1c9:	89 c2                	mov    %eax,%edx
 1cb:	8b 45 08             	mov    0x8(%ebp),%eax
 1ce:	01 c2                	add    %eax,%edx
 1d0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d4:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1d6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1da:	3c 0a                	cmp    $0xa,%al
 1dc:	74 13                	je     1f1 <gets+0x66>
 1de:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1e2:	3c 0d                	cmp    $0xd,%al
 1e4:	74 0b                	je     1f1 <gets+0x66>
  for(i=0; i+1 < max; ){
 1e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1e9:	83 c0 01             	add    $0x1,%eax
 1ec:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1ef:	7c a9                	jl     19a <gets+0xf>
      break;
  }
  buf[i] = '\0';
 1f1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1f4:	8b 45 08             	mov    0x8(%ebp),%eax
 1f7:	01 d0                	add    %edx,%eax
 1f9:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1fc:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ff:	c9                   	leave  
 200:	c3                   	ret    

00000201 <stat>:

int
stat(const char *n, struct stat *st)
{
 201:	55                   	push   %ebp
 202:	89 e5                	mov    %esp,%ebp
 204:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 207:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 20e:	00 
 20f:	8b 45 08             	mov    0x8(%ebp),%eax
 212:	89 04 24             	mov    %eax,(%esp)
 215:	e8 1a 02 00 00       	call   434 <open>
 21a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 21d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 221:	79 07                	jns    22a <stat+0x29>
    return -1;
 223:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 228:	eb 23                	jmp    24d <stat+0x4c>
  r = fstat(fd, st);
 22a:	8b 45 0c             	mov    0xc(%ebp),%eax
 22d:	89 44 24 04          	mov    %eax,0x4(%esp)
 231:	8b 45 f4             	mov    -0xc(%ebp),%eax
 234:	89 04 24             	mov    %eax,(%esp)
 237:	e8 10 02 00 00       	call   44c <fstat>
 23c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 23f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 242:	89 04 24             	mov    %eax,(%esp)
 245:	e8 d2 01 00 00       	call   41c <close>
  return r;
 24a:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 24d:	c9                   	leave  
 24e:	c3                   	ret    

0000024f <atoi>:

int
atoi(const char *s)
{
 24f:	55                   	push   %ebp
 250:	89 e5                	mov    %esp,%ebp
 252:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 255:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 25c:	eb 25                	jmp    283 <atoi+0x34>
    n = n*10 + *s++ - '0';
 25e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 261:	89 d0                	mov    %edx,%eax
 263:	c1 e0 02             	shl    $0x2,%eax
 266:	01 d0                	add    %edx,%eax
 268:	01 c0                	add    %eax,%eax
 26a:	89 c1                	mov    %eax,%ecx
 26c:	8b 45 08             	mov    0x8(%ebp),%eax
 26f:	8d 50 01             	lea    0x1(%eax),%edx
 272:	89 55 08             	mov    %edx,0x8(%ebp)
 275:	0f b6 00             	movzbl (%eax),%eax
 278:	0f be c0             	movsbl %al,%eax
 27b:	01 c8                	add    %ecx,%eax
 27d:	83 e8 30             	sub    $0x30,%eax
 280:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	0f b6 00             	movzbl (%eax),%eax
 289:	3c 2f                	cmp    $0x2f,%al
 28b:	7e 0a                	jle    297 <atoi+0x48>
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
 290:	0f b6 00             	movzbl (%eax),%eax
 293:	3c 39                	cmp    $0x39,%al
 295:	7e c7                	jle    25e <atoi+0xf>
  return n;
 297:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 29a:	c9                   	leave  
 29b:	c3                   	ret    

0000029c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 29c:	55                   	push   %ebp
 29d:	89 e5                	mov    %esp,%ebp
 29f:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 2a2:	8b 45 08             	mov    0x8(%ebp),%eax
 2a5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2a8:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ab:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2ae:	eb 17                	jmp    2c7 <memmove+0x2b>
    *dst++ = *src++;
 2b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2b3:	8d 50 01             	lea    0x1(%eax),%edx
 2b6:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2b9:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2bc:	8d 4a 01             	lea    0x1(%edx),%ecx
 2bf:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2c2:	0f b6 12             	movzbl (%edx),%edx
 2c5:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2c7:	8b 45 10             	mov    0x10(%ebp),%eax
 2ca:	8d 50 ff             	lea    -0x1(%eax),%edx
 2cd:	89 55 10             	mov    %edx,0x10(%ebp)
 2d0:	85 c0                	test   %eax,%eax
 2d2:	7f dc                	jg     2b0 <memmove+0x14>
  return vdst;
 2d4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2d7:	c9                   	leave  
 2d8:	c3                   	ret    

000002d9 <ps>:

void
ps() {
 2d9:	55                   	push   %ebp
 2da:	89 e5                	mov    %esp,%ebp
 2dc:	57                   	push   %edi
 2dd:	56                   	push   %esi
 2de:	53                   	push   %ebx
 2df:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  int i = 0;
 2e5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  printf(1, "PID	TKTS	TCKS	STAT	NAME\n");
 2ec:	c7 44 24 04 77 09 00 	movl   $0x977,0x4(%esp)
 2f3:	00 
 2f4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2fb:	e8 84 02 00 00       	call   584 <printf>
  getpinfo(&pstat);
 300:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 306:	89 04 24             	mov    %eax,(%esp)
 309:	e8 86 01 00 00       	call   494 <getpinfo>
  while (pstat[i].pid != 0) {
 30e:	e9 ad 00 00 00       	jmp    3c0 <ps+0xe7>
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
	pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 313:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 319:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 31c:	89 d0                	mov    %edx,%eax
 31e:	c1 e0 03             	shl    $0x3,%eax
 321:	01 d0                	add    %edx,%eax
 323:	c1 e0 02             	shl    $0x2,%eax
 326:	83 c0 10             	add    $0x10,%eax
 329:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 32c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 32f:	89 d0                	mov    %edx,%eax
 331:	c1 e0 03             	shl    $0x3,%eax
 334:	01 d0                	add    %edx,%eax
 336:	c1 e0 02             	shl    $0x2,%eax
 339:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 33c:	01 d8                	add    %ebx,%eax
 33e:	2d e4 08 00 00       	sub    $0x8e4,%eax
 343:	0f b6 00             	movzbl (%eax),%eax
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
 346:	0f be f0             	movsbl %al,%esi
 349:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 34c:	89 d0                	mov    %edx,%eax
 34e:	c1 e0 03             	shl    $0x3,%eax
 351:	01 d0                	add    %edx,%eax
 353:	c1 e0 02             	shl    $0x2,%eax
 356:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 359:	01 c8                	add    %ecx,%eax
 35b:	2d f8 08 00 00       	sub    $0x8f8,%eax
 360:	8b 18                	mov    (%eax),%ebx
 362:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 365:	89 d0                	mov    %edx,%eax
 367:	c1 e0 03             	shl    $0x3,%eax
 36a:	01 d0                	add    %edx,%eax
 36c:	c1 e0 02             	shl    $0x2,%eax
 36f:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 372:	01 c8                	add    %ecx,%eax
 374:	2d 00 09 00 00       	sub    $0x900,%eax
 379:	8b 08                	mov    (%eax),%ecx
 37b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 37e:	89 d0                	mov    %edx,%eax
 380:	c1 e0 03             	shl    $0x3,%eax
 383:	01 d0                	add    %edx,%eax
 385:	c1 e0 02             	shl    $0x2,%eax
 388:	8d 55 e8             	lea    -0x18(%ebp),%edx
 38b:	01 d0                	add    %edx,%eax
 38d:	2d fc 08 00 00       	sub    $0x8fc,%eax
 392:	8b 00                	mov    (%eax),%eax
 394:	89 7c 24 18          	mov    %edi,0x18(%esp)
 398:	89 74 24 14          	mov    %esi,0x14(%esp)
 39c:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 3a0:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 3a4:	89 44 24 08          	mov    %eax,0x8(%esp)
 3a8:	c7 44 24 04 90 09 00 	movl   $0x990,0x4(%esp)
 3af:	00 
 3b0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3b7:	e8 c8 01 00 00       	call   584 <printf>
      i++;
 3bc:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  while (pstat[i].pid != 0) {
 3c0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3c3:	89 d0                	mov    %edx,%eax
 3c5:	c1 e0 03             	shl    $0x3,%eax
 3c8:	01 d0                	add    %edx,%eax
 3ca:	c1 e0 02             	shl    $0x2,%eax
 3cd:	8d 75 e8             	lea    -0x18(%ebp),%esi
 3d0:	01 f0                	add    %esi,%eax
 3d2:	2d fc 08 00 00       	sub    $0x8fc,%eax
 3d7:	8b 00                	mov    (%eax),%eax
 3d9:	85 c0                	test   %eax,%eax
 3db:	0f 85 32 ff ff ff    	jne    313 <ps+0x3a>
  }
}
 3e1:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 3e7:	5b                   	pop    %ebx
 3e8:	5e                   	pop    %esi
 3e9:	5f                   	pop    %edi
 3ea:	5d                   	pop    %ebp
 3eb:	c3                   	ret    

000003ec <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3ec:	b8 01 00 00 00       	mov    $0x1,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <exit>:
SYSCALL(exit)
 3f4:	b8 02 00 00 00       	mov    $0x2,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <wait>:
SYSCALL(wait)
 3fc:	b8 03 00 00 00       	mov    $0x3,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <pipe>:
SYSCALL(pipe)
 404:	b8 04 00 00 00       	mov    $0x4,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <read>:
SYSCALL(read)
 40c:	b8 05 00 00 00       	mov    $0x5,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <write>:
SYSCALL(write)
 414:	b8 10 00 00 00       	mov    $0x10,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <close>:
SYSCALL(close)
 41c:	b8 15 00 00 00       	mov    $0x15,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <kill>:
SYSCALL(kill)
 424:	b8 06 00 00 00       	mov    $0x6,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <exec>:
SYSCALL(exec)
 42c:	b8 07 00 00 00       	mov    $0x7,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <open>:
SYSCALL(open)
 434:	b8 0f 00 00 00       	mov    $0xf,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <mknod>:
SYSCALL(mknod)
 43c:	b8 11 00 00 00       	mov    $0x11,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <unlink>:
SYSCALL(unlink)
 444:	b8 12 00 00 00       	mov    $0x12,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <fstat>:
SYSCALL(fstat)
 44c:	b8 08 00 00 00       	mov    $0x8,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <link>:
SYSCALL(link)
 454:	b8 13 00 00 00       	mov    $0x13,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <mkdir>:
SYSCALL(mkdir)
 45c:	b8 14 00 00 00       	mov    $0x14,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <chdir>:
SYSCALL(chdir)
 464:	b8 09 00 00 00       	mov    $0x9,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <dup>:
SYSCALL(dup)
 46c:	b8 0a 00 00 00       	mov    $0xa,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <getpid>:
SYSCALL(getpid)
 474:	b8 0b 00 00 00       	mov    $0xb,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <sbrk>:
SYSCALL(sbrk)
 47c:	b8 0c 00 00 00       	mov    $0xc,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <sleep>:
SYSCALL(sleep)
 484:	b8 0d 00 00 00       	mov    $0xd,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <uptime>:
SYSCALL(uptime)
 48c:	b8 0e 00 00 00       	mov    $0xe,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <getpinfo>:
SYSCALL(getpinfo)
 494:	b8 16 00 00 00       	mov    $0x16,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <settickets>:
SYSCALL(settickets)
 49c:	b8 17 00 00 00       	mov    $0x17,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4a4:	55                   	push   %ebp
 4a5:	89 e5                	mov    %esp,%ebp
 4a7:	83 ec 18             	sub    $0x18,%esp
 4aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ad:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4b0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4b7:	00 
 4b8:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 4bf:	8b 45 08             	mov    0x8(%ebp),%eax
 4c2:	89 04 24             	mov    %eax,(%esp)
 4c5:	e8 4a ff ff ff       	call   414 <write>
}
 4ca:	c9                   	leave  
 4cb:	c3                   	ret    

000004cc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4cc:	55                   	push   %ebp
 4cd:	89 e5                	mov    %esp,%ebp
 4cf:	56                   	push   %esi
 4d0:	53                   	push   %ebx
 4d1:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4d4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4db:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4df:	74 17                	je     4f8 <printint+0x2c>
 4e1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4e5:	79 11                	jns    4f8 <printint+0x2c>
    neg = 1;
 4e7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4ee:	8b 45 0c             	mov    0xc(%ebp),%eax
 4f1:	f7 d8                	neg    %eax
 4f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4f6:	eb 06                	jmp    4fe <printint+0x32>
  } else {
    x = xx;
 4f8:	8b 45 0c             	mov    0xc(%ebp),%eax
 4fb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4fe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 505:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 508:	8d 41 01             	lea    0x1(%ecx),%eax
 50b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 50e:	8b 5d 10             	mov    0x10(%ebp),%ebx
 511:	8b 45 ec             	mov    -0x14(%ebp),%eax
 514:	ba 00 00 00 00       	mov    $0x0,%edx
 519:	f7 f3                	div    %ebx
 51b:	89 d0                	mov    %edx,%eax
 51d:	0f b6 80 1c 0c 00 00 	movzbl 0xc1c(%eax),%eax
 524:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 528:	8b 75 10             	mov    0x10(%ebp),%esi
 52b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 52e:	ba 00 00 00 00       	mov    $0x0,%edx
 533:	f7 f6                	div    %esi
 535:	89 45 ec             	mov    %eax,-0x14(%ebp)
 538:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 53c:	75 c7                	jne    505 <printint+0x39>
  if(neg)
 53e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 542:	74 10                	je     554 <printint+0x88>
    buf[i++] = '-';
 544:	8b 45 f4             	mov    -0xc(%ebp),%eax
 547:	8d 50 01             	lea    0x1(%eax),%edx
 54a:	89 55 f4             	mov    %edx,-0xc(%ebp)
 54d:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 552:	eb 1f                	jmp    573 <printint+0xa7>
 554:	eb 1d                	jmp    573 <printint+0xa7>
    putc(fd, buf[i]);
 556:	8d 55 dc             	lea    -0x24(%ebp),%edx
 559:	8b 45 f4             	mov    -0xc(%ebp),%eax
 55c:	01 d0                	add    %edx,%eax
 55e:	0f b6 00             	movzbl (%eax),%eax
 561:	0f be c0             	movsbl %al,%eax
 564:	89 44 24 04          	mov    %eax,0x4(%esp)
 568:	8b 45 08             	mov    0x8(%ebp),%eax
 56b:	89 04 24             	mov    %eax,(%esp)
 56e:	e8 31 ff ff ff       	call   4a4 <putc>
  while(--i >= 0)
 573:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 577:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 57b:	79 d9                	jns    556 <printint+0x8a>
}
 57d:	83 c4 30             	add    $0x30,%esp
 580:	5b                   	pop    %ebx
 581:	5e                   	pop    %esi
 582:	5d                   	pop    %ebp
 583:	c3                   	ret    

00000584 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 584:	55                   	push   %ebp
 585:	89 e5                	mov    %esp,%ebp
 587:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 58a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 591:	8d 45 0c             	lea    0xc(%ebp),%eax
 594:	83 c0 04             	add    $0x4,%eax
 597:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 59a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5a1:	e9 7c 01 00 00       	jmp    722 <printf+0x19e>
    c = fmt[i] & 0xff;
 5a6:	8b 55 0c             	mov    0xc(%ebp),%edx
 5a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5ac:	01 d0                	add    %edx,%eax
 5ae:	0f b6 00             	movzbl (%eax),%eax
 5b1:	0f be c0             	movsbl %al,%eax
 5b4:	25 ff 00 00 00       	and    $0xff,%eax
 5b9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5bc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5c0:	75 2c                	jne    5ee <printf+0x6a>
      if(c == '%'){
 5c2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5c6:	75 0c                	jne    5d4 <printf+0x50>
        state = '%';
 5c8:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5cf:	e9 4a 01 00 00       	jmp    71e <printf+0x19a>
      } else {
        putc(fd, c);
 5d4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5d7:	0f be c0             	movsbl %al,%eax
 5da:	89 44 24 04          	mov    %eax,0x4(%esp)
 5de:	8b 45 08             	mov    0x8(%ebp),%eax
 5e1:	89 04 24             	mov    %eax,(%esp)
 5e4:	e8 bb fe ff ff       	call   4a4 <putc>
 5e9:	e9 30 01 00 00       	jmp    71e <printf+0x19a>
      }
    } else if(state == '%'){
 5ee:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5f2:	0f 85 26 01 00 00    	jne    71e <printf+0x19a>
      if(c == 'd'){
 5f8:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5fc:	75 2d                	jne    62b <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
 601:	8b 00                	mov    (%eax),%eax
 603:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 60a:	00 
 60b:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 612:	00 
 613:	89 44 24 04          	mov    %eax,0x4(%esp)
 617:	8b 45 08             	mov    0x8(%ebp),%eax
 61a:	89 04 24             	mov    %eax,(%esp)
 61d:	e8 aa fe ff ff       	call   4cc <printint>
        ap++;
 622:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 626:	e9 ec 00 00 00       	jmp    717 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 62b:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 62f:	74 06                	je     637 <printf+0xb3>
 631:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 635:	75 2d                	jne    664 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 637:	8b 45 e8             	mov    -0x18(%ebp),%eax
 63a:	8b 00                	mov    (%eax),%eax
 63c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 643:	00 
 644:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 64b:	00 
 64c:	89 44 24 04          	mov    %eax,0x4(%esp)
 650:	8b 45 08             	mov    0x8(%ebp),%eax
 653:	89 04 24             	mov    %eax,(%esp)
 656:	e8 71 fe ff ff       	call   4cc <printint>
        ap++;
 65b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 65f:	e9 b3 00 00 00       	jmp    717 <printf+0x193>
      } else if(c == 's'){
 664:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 668:	75 45                	jne    6af <printf+0x12b>
        s = (char*)*ap;
 66a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 66d:	8b 00                	mov    (%eax),%eax
 66f:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 672:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 676:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 67a:	75 09                	jne    685 <printf+0x101>
          s = "(null)";
 67c:	c7 45 f4 a0 09 00 00 	movl   $0x9a0,-0xc(%ebp)
        while(*s != 0){
 683:	eb 1e                	jmp    6a3 <printf+0x11f>
 685:	eb 1c                	jmp    6a3 <printf+0x11f>
          putc(fd, *s);
 687:	8b 45 f4             	mov    -0xc(%ebp),%eax
 68a:	0f b6 00             	movzbl (%eax),%eax
 68d:	0f be c0             	movsbl %al,%eax
 690:	89 44 24 04          	mov    %eax,0x4(%esp)
 694:	8b 45 08             	mov    0x8(%ebp),%eax
 697:	89 04 24             	mov    %eax,(%esp)
 69a:	e8 05 fe ff ff       	call   4a4 <putc>
          s++;
 69f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 6a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6a6:	0f b6 00             	movzbl (%eax),%eax
 6a9:	84 c0                	test   %al,%al
 6ab:	75 da                	jne    687 <printf+0x103>
 6ad:	eb 68                	jmp    717 <printf+0x193>
        }
      } else if(c == 'c'){
 6af:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6b3:	75 1d                	jne    6d2 <printf+0x14e>
        putc(fd, *ap);
 6b5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6b8:	8b 00                	mov    (%eax),%eax
 6ba:	0f be c0             	movsbl %al,%eax
 6bd:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c1:	8b 45 08             	mov    0x8(%ebp),%eax
 6c4:	89 04 24             	mov    %eax,(%esp)
 6c7:	e8 d8 fd ff ff       	call   4a4 <putc>
        ap++;
 6cc:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6d0:	eb 45                	jmp    717 <printf+0x193>
      } else if(c == '%'){
 6d2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6d6:	75 17                	jne    6ef <printf+0x16b>
        putc(fd, c);
 6d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6db:	0f be c0             	movsbl %al,%eax
 6de:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e2:	8b 45 08             	mov    0x8(%ebp),%eax
 6e5:	89 04 24             	mov    %eax,(%esp)
 6e8:	e8 b7 fd ff ff       	call   4a4 <putc>
 6ed:	eb 28                	jmp    717 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6ef:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6f6:	00 
 6f7:	8b 45 08             	mov    0x8(%ebp),%eax
 6fa:	89 04 24             	mov    %eax,(%esp)
 6fd:	e8 a2 fd ff ff       	call   4a4 <putc>
        putc(fd, c);
 702:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 705:	0f be c0             	movsbl %al,%eax
 708:	89 44 24 04          	mov    %eax,0x4(%esp)
 70c:	8b 45 08             	mov    0x8(%ebp),%eax
 70f:	89 04 24             	mov    %eax,(%esp)
 712:	e8 8d fd ff ff       	call   4a4 <putc>
      }
      state = 0;
 717:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 71e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 722:	8b 55 0c             	mov    0xc(%ebp),%edx
 725:	8b 45 f0             	mov    -0x10(%ebp),%eax
 728:	01 d0                	add    %edx,%eax
 72a:	0f b6 00             	movzbl (%eax),%eax
 72d:	84 c0                	test   %al,%al
 72f:	0f 85 71 fe ff ff    	jne    5a6 <printf+0x22>
    }
  }
}
 735:	c9                   	leave  
 736:	c3                   	ret    

00000737 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 737:	55                   	push   %ebp
 738:	89 e5                	mov    %esp,%ebp
 73a:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 73d:	8b 45 08             	mov    0x8(%ebp),%eax
 740:	83 e8 08             	sub    $0x8,%eax
 743:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 746:	a1 38 0c 00 00       	mov    0xc38,%eax
 74b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 74e:	eb 24                	jmp    774 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 750:	8b 45 fc             	mov    -0x4(%ebp),%eax
 753:	8b 00                	mov    (%eax),%eax
 755:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 758:	77 12                	ja     76c <free+0x35>
 75a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 760:	77 24                	ja     786 <free+0x4f>
 762:	8b 45 fc             	mov    -0x4(%ebp),%eax
 765:	8b 00                	mov    (%eax),%eax
 767:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 76a:	77 1a                	ja     786 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 76c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76f:	8b 00                	mov    (%eax),%eax
 771:	89 45 fc             	mov    %eax,-0x4(%ebp)
 774:	8b 45 f8             	mov    -0x8(%ebp),%eax
 777:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 77a:	76 d4                	jbe    750 <free+0x19>
 77c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77f:	8b 00                	mov    (%eax),%eax
 781:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 784:	76 ca                	jbe    750 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 786:	8b 45 f8             	mov    -0x8(%ebp),%eax
 789:	8b 40 04             	mov    0x4(%eax),%eax
 78c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 793:	8b 45 f8             	mov    -0x8(%ebp),%eax
 796:	01 c2                	add    %eax,%edx
 798:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79b:	8b 00                	mov    (%eax),%eax
 79d:	39 c2                	cmp    %eax,%edx
 79f:	75 24                	jne    7c5 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7a1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a4:	8b 50 04             	mov    0x4(%eax),%edx
 7a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7aa:	8b 00                	mov    (%eax),%eax
 7ac:	8b 40 04             	mov    0x4(%eax),%eax
 7af:	01 c2                	add    %eax,%edx
 7b1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b4:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ba:	8b 00                	mov    (%eax),%eax
 7bc:	8b 10                	mov    (%eax),%edx
 7be:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c1:	89 10                	mov    %edx,(%eax)
 7c3:	eb 0a                	jmp    7cf <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c8:	8b 10                	mov    (%eax),%edx
 7ca:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7cd:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d2:	8b 40 04             	mov    0x4(%eax),%eax
 7d5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7df:	01 d0                	add    %edx,%eax
 7e1:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7e4:	75 20                	jne    806 <free+0xcf>
    p->s.size += bp->s.size;
 7e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e9:	8b 50 04             	mov    0x4(%eax),%edx
 7ec:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ef:	8b 40 04             	mov    0x4(%eax),%eax
 7f2:	01 c2                	add    %eax,%edx
 7f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f7:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7fa:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7fd:	8b 10                	mov    (%eax),%edx
 7ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
 802:	89 10                	mov    %edx,(%eax)
 804:	eb 08                	jmp    80e <free+0xd7>
  } else
    p->s.ptr = bp;
 806:	8b 45 fc             	mov    -0x4(%ebp),%eax
 809:	8b 55 f8             	mov    -0x8(%ebp),%edx
 80c:	89 10                	mov    %edx,(%eax)
  freep = p;
 80e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 811:	a3 38 0c 00 00       	mov    %eax,0xc38
}
 816:	c9                   	leave  
 817:	c3                   	ret    

00000818 <morecore>:

static Header*
morecore(uint nu)
{
 818:	55                   	push   %ebp
 819:	89 e5                	mov    %esp,%ebp
 81b:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 81e:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 825:	77 07                	ja     82e <morecore+0x16>
    nu = 4096;
 827:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 82e:	8b 45 08             	mov    0x8(%ebp),%eax
 831:	c1 e0 03             	shl    $0x3,%eax
 834:	89 04 24             	mov    %eax,(%esp)
 837:	e8 40 fc ff ff       	call   47c <sbrk>
 83c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 83f:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 843:	75 07                	jne    84c <morecore+0x34>
    return 0;
 845:	b8 00 00 00 00       	mov    $0x0,%eax
 84a:	eb 22                	jmp    86e <morecore+0x56>
  hp = (Header*)p;
 84c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 84f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 852:	8b 45 f0             	mov    -0x10(%ebp),%eax
 855:	8b 55 08             	mov    0x8(%ebp),%edx
 858:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 85b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 85e:	83 c0 08             	add    $0x8,%eax
 861:	89 04 24             	mov    %eax,(%esp)
 864:	e8 ce fe ff ff       	call   737 <free>
  return freep;
 869:	a1 38 0c 00 00       	mov    0xc38,%eax
}
 86e:	c9                   	leave  
 86f:	c3                   	ret    

00000870 <malloc>:

void*
malloc(uint nbytes)
{
 870:	55                   	push   %ebp
 871:	89 e5                	mov    %esp,%ebp
 873:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 876:	8b 45 08             	mov    0x8(%ebp),%eax
 879:	83 c0 07             	add    $0x7,%eax
 87c:	c1 e8 03             	shr    $0x3,%eax
 87f:	83 c0 01             	add    $0x1,%eax
 882:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 885:	a1 38 0c 00 00       	mov    0xc38,%eax
 88a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 88d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 891:	75 23                	jne    8b6 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 893:	c7 45 f0 30 0c 00 00 	movl   $0xc30,-0x10(%ebp)
 89a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89d:	a3 38 0c 00 00       	mov    %eax,0xc38
 8a2:	a1 38 0c 00 00       	mov    0xc38,%eax
 8a7:	a3 30 0c 00 00       	mov    %eax,0xc30
    base.s.size = 0;
 8ac:	c7 05 34 0c 00 00 00 	movl   $0x0,0xc34
 8b3:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b9:	8b 00                	mov    (%eax),%eax
 8bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8be:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c1:	8b 40 04             	mov    0x4(%eax),%eax
 8c4:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8c7:	72 4d                	jb     916 <malloc+0xa6>
      if(p->s.size == nunits)
 8c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8cc:	8b 40 04             	mov    0x4(%eax),%eax
 8cf:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8d2:	75 0c                	jne    8e0 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d7:	8b 10                	mov    (%eax),%edx
 8d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8dc:	89 10                	mov    %edx,(%eax)
 8de:	eb 26                	jmp    906 <malloc+0x96>
      else {
        p->s.size -= nunits;
 8e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e3:	8b 40 04             	mov    0x4(%eax),%eax
 8e6:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8e9:	89 c2                	mov    %eax,%edx
 8eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ee:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f4:	8b 40 04             	mov    0x4(%eax),%eax
 8f7:	c1 e0 03             	shl    $0x3,%eax
 8fa:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 900:	8b 55 ec             	mov    -0x14(%ebp),%edx
 903:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 906:	8b 45 f0             	mov    -0x10(%ebp),%eax
 909:	a3 38 0c 00 00       	mov    %eax,0xc38
      return (void*)(p + 1);
 90e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 911:	83 c0 08             	add    $0x8,%eax
 914:	eb 38                	jmp    94e <malloc+0xde>
    }
    if(p == freep)
 916:	a1 38 0c 00 00       	mov    0xc38,%eax
 91b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 91e:	75 1b                	jne    93b <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 920:	8b 45 ec             	mov    -0x14(%ebp),%eax
 923:	89 04 24             	mov    %eax,(%esp)
 926:	e8 ed fe ff ff       	call   818 <morecore>
 92b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 92e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 932:	75 07                	jne    93b <malloc+0xcb>
        return 0;
 934:	b8 00 00 00 00       	mov    $0x0,%eax
 939:	eb 13                	jmp    94e <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 93b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 941:	8b 45 f4             	mov    -0xc(%ebp),%eax
 944:	8b 00                	mov    (%eax),%eax
 946:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 949:	e9 70 ff ff ff       	jmp    8be <malloc+0x4e>
}
 94e:	c9                   	leave  
 94f:	c3                   	ret    
