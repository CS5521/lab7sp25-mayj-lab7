
_mkdir:     file format elf32-i386


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

  if(argc < 2){
   9:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
   d:	7f 19                	jg     28 <main+0x28>
    printf(2, "Usage: mkdir files...\n");
   f:	c7 44 24 04 5e 09 00 	movl   $0x95e,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 6f 05 00 00       	call   592 <printf>
    exit();
  23:	e8 e2 03 00 00       	call   40a <exit>
  }

  for(i = 1; i < argc; i++){
  28:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  2f:	00 
  30:	eb 4f                	jmp    81 <main+0x81>
    if(mkdir(argv[i]) < 0){
  32:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  36:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  40:	01 d0                	add    %edx,%eax
  42:	8b 00                	mov    (%eax),%eax
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 26 04 00 00       	call   472 <mkdir>
  4c:	85 c0                	test   %eax,%eax
  4e:	79 2c                	jns    7c <main+0x7c>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  50:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  54:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  5b:	8b 45 0c             	mov    0xc(%ebp),%eax
  5e:	01 d0                	add    %edx,%eax
  60:	8b 00                	mov    (%eax),%eax
  62:	89 44 24 08          	mov    %eax,0x8(%esp)
  66:	c7 44 24 04 75 09 00 	movl   $0x975,0x4(%esp)
  6d:	00 
  6e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  75:	e8 18 05 00 00       	call   592 <printf>
      break;
  7a:	eb 0e                	jmp    8a <main+0x8a>
  for(i = 1; i < argc; i++){
  7c:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  81:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  85:	3b 45 08             	cmp    0x8(%ebp),%eax
  88:	7c a8                	jl     32 <main+0x32>
    }
  }

  exit();
  8a:	e8 7b 03 00 00       	call   40a <exit>

0000008f <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  8f:	55                   	push   %ebp
  90:	89 e5                	mov    %esp,%ebp
  92:	57                   	push   %edi
  93:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  94:	8b 4d 08             	mov    0x8(%ebp),%ecx
  97:	8b 55 10             	mov    0x10(%ebp),%edx
  9a:	8b 45 0c             	mov    0xc(%ebp),%eax
  9d:	89 cb                	mov    %ecx,%ebx
  9f:	89 df                	mov    %ebx,%edi
  a1:	89 d1                	mov    %edx,%ecx
  a3:	fc                   	cld    
  a4:	f3 aa                	rep stos %al,%es:(%edi)
  a6:	89 ca                	mov    %ecx,%edx
  a8:	89 fb                	mov    %edi,%ebx
  aa:	89 5d 08             	mov    %ebx,0x8(%ebp)
  ad:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  b0:	5b                   	pop    %ebx
  b1:	5f                   	pop    %edi
  b2:	5d                   	pop    %ebp
  b3:	c3                   	ret    

000000b4 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  b4:	55                   	push   %ebp
  b5:	89 e5                	mov    %esp,%ebp
  b7:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  ba:	8b 45 08             	mov    0x8(%ebp),%eax
  bd:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  c0:	90                   	nop
  c1:	8b 45 08             	mov    0x8(%ebp),%eax
  c4:	8d 50 01             	lea    0x1(%eax),%edx
  c7:	89 55 08             	mov    %edx,0x8(%ebp)
  ca:	8b 55 0c             	mov    0xc(%ebp),%edx
  cd:	8d 4a 01             	lea    0x1(%edx),%ecx
  d0:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  d3:	0f b6 12             	movzbl (%edx),%edx
  d6:	88 10                	mov    %dl,(%eax)
  d8:	0f b6 00             	movzbl (%eax),%eax
  db:	84 c0                	test   %al,%al
  dd:	75 e2                	jne    c1 <strcpy+0xd>
    ;
  return os;
  df:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e2:	c9                   	leave  
  e3:	c3                   	ret    

000000e4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  e7:	eb 08                	jmp    f1 <strcmp+0xd>
    p++, q++;
  e9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  ed:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  f1:	8b 45 08             	mov    0x8(%ebp),%eax
  f4:	0f b6 00             	movzbl (%eax),%eax
  f7:	84 c0                	test   %al,%al
  f9:	74 10                	je     10b <strcmp+0x27>
  fb:	8b 45 08             	mov    0x8(%ebp),%eax
  fe:	0f b6 10             	movzbl (%eax),%edx
 101:	8b 45 0c             	mov    0xc(%ebp),%eax
 104:	0f b6 00             	movzbl (%eax),%eax
 107:	38 c2                	cmp    %al,%dl
 109:	74 de                	je     e9 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 10b:	8b 45 08             	mov    0x8(%ebp),%eax
 10e:	0f b6 00             	movzbl (%eax),%eax
 111:	0f b6 d0             	movzbl %al,%edx
 114:	8b 45 0c             	mov    0xc(%ebp),%eax
 117:	0f b6 00             	movzbl (%eax),%eax
 11a:	0f b6 c0             	movzbl %al,%eax
 11d:	29 c2                	sub    %eax,%edx
 11f:	89 d0                	mov    %edx,%eax
}
 121:	5d                   	pop    %ebp
 122:	c3                   	ret    

00000123 <strlen>:

uint
strlen(const char *s)
{
 123:	55                   	push   %ebp
 124:	89 e5                	mov    %esp,%ebp
 126:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 129:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 130:	eb 04                	jmp    136 <strlen+0x13>
 132:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 136:	8b 55 fc             	mov    -0x4(%ebp),%edx
 139:	8b 45 08             	mov    0x8(%ebp),%eax
 13c:	01 d0                	add    %edx,%eax
 13e:	0f b6 00             	movzbl (%eax),%eax
 141:	84 c0                	test   %al,%al
 143:	75 ed                	jne    132 <strlen+0xf>
    ;
  return n;
 145:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 148:	c9                   	leave  
 149:	c3                   	ret    

0000014a <memset>:

void*
memset(void *dst, int c, uint n)
{
 14a:	55                   	push   %ebp
 14b:	89 e5                	mov    %esp,%ebp
 14d:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 150:	8b 45 10             	mov    0x10(%ebp),%eax
 153:	89 44 24 08          	mov    %eax,0x8(%esp)
 157:	8b 45 0c             	mov    0xc(%ebp),%eax
 15a:	89 44 24 04          	mov    %eax,0x4(%esp)
 15e:	8b 45 08             	mov    0x8(%ebp),%eax
 161:	89 04 24             	mov    %eax,(%esp)
 164:	e8 26 ff ff ff       	call   8f <stosb>
  return dst;
 169:	8b 45 08             	mov    0x8(%ebp),%eax
}
 16c:	c9                   	leave  
 16d:	c3                   	ret    

0000016e <strchr>:

char*
strchr(const char *s, char c)
{
 16e:	55                   	push   %ebp
 16f:	89 e5                	mov    %esp,%ebp
 171:	83 ec 04             	sub    $0x4,%esp
 174:	8b 45 0c             	mov    0xc(%ebp),%eax
 177:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 17a:	eb 14                	jmp    190 <strchr+0x22>
    if(*s == c)
 17c:	8b 45 08             	mov    0x8(%ebp),%eax
 17f:	0f b6 00             	movzbl (%eax),%eax
 182:	3a 45 fc             	cmp    -0x4(%ebp),%al
 185:	75 05                	jne    18c <strchr+0x1e>
      return (char*)s;
 187:	8b 45 08             	mov    0x8(%ebp),%eax
 18a:	eb 13                	jmp    19f <strchr+0x31>
  for(; *s; s++)
 18c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 190:	8b 45 08             	mov    0x8(%ebp),%eax
 193:	0f b6 00             	movzbl (%eax),%eax
 196:	84 c0                	test   %al,%al
 198:	75 e2                	jne    17c <strchr+0xe>
  return 0;
 19a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 19f:	c9                   	leave  
 1a0:	c3                   	ret    

000001a1 <gets>:

char*
gets(char *buf, int max)
{
 1a1:	55                   	push   %ebp
 1a2:	89 e5                	mov    %esp,%ebp
 1a4:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1ae:	eb 4c                	jmp    1fc <gets+0x5b>
    cc = read(0, &c, 1);
 1b0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1b7:	00 
 1b8:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 1bf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1c6:	e8 57 02 00 00       	call   422 <read>
 1cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1ce:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1d2:	7f 02                	jg     1d6 <gets+0x35>
      break;
 1d4:	eb 31                	jmp    207 <gets+0x66>
    buf[i++] = c;
 1d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d9:	8d 50 01             	lea    0x1(%eax),%edx
 1dc:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1df:	89 c2                	mov    %eax,%edx
 1e1:	8b 45 08             	mov    0x8(%ebp),%eax
 1e4:	01 c2                	add    %eax,%edx
 1e6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1ea:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1ec:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1f0:	3c 0a                	cmp    $0xa,%al
 1f2:	74 13                	je     207 <gets+0x66>
 1f4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1f8:	3c 0d                	cmp    $0xd,%al
 1fa:	74 0b                	je     207 <gets+0x66>
  for(i=0; i+1 < max; ){
 1fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ff:	83 c0 01             	add    $0x1,%eax
 202:	3b 45 0c             	cmp    0xc(%ebp),%eax
 205:	7c a9                	jl     1b0 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 207:	8b 55 f4             	mov    -0xc(%ebp),%edx
 20a:	8b 45 08             	mov    0x8(%ebp),%eax
 20d:	01 d0                	add    %edx,%eax
 20f:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 212:	8b 45 08             	mov    0x8(%ebp),%eax
}
 215:	c9                   	leave  
 216:	c3                   	ret    

00000217 <stat>:

int
stat(const char *n, struct stat *st)
{
 217:	55                   	push   %ebp
 218:	89 e5                	mov    %esp,%ebp
 21a:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 21d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 224:	00 
 225:	8b 45 08             	mov    0x8(%ebp),%eax
 228:	89 04 24             	mov    %eax,(%esp)
 22b:	e8 1a 02 00 00       	call   44a <open>
 230:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 233:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 237:	79 07                	jns    240 <stat+0x29>
    return -1;
 239:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 23e:	eb 23                	jmp    263 <stat+0x4c>
  r = fstat(fd, st);
 240:	8b 45 0c             	mov    0xc(%ebp),%eax
 243:	89 44 24 04          	mov    %eax,0x4(%esp)
 247:	8b 45 f4             	mov    -0xc(%ebp),%eax
 24a:	89 04 24             	mov    %eax,(%esp)
 24d:	e8 10 02 00 00       	call   462 <fstat>
 252:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 255:	8b 45 f4             	mov    -0xc(%ebp),%eax
 258:	89 04 24             	mov    %eax,(%esp)
 25b:	e8 d2 01 00 00       	call   432 <close>
  return r;
 260:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 263:	c9                   	leave  
 264:	c3                   	ret    

00000265 <atoi>:

int
atoi(const char *s)
{
 265:	55                   	push   %ebp
 266:	89 e5                	mov    %esp,%ebp
 268:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 26b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 272:	eb 25                	jmp    299 <atoi+0x34>
    n = n*10 + *s++ - '0';
 274:	8b 55 fc             	mov    -0x4(%ebp),%edx
 277:	89 d0                	mov    %edx,%eax
 279:	c1 e0 02             	shl    $0x2,%eax
 27c:	01 d0                	add    %edx,%eax
 27e:	01 c0                	add    %eax,%eax
 280:	89 c1                	mov    %eax,%ecx
 282:	8b 45 08             	mov    0x8(%ebp),%eax
 285:	8d 50 01             	lea    0x1(%eax),%edx
 288:	89 55 08             	mov    %edx,0x8(%ebp)
 28b:	0f b6 00             	movzbl (%eax),%eax
 28e:	0f be c0             	movsbl %al,%eax
 291:	01 c8                	add    %ecx,%eax
 293:	83 e8 30             	sub    $0x30,%eax
 296:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 299:	8b 45 08             	mov    0x8(%ebp),%eax
 29c:	0f b6 00             	movzbl (%eax),%eax
 29f:	3c 2f                	cmp    $0x2f,%al
 2a1:	7e 0a                	jle    2ad <atoi+0x48>
 2a3:	8b 45 08             	mov    0x8(%ebp),%eax
 2a6:	0f b6 00             	movzbl (%eax),%eax
 2a9:	3c 39                	cmp    $0x39,%al
 2ab:	7e c7                	jle    274 <atoi+0xf>
  return n;
 2ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2b0:	c9                   	leave  
 2b1:	c3                   	ret    

000002b2 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2b2:	55                   	push   %ebp
 2b3:	89 e5                	mov    %esp,%ebp
 2b5:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 2b8:	8b 45 08             	mov    0x8(%ebp),%eax
 2bb:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2be:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2c4:	eb 17                	jmp    2dd <memmove+0x2b>
    *dst++ = *src++;
 2c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2c9:	8d 50 01             	lea    0x1(%eax),%edx
 2cc:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2cf:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2d2:	8d 4a 01             	lea    0x1(%edx),%ecx
 2d5:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2d8:	0f b6 12             	movzbl (%edx),%edx
 2db:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2dd:	8b 45 10             	mov    0x10(%ebp),%eax
 2e0:	8d 50 ff             	lea    -0x1(%eax),%edx
 2e3:	89 55 10             	mov    %edx,0x10(%ebp)
 2e6:	85 c0                	test   %eax,%eax
 2e8:	7f dc                	jg     2c6 <memmove+0x14>
  return vdst;
 2ea:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2ed:	c9                   	leave  
 2ee:	c3                   	ret    

000002ef <ps>:

void
ps() {
 2ef:	55                   	push   %ebp
 2f0:	89 e5                	mov    %esp,%ebp
 2f2:	57                   	push   %edi
 2f3:	56                   	push   %esi
 2f4:	53                   	push   %ebx
 2f5:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  int i = 0;
 2fb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  printf(1, "PID	TKTS	TCKS	STAT	NAME\n");
 302:	c7 44 24 04 91 09 00 	movl   $0x991,0x4(%esp)
 309:	00 
 30a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 311:	e8 7c 02 00 00       	call   592 <printf>
  getpinfo(&pstat);
 316:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 31c:	89 04 24             	mov    %eax,(%esp)
 31f:	e8 86 01 00 00       	call   4aa <getpinfo>
  while (pstat[i].pid != 0) {
 324:	e9 ad 00 00 00       	jmp    3d6 <ps+0xe7>
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
	pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 329:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 32f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 332:	89 d0                	mov    %edx,%eax
 334:	c1 e0 03             	shl    $0x3,%eax
 337:	01 d0                	add    %edx,%eax
 339:	c1 e0 02             	shl    $0x2,%eax
 33c:	83 c0 10             	add    $0x10,%eax
 33f:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 342:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 345:	89 d0                	mov    %edx,%eax
 347:	c1 e0 03             	shl    $0x3,%eax
 34a:	01 d0                	add    %edx,%eax
 34c:	c1 e0 02             	shl    $0x2,%eax
 34f:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 352:	01 d8                	add    %ebx,%eax
 354:	2d e4 08 00 00       	sub    $0x8e4,%eax
 359:	0f b6 00             	movzbl (%eax),%eax
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
 35c:	0f be f0             	movsbl %al,%esi
 35f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 362:	89 d0                	mov    %edx,%eax
 364:	c1 e0 03             	shl    $0x3,%eax
 367:	01 d0                	add    %edx,%eax
 369:	c1 e0 02             	shl    $0x2,%eax
 36c:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 36f:	01 c8                	add    %ecx,%eax
 371:	2d f8 08 00 00       	sub    $0x8f8,%eax
 376:	8b 18                	mov    (%eax),%ebx
 378:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 37b:	89 d0                	mov    %edx,%eax
 37d:	c1 e0 03             	shl    $0x3,%eax
 380:	01 d0                	add    %edx,%eax
 382:	c1 e0 02             	shl    $0x2,%eax
 385:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 388:	01 c8                	add    %ecx,%eax
 38a:	2d 00 09 00 00       	sub    $0x900,%eax
 38f:	8b 08                	mov    (%eax),%ecx
 391:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 394:	89 d0                	mov    %edx,%eax
 396:	c1 e0 03             	shl    $0x3,%eax
 399:	01 d0                	add    %edx,%eax
 39b:	c1 e0 02             	shl    $0x2,%eax
 39e:	8d 55 e8             	lea    -0x18(%ebp),%edx
 3a1:	01 d0                	add    %edx,%eax
 3a3:	2d fc 08 00 00       	sub    $0x8fc,%eax
 3a8:	8b 00                	mov    (%eax),%eax
 3aa:	89 7c 24 18          	mov    %edi,0x18(%esp)
 3ae:	89 74 24 14          	mov    %esi,0x14(%esp)
 3b2:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 3b6:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 3ba:	89 44 24 08          	mov    %eax,0x8(%esp)
 3be:	c7 44 24 04 aa 09 00 	movl   $0x9aa,0x4(%esp)
 3c5:	00 
 3c6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3cd:	e8 c0 01 00 00       	call   592 <printf>
      i++;
 3d2:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  while (pstat[i].pid != 0) {
 3d6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3d9:	89 d0                	mov    %edx,%eax
 3db:	c1 e0 03             	shl    $0x3,%eax
 3de:	01 d0                	add    %edx,%eax
 3e0:	c1 e0 02             	shl    $0x2,%eax
 3e3:	8d 75 e8             	lea    -0x18(%ebp),%esi
 3e6:	01 f0                	add    %esi,%eax
 3e8:	2d fc 08 00 00       	sub    $0x8fc,%eax
 3ed:	8b 00                	mov    (%eax),%eax
 3ef:	85 c0                	test   %eax,%eax
 3f1:	0f 85 32 ff ff ff    	jne    329 <ps+0x3a>
  }
}
 3f7:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 3fd:	5b                   	pop    %ebx
 3fe:	5e                   	pop    %esi
 3ff:	5f                   	pop    %edi
 400:	5d                   	pop    %ebp
 401:	c3                   	ret    

00000402 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 402:	b8 01 00 00 00       	mov    $0x1,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <exit>:
SYSCALL(exit)
 40a:	b8 02 00 00 00       	mov    $0x2,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <wait>:
SYSCALL(wait)
 412:	b8 03 00 00 00       	mov    $0x3,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <pipe>:
SYSCALL(pipe)
 41a:	b8 04 00 00 00       	mov    $0x4,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <read>:
SYSCALL(read)
 422:	b8 05 00 00 00       	mov    $0x5,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <write>:
SYSCALL(write)
 42a:	b8 10 00 00 00       	mov    $0x10,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <close>:
SYSCALL(close)
 432:	b8 15 00 00 00       	mov    $0x15,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <kill>:
SYSCALL(kill)
 43a:	b8 06 00 00 00       	mov    $0x6,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <exec>:
SYSCALL(exec)
 442:	b8 07 00 00 00       	mov    $0x7,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <open>:
SYSCALL(open)
 44a:	b8 0f 00 00 00       	mov    $0xf,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <mknod>:
SYSCALL(mknod)
 452:	b8 11 00 00 00       	mov    $0x11,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <unlink>:
SYSCALL(unlink)
 45a:	b8 12 00 00 00       	mov    $0x12,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <fstat>:
SYSCALL(fstat)
 462:	b8 08 00 00 00       	mov    $0x8,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <link>:
SYSCALL(link)
 46a:	b8 13 00 00 00       	mov    $0x13,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <mkdir>:
SYSCALL(mkdir)
 472:	b8 14 00 00 00       	mov    $0x14,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <chdir>:
SYSCALL(chdir)
 47a:	b8 09 00 00 00       	mov    $0x9,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <dup>:
SYSCALL(dup)
 482:	b8 0a 00 00 00       	mov    $0xa,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <getpid>:
SYSCALL(getpid)
 48a:	b8 0b 00 00 00       	mov    $0xb,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <sbrk>:
SYSCALL(sbrk)
 492:	b8 0c 00 00 00       	mov    $0xc,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <sleep>:
SYSCALL(sleep)
 49a:	b8 0d 00 00 00       	mov    $0xd,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <uptime>:
SYSCALL(uptime)
 4a2:	b8 0e 00 00 00       	mov    $0xe,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <getpinfo>:
SYSCALL(getpinfo)
 4aa:	b8 16 00 00 00       	mov    $0x16,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4b2:	55                   	push   %ebp
 4b3:	89 e5                	mov    %esp,%ebp
 4b5:	83 ec 18             	sub    $0x18,%esp
 4b8:	8b 45 0c             	mov    0xc(%ebp),%eax
 4bb:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4be:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4c5:	00 
 4c6:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4c9:	89 44 24 04          	mov    %eax,0x4(%esp)
 4cd:	8b 45 08             	mov    0x8(%ebp),%eax
 4d0:	89 04 24             	mov    %eax,(%esp)
 4d3:	e8 52 ff ff ff       	call   42a <write>
}
 4d8:	c9                   	leave  
 4d9:	c3                   	ret    

000004da <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4da:	55                   	push   %ebp
 4db:	89 e5                	mov    %esp,%ebp
 4dd:	56                   	push   %esi
 4de:	53                   	push   %ebx
 4df:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4e2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4e9:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4ed:	74 17                	je     506 <printint+0x2c>
 4ef:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4f3:	79 11                	jns    506 <printint+0x2c>
    neg = 1;
 4f5:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4fc:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ff:	f7 d8                	neg    %eax
 501:	89 45 ec             	mov    %eax,-0x14(%ebp)
 504:	eb 06                	jmp    50c <printint+0x32>
  } else {
    x = xx;
 506:	8b 45 0c             	mov    0xc(%ebp),%eax
 509:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 50c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 513:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 516:	8d 41 01             	lea    0x1(%ecx),%eax
 519:	89 45 f4             	mov    %eax,-0xc(%ebp)
 51c:	8b 5d 10             	mov    0x10(%ebp),%ebx
 51f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 522:	ba 00 00 00 00       	mov    $0x0,%edx
 527:	f7 f3                	div    %ebx
 529:	89 d0                	mov    %edx,%eax
 52b:	0f b6 80 38 0c 00 00 	movzbl 0xc38(%eax),%eax
 532:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 536:	8b 75 10             	mov    0x10(%ebp),%esi
 539:	8b 45 ec             	mov    -0x14(%ebp),%eax
 53c:	ba 00 00 00 00       	mov    $0x0,%edx
 541:	f7 f6                	div    %esi
 543:	89 45 ec             	mov    %eax,-0x14(%ebp)
 546:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 54a:	75 c7                	jne    513 <printint+0x39>
  if(neg)
 54c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 550:	74 10                	je     562 <printint+0x88>
    buf[i++] = '-';
 552:	8b 45 f4             	mov    -0xc(%ebp),%eax
 555:	8d 50 01             	lea    0x1(%eax),%edx
 558:	89 55 f4             	mov    %edx,-0xc(%ebp)
 55b:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 560:	eb 1f                	jmp    581 <printint+0xa7>
 562:	eb 1d                	jmp    581 <printint+0xa7>
    putc(fd, buf[i]);
 564:	8d 55 dc             	lea    -0x24(%ebp),%edx
 567:	8b 45 f4             	mov    -0xc(%ebp),%eax
 56a:	01 d0                	add    %edx,%eax
 56c:	0f b6 00             	movzbl (%eax),%eax
 56f:	0f be c0             	movsbl %al,%eax
 572:	89 44 24 04          	mov    %eax,0x4(%esp)
 576:	8b 45 08             	mov    0x8(%ebp),%eax
 579:	89 04 24             	mov    %eax,(%esp)
 57c:	e8 31 ff ff ff       	call   4b2 <putc>
  while(--i >= 0)
 581:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 585:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 589:	79 d9                	jns    564 <printint+0x8a>
}
 58b:	83 c4 30             	add    $0x30,%esp
 58e:	5b                   	pop    %ebx
 58f:	5e                   	pop    %esi
 590:	5d                   	pop    %ebp
 591:	c3                   	ret    

00000592 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 592:	55                   	push   %ebp
 593:	89 e5                	mov    %esp,%ebp
 595:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 598:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 59f:	8d 45 0c             	lea    0xc(%ebp),%eax
 5a2:	83 c0 04             	add    $0x4,%eax
 5a5:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5a8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5af:	e9 7c 01 00 00       	jmp    730 <printf+0x19e>
    c = fmt[i] & 0xff;
 5b4:	8b 55 0c             	mov    0xc(%ebp),%edx
 5b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5ba:	01 d0                	add    %edx,%eax
 5bc:	0f b6 00             	movzbl (%eax),%eax
 5bf:	0f be c0             	movsbl %al,%eax
 5c2:	25 ff 00 00 00       	and    $0xff,%eax
 5c7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5ca:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5ce:	75 2c                	jne    5fc <printf+0x6a>
      if(c == '%'){
 5d0:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5d4:	75 0c                	jne    5e2 <printf+0x50>
        state = '%';
 5d6:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5dd:	e9 4a 01 00 00       	jmp    72c <printf+0x19a>
      } else {
        putc(fd, c);
 5e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5e5:	0f be c0             	movsbl %al,%eax
 5e8:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ec:	8b 45 08             	mov    0x8(%ebp),%eax
 5ef:	89 04 24             	mov    %eax,(%esp)
 5f2:	e8 bb fe ff ff       	call   4b2 <putc>
 5f7:	e9 30 01 00 00       	jmp    72c <printf+0x19a>
      }
    } else if(state == '%'){
 5fc:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 600:	0f 85 26 01 00 00    	jne    72c <printf+0x19a>
      if(c == 'd'){
 606:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 60a:	75 2d                	jne    639 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 60c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 60f:	8b 00                	mov    (%eax),%eax
 611:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 618:	00 
 619:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 620:	00 
 621:	89 44 24 04          	mov    %eax,0x4(%esp)
 625:	8b 45 08             	mov    0x8(%ebp),%eax
 628:	89 04 24             	mov    %eax,(%esp)
 62b:	e8 aa fe ff ff       	call   4da <printint>
        ap++;
 630:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 634:	e9 ec 00 00 00       	jmp    725 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 639:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 63d:	74 06                	je     645 <printf+0xb3>
 63f:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 643:	75 2d                	jne    672 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 645:	8b 45 e8             	mov    -0x18(%ebp),%eax
 648:	8b 00                	mov    (%eax),%eax
 64a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 651:	00 
 652:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 659:	00 
 65a:	89 44 24 04          	mov    %eax,0x4(%esp)
 65e:	8b 45 08             	mov    0x8(%ebp),%eax
 661:	89 04 24             	mov    %eax,(%esp)
 664:	e8 71 fe ff ff       	call   4da <printint>
        ap++;
 669:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 66d:	e9 b3 00 00 00       	jmp    725 <printf+0x193>
      } else if(c == 's'){
 672:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 676:	75 45                	jne    6bd <printf+0x12b>
        s = (char*)*ap;
 678:	8b 45 e8             	mov    -0x18(%ebp),%eax
 67b:	8b 00                	mov    (%eax),%eax
 67d:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 680:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 684:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 688:	75 09                	jne    693 <printf+0x101>
          s = "(null)";
 68a:	c7 45 f4 ba 09 00 00 	movl   $0x9ba,-0xc(%ebp)
        while(*s != 0){
 691:	eb 1e                	jmp    6b1 <printf+0x11f>
 693:	eb 1c                	jmp    6b1 <printf+0x11f>
          putc(fd, *s);
 695:	8b 45 f4             	mov    -0xc(%ebp),%eax
 698:	0f b6 00             	movzbl (%eax),%eax
 69b:	0f be c0             	movsbl %al,%eax
 69e:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a2:	8b 45 08             	mov    0x8(%ebp),%eax
 6a5:	89 04 24             	mov    %eax,(%esp)
 6a8:	e8 05 fe ff ff       	call   4b2 <putc>
          s++;
 6ad:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 6b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6b4:	0f b6 00             	movzbl (%eax),%eax
 6b7:	84 c0                	test   %al,%al
 6b9:	75 da                	jne    695 <printf+0x103>
 6bb:	eb 68                	jmp    725 <printf+0x193>
        }
      } else if(c == 'c'){
 6bd:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6c1:	75 1d                	jne    6e0 <printf+0x14e>
        putc(fd, *ap);
 6c3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6c6:	8b 00                	mov    (%eax),%eax
 6c8:	0f be c0             	movsbl %al,%eax
 6cb:	89 44 24 04          	mov    %eax,0x4(%esp)
 6cf:	8b 45 08             	mov    0x8(%ebp),%eax
 6d2:	89 04 24             	mov    %eax,(%esp)
 6d5:	e8 d8 fd ff ff       	call   4b2 <putc>
        ap++;
 6da:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6de:	eb 45                	jmp    725 <printf+0x193>
      } else if(c == '%'){
 6e0:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6e4:	75 17                	jne    6fd <printf+0x16b>
        putc(fd, c);
 6e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6e9:	0f be c0             	movsbl %al,%eax
 6ec:	89 44 24 04          	mov    %eax,0x4(%esp)
 6f0:	8b 45 08             	mov    0x8(%ebp),%eax
 6f3:	89 04 24             	mov    %eax,(%esp)
 6f6:	e8 b7 fd ff ff       	call   4b2 <putc>
 6fb:	eb 28                	jmp    725 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6fd:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 704:	00 
 705:	8b 45 08             	mov    0x8(%ebp),%eax
 708:	89 04 24             	mov    %eax,(%esp)
 70b:	e8 a2 fd ff ff       	call   4b2 <putc>
        putc(fd, c);
 710:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 713:	0f be c0             	movsbl %al,%eax
 716:	89 44 24 04          	mov    %eax,0x4(%esp)
 71a:	8b 45 08             	mov    0x8(%ebp),%eax
 71d:	89 04 24             	mov    %eax,(%esp)
 720:	e8 8d fd ff ff       	call   4b2 <putc>
      }
      state = 0;
 725:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 72c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 730:	8b 55 0c             	mov    0xc(%ebp),%edx
 733:	8b 45 f0             	mov    -0x10(%ebp),%eax
 736:	01 d0                	add    %edx,%eax
 738:	0f b6 00             	movzbl (%eax),%eax
 73b:	84 c0                	test   %al,%al
 73d:	0f 85 71 fe ff ff    	jne    5b4 <printf+0x22>
    }
  }
}
 743:	c9                   	leave  
 744:	c3                   	ret    

00000745 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 745:	55                   	push   %ebp
 746:	89 e5                	mov    %esp,%ebp
 748:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 74b:	8b 45 08             	mov    0x8(%ebp),%eax
 74e:	83 e8 08             	sub    $0x8,%eax
 751:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 754:	a1 54 0c 00 00       	mov    0xc54,%eax
 759:	89 45 fc             	mov    %eax,-0x4(%ebp)
 75c:	eb 24                	jmp    782 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 75e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 761:	8b 00                	mov    (%eax),%eax
 763:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 766:	77 12                	ja     77a <free+0x35>
 768:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 76e:	77 24                	ja     794 <free+0x4f>
 770:	8b 45 fc             	mov    -0x4(%ebp),%eax
 773:	8b 00                	mov    (%eax),%eax
 775:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 778:	77 1a                	ja     794 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 77a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77d:	8b 00                	mov    (%eax),%eax
 77f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 782:	8b 45 f8             	mov    -0x8(%ebp),%eax
 785:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 788:	76 d4                	jbe    75e <free+0x19>
 78a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78d:	8b 00                	mov    (%eax),%eax
 78f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 792:	76 ca                	jbe    75e <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 794:	8b 45 f8             	mov    -0x8(%ebp),%eax
 797:	8b 40 04             	mov    0x4(%eax),%eax
 79a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7a1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a4:	01 c2                	add    %eax,%edx
 7a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a9:	8b 00                	mov    (%eax),%eax
 7ab:	39 c2                	cmp    %eax,%edx
 7ad:	75 24                	jne    7d3 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7af:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b2:	8b 50 04             	mov    0x4(%eax),%edx
 7b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b8:	8b 00                	mov    (%eax),%eax
 7ba:	8b 40 04             	mov    0x4(%eax),%eax
 7bd:	01 c2                	add    %eax,%edx
 7bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c2:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c8:	8b 00                	mov    (%eax),%eax
 7ca:	8b 10                	mov    (%eax),%edx
 7cc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7cf:	89 10                	mov    %edx,(%eax)
 7d1:	eb 0a                	jmp    7dd <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d6:	8b 10                	mov    (%eax),%edx
 7d8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7db:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e0:	8b 40 04             	mov    0x4(%eax),%eax
 7e3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ed:	01 d0                	add    %edx,%eax
 7ef:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7f2:	75 20                	jne    814 <free+0xcf>
    p->s.size += bp->s.size;
 7f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f7:	8b 50 04             	mov    0x4(%eax),%edx
 7fa:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7fd:	8b 40 04             	mov    0x4(%eax),%eax
 800:	01 c2                	add    %eax,%edx
 802:	8b 45 fc             	mov    -0x4(%ebp),%eax
 805:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 808:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80b:	8b 10                	mov    (%eax),%edx
 80d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 810:	89 10                	mov    %edx,(%eax)
 812:	eb 08                	jmp    81c <free+0xd7>
  } else
    p->s.ptr = bp;
 814:	8b 45 fc             	mov    -0x4(%ebp),%eax
 817:	8b 55 f8             	mov    -0x8(%ebp),%edx
 81a:	89 10                	mov    %edx,(%eax)
  freep = p;
 81c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81f:	a3 54 0c 00 00       	mov    %eax,0xc54
}
 824:	c9                   	leave  
 825:	c3                   	ret    

00000826 <morecore>:

static Header*
morecore(uint nu)
{
 826:	55                   	push   %ebp
 827:	89 e5                	mov    %esp,%ebp
 829:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 82c:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 833:	77 07                	ja     83c <morecore+0x16>
    nu = 4096;
 835:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 83c:	8b 45 08             	mov    0x8(%ebp),%eax
 83f:	c1 e0 03             	shl    $0x3,%eax
 842:	89 04 24             	mov    %eax,(%esp)
 845:	e8 48 fc ff ff       	call   492 <sbrk>
 84a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 84d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 851:	75 07                	jne    85a <morecore+0x34>
    return 0;
 853:	b8 00 00 00 00       	mov    $0x0,%eax
 858:	eb 22                	jmp    87c <morecore+0x56>
  hp = (Header*)p;
 85a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 85d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 860:	8b 45 f0             	mov    -0x10(%ebp),%eax
 863:	8b 55 08             	mov    0x8(%ebp),%edx
 866:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 869:	8b 45 f0             	mov    -0x10(%ebp),%eax
 86c:	83 c0 08             	add    $0x8,%eax
 86f:	89 04 24             	mov    %eax,(%esp)
 872:	e8 ce fe ff ff       	call   745 <free>
  return freep;
 877:	a1 54 0c 00 00       	mov    0xc54,%eax
}
 87c:	c9                   	leave  
 87d:	c3                   	ret    

0000087e <malloc>:

void*
malloc(uint nbytes)
{
 87e:	55                   	push   %ebp
 87f:	89 e5                	mov    %esp,%ebp
 881:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 884:	8b 45 08             	mov    0x8(%ebp),%eax
 887:	83 c0 07             	add    $0x7,%eax
 88a:	c1 e8 03             	shr    $0x3,%eax
 88d:	83 c0 01             	add    $0x1,%eax
 890:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 893:	a1 54 0c 00 00       	mov    0xc54,%eax
 898:	89 45 f0             	mov    %eax,-0x10(%ebp)
 89b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 89f:	75 23                	jne    8c4 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8a1:	c7 45 f0 4c 0c 00 00 	movl   $0xc4c,-0x10(%ebp)
 8a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ab:	a3 54 0c 00 00       	mov    %eax,0xc54
 8b0:	a1 54 0c 00 00       	mov    0xc54,%eax
 8b5:	a3 4c 0c 00 00       	mov    %eax,0xc4c
    base.s.size = 0;
 8ba:	c7 05 50 0c 00 00 00 	movl   $0x0,0xc50
 8c1:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c7:	8b 00                	mov    (%eax),%eax
 8c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8cf:	8b 40 04             	mov    0x4(%eax),%eax
 8d2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8d5:	72 4d                	jb     924 <malloc+0xa6>
      if(p->s.size == nunits)
 8d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8da:	8b 40 04             	mov    0x4(%eax),%eax
 8dd:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8e0:	75 0c                	jne    8ee <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e5:	8b 10                	mov    (%eax),%edx
 8e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ea:	89 10                	mov    %edx,(%eax)
 8ec:	eb 26                	jmp    914 <malloc+0x96>
      else {
        p->s.size -= nunits;
 8ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f1:	8b 40 04             	mov    0x4(%eax),%eax
 8f4:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8f7:	89 c2                	mov    %eax,%edx
 8f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8fc:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
 902:	8b 40 04             	mov    0x4(%eax),%eax
 905:	c1 e0 03             	shl    $0x3,%eax
 908:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 90b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90e:	8b 55 ec             	mov    -0x14(%ebp),%edx
 911:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 914:	8b 45 f0             	mov    -0x10(%ebp),%eax
 917:	a3 54 0c 00 00       	mov    %eax,0xc54
      return (void*)(p + 1);
 91c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 91f:	83 c0 08             	add    $0x8,%eax
 922:	eb 38                	jmp    95c <malloc+0xde>
    }
    if(p == freep)
 924:	a1 54 0c 00 00       	mov    0xc54,%eax
 929:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 92c:	75 1b                	jne    949 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 92e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 931:	89 04 24             	mov    %eax,(%esp)
 934:	e8 ed fe ff ff       	call   826 <morecore>
 939:	89 45 f4             	mov    %eax,-0xc(%ebp)
 93c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 940:	75 07                	jne    949 <malloc+0xcb>
        return 0;
 942:	b8 00 00 00 00       	mov    $0x0,%eax
 947:	eb 13                	jmp    95c <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 949:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 94f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 952:	8b 00                	mov    (%eax),%eax
 954:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 957:	e9 70 ff ff ff       	jmp    8cc <malloc+0x4e>
}
 95c:	c9                   	leave  
 95d:	c3                   	ret    
