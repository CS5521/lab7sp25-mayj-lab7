
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
  if(fork() > 0)
   9:	e8 88 03 00 00       	call   396 <fork>
   e:	85 c0                	test   %eax,%eax
  10:	7e 0c                	jle    1e <main+0x1e>
    sleep(5);  // Let child exit before parent.
  12:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  19:	e8 10 04 00 00       	call   42e <sleep>
  exit();
  1e:	e8 7b 03 00 00       	call   39e <exit>

00000023 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  23:	55                   	push   %ebp
  24:	89 e5                	mov    %esp,%ebp
  26:	57                   	push   %edi
  27:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  28:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2b:	8b 55 10             	mov    0x10(%ebp),%edx
  2e:	8b 45 0c             	mov    0xc(%ebp),%eax
  31:	89 cb                	mov    %ecx,%ebx
  33:	89 df                	mov    %ebx,%edi
  35:	89 d1                	mov    %edx,%ecx
  37:	fc                   	cld    
  38:	f3 aa                	rep stos %al,%es:(%edi)
  3a:	89 ca                	mov    %ecx,%edx
  3c:	89 fb                	mov    %edi,%ebx
  3e:	89 5d 08             	mov    %ebx,0x8(%ebp)
  41:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  44:	5b                   	pop    %ebx
  45:	5f                   	pop    %edi
  46:	5d                   	pop    %ebp
  47:	c3                   	ret    

00000048 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  48:	55                   	push   %ebp
  49:	89 e5                	mov    %esp,%ebp
  4b:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  4e:	8b 45 08             	mov    0x8(%ebp),%eax
  51:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  54:	90                   	nop
  55:	8b 45 08             	mov    0x8(%ebp),%eax
  58:	8d 50 01             	lea    0x1(%eax),%edx
  5b:	89 55 08             	mov    %edx,0x8(%ebp)
  5e:	8b 55 0c             	mov    0xc(%ebp),%edx
  61:	8d 4a 01             	lea    0x1(%edx),%ecx
  64:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  67:	0f b6 12             	movzbl (%edx),%edx
  6a:	88 10                	mov    %dl,(%eax)
  6c:	0f b6 00             	movzbl (%eax),%eax
  6f:	84 c0                	test   %al,%al
  71:	75 e2                	jne    55 <strcpy+0xd>
    ;
  return os;
  73:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  76:	c9                   	leave  
  77:	c3                   	ret    

00000078 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  78:	55                   	push   %ebp
  79:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  7b:	eb 08                	jmp    85 <strcmp+0xd>
    p++, q++;
  7d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  81:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  85:	8b 45 08             	mov    0x8(%ebp),%eax
  88:	0f b6 00             	movzbl (%eax),%eax
  8b:	84 c0                	test   %al,%al
  8d:	74 10                	je     9f <strcmp+0x27>
  8f:	8b 45 08             	mov    0x8(%ebp),%eax
  92:	0f b6 10             	movzbl (%eax),%edx
  95:	8b 45 0c             	mov    0xc(%ebp),%eax
  98:	0f b6 00             	movzbl (%eax),%eax
  9b:	38 c2                	cmp    %al,%dl
  9d:	74 de                	je     7d <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  9f:	8b 45 08             	mov    0x8(%ebp),%eax
  a2:	0f b6 00             	movzbl (%eax),%eax
  a5:	0f b6 d0             	movzbl %al,%edx
  a8:	8b 45 0c             	mov    0xc(%ebp),%eax
  ab:	0f b6 00             	movzbl (%eax),%eax
  ae:	0f b6 c0             	movzbl %al,%eax
  b1:	29 c2                	sub    %eax,%edx
  b3:	89 d0                	mov    %edx,%eax
}
  b5:	5d                   	pop    %ebp
  b6:	c3                   	ret    

000000b7 <strlen>:

uint
strlen(const char *s)
{
  b7:	55                   	push   %ebp
  b8:	89 e5                	mov    %esp,%ebp
  ba:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  bd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c4:	eb 04                	jmp    ca <strlen+0x13>
  c6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  ca:	8b 55 fc             	mov    -0x4(%ebp),%edx
  cd:	8b 45 08             	mov    0x8(%ebp),%eax
  d0:	01 d0                	add    %edx,%eax
  d2:	0f b6 00             	movzbl (%eax),%eax
  d5:	84 c0                	test   %al,%al
  d7:	75 ed                	jne    c6 <strlen+0xf>
    ;
  return n;
  d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  dc:	c9                   	leave  
  dd:	c3                   	ret    

000000de <memset>:

void*
memset(void *dst, int c, uint n)
{
  de:	55                   	push   %ebp
  df:	89 e5                	mov    %esp,%ebp
  e1:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  e4:	8b 45 10             	mov    0x10(%ebp),%eax
  e7:	89 44 24 08          	mov    %eax,0x8(%esp)
  eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  ee:	89 44 24 04          	mov    %eax,0x4(%esp)
  f2:	8b 45 08             	mov    0x8(%ebp),%eax
  f5:	89 04 24             	mov    %eax,(%esp)
  f8:	e8 26 ff ff ff       	call   23 <stosb>
  return dst;
  fd:	8b 45 08             	mov    0x8(%ebp),%eax
}
 100:	c9                   	leave  
 101:	c3                   	ret    

00000102 <strchr>:

char*
strchr(const char *s, char c)
{
 102:	55                   	push   %ebp
 103:	89 e5                	mov    %esp,%ebp
 105:	83 ec 04             	sub    $0x4,%esp
 108:	8b 45 0c             	mov    0xc(%ebp),%eax
 10b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 10e:	eb 14                	jmp    124 <strchr+0x22>
    if(*s == c)
 110:	8b 45 08             	mov    0x8(%ebp),%eax
 113:	0f b6 00             	movzbl (%eax),%eax
 116:	3a 45 fc             	cmp    -0x4(%ebp),%al
 119:	75 05                	jne    120 <strchr+0x1e>
      return (char*)s;
 11b:	8b 45 08             	mov    0x8(%ebp),%eax
 11e:	eb 13                	jmp    133 <strchr+0x31>
  for(; *s; s++)
 120:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 124:	8b 45 08             	mov    0x8(%ebp),%eax
 127:	0f b6 00             	movzbl (%eax),%eax
 12a:	84 c0                	test   %al,%al
 12c:	75 e2                	jne    110 <strchr+0xe>
  return 0;
 12e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 133:	c9                   	leave  
 134:	c3                   	ret    

00000135 <gets>:

char*
gets(char *buf, int max)
{
 135:	55                   	push   %ebp
 136:	89 e5                	mov    %esp,%ebp
 138:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 13b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 142:	eb 4c                	jmp    190 <gets+0x5b>
    cc = read(0, &c, 1);
 144:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 14b:	00 
 14c:	8d 45 ef             	lea    -0x11(%ebp),%eax
 14f:	89 44 24 04          	mov    %eax,0x4(%esp)
 153:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 15a:	e8 57 02 00 00       	call   3b6 <read>
 15f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 162:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 166:	7f 02                	jg     16a <gets+0x35>
      break;
 168:	eb 31                	jmp    19b <gets+0x66>
    buf[i++] = c;
 16a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 16d:	8d 50 01             	lea    0x1(%eax),%edx
 170:	89 55 f4             	mov    %edx,-0xc(%ebp)
 173:	89 c2                	mov    %eax,%edx
 175:	8b 45 08             	mov    0x8(%ebp),%eax
 178:	01 c2                	add    %eax,%edx
 17a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 17e:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 180:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 184:	3c 0a                	cmp    $0xa,%al
 186:	74 13                	je     19b <gets+0x66>
 188:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 18c:	3c 0d                	cmp    $0xd,%al
 18e:	74 0b                	je     19b <gets+0x66>
  for(i=0; i+1 < max; ){
 190:	8b 45 f4             	mov    -0xc(%ebp),%eax
 193:	83 c0 01             	add    $0x1,%eax
 196:	3b 45 0c             	cmp    0xc(%ebp),%eax
 199:	7c a9                	jl     144 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 19b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 19e:	8b 45 08             	mov    0x8(%ebp),%eax
 1a1:	01 d0                	add    %edx,%eax
 1a3:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1a6:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1a9:	c9                   	leave  
 1aa:	c3                   	ret    

000001ab <stat>:

int
stat(const char *n, struct stat *st)
{
 1ab:	55                   	push   %ebp
 1ac:	89 e5                	mov    %esp,%ebp
 1ae:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1b8:	00 
 1b9:	8b 45 08             	mov    0x8(%ebp),%eax
 1bc:	89 04 24             	mov    %eax,(%esp)
 1bf:	e8 1a 02 00 00       	call   3de <open>
 1c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1cb:	79 07                	jns    1d4 <stat+0x29>
    return -1;
 1cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1d2:	eb 23                	jmp    1f7 <stat+0x4c>
  r = fstat(fd, st);
 1d4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d7:	89 44 24 04          	mov    %eax,0x4(%esp)
 1db:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1de:	89 04 24             	mov    %eax,(%esp)
 1e1:	e8 10 02 00 00       	call   3f6 <fstat>
 1e6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ec:	89 04 24             	mov    %eax,(%esp)
 1ef:	e8 d2 01 00 00       	call   3c6 <close>
  return r;
 1f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1f7:	c9                   	leave  
 1f8:	c3                   	ret    

000001f9 <atoi>:

int
atoi(const char *s)
{
 1f9:	55                   	push   %ebp
 1fa:	89 e5                	mov    %esp,%ebp
 1fc:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1ff:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 206:	eb 25                	jmp    22d <atoi+0x34>
    n = n*10 + *s++ - '0';
 208:	8b 55 fc             	mov    -0x4(%ebp),%edx
 20b:	89 d0                	mov    %edx,%eax
 20d:	c1 e0 02             	shl    $0x2,%eax
 210:	01 d0                	add    %edx,%eax
 212:	01 c0                	add    %eax,%eax
 214:	89 c1                	mov    %eax,%ecx
 216:	8b 45 08             	mov    0x8(%ebp),%eax
 219:	8d 50 01             	lea    0x1(%eax),%edx
 21c:	89 55 08             	mov    %edx,0x8(%ebp)
 21f:	0f b6 00             	movzbl (%eax),%eax
 222:	0f be c0             	movsbl %al,%eax
 225:	01 c8                	add    %ecx,%eax
 227:	83 e8 30             	sub    $0x30,%eax
 22a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 22d:	8b 45 08             	mov    0x8(%ebp),%eax
 230:	0f b6 00             	movzbl (%eax),%eax
 233:	3c 2f                	cmp    $0x2f,%al
 235:	7e 0a                	jle    241 <atoi+0x48>
 237:	8b 45 08             	mov    0x8(%ebp),%eax
 23a:	0f b6 00             	movzbl (%eax),%eax
 23d:	3c 39                	cmp    $0x39,%al
 23f:	7e c7                	jle    208 <atoi+0xf>
  return n;
 241:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 244:	c9                   	leave  
 245:	c3                   	ret    

00000246 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 246:	55                   	push   %ebp
 247:	89 e5                	mov    %esp,%ebp
 249:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 24c:	8b 45 08             	mov    0x8(%ebp),%eax
 24f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 252:	8b 45 0c             	mov    0xc(%ebp),%eax
 255:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 258:	eb 17                	jmp    271 <memmove+0x2b>
    *dst++ = *src++;
 25a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 25d:	8d 50 01             	lea    0x1(%eax),%edx
 260:	89 55 fc             	mov    %edx,-0x4(%ebp)
 263:	8b 55 f8             	mov    -0x8(%ebp),%edx
 266:	8d 4a 01             	lea    0x1(%edx),%ecx
 269:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 26c:	0f b6 12             	movzbl (%edx),%edx
 26f:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 271:	8b 45 10             	mov    0x10(%ebp),%eax
 274:	8d 50 ff             	lea    -0x1(%eax),%edx
 277:	89 55 10             	mov    %edx,0x10(%ebp)
 27a:	85 c0                	test   %eax,%eax
 27c:	7f dc                	jg     25a <memmove+0x14>
  return vdst;
 27e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 281:	c9                   	leave  
 282:	c3                   	ret    

00000283 <ps>:

void
ps() {
 283:	55                   	push   %ebp
 284:	89 e5                	mov    %esp,%ebp
 286:	57                   	push   %edi
 287:	56                   	push   %esi
 288:	53                   	push   %ebx
 289:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  int i = 0;
 28f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  printf(1, "PID	TKTS	TCKS	STAT	NAME\n");
 296:	c7 44 24 04 fa 08 00 	movl   $0x8fa,0x4(%esp)
 29d:	00 
 29e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2a5:	e8 84 02 00 00       	call   52e <printf>
  getpinfo(&pstat);
 2aa:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 2b0:	89 04 24             	mov    %eax,(%esp)
 2b3:	e8 86 01 00 00       	call   43e <getpinfo>
  while (pstat[i].pid != 0) {
 2b8:	e9 ad 00 00 00       	jmp    36a <ps+0xe7>
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
	pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 2bd:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 2c3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2c6:	89 d0                	mov    %edx,%eax
 2c8:	c1 e0 03             	shl    $0x3,%eax
 2cb:	01 d0                	add    %edx,%eax
 2cd:	c1 e0 02             	shl    $0x2,%eax
 2d0:	83 c0 10             	add    $0x10,%eax
 2d3:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 2d6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2d9:	89 d0                	mov    %edx,%eax
 2db:	c1 e0 03             	shl    $0x3,%eax
 2de:	01 d0                	add    %edx,%eax
 2e0:	c1 e0 02             	shl    $0x2,%eax
 2e3:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 2e6:	01 d8                	add    %ebx,%eax
 2e8:	2d e4 08 00 00       	sub    $0x8e4,%eax
 2ed:	0f b6 00             	movzbl (%eax),%eax
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
 2f0:	0f be f0             	movsbl %al,%esi
 2f3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2f6:	89 d0                	mov    %edx,%eax
 2f8:	c1 e0 03             	shl    $0x3,%eax
 2fb:	01 d0                	add    %edx,%eax
 2fd:	c1 e0 02             	shl    $0x2,%eax
 300:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 303:	01 c8                	add    %ecx,%eax
 305:	2d f8 08 00 00       	sub    $0x8f8,%eax
 30a:	8b 18                	mov    (%eax),%ebx
 30c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 30f:	89 d0                	mov    %edx,%eax
 311:	c1 e0 03             	shl    $0x3,%eax
 314:	01 d0                	add    %edx,%eax
 316:	c1 e0 02             	shl    $0x2,%eax
 319:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 31c:	01 c8                	add    %ecx,%eax
 31e:	2d 00 09 00 00       	sub    $0x900,%eax
 323:	8b 08                	mov    (%eax),%ecx
 325:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 328:	89 d0                	mov    %edx,%eax
 32a:	c1 e0 03             	shl    $0x3,%eax
 32d:	01 d0                	add    %edx,%eax
 32f:	c1 e0 02             	shl    $0x2,%eax
 332:	8d 55 e8             	lea    -0x18(%ebp),%edx
 335:	01 d0                	add    %edx,%eax
 337:	2d fc 08 00 00       	sub    $0x8fc,%eax
 33c:	8b 00                	mov    (%eax),%eax
 33e:	89 7c 24 18          	mov    %edi,0x18(%esp)
 342:	89 74 24 14          	mov    %esi,0x14(%esp)
 346:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 34a:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 34e:	89 44 24 08          	mov    %eax,0x8(%esp)
 352:	c7 44 24 04 13 09 00 	movl   $0x913,0x4(%esp)
 359:	00 
 35a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 361:	e8 c8 01 00 00       	call   52e <printf>
      i++;
 366:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  while (pstat[i].pid != 0) {
 36a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 36d:	89 d0                	mov    %edx,%eax
 36f:	c1 e0 03             	shl    $0x3,%eax
 372:	01 d0                	add    %edx,%eax
 374:	c1 e0 02             	shl    $0x2,%eax
 377:	8d 75 e8             	lea    -0x18(%ebp),%esi
 37a:	01 f0                	add    %esi,%eax
 37c:	2d fc 08 00 00       	sub    $0x8fc,%eax
 381:	8b 00                	mov    (%eax),%eax
 383:	85 c0                	test   %eax,%eax
 385:	0f 85 32 ff ff ff    	jne    2bd <ps+0x3a>
  }
}
 38b:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 391:	5b                   	pop    %ebx
 392:	5e                   	pop    %esi
 393:	5f                   	pop    %edi
 394:	5d                   	pop    %ebp
 395:	c3                   	ret    

00000396 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 396:	b8 01 00 00 00       	mov    $0x1,%eax
 39b:	cd 40                	int    $0x40
 39d:	c3                   	ret    

0000039e <exit>:
SYSCALL(exit)
 39e:	b8 02 00 00 00       	mov    $0x2,%eax
 3a3:	cd 40                	int    $0x40
 3a5:	c3                   	ret    

000003a6 <wait>:
SYSCALL(wait)
 3a6:	b8 03 00 00 00       	mov    $0x3,%eax
 3ab:	cd 40                	int    $0x40
 3ad:	c3                   	ret    

000003ae <pipe>:
SYSCALL(pipe)
 3ae:	b8 04 00 00 00       	mov    $0x4,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret    

000003b6 <read>:
SYSCALL(read)
 3b6:	b8 05 00 00 00       	mov    $0x5,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret    

000003be <write>:
SYSCALL(write)
 3be:	b8 10 00 00 00       	mov    $0x10,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret    

000003c6 <close>:
SYSCALL(close)
 3c6:	b8 15 00 00 00       	mov    $0x15,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret    

000003ce <kill>:
SYSCALL(kill)
 3ce:	b8 06 00 00 00       	mov    $0x6,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret    

000003d6 <exec>:
SYSCALL(exec)
 3d6:	b8 07 00 00 00       	mov    $0x7,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret    

000003de <open>:
SYSCALL(open)
 3de:	b8 0f 00 00 00       	mov    $0xf,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret    

000003e6 <mknod>:
SYSCALL(mknod)
 3e6:	b8 11 00 00 00       	mov    $0x11,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret    

000003ee <unlink>:
SYSCALL(unlink)
 3ee:	b8 12 00 00 00       	mov    $0x12,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <fstat>:
SYSCALL(fstat)
 3f6:	b8 08 00 00 00       	mov    $0x8,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret    

000003fe <link>:
SYSCALL(link)
 3fe:	b8 13 00 00 00       	mov    $0x13,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <mkdir>:
SYSCALL(mkdir)
 406:	b8 14 00 00 00       	mov    $0x14,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <chdir>:
SYSCALL(chdir)
 40e:	b8 09 00 00 00       	mov    $0x9,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret    

00000416 <dup>:
SYSCALL(dup)
 416:	b8 0a 00 00 00       	mov    $0xa,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret    

0000041e <getpid>:
SYSCALL(getpid)
 41e:	b8 0b 00 00 00       	mov    $0xb,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret    

00000426 <sbrk>:
SYSCALL(sbrk)
 426:	b8 0c 00 00 00       	mov    $0xc,%eax
 42b:	cd 40                	int    $0x40
 42d:	c3                   	ret    

0000042e <sleep>:
SYSCALL(sleep)
 42e:	b8 0d 00 00 00       	mov    $0xd,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret    

00000436 <uptime>:
SYSCALL(uptime)
 436:	b8 0e 00 00 00       	mov    $0xe,%eax
 43b:	cd 40                	int    $0x40
 43d:	c3                   	ret    

0000043e <getpinfo>:
SYSCALL(getpinfo)
 43e:	b8 16 00 00 00       	mov    $0x16,%eax
 443:	cd 40                	int    $0x40
 445:	c3                   	ret    

00000446 <settickets>:
SYSCALL(settickets)
 446:	b8 17 00 00 00       	mov    $0x17,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret    

0000044e <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 44e:	55                   	push   %ebp
 44f:	89 e5                	mov    %esp,%ebp
 451:	83 ec 18             	sub    $0x18,%esp
 454:	8b 45 0c             	mov    0xc(%ebp),%eax
 457:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 45a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 461:	00 
 462:	8d 45 f4             	lea    -0xc(%ebp),%eax
 465:	89 44 24 04          	mov    %eax,0x4(%esp)
 469:	8b 45 08             	mov    0x8(%ebp),%eax
 46c:	89 04 24             	mov    %eax,(%esp)
 46f:	e8 4a ff ff ff       	call   3be <write>
}
 474:	c9                   	leave  
 475:	c3                   	ret    

00000476 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 476:	55                   	push   %ebp
 477:	89 e5                	mov    %esp,%ebp
 479:	56                   	push   %esi
 47a:	53                   	push   %ebx
 47b:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 47e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 485:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 489:	74 17                	je     4a2 <printint+0x2c>
 48b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 48f:	79 11                	jns    4a2 <printint+0x2c>
    neg = 1;
 491:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 498:	8b 45 0c             	mov    0xc(%ebp),%eax
 49b:	f7 d8                	neg    %eax
 49d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4a0:	eb 06                	jmp    4a8 <printint+0x32>
  } else {
    x = xx;
 4a2:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4a8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4af:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4b2:	8d 41 01             	lea    0x1(%ecx),%eax
 4b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4b8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4be:	ba 00 00 00 00       	mov    $0x0,%edx
 4c3:	f7 f3                	div    %ebx
 4c5:	89 d0                	mov    %edx,%eax
 4c7:	0f b6 80 a0 0b 00 00 	movzbl 0xba0(%eax),%eax
 4ce:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4d2:	8b 75 10             	mov    0x10(%ebp),%esi
 4d5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4d8:	ba 00 00 00 00       	mov    $0x0,%edx
 4dd:	f7 f6                	div    %esi
 4df:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4e2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4e6:	75 c7                	jne    4af <printint+0x39>
  if(neg)
 4e8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4ec:	74 10                	je     4fe <printint+0x88>
    buf[i++] = '-';
 4ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4f1:	8d 50 01             	lea    0x1(%eax),%edx
 4f4:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4f7:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4fc:	eb 1f                	jmp    51d <printint+0xa7>
 4fe:	eb 1d                	jmp    51d <printint+0xa7>
    putc(fd, buf[i]);
 500:	8d 55 dc             	lea    -0x24(%ebp),%edx
 503:	8b 45 f4             	mov    -0xc(%ebp),%eax
 506:	01 d0                	add    %edx,%eax
 508:	0f b6 00             	movzbl (%eax),%eax
 50b:	0f be c0             	movsbl %al,%eax
 50e:	89 44 24 04          	mov    %eax,0x4(%esp)
 512:	8b 45 08             	mov    0x8(%ebp),%eax
 515:	89 04 24             	mov    %eax,(%esp)
 518:	e8 31 ff ff ff       	call   44e <putc>
  while(--i >= 0)
 51d:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 521:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 525:	79 d9                	jns    500 <printint+0x8a>
}
 527:	83 c4 30             	add    $0x30,%esp
 52a:	5b                   	pop    %ebx
 52b:	5e                   	pop    %esi
 52c:	5d                   	pop    %ebp
 52d:	c3                   	ret    

0000052e <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 52e:	55                   	push   %ebp
 52f:	89 e5                	mov    %esp,%ebp
 531:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 534:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 53b:	8d 45 0c             	lea    0xc(%ebp),%eax
 53e:	83 c0 04             	add    $0x4,%eax
 541:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 544:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 54b:	e9 7c 01 00 00       	jmp    6cc <printf+0x19e>
    c = fmt[i] & 0xff;
 550:	8b 55 0c             	mov    0xc(%ebp),%edx
 553:	8b 45 f0             	mov    -0x10(%ebp),%eax
 556:	01 d0                	add    %edx,%eax
 558:	0f b6 00             	movzbl (%eax),%eax
 55b:	0f be c0             	movsbl %al,%eax
 55e:	25 ff 00 00 00       	and    $0xff,%eax
 563:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 566:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 56a:	75 2c                	jne    598 <printf+0x6a>
      if(c == '%'){
 56c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 570:	75 0c                	jne    57e <printf+0x50>
        state = '%';
 572:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 579:	e9 4a 01 00 00       	jmp    6c8 <printf+0x19a>
      } else {
        putc(fd, c);
 57e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 581:	0f be c0             	movsbl %al,%eax
 584:	89 44 24 04          	mov    %eax,0x4(%esp)
 588:	8b 45 08             	mov    0x8(%ebp),%eax
 58b:	89 04 24             	mov    %eax,(%esp)
 58e:	e8 bb fe ff ff       	call   44e <putc>
 593:	e9 30 01 00 00       	jmp    6c8 <printf+0x19a>
      }
    } else if(state == '%'){
 598:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 59c:	0f 85 26 01 00 00    	jne    6c8 <printf+0x19a>
      if(c == 'd'){
 5a2:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5a6:	75 2d                	jne    5d5 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5a8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5ab:	8b 00                	mov    (%eax),%eax
 5ad:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5b4:	00 
 5b5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5bc:	00 
 5bd:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c1:	8b 45 08             	mov    0x8(%ebp),%eax
 5c4:	89 04 24             	mov    %eax,(%esp)
 5c7:	e8 aa fe ff ff       	call   476 <printint>
        ap++;
 5cc:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5d0:	e9 ec 00 00 00       	jmp    6c1 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 5d5:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5d9:	74 06                	je     5e1 <printf+0xb3>
 5db:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5df:	75 2d                	jne    60e <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5e1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5e4:	8b 00                	mov    (%eax),%eax
 5e6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5ed:	00 
 5ee:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5f5:	00 
 5f6:	89 44 24 04          	mov    %eax,0x4(%esp)
 5fa:	8b 45 08             	mov    0x8(%ebp),%eax
 5fd:	89 04 24             	mov    %eax,(%esp)
 600:	e8 71 fe ff ff       	call   476 <printint>
        ap++;
 605:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 609:	e9 b3 00 00 00       	jmp    6c1 <printf+0x193>
      } else if(c == 's'){
 60e:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 612:	75 45                	jne    659 <printf+0x12b>
        s = (char*)*ap;
 614:	8b 45 e8             	mov    -0x18(%ebp),%eax
 617:	8b 00                	mov    (%eax),%eax
 619:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 61c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 620:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 624:	75 09                	jne    62f <printf+0x101>
          s = "(null)";
 626:	c7 45 f4 23 09 00 00 	movl   $0x923,-0xc(%ebp)
        while(*s != 0){
 62d:	eb 1e                	jmp    64d <printf+0x11f>
 62f:	eb 1c                	jmp    64d <printf+0x11f>
          putc(fd, *s);
 631:	8b 45 f4             	mov    -0xc(%ebp),%eax
 634:	0f b6 00             	movzbl (%eax),%eax
 637:	0f be c0             	movsbl %al,%eax
 63a:	89 44 24 04          	mov    %eax,0x4(%esp)
 63e:	8b 45 08             	mov    0x8(%ebp),%eax
 641:	89 04 24             	mov    %eax,(%esp)
 644:	e8 05 fe ff ff       	call   44e <putc>
          s++;
 649:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 64d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 650:	0f b6 00             	movzbl (%eax),%eax
 653:	84 c0                	test   %al,%al
 655:	75 da                	jne    631 <printf+0x103>
 657:	eb 68                	jmp    6c1 <printf+0x193>
        }
      } else if(c == 'c'){
 659:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 65d:	75 1d                	jne    67c <printf+0x14e>
        putc(fd, *ap);
 65f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 662:	8b 00                	mov    (%eax),%eax
 664:	0f be c0             	movsbl %al,%eax
 667:	89 44 24 04          	mov    %eax,0x4(%esp)
 66b:	8b 45 08             	mov    0x8(%ebp),%eax
 66e:	89 04 24             	mov    %eax,(%esp)
 671:	e8 d8 fd ff ff       	call   44e <putc>
        ap++;
 676:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 67a:	eb 45                	jmp    6c1 <printf+0x193>
      } else if(c == '%'){
 67c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 680:	75 17                	jne    699 <printf+0x16b>
        putc(fd, c);
 682:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 685:	0f be c0             	movsbl %al,%eax
 688:	89 44 24 04          	mov    %eax,0x4(%esp)
 68c:	8b 45 08             	mov    0x8(%ebp),%eax
 68f:	89 04 24             	mov    %eax,(%esp)
 692:	e8 b7 fd ff ff       	call   44e <putc>
 697:	eb 28                	jmp    6c1 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 699:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6a0:	00 
 6a1:	8b 45 08             	mov    0x8(%ebp),%eax
 6a4:	89 04 24             	mov    %eax,(%esp)
 6a7:	e8 a2 fd ff ff       	call   44e <putc>
        putc(fd, c);
 6ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6af:	0f be c0             	movsbl %al,%eax
 6b2:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b6:	8b 45 08             	mov    0x8(%ebp),%eax
 6b9:	89 04 24             	mov    %eax,(%esp)
 6bc:	e8 8d fd ff ff       	call   44e <putc>
      }
      state = 0;
 6c1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 6c8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6cc:	8b 55 0c             	mov    0xc(%ebp),%edx
 6cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6d2:	01 d0                	add    %edx,%eax
 6d4:	0f b6 00             	movzbl (%eax),%eax
 6d7:	84 c0                	test   %al,%al
 6d9:	0f 85 71 fe ff ff    	jne    550 <printf+0x22>
    }
  }
}
 6df:	c9                   	leave  
 6e0:	c3                   	ret    

000006e1 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6e1:	55                   	push   %ebp
 6e2:	89 e5                	mov    %esp,%ebp
 6e4:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6e7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ea:	83 e8 08             	sub    $0x8,%eax
 6ed:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f0:	a1 bc 0b 00 00       	mov    0xbbc,%eax
 6f5:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6f8:	eb 24                	jmp    71e <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fd:	8b 00                	mov    (%eax),%eax
 6ff:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 702:	77 12                	ja     716 <free+0x35>
 704:	8b 45 f8             	mov    -0x8(%ebp),%eax
 707:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 70a:	77 24                	ja     730 <free+0x4f>
 70c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70f:	8b 00                	mov    (%eax),%eax
 711:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 714:	77 1a                	ja     730 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 716:	8b 45 fc             	mov    -0x4(%ebp),%eax
 719:	8b 00                	mov    (%eax),%eax
 71b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 71e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 721:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 724:	76 d4                	jbe    6fa <free+0x19>
 726:	8b 45 fc             	mov    -0x4(%ebp),%eax
 729:	8b 00                	mov    (%eax),%eax
 72b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 72e:	76 ca                	jbe    6fa <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 730:	8b 45 f8             	mov    -0x8(%ebp),%eax
 733:	8b 40 04             	mov    0x4(%eax),%eax
 736:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 73d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 740:	01 c2                	add    %eax,%edx
 742:	8b 45 fc             	mov    -0x4(%ebp),%eax
 745:	8b 00                	mov    (%eax),%eax
 747:	39 c2                	cmp    %eax,%edx
 749:	75 24                	jne    76f <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 74b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74e:	8b 50 04             	mov    0x4(%eax),%edx
 751:	8b 45 fc             	mov    -0x4(%ebp),%eax
 754:	8b 00                	mov    (%eax),%eax
 756:	8b 40 04             	mov    0x4(%eax),%eax
 759:	01 c2                	add    %eax,%edx
 75b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75e:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 761:	8b 45 fc             	mov    -0x4(%ebp),%eax
 764:	8b 00                	mov    (%eax),%eax
 766:	8b 10                	mov    (%eax),%edx
 768:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76b:	89 10                	mov    %edx,(%eax)
 76d:	eb 0a                	jmp    779 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 76f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 772:	8b 10                	mov    (%eax),%edx
 774:	8b 45 f8             	mov    -0x8(%ebp),%eax
 777:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 779:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77c:	8b 40 04             	mov    0x4(%eax),%eax
 77f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 786:	8b 45 fc             	mov    -0x4(%ebp),%eax
 789:	01 d0                	add    %edx,%eax
 78b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 78e:	75 20                	jne    7b0 <free+0xcf>
    p->s.size += bp->s.size;
 790:	8b 45 fc             	mov    -0x4(%ebp),%eax
 793:	8b 50 04             	mov    0x4(%eax),%edx
 796:	8b 45 f8             	mov    -0x8(%ebp),%eax
 799:	8b 40 04             	mov    0x4(%eax),%eax
 79c:	01 c2                	add    %eax,%edx
 79e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a1:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7a4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a7:	8b 10                	mov    (%eax),%edx
 7a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ac:	89 10                	mov    %edx,(%eax)
 7ae:	eb 08                	jmp    7b8 <free+0xd7>
  } else
    p->s.ptr = bp;
 7b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b3:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7b6:	89 10                	mov    %edx,(%eax)
  freep = p;
 7b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bb:	a3 bc 0b 00 00       	mov    %eax,0xbbc
}
 7c0:	c9                   	leave  
 7c1:	c3                   	ret    

000007c2 <morecore>:

static Header*
morecore(uint nu)
{
 7c2:	55                   	push   %ebp
 7c3:	89 e5                	mov    %esp,%ebp
 7c5:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7c8:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7cf:	77 07                	ja     7d8 <morecore+0x16>
    nu = 4096;
 7d1:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7d8:	8b 45 08             	mov    0x8(%ebp),%eax
 7db:	c1 e0 03             	shl    $0x3,%eax
 7de:	89 04 24             	mov    %eax,(%esp)
 7e1:	e8 40 fc ff ff       	call   426 <sbrk>
 7e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7e9:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7ed:	75 07                	jne    7f6 <morecore+0x34>
    return 0;
 7ef:	b8 00 00 00 00       	mov    $0x0,%eax
 7f4:	eb 22                	jmp    818 <morecore+0x56>
  hp = (Header*)p;
 7f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ff:	8b 55 08             	mov    0x8(%ebp),%edx
 802:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 805:	8b 45 f0             	mov    -0x10(%ebp),%eax
 808:	83 c0 08             	add    $0x8,%eax
 80b:	89 04 24             	mov    %eax,(%esp)
 80e:	e8 ce fe ff ff       	call   6e1 <free>
  return freep;
 813:	a1 bc 0b 00 00       	mov    0xbbc,%eax
}
 818:	c9                   	leave  
 819:	c3                   	ret    

0000081a <malloc>:

void*
malloc(uint nbytes)
{
 81a:	55                   	push   %ebp
 81b:	89 e5                	mov    %esp,%ebp
 81d:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 820:	8b 45 08             	mov    0x8(%ebp),%eax
 823:	83 c0 07             	add    $0x7,%eax
 826:	c1 e8 03             	shr    $0x3,%eax
 829:	83 c0 01             	add    $0x1,%eax
 82c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 82f:	a1 bc 0b 00 00       	mov    0xbbc,%eax
 834:	89 45 f0             	mov    %eax,-0x10(%ebp)
 837:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 83b:	75 23                	jne    860 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 83d:	c7 45 f0 b4 0b 00 00 	movl   $0xbb4,-0x10(%ebp)
 844:	8b 45 f0             	mov    -0x10(%ebp),%eax
 847:	a3 bc 0b 00 00       	mov    %eax,0xbbc
 84c:	a1 bc 0b 00 00       	mov    0xbbc,%eax
 851:	a3 b4 0b 00 00       	mov    %eax,0xbb4
    base.s.size = 0;
 856:	c7 05 b8 0b 00 00 00 	movl   $0x0,0xbb8
 85d:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 860:	8b 45 f0             	mov    -0x10(%ebp),%eax
 863:	8b 00                	mov    (%eax),%eax
 865:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 868:	8b 45 f4             	mov    -0xc(%ebp),%eax
 86b:	8b 40 04             	mov    0x4(%eax),%eax
 86e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 871:	72 4d                	jb     8c0 <malloc+0xa6>
      if(p->s.size == nunits)
 873:	8b 45 f4             	mov    -0xc(%ebp),%eax
 876:	8b 40 04             	mov    0x4(%eax),%eax
 879:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 87c:	75 0c                	jne    88a <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 87e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 881:	8b 10                	mov    (%eax),%edx
 883:	8b 45 f0             	mov    -0x10(%ebp),%eax
 886:	89 10                	mov    %edx,(%eax)
 888:	eb 26                	jmp    8b0 <malloc+0x96>
      else {
        p->s.size -= nunits;
 88a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88d:	8b 40 04             	mov    0x4(%eax),%eax
 890:	2b 45 ec             	sub    -0x14(%ebp),%eax
 893:	89 c2                	mov    %eax,%edx
 895:	8b 45 f4             	mov    -0xc(%ebp),%eax
 898:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 89b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89e:	8b 40 04             	mov    0x4(%eax),%eax
 8a1:	c1 e0 03             	shl    $0x3,%eax
 8a4:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8aa:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8ad:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b3:	a3 bc 0b 00 00       	mov    %eax,0xbbc
      return (void*)(p + 1);
 8b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8bb:	83 c0 08             	add    $0x8,%eax
 8be:	eb 38                	jmp    8f8 <malloc+0xde>
    }
    if(p == freep)
 8c0:	a1 bc 0b 00 00       	mov    0xbbc,%eax
 8c5:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8c8:	75 1b                	jne    8e5 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8cd:	89 04 24             	mov    %eax,(%esp)
 8d0:	e8 ed fe ff ff       	call   7c2 <morecore>
 8d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8d8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8dc:	75 07                	jne    8e5 <malloc+0xcb>
        return 0;
 8de:	b8 00 00 00 00       	mov    $0x0,%eax
 8e3:	eb 13                	jmp    8f8 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ee:	8b 00                	mov    (%eax),%eax
 8f0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 8f3:	e9 70 ff ff ff       	jmp    868 <malloc+0x4e>
}
 8f8:	c9                   	leave  
 8f9:	c3                   	ret    
