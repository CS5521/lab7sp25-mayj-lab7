
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
 283:	c7 44 24 04 df 08 00 	movl   $0x8df,0x4(%esp)
 28a:	00 
 28b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 292:	e8 7c 02 00 00       	call   513 <printf>
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
 33f:	c7 44 24 04 f8 08 00 	movl   $0x8f8,0x4(%esp)
 346:	00 
 347:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 34e:	e8 c0 01 00 00       	call   513 <printf>
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

00000433 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 433:	55                   	push   %ebp
 434:	89 e5                	mov    %esp,%ebp
 436:	83 ec 18             	sub    $0x18,%esp
 439:	8b 45 0c             	mov    0xc(%ebp),%eax
 43c:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 43f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 446:	00 
 447:	8d 45 f4             	lea    -0xc(%ebp),%eax
 44a:	89 44 24 04          	mov    %eax,0x4(%esp)
 44e:	8b 45 08             	mov    0x8(%ebp),%eax
 451:	89 04 24             	mov    %eax,(%esp)
 454:	e8 52 ff ff ff       	call   3ab <write>
}
 459:	c9                   	leave  
 45a:	c3                   	ret    

0000045b <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 45b:	55                   	push   %ebp
 45c:	89 e5                	mov    %esp,%ebp
 45e:	56                   	push   %esi
 45f:	53                   	push   %ebx
 460:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 463:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 46a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 46e:	74 17                	je     487 <printint+0x2c>
 470:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 474:	79 11                	jns    487 <printint+0x2c>
    neg = 1;
 476:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 47d:	8b 45 0c             	mov    0xc(%ebp),%eax
 480:	f7 d8                	neg    %eax
 482:	89 45 ec             	mov    %eax,-0x14(%ebp)
 485:	eb 06                	jmp    48d <printint+0x32>
  } else {
    x = xx;
 487:	8b 45 0c             	mov    0xc(%ebp),%eax
 48a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 48d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 494:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 497:	8d 41 01             	lea    0x1(%ecx),%eax
 49a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 49d:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4a0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4a3:	ba 00 00 00 00       	mov    $0x0,%edx
 4a8:	f7 f3                	div    %ebx
 4aa:	89 d0                	mov    %edx,%eax
 4ac:	0f b6 80 84 0b 00 00 	movzbl 0xb84(%eax),%eax
 4b3:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4b7:	8b 75 10             	mov    0x10(%ebp),%esi
 4ba:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4bd:	ba 00 00 00 00       	mov    $0x0,%edx
 4c2:	f7 f6                	div    %esi
 4c4:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4c7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4cb:	75 c7                	jne    494 <printint+0x39>
  if(neg)
 4cd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4d1:	74 10                	je     4e3 <printint+0x88>
    buf[i++] = '-';
 4d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4d6:	8d 50 01             	lea    0x1(%eax),%edx
 4d9:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4dc:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4e1:	eb 1f                	jmp    502 <printint+0xa7>
 4e3:	eb 1d                	jmp    502 <printint+0xa7>
    putc(fd, buf[i]);
 4e5:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4eb:	01 d0                	add    %edx,%eax
 4ed:	0f b6 00             	movzbl (%eax),%eax
 4f0:	0f be c0             	movsbl %al,%eax
 4f3:	89 44 24 04          	mov    %eax,0x4(%esp)
 4f7:	8b 45 08             	mov    0x8(%ebp),%eax
 4fa:	89 04 24             	mov    %eax,(%esp)
 4fd:	e8 31 ff ff ff       	call   433 <putc>
  while(--i >= 0)
 502:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 506:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 50a:	79 d9                	jns    4e5 <printint+0x8a>
}
 50c:	83 c4 30             	add    $0x30,%esp
 50f:	5b                   	pop    %ebx
 510:	5e                   	pop    %esi
 511:	5d                   	pop    %ebp
 512:	c3                   	ret    

00000513 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 513:	55                   	push   %ebp
 514:	89 e5                	mov    %esp,%ebp
 516:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 519:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 520:	8d 45 0c             	lea    0xc(%ebp),%eax
 523:	83 c0 04             	add    $0x4,%eax
 526:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 529:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 530:	e9 7c 01 00 00       	jmp    6b1 <printf+0x19e>
    c = fmt[i] & 0xff;
 535:	8b 55 0c             	mov    0xc(%ebp),%edx
 538:	8b 45 f0             	mov    -0x10(%ebp),%eax
 53b:	01 d0                	add    %edx,%eax
 53d:	0f b6 00             	movzbl (%eax),%eax
 540:	0f be c0             	movsbl %al,%eax
 543:	25 ff 00 00 00       	and    $0xff,%eax
 548:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 54b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 54f:	75 2c                	jne    57d <printf+0x6a>
      if(c == '%'){
 551:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 555:	75 0c                	jne    563 <printf+0x50>
        state = '%';
 557:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 55e:	e9 4a 01 00 00       	jmp    6ad <printf+0x19a>
      } else {
        putc(fd, c);
 563:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 566:	0f be c0             	movsbl %al,%eax
 569:	89 44 24 04          	mov    %eax,0x4(%esp)
 56d:	8b 45 08             	mov    0x8(%ebp),%eax
 570:	89 04 24             	mov    %eax,(%esp)
 573:	e8 bb fe ff ff       	call   433 <putc>
 578:	e9 30 01 00 00       	jmp    6ad <printf+0x19a>
      }
    } else if(state == '%'){
 57d:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 581:	0f 85 26 01 00 00    	jne    6ad <printf+0x19a>
      if(c == 'd'){
 587:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 58b:	75 2d                	jne    5ba <printf+0xa7>
        printint(fd, *ap, 10, 1);
 58d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 590:	8b 00                	mov    (%eax),%eax
 592:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 599:	00 
 59a:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5a1:	00 
 5a2:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a6:	8b 45 08             	mov    0x8(%ebp),%eax
 5a9:	89 04 24             	mov    %eax,(%esp)
 5ac:	e8 aa fe ff ff       	call   45b <printint>
        ap++;
 5b1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5b5:	e9 ec 00 00 00       	jmp    6a6 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 5ba:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5be:	74 06                	je     5c6 <printf+0xb3>
 5c0:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5c4:	75 2d                	jne    5f3 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5c6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5c9:	8b 00                	mov    (%eax),%eax
 5cb:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5d2:	00 
 5d3:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5da:	00 
 5db:	89 44 24 04          	mov    %eax,0x4(%esp)
 5df:	8b 45 08             	mov    0x8(%ebp),%eax
 5e2:	89 04 24             	mov    %eax,(%esp)
 5e5:	e8 71 fe ff ff       	call   45b <printint>
        ap++;
 5ea:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5ee:	e9 b3 00 00 00       	jmp    6a6 <printf+0x193>
      } else if(c == 's'){
 5f3:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5f7:	75 45                	jne    63e <printf+0x12b>
        s = (char*)*ap;
 5f9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5fc:	8b 00                	mov    (%eax),%eax
 5fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 601:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 605:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 609:	75 09                	jne    614 <printf+0x101>
          s = "(null)";
 60b:	c7 45 f4 08 09 00 00 	movl   $0x908,-0xc(%ebp)
        while(*s != 0){
 612:	eb 1e                	jmp    632 <printf+0x11f>
 614:	eb 1c                	jmp    632 <printf+0x11f>
          putc(fd, *s);
 616:	8b 45 f4             	mov    -0xc(%ebp),%eax
 619:	0f b6 00             	movzbl (%eax),%eax
 61c:	0f be c0             	movsbl %al,%eax
 61f:	89 44 24 04          	mov    %eax,0x4(%esp)
 623:	8b 45 08             	mov    0x8(%ebp),%eax
 626:	89 04 24             	mov    %eax,(%esp)
 629:	e8 05 fe ff ff       	call   433 <putc>
          s++;
 62e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 632:	8b 45 f4             	mov    -0xc(%ebp),%eax
 635:	0f b6 00             	movzbl (%eax),%eax
 638:	84 c0                	test   %al,%al
 63a:	75 da                	jne    616 <printf+0x103>
 63c:	eb 68                	jmp    6a6 <printf+0x193>
        }
      } else if(c == 'c'){
 63e:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 642:	75 1d                	jne    661 <printf+0x14e>
        putc(fd, *ap);
 644:	8b 45 e8             	mov    -0x18(%ebp),%eax
 647:	8b 00                	mov    (%eax),%eax
 649:	0f be c0             	movsbl %al,%eax
 64c:	89 44 24 04          	mov    %eax,0x4(%esp)
 650:	8b 45 08             	mov    0x8(%ebp),%eax
 653:	89 04 24             	mov    %eax,(%esp)
 656:	e8 d8 fd ff ff       	call   433 <putc>
        ap++;
 65b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 65f:	eb 45                	jmp    6a6 <printf+0x193>
      } else if(c == '%'){
 661:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 665:	75 17                	jne    67e <printf+0x16b>
        putc(fd, c);
 667:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 66a:	0f be c0             	movsbl %al,%eax
 66d:	89 44 24 04          	mov    %eax,0x4(%esp)
 671:	8b 45 08             	mov    0x8(%ebp),%eax
 674:	89 04 24             	mov    %eax,(%esp)
 677:	e8 b7 fd ff ff       	call   433 <putc>
 67c:	eb 28                	jmp    6a6 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 67e:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 685:	00 
 686:	8b 45 08             	mov    0x8(%ebp),%eax
 689:	89 04 24             	mov    %eax,(%esp)
 68c:	e8 a2 fd ff ff       	call   433 <putc>
        putc(fd, c);
 691:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 694:	0f be c0             	movsbl %al,%eax
 697:	89 44 24 04          	mov    %eax,0x4(%esp)
 69b:	8b 45 08             	mov    0x8(%ebp),%eax
 69e:	89 04 24             	mov    %eax,(%esp)
 6a1:	e8 8d fd ff ff       	call   433 <putc>
      }
      state = 0;
 6a6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 6ad:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6b1:	8b 55 0c             	mov    0xc(%ebp),%edx
 6b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6b7:	01 d0                	add    %edx,%eax
 6b9:	0f b6 00             	movzbl (%eax),%eax
 6bc:	84 c0                	test   %al,%al
 6be:	0f 85 71 fe ff ff    	jne    535 <printf+0x22>
    }
  }
}
 6c4:	c9                   	leave  
 6c5:	c3                   	ret    

000006c6 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6c6:	55                   	push   %ebp
 6c7:	89 e5                	mov    %esp,%ebp
 6c9:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6cc:	8b 45 08             	mov    0x8(%ebp),%eax
 6cf:	83 e8 08             	sub    $0x8,%eax
 6d2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d5:	a1 a0 0b 00 00       	mov    0xba0,%eax
 6da:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6dd:	eb 24                	jmp    703 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6df:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e2:	8b 00                	mov    (%eax),%eax
 6e4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6e7:	77 12                	ja     6fb <free+0x35>
 6e9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ec:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6ef:	77 24                	ja     715 <free+0x4f>
 6f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f4:	8b 00                	mov    (%eax),%eax
 6f6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6f9:	77 1a                	ja     715 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fe:	8b 00                	mov    (%eax),%eax
 700:	89 45 fc             	mov    %eax,-0x4(%ebp)
 703:	8b 45 f8             	mov    -0x8(%ebp),%eax
 706:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 709:	76 d4                	jbe    6df <free+0x19>
 70b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70e:	8b 00                	mov    (%eax),%eax
 710:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 713:	76 ca                	jbe    6df <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 715:	8b 45 f8             	mov    -0x8(%ebp),%eax
 718:	8b 40 04             	mov    0x4(%eax),%eax
 71b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 722:	8b 45 f8             	mov    -0x8(%ebp),%eax
 725:	01 c2                	add    %eax,%edx
 727:	8b 45 fc             	mov    -0x4(%ebp),%eax
 72a:	8b 00                	mov    (%eax),%eax
 72c:	39 c2                	cmp    %eax,%edx
 72e:	75 24                	jne    754 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 730:	8b 45 f8             	mov    -0x8(%ebp),%eax
 733:	8b 50 04             	mov    0x4(%eax),%edx
 736:	8b 45 fc             	mov    -0x4(%ebp),%eax
 739:	8b 00                	mov    (%eax),%eax
 73b:	8b 40 04             	mov    0x4(%eax),%eax
 73e:	01 c2                	add    %eax,%edx
 740:	8b 45 f8             	mov    -0x8(%ebp),%eax
 743:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 746:	8b 45 fc             	mov    -0x4(%ebp),%eax
 749:	8b 00                	mov    (%eax),%eax
 74b:	8b 10                	mov    (%eax),%edx
 74d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 750:	89 10                	mov    %edx,(%eax)
 752:	eb 0a                	jmp    75e <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 754:	8b 45 fc             	mov    -0x4(%ebp),%eax
 757:	8b 10                	mov    (%eax),%edx
 759:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75c:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 75e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 761:	8b 40 04             	mov    0x4(%eax),%eax
 764:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 76b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76e:	01 d0                	add    %edx,%eax
 770:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 773:	75 20                	jne    795 <free+0xcf>
    p->s.size += bp->s.size;
 775:	8b 45 fc             	mov    -0x4(%ebp),%eax
 778:	8b 50 04             	mov    0x4(%eax),%edx
 77b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77e:	8b 40 04             	mov    0x4(%eax),%eax
 781:	01 c2                	add    %eax,%edx
 783:	8b 45 fc             	mov    -0x4(%ebp),%eax
 786:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 789:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78c:	8b 10                	mov    (%eax),%edx
 78e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 791:	89 10                	mov    %edx,(%eax)
 793:	eb 08                	jmp    79d <free+0xd7>
  } else
    p->s.ptr = bp;
 795:	8b 45 fc             	mov    -0x4(%ebp),%eax
 798:	8b 55 f8             	mov    -0x8(%ebp),%edx
 79b:	89 10                	mov    %edx,(%eax)
  freep = p;
 79d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a0:	a3 a0 0b 00 00       	mov    %eax,0xba0
}
 7a5:	c9                   	leave  
 7a6:	c3                   	ret    

000007a7 <morecore>:

static Header*
morecore(uint nu)
{
 7a7:	55                   	push   %ebp
 7a8:	89 e5                	mov    %esp,%ebp
 7aa:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7ad:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7b4:	77 07                	ja     7bd <morecore+0x16>
    nu = 4096;
 7b6:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7bd:	8b 45 08             	mov    0x8(%ebp),%eax
 7c0:	c1 e0 03             	shl    $0x3,%eax
 7c3:	89 04 24             	mov    %eax,(%esp)
 7c6:	e8 48 fc ff ff       	call   413 <sbrk>
 7cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7ce:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7d2:	75 07                	jne    7db <morecore+0x34>
    return 0;
 7d4:	b8 00 00 00 00       	mov    $0x0,%eax
 7d9:	eb 22                	jmp    7fd <morecore+0x56>
  hp = (Header*)p;
 7db:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7de:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7e4:	8b 55 08             	mov    0x8(%ebp),%edx
 7e7:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ed:	83 c0 08             	add    $0x8,%eax
 7f0:	89 04 24             	mov    %eax,(%esp)
 7f3:	e8 ce fe ff ff       	call   6c6 <free>
  return freep;
 7f8:	a1 a0 0b 00 00       	mov    0xba0,%eax
}
 7fd:	c9                   	leave  
 7fe:	c3                   	ret    

000007ff <malloc>:

void*
malloc(uint nbytes)
{
 7ff:	55                   	push   %ebp
 800:	89 e5                	mov    %esp,%ebp
 802:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 805:	8b 45 08             	mov    0x8(%ebp),%eax
 808:	83 c0 07             	add    $0x7,%eax
 80b:	c1 e8 03             	shr    $0x3,%eax
 80e:	83 c0 01             	add    $0x1,%eax
 811:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 814:	a1 a0 0b 00 00       	mov    0xba0,%eax
 819:	89 45 f0             	mov    %eax,-0x10(%ebp)
 81c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 820:	75 23                	jne    845 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 822:	c7 45 f0 98 0b 00 00 	movl   $0xb98,-0x10(%ebp)
 829:	8b 45 f0             	mov    -0x10(%ebp),%eax
 82c:	a3 a0 0b 00 00       	mov    %eax,0xba0
 831:	a1 a0 0b 00 00       	mov    0xba0,%eax
 836:	a3 98 0b 00 00       	mov    %eax,0xb98
    base.s.size = 0;
 83b:	c7 05 9c 0b 00 00 00 	movl   $0x0,0xb9c
 842:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 845:	8b 45 f0             	mov    -0x10(%ebp),%eax
 848:	8b 00                	mov    (%eax),%eax
 84a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 84d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 850:	8b 40 04             	mov    0x4(%eax),%eax
 853:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 856:	72 4d                	jb     8a5 <malloc+0xa6>
      if(p->s.size == nunits)
 858:	8b 45 f4             	mov    -0xc(%ebp),%eax
 85b:	8b 40 04             	mov    0x4(%eax),%eax
 85e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 861:	75 0c                	jne    86f <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 863:	8b 45 f4             	mov    -0xc(%ebp),%eax
 866:	8b 10                	mov    (%eax),%edx
 868:	8b 45 f0             	mov    -0x10(%ebp),%eax
 86b:	89 10                	mov    %edx,(%eax)
 86d:	eb 26                	jmp    895 <malloc+0x96>
      else {
        p->s.size -= nunits;
 86f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 872:	8b 40 04             	mov    0x4(%eax),%eax
 875:	2b 45 ec             	sub    -0x14(%ebp),%eax
 878:	89 c2                	mov    %eax,%edx
 87a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 880:	8b 45 f4             	mov    -0xc(%ebp),%eax
 883:	8b 40 04             	mov    0x4(%eax),%eax
 886:	c1 e0 03             	shl    $0x3,%eax
 889:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 88c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88f:	8b 55 ec             	mov    -0x14(%ebp),%edx
 892:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 895:	8b 45 f0             	mov    -0x10(%ebp),%eax
 898:	a3 a0 0b 00 00       	mov    %eax,0xba0
      return (void*)(p + 1);
 89d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a0:	83 c0 08             	add    $0x8,%eax
 8a3:	eb 38                	jmp    8dd <malloc+0xde>
    }
    if(p == freep)
 8a5:	a1 a0 0b 00 00       	mov    0xba0,%eax
 8aa:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8ad:	75 1b                	jne    8ca <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8af:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8b2:	89 04 24             	mov    %eax,(%esp)
 8b5:	e8 ed fe ff ff       	call   7a7 <morecore>
 8ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8bd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8c1:	75 07                	jne    8ca <malloc+0xcb>
        return 0;
 8c3:	b8 00 00 00 00       	mov    $0x0,%eax
 8c8:	eb 13                	jmp    8dd <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8cd:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d3:	8b 00                	mov    (%eax),%eax
 8d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 8d8:	e9 70 ff ff ff       	jmp    84d <malloc+0x4e>
}
 8dd:	c9                   	leave  
 8de:	c3                   	ret    
