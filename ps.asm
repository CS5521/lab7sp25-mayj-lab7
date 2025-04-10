
_ps:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"

int main() {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
  ps();
   6:	e8 65 02 00 00       	call   270 <ps>
  exit();
   b:	e8 7b 03 00 00       	call   38b <exit>

00000010 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	57                   	push   %edi
  14:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  15:	8b 4d 08             	mov    0x8(%ebp),%ecx
  18:	8b 55 10             	mov    0x10(%ebp),%edx
  1b:	8b 45 0c             	mov    0xc(%ebp),%eax
  1e:	89 cb                	mov    %ecx,%ebx
  20:	89 df                	mov    %ebx,%edi
  22:	89 d1                	mov    %edx,%ecx
  24:	fc                   	cld    
  25:	f3 aa                	rep stos %al,%es:(%edi)
  27:	89 ca                	mov    %ecx,%edx
  29:	89 fb                	mov    %edi,%ebx
  2b:	89 5d 08             	mov    %ebx,0x8(%ebp)
  2e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  31:	5b                   	pop    %ebx
  32:	5f                   	pop    %edi
  33:	5d                   	pop    %ebp
  34:	c3                   	ret    

00000035 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  35:	55                   	push   %ebp
  36:	89 e5                	mov    %esp,%ebp
  38:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  3b:	8b 45 08             	mov    0x8(%ebp),%eax
  3e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  41:	90                   	nop
  42:	8b 45 08             	mov    0x8(%ebp),%eax
  45:	8d 50 01             	lea    0x1(%eax),%edx
  48:	89 55 08             	mov    %edx,0x8(%ebp)
  4b:	8b 55 0c             	mov    0xc(%ebp),%edx
  4e:	8d 4a 01             	lea    0x1(%edx),%ecx
  51:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  54:	0f b6 12             	movzbl (%edx),%edx
  57:	88 10                	mov    %dl,(%eax)
  59:	0f b6 00             	movzbl (%eax),%eax
  5c:	84 c0                	test   %al,%al
  5e:	75 e2                	jne    42 <strcpy+0xd>
    ;
  return os;
  60:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  63:	c9                   	leave  
  64:	c3                   	ret    

00000065 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  65:	55                   	push   %ebp
  66:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  68:	eb 08                	jmp    72 <strcmp+0xd>
    p++, q++;
  6a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  6e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  72:	8b 45 08             	mov    0x8(%ebp),%eax
  75:	0f b6 00             	movzbl (%eax),%eax
  78:	84 c0                	test   %al,%al
  7a:	74 10                	je     8c <strcmp+0x27>
  7c:	8b 45 08             	mov    0x8(%ebp),%eax
  7f:	0f b6 10             	movzbl (%eax),%edx
  82:	8b 45 0c             	mov    0xc(%ebp),%eax
  85:	0f b6 00             	movzbl (%eax),%eax
  88:	38 c2                	cmp    %al,%dl
  8a:	74 de                	je     6a <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  8c:	8b 45 08             	mov    0x8(%ebp),%eax
  8f:	0f b6 00             	movzbl (%eax),%eax
  92:	0f b6 d0             	movzbl %al,%edx
  95:	8b 45 0c             	mov    0xc(%ebp),%eax
  98:	0f b6 00             	movzbl (%eax),%eax
  9b:	0f b6 c0             	movzbl %al,%eax
  9e:	29 c2                	sub    %eax,%edx
  a0:	89 d0                	mov    %edx,%eax
}
  a2:	5d                   	pop    %ebp
  a3:	c3                   	ret    

000000a4 <strlen>:

uint
strlen(const char *s)
{
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  aa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  b1:	eb 04                	jmp    b7 <strlen+0x13>
  b3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  b7:	8b 55 fc             	mov    -0x4(%ebp),%edx
  ba:	8b 45 08             	mov    0x8(%ebp),%eax
  bd:	01 d0                	add    %edx,%eax
  bf:	0f b6 00             	movzbl (%eax),%eax
  c2:	84 c0                	test   %al,%al
  c4:	75 ed                	jne    b3 <strlen+0xf>
    ;
  return n;
  c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  c9:	c9                   	leave  
  ca:	c3                   	ret    

000000cb <memset>:

void*
memset(void *dst, int c, uint n)
{
  cb:	55                   	push   %ebp
  cc:	89 e5                	mov    %esp,%ebp
  ce:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  d1:	8b 45 10             	mov    0x10(%ebp),%eax
  d4:	89 44 24 08          	mov    %eax,0x8(%esp)
  d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  db:	89 44 24 04          	mov    %eax,0x4(%esp)
  df:	8b 45 08             	mov    0x8(%ebp),%eax
  e2:	89 04 24             	mov    %eax,(%esp)
  e5:	e8 26 ff ff ff       	call   10 <stosb>
  return dst;
  ea:	8b 45 08             	mov    0x8(%ebp),%eax
}
  ed:	c9                   	leave  
  ee:	c3                   	ret    

000000ef <strchr>:

char*
strchr(const char *s, char c)
{
  ef:	55                   	push   %ebp
  f0:	89 e5                	mov    %esp,%ebp
  f2:	83 ec 04             	sub    $0x4,%esp
  f5:	8b 45 0c             	mov    0xc(%ebp),%eax
  f8:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
  fb:	eb 14                	jmp    111 <strchr+0x22>
    if(*s == c)
  fd:	8b 45 08             	mov    0x8(%ebp),%eax
 100:	0f b6 00             	movzbl (%eax),%eax
 103:	3a 45 fc             	cmp    -0x4(%ebp),%al
 106:	75 05                	jne    10d <strchr+0x1e>
      return (char*)s;
 108:	8b 45 08             	mov    0x8(%ebp),%eax
 10b:	eb 13                	jmp    120 <strchr+0x31>
  for(; *s; s++)
 10d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 111:	8b 45 08             	mov    0x8(%ebp),%eax
 114:	0f b6 00             	movzbl (%eax),%eax
 117:	84 c0                	test   %al,%al
 119:	75 e2                	jne    fd <strchr+0xe>
  return 0;
 11b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 120:	c9                   	leave  
 121:	c3                   	ret    

00000122 <gets>:

char*
gets(char *buf, int max)
{
 122:	55                   	push   %ebp
 123:	89 e5                	mov    %esp,%ebp
 125:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 128:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 12f:	eb 4c                	jmp    17d <gets+0x5b>
    cc = read(0, &c, 1);
 131:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 138:	00 
 139:	8d 45 ef             	lea    -0x11(%ebp),%eax
 13c:	89 44 24 04          	mov    %eax,0x4(%esp)
 140:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 147:	e8 57 02 00 00       	call   3a3 <read>
 14c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 14f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 153:	7f 02                	jg     157 <gets+0x35>
      break;
 155:	eb 31                	jmp    188 <gets+0x66>
    buf[i++] = c;
 157:	8b 45 f4             	mov    -0xc(%ebp),%eax
 15a:	8d 50 01             	lea    0x1(%eax),%edx
 15d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 160:	89 c2                	mov    %eax,%edx
 162:	8b 45 08             	mov    0x8(%ebp),%eax
 165:	01 c2                	add    %eax,%edx
 167:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 16b:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 16d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 171:	3c 0a                	cmp    $0xa,%al
 173:	74 13                	je     188 <gets+0x66>
 175:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 179:	3c 0d                	cmp    $0xd,%al
 17b:	74 0b                	je     188 <gets+0x66>
  for(i=0; i+1 < max; ){
 17d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 180:	83 c0 01             	add    $0x1,%eax
 183:	3b 45 0c             	cmp    0xc(%ebp),%eax
 186:	7c a9                	jl     131 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 188:	8b 55 f4             	mov    -0xc(%ebp),%edx
 18b:	8b 45 08             	mov    0x8(%ebp),%eax
 18e:	01 d0                	add    %edx,%eax
 190:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 193:	8b 45 08             	mov    0x8(%ebp),%eax
}
 196:	c9                   	leave  
 197:	c3                   	ret    

00000198 <stat>:

int
stat(const char *n, struct stat *st)
{
 198:	55                   	push   %ebp
 199:	89 e5                	mov    %esp,%ebp
 19b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 19e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1a5:	00 
 1a6:	8b 45 08             	mov    0x8(%ebp),%eax
 1a9:	89 04 24             	mov    %eax,(%esp)
 1ac:	e8 1a 02 00 00       	call   3cb <open>
 1b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1b4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1b8:	79 07                	jns    1c1 <stat+0x29>
    return -1;
 1ba:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1bf:	eb 23                	jmp    1e4 <stat+0x4c>
  r = fstat(fd, st);
 1c1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c4:	89 44 24 04          	mov    %eax,0x4(%esp)
 1c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1cb:	89 04 24             	mov    %eax,(%esp)
 1ce:	e8 10 02 00 00       	call   3e3 <fstat>
 1d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d9:	89 04 24             	mov    %eax,(%esp)
 1dc:	e8 d2 01 00 00       	call   3b3 <close>
  return r;
 1e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1e4:	c9                   	leave  
 1e5:	c3                   	ret    

000001e6 <atoi>:

int
atoi(const char *s)
{
 1e6:	55                   	push   %ebp
 1e7:	89 e5                	mov    %esp,%ebp
 1e9:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1ec:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 1f3:	eb 25                	jmp    21a <atoi+0x34>
    n = n*10 + *s++ - '0';
 1f5:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1f8:	89 d0                	mov    %edx,%eax
 1fa:	c1 e0 02             	shl    $0x2,%eax
 1fd:	01 d0                	add    %edx,%eax
 1ff:	01 c0                	add    %eax,%eax
 201:	89 c1                	mov    %eax,%ecx
 203:	8b 45 08             	mov    0x8(%ebp),%eax
 206:	8d 50 01             	lea    0x1(%eax),%edx
 209:	89 55 08             	mov    %edx,0x8(%ebp)
 20c:	0f b6 00             	movzbl (%eax),%eax
 20f:	0f be c0             	movsbl %al,%eax
 212:	01 c8                	add    %ecx,%eax
 214:	83 e8 30             	sub    $0x30,%eax
 217:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 21a:	8b 45 08             	mov    0x8(%ebp),%eax
 21d:	0f b6 00             	movzbl (%eax),%eax
 220:	3c 2f                	cmp    $0x2f,%al
 222:	7e 0a                	jle    22e <atoi+0x48>
 224:	8b 45 08             	mov    0x8(%ebp),%eax
 227:	0f b6 00             	movzbl (%eax),%eax
 22a:	3c 39                	cmp    $0x39,%al
 22c:	7e c7                	jle    1f5 <atoi+0xf>
  return n;
 22e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 231:	c9                   	leave  
 232:	c3                   	ret    

00000233 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 233:	55                   	push   %ebp
 234:	89 e5                	mov    %esp,%ebp
 236:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 239:	8b 45 08             	mov    0x8(%ebp),%eax
 23c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 23f:	8b 45 0c             	mov    0xc(%ebp),%eax
 242:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 245:	eb 17                	jmp    25e <memmove+0x2b>
    *dst++ = *src++;
 247:	8b 45 fc             	mov    -0x4(%ebp),%eax
 24a:	8d 50 01             	lea    0x1(%eax),%edx
 24d:	89 55 fc             	mov    %edx,-0x4(%ebp)
 250:	8b 55 f8             	mov    -0x8(%ebp),%edx
 253:	8d 4a 01             	lea    0x1(%edx),%ecx
 256:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 259:	0f b6 12             	movzbl (%edx),%edx
 25c:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 25e:	8b 45 10             	mov    0x10(%ebp),%eax
 261:	8d 50 ff             	lea    -0x1(%eax),%edx
 264:	89 55 10             	mov    %edx,0x10(%ebp)
 267:	85 c0                	test   %eax,%eax
 269:	7f dc                	jg     247 <memmove+0x14>
  return vdst;
 26b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 26e:	c9                   	leave  
 26f:	c3                   	ret    

00000270 <ps>:

void
ps() {
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	56                   	push   %esi
 275:	53                   	push   %ebx
 276:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  int i = 0;
 27c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  printf(1, "PID	TKTS	TCKS	STAT	NAME\n");
 283:	c7 44 24 04 e7 08 00 	movl   $0x8e7,0x4(%esp)
 28a:	00 
 28b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 292:	e8 84 02 00 00       	call   51b <printf>
  getpinfo(&pstat);
 297:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 29d:	89 04 24             	mov    %eax,(%esp)
 2a0:	e8 86 01 00 00       	call   42b <getpinfo>
  while (pstat[i].pid != 0) {
 2a5:	e9 ad 00 00 00       	jmp    357 <ps+0xe7>
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
	pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 2aa:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 2b0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2b3:	89 d0                	mov    %edx,%eax
 2b5:	c1 e0 03             	shl    $0x3,%eax
 2b8:	01 d0                	add    %edx,%eax
 2ba:	c1 e0 02             	shl    $0x2,%eax
 2bd:	83 c0 10             	add    $0x10,%eax
 2c0:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 2c3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2c6:	89 d0                	mov    %edx,%eax
 2c8:	c1 e0 03             	shl    $0x3,%eax
 2cb:	01 d0                	add    %edx,%eax
 2cd:	c1 e0 02             	shl    $0x2,%eax
 2d0:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 2d3:	01 d8                	add    %ebx,%eax
 2d5:	2d e4 08 00 00       	sub    $0x8e4,%eax
 2da:	0f b6 00             	movzbl (%eax),%eax
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
 2dd:	0f be f0             	movsbl %al,%esi
 2e0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2e3:	89 d0                	mov    %edx,%eax
 2e5:	c1 e0 03             	shl    $0x3,%eax
 2e8:	01 d0                	add    %edx,%eax
 2ea:	c1 e0 02             	shl    $0x2,%eax
 2ed:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 2f0:	01 c8                	add    %ecx,%eax
 2f2:	2d f8 08 00 00       	sub    $0x8f8,%eax
 2f7:	8b 18                	mov    (%eax),%ebx
 2f9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2fc:	89 d0                	mov    %edx,%eax
 2fe:	c1 e0 03             	shl    $0x3,%eax
 301:	01 d0                	add    %edx,%eax
 303:	c1 e0 02             	shl    $0x2,%eax
 306:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 309:	01 c8                	add    %ecx,%eax
 30b:	2d 00 09 00 00       	sub    $0x900,%eax
 310:	8b 08                	mov    (%eax),%ecx
 312:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 315:	89 d0                	mov    %edx,%eax
 317:	c1 e0 03             	shl    $0x3,%eax
 31a:	01 d0                	add    %edx,%eax
 31c:	c1 e0 02             	shl    $0x2,%eax
 31f:	8d 55 e8             	lea    -0x18(%ebp),%edx
 322:	01 d0                	add    %edx,%eax
 324:	2d fc 08 00 00       	sub    $0x8fc,%eax
 329:	8b 00                	mov    (%eax),%eax
 32b:	89 7c 24 18          	mov    %edi,0x18(%esp)
 32f:	89 74 24 14          	mov    %esi,0x14(%esp)
 333:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 337:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 33b:	89 44 24 08          	mov    %eax,0x8(%esp)
 33f:	c7 44 24 04 00 09 00 	movl   $0x900,0x4(%esp)
 346:	00 
 347:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 34e:	e8 c8 01 00 00       	call   51b <printf>
      i++;
 353:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  while (pstat[i].pid != 0) {
 357:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 35a:	89 d0                	mov    %edx,%eax
 35c:	c1 e0 03             	shl    $0x3,%eax
 35f:	01 d0                	add    %edx,%eax
 361:	c1 e0 02             	shl    $0x2,%eax
 364:	8d 75 e8             	lea    -0x18(%ebp),%esi
 367:	01 f0                	add    %esi,%eax
 369:	2d fc 08 00 00       	sub    $0x8fc,%eax
 36e:	8b 00                	mov    (%eax),%eax
 370:	85 c0                	test   %eax,%eax
 372:	0f 85 32 ff ff ff    	jne    2aa <ps+0x3a>
  }
}
 378:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 37e:	5b                   	pop    %ebx
 37f:	5e                   	pop    %esi
 380:	5f                   	pop    %edi
 381:	5d                   	pop    %ebp
 382:	c3                   	ret    

00000383 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 383:	b8 01 00 00 00       	mov    $0x1,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <exit>:
SYSCALL(exit)
 38b:	b8 02 00 00 00       	mov    $0x2,%eax
 390:	cd 40                	int    $0x40
 392:	c3                   	ret    

00000393 <wait>:
SYSCALL(wait)
 393:	b8 03 00 00 00       	mov    $0x3,%eax
 398:	cd 40                	int    $0x40
 39a:	c3                   	ret    

0000039b <pipe>:
SYSCALL(pipe)
 39b:	b8 04 00 00 00       	mov    $0x4,%eax
 3a0:	cd 40                	int    $0x40
 3a2:	c3                   	ret    

000003a3 <read>:
SYSCALL(read)
 3a3:	b8 05 00 00 00       	mov    $0x5,%eax
 3a8:	cd 40                	int    $0x40
 3aa:	c3                   	ret    

000003ab <write>:
SYSCALL(write)
 3ab:	b8 10 00 00 00       	mov    $0x10,%eax
 3b0:	cd 40                	int    $0x40
 3b2:	c3                   	ret    

000003b3 <close>:
SYSCALL(close)
 3b3:	b8 15 00 00 00       	mov    $0x15,%eax
 3b8:	cd 40                	int    $0x40
 3ba:	c3                   	ret    

000003bb <kill>:
SYSCALL(kill)
 3bb:	b8 06 00 00 00       	mov    $0x6,%eax
 3c0:	cd 40                	int    $0x40
 3c2:	c3                   	ret    

000003c3 <exec>:
SYSCALL(exec)
 3c3:	b8 07 00 00 00       	mov    $0x7,%eax
 3c8:	cd 40                	int    $0x40
 3ca:	c3                   	ret    

000003cb <open>:
SYSCALL(open)
 3cb:	b8 0f 00 00 00       	mov    $0xf,%eax
 3d0:	cd 40                	int    $0x40
 3d2:	c3                   	ret    

000003d3 <mknod>:
SYSCALL(mknod)
 3d3:	b8 11 00 00 00       	mov    $0x11,%eax
 3d8:	cd 40                	int    $0x40
 3da:	c3                   	ret    

000003db <unlink>:
SYSCALL(unlink)
 3db:	b8 12 00 00 00       	mov    $0x12,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <fstat>:
SYSCALL(fstat)
 3e3:	b8 08 00 00 00       	mov    $0x8,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <link>:
SYSCALL(link)
 3eb:	b8 13 00 00 00       	mov    $0x13,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <mkdir>:
SYSCALL(mkdir)
 3f3:	b8 14 00 00 00       	mov    $0x14,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <chdir>:
SYSCALL(chdir)
 3fb:	b8 09 00 00 00       	mov    $0x9,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <dup>:
SYSCALL(dup)
 403:	b8 0a 00 00 00       	mov    $0xa,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <getpid>:
SYSCALL(getpid)
 40b:	b8 0b 00 00 00       	mov    $0xb,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <sbrk>:
SYSCALL(sbrk)
 413:	b8 0c 00 00 00       	mov    $0xc,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <sleep>:
SYSCALL(sleep)
 41b:	b8 0d 00 00 00       	mov    $0xd,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <uptime>:
SYSCALL(uptime)
 423:	b8 0e 00 00 00       	mov    $0xe,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <getpinfo>:
SYSCALL(getpinfo)
 42b:	b8 16 00 00 00       	mov    $0x16,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <settickets>:
SYSCALL(settickets)
 433:	b8 17 00 00 00       	mov    $0x17,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 43b:	55                   	push   %ebp
 43c:	89 e5                	mov    %esp,%ebp
 43e:	83 ec 18             	sub    $0x18,%esp
 441:	8b 45 0c             	mov    0xc(%ebp),%eax
 444:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 447:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 44e:	00 
 44f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 452:	89 44 24 04          	mov    %eax,0x4(%esp)
 456:	8b 45 08             	mov    0x8(%ebp),%eax
 459:	89 04 24             	mov    %eax,(%esp)
 45c:	e8 4a ff ff ff       	call   3ab <write>
}
 461:	c9                   	leave  
 462:	c3                   	ret    

00000463 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 463:	55                   	push   %ebp
 464:	89 e5                	mov    %esp,%ebp
 466:	56                   	push   %esi
 467:	53                   	push   %ebx
 468:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 46b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 472:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 476:	74 17                	je     48f <printint+0x2c>
 478:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 47c:	79 11                	jns    48f <printint+0x2c>
    neg = 1;
 47e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 485:	8b 45 0c             	mov    0xc(%ebp),%eax
 488:	f7 d8                	neg    %eax
 48a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 48d:	eb 06                	jmp    495 <printint+0x32>
  } else {
    x = xx;
 48f:	8b 45 0c             	mov    0xc(%ebp),%eax
 492:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 495:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 49c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 49f:	8d 41 01             	lea    0x1(%ecx),%eax
 4a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4a5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4ab:	ba 00 00 00 00       	mov    $0x0,%edx
 4b0:	f7 f3                	div    %ebx
 4b2:	89 d0                	mov    %edx,%eax
 4b4:	0f b6 80 8c 0b 00 00 	movzbl 0xb8c(%eax),%eax
 4bb:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4bf:	8b 75 10             	mov    0x10(%ebp),%esi
 4c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4c5:	ba 00 00 00 00       	mov    $0x0,%edx
 4ca:	f7 f6                	div    %esi
 4cc:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4cf:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4d3:	75 c7                	jne    49c <printint+0x39>
  if(neg)
 4d5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4d9:	74 10                	je     4eb <printint+0x88>
    buf[i++] = '-';
 4db:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4de:	8d 50 01             	lea    0x1(%eax),%edx
 4e1:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4e4:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4e9:	eb 1f                	jmp    50a <printint+0xa7>
 4eb:	eb 1d                	jmp    50a <printint+0xa7>
    putc(fd, buf[i]);
 4ed:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4f3:	01 d0                	add    %edx,%eax
 4f5:	0f b6 00             	movzbl (%eax),%eax
 4f8:	0f be c0             	movsbl %al,%eax
 4fb:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ff:	8b 45 08             	mov    0x8(%ebp),%eax
 502:	89 04 24             	mov    %eax,(%esp)
 505:	e8 31 ff ff ff       	call   43b <putc>
  while(--i >= 0)
 50a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 50e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 512:	79 d9                	jns    4ed <printint+0x8a>
}
 514:	83 c4 30             	add    $0x30,%esp
 517:	5b                   	pop    %ebx
 518:	5e                   	pop    %esi
 519:	5d                   	pop    %ebp
 51a:	c3                   	ret    

0000051b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 51b:	55                   	push   %ebp
 51c:	89 e5                	mov    %esp,%ebp
 51e:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 521:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 528:	8d 45 0c             	lea    0xc(%ebp),%eax
 52b:	83 c0 04             	add    $0x4,%eax
 52e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 531:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 538:	e9 7c 01 00 00       	jmp    6b9 <printf+0x19e>
    c = fmt[i] & 0xff;
 53d:	8b 55 0c             	mov    0xc(%ebp),%edx
 540:	8b 45 f0             	mov    -0x10(%ebp),%eax
 543:	01 d0                	add    %edx,%eax
 545:	0f b6 00             	movzbl (%eax),%eax
 548:	0f be c0             	movsbl %al,%eax
 54b:	25 ff 00 00 00       	and    $0xff,%eax
 550:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 553:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 557:	75 2c                	jne    585 <printf+0x6a>
      if(c == '%'){
 559:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 55d:	75 0c                	jne    56b <printf+0x50>
        state = '%';
 55f:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 566:	e9 4a 01 00 00       	jmp    6b5 <printf+0x19a>
      } else {
        putc(fd, c);
 56b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 56e:	0f be c0             	movsbl %al,%eax
 571:	89 44 24 04          	mov    %eax,0x4(%esp)
 575:	8b 45 08             	mov    0x8(%ebp),%eax
 578:	89 04 24             	mov    %eax,(%esp)
 57b:	e8 bb fe ff ff       	call   43b <putc>
 580:	e9 30 01 00 00       	jmp    6b5 <printf+0x19a>
      }
    } else if(state == '%'){
 585:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 589:	0f 85 26 01 00 00    	jne    6b5 <printf+0x19a>
      if(c == 'd'){
 58f:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 593:	75 2d                	jne    5c2 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 595:	8b 45 e8             	mov    -0x18(%ebp),%eax
 598:	8b 00                	mov    (%eax),%eax
 59a:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5a1:	00 
 5a2:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5a9:	00 
 5aa:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ae:	8b 45 08             	mov    0x8(%ebp),%eax
 5b1:	89 04 24             	mov    %eax,(%esp)
 5b4:	e8 aa fe ff ff       	call   463 <printint>
        ap++;
 5b9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5bd:	e9 ec 00 00 00       	jmp    6ae <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 5c2:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5c6:	74 06                	je     5ce <printf+0xb3>
 5c8:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5cc:	75 2d                	jne    5fb <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5ce:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5d1:	8b 00                	mov    (%eax),%eax
 5d3:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5da:	00 
 5db:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5e2:	00 
 5e3:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e7:	8b 45 08             	mov    0x8(%ebp),%eax
 5ea:	89 04 24             	mov    %eax,(%esp)
 5ed:	e8 71 fe ff ff       	call   463 <printint>
        ap++;
 5f2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5f6:	e9 b3 00 00 00       	jmp    6ae <printf+0x193>
      } else if(c == 's'){
 5fb:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5ff:	75 45                	jne    646 <printf+0x12b>
        s = (char*)*ap;
 601:	8b 45 e8             	mov    -0x18(%ebp),%eax
 604:	8b 00                	mov    (%eax),%eax
 606:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 609:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 60d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 611:	75 09                	jne    61c <printf+0x101>
          s = "(null)";
 613:	c7 45 f4 10 09 00 00 	movl   $0x910,-0xc(%ebp)
        while(*s != 0){
 61a:	eb 1e                	jmp    63a <printf+0x11f>
 61c:	eb 1c                	jmp    63a <printf+0x11f>
          putc(fd, *s);
 61e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 621:	0f b6 00             	movzbl (%eax),%eax
 624:	0f be c0             	movsbl %al,%eax
 627:	89 44 24 04          	mov    %eax,0x4(%esp)
 62b:	8b 45 08             	mov    0x8(%ebp),%eax
 62e:	89 04 24             	mov    %eax,(%esp)
 631:	e8 05 fe ff ff       	call   43b <putc>
          s++;
 636:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 63a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 63d:	0f b6 00             	movzbl (%eax),%eax
 640:	84 c0                	test   %al,%al
 642:	75 da                	jne    61e <printf+0x103>
 644:	eb 68                	jmp    6ae <printf+0x193>
        }
      } else if(c == 'c'){
 646:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 64a:	75 1d                	jne    669 <printf+0x14e>
        putc(fd, *ap);
 64c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 64f:	8b 00                	mov    (%eax),%eax
 651:	0f be c0             	movsbl %al,%eax
 654:	89 44 24 04          	mov    %eax,0x4(%esp)
 658:	8b 45 08             	mov    0x8(%ebp),%eax
 65b:	89 04 24             	mov    %eax,(%esp)
 65e:	e8 d8 fd ff ff       	call   43b <putc>
        ap++;
 663:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 667:	eb 45                	jmp    6ae <printf+0x193>
      } else if(c == '%'){
 669:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 66d:	75 17                	jne    686 <printf+0x16b>
        putc(fd, c);
 66f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 672:	0f be c0             	movsbl %al,%eax
 675:	89 44 24 04          	mov    %eax,0x4(%esp)
 679:	8b 45 08             	mov    0x8(%ebp),%eax
 67c:	89 04 24             	mov    %eax,(%esp)
 67f:	e8 b7 fd ff ff       	call   43b <putc>
 684:	eb 28                	jmp    6ae <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 686:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 68d:	00 
 68e:	8b 45 08             	mov    0x8(%ebp),%eax
 691:	89 04 24             	mov    %eax,(%esp)
 694:	e8 a2 fd ff ff       	call   43b <putc>
        putc(fd, c);
 699:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 69c:	0f be c0             	movsbl %al,%eax
 69f:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a3:	8b 45 08             	mov    0x8(%ebp),%eax
 6a6:	89 04 24             	mov    %eax,(%esp)
 6a9:	e8 8d fd ff ff       	call   43b <putc>
      }
      state = 0;
 6ae:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 6b5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6b9:	8b 55 0c             	mov    0xc(%ebp),%edx
 6bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6bf:	01 d0                	add    %edx,%eax
 6c1:	0f b6 00             	movzbl (%eax),%eax
 6c4:	84 c0                	test   %al,%al
 6c6:	0f 85 71 fe ff ff    	jne    53d <printf+0x22>
    }
  }
}
 6cc:	c9                   	leave  
 6cd:	c3                   	ret    

000006ce <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6ce:	55                   	push   %ebp
 6cf:	89 e5                	mov    %esp,%ebp
 6d1:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6d4:	8b 45 08             	mov    0x8(%ebp),%eax
 6d7:	83 e8 08             	sub    $0x8,%eax
 6da:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6dd:	a1 a8 0b 00 00       	mov    0xba8,%eax
 6e2:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6e5:	eb 24                	jmp    70b <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ea:	8b 00                	mov    (%eax),%eax
 6ec:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6ef:	77 12                	ja     703 <free+0x35>
 6f1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6f7:	77 24                	ja     71d <free+0x4f>
 6f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fc:	8b 00                	mov    (%eax),%eax
 6fe:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 701:	77 1a                	ja     71d <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 703:	8b 45 fc             	mov    -0x4(%ebp),%eax
 706:	8b 00                	mov    (%eax),%eax
 708:	89 45 fc             	mov    %eax,-0x4(%ebp)
 70b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 70e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 711:	76 d4                	jbe    6e7 <free+0x19>
 713:	8b 45 fc             	mov    -0x4(%ebp),%eax
 716:	8b 00                	mov    (%eax),%eax
 718:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 71b:	76 ca                	jbe    6e7 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 71d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 720:	8b 40 04             	mov    0x4(%eax),%eax
 723:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 72a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 72d:	01 c2                	add    %eax,%edx
 72f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 732:	8b 00                	mov    (%eax),%eax
 734:	39 c2                	cmp    %eax,%edx
 736:	75 24                	jne    75c <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 738:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73b:	8b 50 04             	mov    0x4(%eax),%edx
 73e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 741:	8b 00                	mov    (%eax),%eax
 743:	8b 40 04             	mov    0x4(%eax),%eax
 746:	01 c2                	add    %eax,%edx
 748:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74b:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 74e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 751:	8b 00                	mov    (%eax),%eax
 753:	8b 10                	mov    (%eax),%edx
 755:	8b 45 f8             	mov    -0x8(%ebp),%eax
 758:	89 10                	mov    %edx,(%eax)
 75a:	eb 0a                	jmp    766 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 75c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75f:	8b 10                	mov    (%eax),%edx
 761:	8b 45 f8             	mov    -0x8(%ebp),%eax
 764:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 766:	8b 45 fc             	mov    -0x4(%ebp),%eax
 769:	8b 40 04             	mov    0x4(%eax),%eax
 76c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 773:	8b 45 fc             	mov    -0x4(%ebp),%eax
 776:	01 d0                	add    %edx,%eax
 778:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 77b:	75 20                	jne    79d <free+0xcf>
    p->s.size += bp->s.size;
 77d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 780:	8b 50 04             	mov    0x4(%eax),%edx
 783:	8b 45 f8             	mov    -0x8(%ebp),%eax
 786:	8b 40 04             	mov    0x4(%eax),%eax
 789:	01 c2                	add    %eax,%edx
 78b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 791:	8b 45 f8             	mov    -0x8(%ebp),%eax
 794:	8b 10                	mov    (%eax),%edx
 796:	8b 45 fc             	mov    -0x4(%ebp),%eax
 799:	89 10                	mov    %edx,(%eax)
 79b:	eb 08                	jmp    7a5 <free+0xd7>
  } else
    p->s.ptr = bp;
 79d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a0:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7a3:	89 10                	mov    %edx,(%eax)
  freep = p;
 7a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a8:	a3 a8 0b 00 00       	mov    %eax,0xba8
}
 7ad:	c9                   	leave  
 7ae:	c3                   	ret    

000007af <morecore>:

static Header*
morecore(uint nu)
{
 7af:	55                   	push   %ebp
 7b0:	89 e5                	mov    %esp,%ebp
 7b2:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7b5:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7bc:	77 07                	ja     7c5 <morecore+0x16>
    nu = 4096;
 7be:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7c5:	8b 45 08             	mov    0x8(%ebp),%eax
 7c8:	c1 e0 03             	shl    $0x3,%eax
 7cb:	89 04 24             	mov    %eax,(%esp)
 7ce:	e8 40 fc ff ff       	call   413 <sbrk>
 7d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7d6:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7da:	75 07                	jne    7e3 <morecore+0x34>
    return 0;
 7dc:	b8 00 00 00 00       	mov    $0x0,%eax
 7e1:	eb 22                	jmp    805 <morecore+0x56>
  hp = (Header*)p;
 7e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ec:	8b 55 08             	mov    0x8(%ebp),%edx
 7ef:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f5:	83 c0 08             	add    $0x8,%eax
 7f8:	89 04 24             	mov    %eax,(%esp)
 7fb:	e8 ce fe ff ff       	call   6ce <free>
  return freep;
 800:	a1 a8 0b 00 00       	mov    0xba8,%eax
}
 805:	c9                   	leave  
 806:	c3                   	ret    

00000807 <malloc>:

void*
malloc(uint nbytes)
{
 807:	55                   	push   %ebp
 808:	89 e5                	mov    %esp,%ebp
 80a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 80d:	8b 45 08             	mov    0x8(%ebp),%eax
 810:	83 c0 07             	add    $0x7,%eax
 813:	c1 e8 03             	shr    $0x3,%eax
 816:	83 c0 01             	add    $0x1,%eax
 819:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 81c:	a1 a8 0b 00 00       	mov    0xba8,%eax
 821:	89 45 f0             	mov    %eax,-0x10(%ebp)
 824:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 828:	75 23                	jne    84d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 82a:	c7 45 f0 a0 0b 00 00 	movl   $0xba0,-0x10(%ebp)
 831:	8b 45 f0             	mov    -0x10(%ebp),%eax
 834:	a3 a8 0b 00 00       	mov    %eax,0xba8
 839:	a1 a8 0b 00 00       	mov    0xba8,%eax
 83e:	a3 a0 0b 00 00       	mov    %eax,0xba0
    base.s.size = 0;
 843:	c7 05 a4 0b 00 00 00 	movl   $0x0,0xba4
 84a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 84d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 850:	8b 00                	mov    (%eax),%eax
 852:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 855:	8b 45 f4             	mov    -0xc(%ebp),%eax
 858:	8b 40 04             	mov    0x4(%eax),%eax
 85b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 85e:	72 4d                	jb     8ad <malloc+0xa6>
      if(p->s.size == nunits)
 860:	8b 45 f4             	mov    -0xc(%ebp),%eax
 863:	8b 40 04             	mov    0x4(%eax),%eax
 866:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 869:	75 0c                	jne    877 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 86b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 86e:	8b 10                	mov    (%eax),%edx
 870:	8b 45 f0             	mov    -0x10(%ebp),%eax
 873:	89 10                	mov    %edx,(%eax)
 875:	eb 26                	jmp    89d <malloc+0x96>
      else {
        p->s.size -= nunits;
 877:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87a:	8b 40 04             	mov    0x4(%eax),%eax
 87d:	2b 45 ec             	sub    -0x14(%ebp),%eax
 880:	89 c2                	mov    %eax,%edx
 882:	8b 45 f4             	mov    -0xc(%ebp),%eax
 885:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 888:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88b:	8b 40 04             	mov    0x4(%eax),%eax
 88e:	c1 e0 03             	shl    $0x3,%eax
 891:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 894:	8b 45 f4             	mov    -0xc(%ebp),%eax
 897:	8b 55 ec             	mov    -0x14(%ebp),%edx
 89a:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 89d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a0:	a3 a8 0b 00 00       	mov    %eax,0xba8
      return (void*)(p + 1);
 8a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a8:	83 c0 08             	add    $0x8,%eax
 8ab:	eb 38                	jmp    8e5 <malloc+0xde>
    }
    if(p == freep)
 8ad:	a1 a8 0b 00 00       	mov    0xba8,%eax
 8b2:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8b5:	75 1b                	jne    8d2 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8ba:	89 04 24             	mov    %eax,(%esp)
 8bd:	e8 ed fe ff ff       	call   7af <morecore>
 8c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8c5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8c9:	75 07                	jne    8d2 <malloc+0xcb>
        return 0;
 8cb:	b8 00 00 00 00       	mov    $0x0,%eax
 8d0:	eb 13                	jmp    8e5 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8db:	8b 00                	mov    (%eax),%eax
 8dd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 8e0:	e9 70 ff ff ff       	jmp    855 <malloc+0x4e>
}
 8e5:	c9                   	leave  
 8e6:	c3                   	ret    
