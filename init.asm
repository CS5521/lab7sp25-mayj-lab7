
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   9:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  10:	00 
  11:	c7 04 24 e9 09 00 00 	movl   $0x9e9,(%esp)
  18:	e8 ad 04 00 00       	call   4ca <open>
  1d:	85 c0                	test   %eax,%eax
  1f:	79 30                	jns    51 <main+0x51>
    mknod("console", 1, 1);
  21:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  28:	00 
  29:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  30:	00 
  31:	c7 04 24 e9 09 00 00 	movl   $0x9e9,(%esp)
  38:	e8 95 04 00 00       	call   4d2 <mknod>
    open("console", O_RDWR);
  3d:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  44:	00 
  45:	c7 04 24 e9 09 00 00 	movl   $0x9e9,(%esp)
  4c:	e8 79 04 00 00       	call   4ca <open>
  }
  dup(0);  // stdout
  51:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  58:	e8 a5 04 00 00       	call   502 <dup>
  dup(0);  // stderr
  5d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  64:	e8 99 04 00 00       	call   502 <dup>

  for(;;){
    printf(1, "init: starting sh\n");
  69:	c7 44 24 04 f1 09 00 	movl   $0x9f1,0x4(%esp)
  70:	00 
  71:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  78:	e8 9d 05 00 00       	call   61a <printf>
    pid = fork();
  7d:	e8 00 04 00 00       	call   482 <fork>
  82:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    if(pid < 0){
  86:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  8b:	79 19                	jns    a6 <main+0xa6>
      printf(1, "init: fork failed\n");
  8d:	c7 44 24 04 04 0a 00 	movl   $0xa04,0x4(%esp)
  94:	00 
  95:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9c:	e8 79 05 00 00       	call   61a <printf>
      exit();
  a1:	e8 e4 03 00 00       	call   48a <exit>
    }
    if(pid == 0){
  a6:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  ab:	75 2d                	jne    da <main+0xda>
      exec("sh", argv);
  ad:	c7 44 24 04 dc 0c 00 	movl   $0xcdc,0x4(%esp)
  b4:	00 
  b5:	c7 04 24 e6 09 00 00 	movl   $0x9e6,(%esp)
  bc:	e8 01 04 00 00       	call   4c2 <exec>
      printf(1, "init: exec sh failed\n");
  c1:	c7 44 24 04 17 0a 00 	movl   $0xa17,0x4(%esp)
  c8:	00 
  c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d0:	e8 45 05 00 00       	call   61a <printf>
      exit();
  d5:	e8 b0 03 00 00       	call   48a <exit>
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  da:	eb 14                	jmp    f0 <main+0xf0>
      printf(1, "zombie!\n");
  dc:	c7 44 24 04 2d 0a 00 	movl   $0xa2d,0x4(%esp)
  e3:	00 
  e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  eb:	e8 2a 05 00 00       	call   61a <printf>
    while((wpid=wait()) >= 0 && wpid != pid)
  f0:	e8 9d 03 00 00       	call   492 <wait>
  f5:	89 44 24 18          	mov    %eax,0x18(%esp)
  f9:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  fe:	78 0a                	js     10a <main+0x10a>
 100:	8b 44 24 18          	mov    0x18(%esp),%eax
 104:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
 108:	75 d2                	jne    dc <main+0xdc>
  }
 10a:	e9 5a ff ff ff       	jmp    69 <main+0x69>

0000010f <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 10f:	55                   	push   %ebp
 110:	89 e5                	mov    %esp,%ebp
 112:	57                   	push   %edi
 113:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 114:	8b 4d 08             	mov    0x8(%ebp),%ecx
 117:	8b 55 10             	mov    0x10(%ebp),%edx
 11a:	8b 45 0c             	mov    0xc(%ebp),%eax
 11d:	89 cb                	mov    %ecx,%ebx
 11f:	89 df                	mov    %ebx,%edi
 121:	89 d1                	mov    %edx,%ecx
 123:	fc                   	cld    
 124:	f3 aa                	rep stos %al,%es:(%edi)
 126:	89 ca                	mov    %ecx,%edx
 128:	89 fb                	mov    %edi,%ebx
 12a:	89 5d 08             	mov    %ebx,0x8(%ebp)
 12d:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 130:	5b                   	pop    %ebx
 131:	5f                   	pop    %edi
 132:	5d                   	pop    %ebp
 133:	c3                   	ret    

00000134 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 13a:	8b 45 08             	mov    0x8(%ebp),%eax
 13d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 140:	90                   	nop
 141:	8b 45 08             	mov    0x8(%ebp),%eax
 144:	8d 50 01             	lea    0x1(%eax),%edx
 147:	89 55 08             	mov    %edx,0x8(%ebp)
 14a:	8b 55 0c             	mov    0xc(%ebp),%edx
 14d:	8d 4a 01             	lea    0x1(%edx),%ecx
 150:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 153:	0f b6 12             	movzbl (%edx),%edx
 156:	88 10                	mov    %dl,(%eax)
 158:	0f b6 00             	movzbl (%eax),%eax
 15b:	84 c0                	test   %al,%al
 15d:	75 e2                	jne    141 <strcpy+0xd>
    ;
  return os;
 15f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 162:	c9                   	leave  
 163:	c3                   	ret    

00000164 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 167:	eb 08                	jmp    171 <strcmp+0xd>
    p++, q++;
 169:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16d:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 171:	8b 45 08             	mov    0x8(%ebp),%eax
 174:	0f b6 00             	movzbl (%eax),%eax
 177:	84 c0                	test   %al,%al
 179:	74 10                	je     18b <strcmp+0x27>
 17b:	8b 45 08             	mov    0x8(%ebp),%eax
 17e:	0f b6 10             	movzbl (%eax),%edx
 181:	8b 45 0c             	mov    0xc(%ebp),%eax
 184:	0f b6 00             	movzbl (%eax),%eax
 187:	38 c2                	cmp    %al,%dl
 189:	74 de                	je     169 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 18b:	8b 45 08             	mov    0x8(%ebp),%eax
 18e:	0f b6 00             	movzbl (%eax),%eax
 191:	0f b6 d0             	movzbl %al,%edx
 194:	8b 45 0c             	mov    0xc(%ebp),%eax
 197:	0f b6 00             	movzbl (%eax),%eax
 19a:	0f b6 c0             	movzbl %al,%eax
 19d:	29 c2                	sub    %eax,%edx
 19f:	89 d0                	mov    %edx,%eax
}
 1a1:	5d                   	pop    %ebp
 1a2:	c3                   	ret    

000001a3 <strlen>:

uint
strlen(const char *s)
{
 1a3:	55                   	push   %ebp
 1a4:	89 e5                	mov    %esp,%ebp
 1a6:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1a9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1b0:	eb 04                	jmp    1b6 <strlen+0x13>
 1b2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1b6:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1b9:	8b 45 08             	mov    0x8(%ebp),%eax
 1bc:	01 d0                	add    %edx,%eax
 1be:	0f b6 00             	movzbl (%eax),%eax
 1c1:	84 c0                	test   %al,%al
 1c3:	75 ed                	jne    1b2 <strlen+0xf>
    ;
  return n;
 1c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1c8:	c9                   	leave  
 1c9:	c3                   	ret    

000001ca <memset>:

void*
memset(void *dst, int c, uint n)
{
 1ca:	55                   	push   %ebp
 1cb:	89 e5                	mov    %esp,%ebp
 1cd:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1d0:	8b 45 10             	mov    0x10(%ebp),%eax
 1d3:	89 44 24 08          	mov    %eax,0x8(%esp)
 1d7:	8b 45 0c             	mov    0xc(%ebp),%eax
 1da:	89 44 24 04          	mov    %eax,0x4(%esp)
 1de:	8b 45 08             	mov    0x8(%ebp),%eax
 1e1:	89 04 24             	mov    %eax,(%esp)
 1e4:	e8 26 ff ff ff       	call   10f <stosb>
  return dst;
 1e9:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ec:	c9                   	leave  
 1ed:	c3                   	ret    

000001ee <strchr>:

char*
strchr(const char *s, char c)
{
 1ee:	55                   	push   %ebp
 1ef:	89 e5                	mov    %esp,%ebp
 1f1:	83 ec 04             	sub    $0x4,%esp
 1f4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f7:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1fa:	eb 14                	jmp    210 <strchr+0x22>
    if(*s == c)
 1fc:	8b 45 08             	mov    0x8(%ebp),%eax
 1ff:	0f b6 00             	movzbl (%eax),%eax
 202:	3a 45 fc             	cmp    -0x4(%ebp),%al
 205:	75 05                	jne    20c <strchr+0x1e>
      return (char*)s;
 207:	8b 45 08             	mov    0x8(%ebp),%eax
 20a:	eb 13                	jmp    21f <strchr+0x31>
  for(; *s; s++)
 20c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 210:	8b 45 08             	mov    0x8(%ebp),%eax
 213:	0f b6 00             	movzbl (%eax),%eax
 216:	84 c0                	test   %al,%al
 218:	75 e2                	jne    1fc <strchr+0xe>
  return 0;
 21a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 21f:	c9                   	leave  
 220:	c3                   	ret    

00000221 <gets>:

char*
gets(char *buf, int max)
{
 221:	55                   	push   %ebp
 222:	89 e5                	mov    %esp,%ebp
 224:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 227:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 22e:	eb 4c                	jmp    27c <gets+0x5b>
    cc = read(0, &c, 1);
 230:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 237:	00 
 238:	8d 45 ef             	lea    -0x11(%ebp),%eax
 23b:	89 44 24 04          	mov    %eax,0x4(%esp)
 23f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 246:	e8 57 02 00 00       	call   4a2 <read>
 24b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 24e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 252:	7f 02                	jg     256 <gets+0x35>
      break;
 254:	eb 31                	jmp    287 <gets+0x66>
    buf[i++] = c;
 256:	8b 45 f4             	mov    -0xc(%ebp),%eax
 259:	8d 50 01             	lea    0x1(%eax),%edx
 25c:	89 55 f4             	mov    %edx,-0xc(%ebp)
 25f:	89 c2                	mov    %eax,%edx
 261:	8b 45 08             	mov    0x8(%ebp),%eax
 264:	01 c2                	add    %eax,%edx
 266:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 26a:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 26c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 270:	3c 0a                	cmp    $0xa,%al
 272:	74 13                	je     287 <gets+0x66>
 274:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 278:	3c 0d                	cmp    $0xd,%al
 27a:	74 0b                	je     287 <gets+0x66>
  for(i=0; i+1 < max; ){
 27c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 27f:	83 c0 01             	add    $0x1,%eax
 282:	3b 45 0c             	cmp    0xc(%ebp),%eax
 285:	7c a9                	jl     230 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 287:	8b 55 f4             	mov    -0xc(%ebp),%edx
 28a:	8b 45 08             	mov    0x8(%ebp),%eax
 28d:	01 d0                	add    %edx,%eax
 28f:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 292:	8b 45 08             	mov    0x8(%ebp),%eax
}
 295:	c9                   	leave  
 296:	c3                   	ret    

00000297 <stat>:

int
stat(const char *n, struct stat *st)
{
 297:	55                   	push   %ebp
 298:	89 e5                	mov    %esp,%ebp
 29a:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 29d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2a4:	00 
 2a5:	8b 45 08             	mov    0x8(%ebp),%eax
 2a8:	89 04 24             	mov    %eax,(%esp)
 2ab:	e8 1a 02 00 00       	call   4ca <open>
 2b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2b3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2b7:	79 07                	jns    2c0 <stat+0x29>
    return -1;
 2b9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2be:	eb 23                	jmp    2e3 <stat+0x4c>
  r = fstat(fd, st);
 2c0:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c3:	89 44 24 04          	mov    %eax,0x4(%esp)
 2c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2ca:	89 04 24             	mov    %eax,(%esp)
 2cd:	e8 10 02 00 00       	call   4e2 <fstat>
 2d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2d8:	89 04 24             	mov    %eax,(%esp)
 2db:	e8 d2 01 00 00       	call   4b2 <close>
  return r;
 2e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2e3:	c9                   	leave  
 2e4:	c3                   	ret    

000002e5 <atoi>:

int
atoi(const char *s)
{
 2e5:	55                   	push   %ebp
 2e6:	89 e5                	mov    %esp,%ebp
 2e8:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2eb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2f2:	eb 25                	jmp    319 <atoi+0x34>
    n = n*10 + *s++ - '0';
 2f4:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2f7:	89 d0                	mov    %edx,%eax
 2f9:	c1 e0 02             	shl    $0x2,%eax
 2fc:	01 d0                	add    %edx,%eax
 2fe:	01 c0                	add    %eax,%eax
 300:	89 c1                	mov    %eax,%ecx
 302:	8b 45 08             	mov    0x8(%ebp),%eax
 305:	8d 50 01             	lea    0x1(%eax),%edx
 308:	89 55 08             	mov    %edx,0x8(%ebp)
 30b:	0f b6 00             	movzbl (%eax),%eax
 30e:	0f be c0             	movsbl %al,%eax
 311:	01 c8                	add    %ecx,%eax
 313:	83 e8 30             	sub    $0x30,%eax
 316:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 319:	8b 45 08             	mov    0x8(%ebp),%eax
 31c:	0f b6 00             	movzbl (%eax),%eax
 31f:	3c 2f                	cmp    $0x2f,%al
 321:	7e 0a                	jle    32d <atoi+0x48>
 323:	8b 45 08             	mov    0x8(%ebp),%eax
 326:	0f b6 00             	movzbl (%eax),%eax
 329:	3c 39                	cmp    $0x39,%al
 32b:	7e c7                	jle    2f4 <atoi+0xf>
  return n;
 32d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 330:	c9                   	leave  
 331:	c3                   	ret    

00000332 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 332:	55                   	push   %ebp
 333:	89 e5                	mov    %esp,%ebp
 335:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 338:	8b 45 08             	mov    0x8(%ebp),%eax
 33b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 33e:	8b 45 0c             	mov    0xc(%ebp),%eax
 341:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 344:	eb 17                	jmp    35d <memmove+0x2b>
    *dst++ = *src++;
 346:	8b 45 fc             	mov    -0x4(%ebp),%eax
 349:	8d 50 01             	lea    0x1(%eax),%edx
 34c:	89 55 fc             	mov    %edx,-0x4(%ebp)
 34f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 352:	8d 4a 01             	lea    0x1(%edx),%ecx
 355:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 358:	0f b6 12             	movzbl (%edx),%edx
 35b:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 35d:	8b 45 10             	mov    0x10(%ebp),%eax
 360:	8d 50 ff             	lea    -0x1(%eax),%edx
 363:	89 55 10             	mov    %edx,0x10(%ebp)
 366:	85 c0                	test   %eax,%eax
 368:	7f dc                	jg     346 <memmove+0x14>
  return vdst;
 36a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 36d:	c9                   	leave  
 36e:	c3                   	ret    

0000036f <ps>:

void
ps() {
 36f:	55                   	push   %ebp
 370:	89 e5                	mov    %esp,%ebp
 372:	57                   	push   %edi
 373:	56                   	push   %esi
 374:	53                   	push   %ebx
 375:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  int i = 0;
 37b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  printf(1, "PID	TKTS	TCKS	STAT	NAME\n");
 382:	c7 44 24 04 36 0a 00 	movl   $0xa36,0x4(%esp)
 389:	00 
 38a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 391:	e8 84 02 00 00       	call   61a <printf>
  getpinfo(&pstat);
 396:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 39c:	89 04 24             	mov    %eax,(%esp)
 39f:	e8 86 01 00 00       	call   52a <getpinfo>
  while (pstat[i].pid != 0) {
 3a4:	e9 ad 00 00 00       	jmp    456 <ps+0xe7>
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
	pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 3a9:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 3af:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3b2:	89 d0                	mov    %edx,%eax
 3b4:	c1 e0 03             	shl    $0x3,%eax
 3b7:	01 d0                	add    %edx,%eax
 3b9:	c1 e0 02             	shl    $0x2,%eax
 3bc:	83 c0 10             	add    $0x10,%eax
 3bf:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 3c2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3c5:	89 d0                	mov    %edx,%eax
 3c7:	c1 e0 03             	shl    $0x3,%eax
 3ca:	01 d0                	add    %edx,%eax
 3cc:	c1 e0 02             	shl    $0x2,%eax
 3cf:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 3d2:	01 d8                	add    %ebx,%eax
 3d4:	2d e4 08 00 00       	sub    $0x8e4,%eax
 3d9:	0f b6 00             	movzbl (%eax),%eax
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
 3dc:	0f be f0             	movsbl %al,%esi
 3df:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3e2:	89 d0                	mov    %edx,%eax
 3e4:	c1 e0 03             	shl    $0x3,%eax
 3e7:	01 d0                	add    %edx,%eax
 3e9:	c1 e0 02             	shl    $0x2,%eax
 3ec:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 3ef:	01 c8                	add    %ecx,%eax
 3f1:	2d f8 08 00 00       	sub    $0x8f8,%eax
 3f6:	8b 18                	mov    (%eax),%ebx
 3f8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3fb:	89 d0                	mov    %edx,%eax
 3fd:	c1 e0 03             	shl    $0x3,%eax
 400:	01 d0                	add    %edx,%eax
 402:	c1 e0 02             	shl    $0x2,%eax
 405:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 408:	01 c8                	add    %ecx,%eax
 40a:	2d 00 09 00 00       	sub    $0x900,%eax
 40f:	8b 08                	mov    (%eax),%ecx
 411:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 414:	89 d0                	mov    %edx,%eax
 416:	c1 e0 03             	shl    $0x3,%eax
 419:	01 d0                	add    %edx,%eax
 41b:	c1 e0 02             	shl    $0x2,%eax
 41e:	8d 55 e8             	lea    -0x18(%ebp),%edx
 421:	01 d0                	add    %edx,%eax
 423:	2d fc 08 00 00       	sub    $0x8fc,%eax
 428:	8b 00                	mov    (%eax),%eax
 42a:	89 7c 24 18          	mov    %edi,0x18(%esp)
 42e:	89 74 24 14          	mov    %esi,0x14(%esp)
 432:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 436:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 43a:	89 44 24 08          	mov    %eax,0x8(%esp)
 43e:	c7 44 24 04 4f 0a 00 	movl   $0xa4f,0x4(%esp)
 445:	00 
 446:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 44d:	e8 c8 01 00 00       	call   61a <printf>
      i++;
 452:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  while (pstat[i].pid != 0) {
 456:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 459:	89 d0                	mov    %edx,%eax
 45b:	c1 e0 03             	shl    $0x3,%eax
 45e:	01 d0                	add    %edx,%eax
 460:	c1 e0 02             	shl    $0x2,%eax
 463:	8d 75 e8             	lea    -0x18(%ebp),%esi
 466:	01 f0                	add    %esi,%eax
 468:	2d fc 08 00 00       	sub    $0x8fc,%eax
 46d:	8b 00                	mov    (%eax),%eax
 46f:	85 c0                	test   %eax,%eax
 471:	0f 85 32 ff ff ff    	jne    3a9 <ps+0x3a>
  }
}
 477:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 47d:	5b                   	pop    %ebx
 47e:	5e                   	pop    %esi
 47f:	5f                   	pop    %edi
 480:	5d                   	pop    %ebp
 481:	c3                   	ret    

00000482 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 482:	b8 01 00 00 00       	mov    $0x1,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <exit>:
SYSCALL(exit)
 48a:	b8 02 00 00 00       	mov    $0x2,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <wait>:
SYSCALL(wait)
 492:	b8 03 00 00 00       	mov    $0x3,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <pipe>:
SYSCALL(pipe)
 49a:	b8 04 00 00 00       	mov    $0x4,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <read>:
SYSCALL(read)
 4a2:	b8 05 00 00 00       	mov    $0x5,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <write>:
SYSCALL(write)
 4aa:	b8 10 00 00 00       	mov    $0x10,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <close>:
SYSCALL(close)
 4b2:	b8 15 00 00 00       	mov    $0x15,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <kill>:
SYSCALL(kill)
 4ba:	b8 06 00 00 00       	mov    $0x6,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <exec>:
SYSCALL(exec)
 4c2:	b8 07 00 00 00       	mov    $0x7,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <open>:
SYSCALL(open)
 4ca:	b8 0f 00 00 00       	mov    $0xf,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <mknod>:
SYSCALL(mknod)
 4d2:	b8 11 00 00 00       	mov    $0x11,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <unlink>:
SYSCALL(unlink)
 4da:	b8 12 00 00 00       	mov    $0x12,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <fstat>:
SYSCALL(fstat)
 4e2:	b8 08 00 00 00       	mov    $0x8,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <link>:
SYSCALL(link)
 4ea:	b8 13 00 00 00       	mov    $0x13,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <mkdir>:
SYSCALL(mkdir)
 4f2:	b8 14 00 00 00       	mov    $0x14,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <chdir>:
SYSCALL(chdir)
 4fa:	b8 09 00 00 00       	mov    $0x9,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <dup>:
SYSCALL(dup)
 502:	b8 0a 00 00 00       	mov    $0xa,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <getpid>:
SYSCALL(getpid)
 50a:	b8 0b 00 00 00       	mov    $0xb,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <sbrk>:
SYSCALL(sbrk)
 512:	b8 0c 00 00 00       	mov    $0xc,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <sleep>:
SYSCALL(sleep)
 51a:	b8 0d 00 00 00       	mov    $0xd,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <uptime>:
SYSCALL(uptime)
 522:	b8 0e 00 00 00       	mov    $0xe,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <getpinfo>:
SYSCALL(getpinfo)
 52a:	b8 16 00 00 00       	mov    $0x16,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <settickets>:
SYSCALL(settickets)
 532:	b8 17 00 00 00       	mov    $0x17,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 53a:	55                   	push   %ebp
 53b:	89 e5                	mov    %esp,%ebp
 53d:	83 ec 18             	sub    $0x18,%esp
 540:	8b 45 0c             	mov    0xc(%ebp),%eax
 543:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 546:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 54d:	00 
 54e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 551:	89 44 24 04          	mov    %eax,0x4(%esp)
 555:	8b 45 08             	mov    0x8(%ebp),%eax
 558:	89 04 24             	mov    %eax,(%esp)
 55b:	e8 4a ff ff ff       	call   4aa <write>
}
 560:	c9                   	leave  
 561:	c3                   	ret    

00000562 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 562:	55                   	push   %ebp
 563:	89 e5                	mov    %esp,%ebp
 565:	56                   	push   %esi
 566:	53                   	push   %ebx
 567:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 56a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 571:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 575:	74 17                	je     58e <printint+0x2c>
 577:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 57b:	79 11                	jns    58e <printint+0x2c>
    neg = 1;
 57d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 584:	8b 45 0c             	mov    0xc(%ebp),%eax
 587:	f7 d8                	neg    %eax
 589:	89 45 ec             	mov    %eax,-0x14(%ebp)
 58c:	eb 06                	jmp    594 <printint+0x32>
  } else {
    x = xx;
 58e:	8b 45 0c             	mov    0xc(%ebp),%eax
 591:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 594:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 59b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 59e:	8d 41 01             	lea    0x1(%ecx),%eax
 5a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5a4:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5aa:	ba 00 00 00 00       	mov    $0x0,%edx
 5af:	f7 f3                	div    %ebx
 5b1:	89 d0                	mov    %edx,%eax
 5b3:	0f b6 80 e4 0c 00 00 	movzbl 0xce4(%eax),%eax
 5ba:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 5be:	8b 75 10             	mov    0x10(%ebp),%esi
 5c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5c4:	ba 00 00 00 00       	mov    $0x0,%edx
 5c9:	f7 f6                	div    %esi
 5cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5ce:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5d2:	75 c7                	jne    59b <printint+0x39>
  if(neg)
 5d4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5d8:	74 10                	je     5ea <printint+0x88>
    buf[i++] = '-';
 5da:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5dd:	8d 50 01             	lea    0x1(%eax),%edx
 5e0:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5e3:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5e8:	eb 1f                	jmp    609 <printint+0xa7>
 5ea:	eb 1d                	jmp    609 <printint+0xa7>
    putc(fd, buf[i]);
 5ec:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5f2:	01 d0                	add    %edx,%eax
 5f4:	0f b6 00             	movzbl (%eax),%eax
 5f7:	0f be c0             	movsbl %al,%eax
 5fa:	89 44 24 04          	mov    %eax,0x4(%esp)
 5fe:	8b 45 08             	mov    0x8(%ebp),%eax
 601:	89 04 24             	mov    %eax,(%esp)
 604:	e8 31 ff ff ff       	call   53a <putc>
  while(--i >= 0)
 609:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 60d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 611:	79 d9                	jns    5ec <printint+0x8a>
}
 613:	83 c4 30             	add    $0x30,%esp
 616:	5b                   	pop    %ebx
 617:	5e                   	pop    %esi
 618:	5d                   	pop    %ebp
 619:	c3                   	ret    

0000061a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 61a:	55                   	push   %ebp
 61b:	89 e5                	mov    %esp,%ebp
 61d:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 620:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 627:	8d 45 0c             	lea    0xc(%ebp),%eax
 62a:	83 c0 04             	add    $0x4,%eax
 62d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 630:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 637:	e9 7c 01 00 00       	jmp    7b8 <printf+0x19e>
    c = fmt[i] & 0xff;
 63c:	8b 55 0c             	mov    0xc(%ebp),%edx
 63f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 642:	01 d0                	add    %edx,%eax
 644:	0f b6 00             	movzbl (%eax),%eax
 647:	0f be c0             	movsbl %al,%eax
 64a:	25 ff 00 00 00       	and    $0xff,%eax
 64f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 652:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 656:	75 2c                	jne    684 <printf+0x6a>
      if(c == '%'){
 658:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 65c:	75 0c                	jne    66a <printf+0x50>
        state = '%';
 65e:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 665:	e9 4a 01 00 00       	jmp    7b4 <printf+0x19a>
      } else {
        putc(fd, c);
 66a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 66d:	0f be c0             	movsbl %al,%eax
 670:	89 44 24 04          	mov    %eax,0x4(%esp)
 674:	8b 45 08             	mov    0x8(%ebp),%eax
 677:	89 04 24             	mov    %eax,(%esp)
 67a:	e8 bb fe ff ff       	call   53a <putc>
 67f:	e9 30 01 00 00       	jmp    7b4 <printf+0x19a>
      }
    } else if(state == '%'){
 684:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 688:	0f 85 26 01 00 00    	jne    7b4 <printf+0x19a>
      if(c == 'd'){
 68e:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 692:	75 2d                	jne    6c1 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 694:	8b 45 e8             	mov    -0x18(%ebp),%eax
 697:	8b 00                	mov    (%eax),%eax
 699:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 6a0:	00 
 6a1:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 6a8:	00 
 6a9:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ad:	8b 45 08             	mov    0x8(%ebp),%eax
 6b0:	89 04 24             	mov    %eax,(%esp)
 6b3:	e8 aa fe ff ff       	call   562 <printint>
        ap++;
 6b8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6bc:	e9 ec 00 00 00       	jmp    7ad <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 6c1:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 6c5:	74 06                	je     6cd <printf+0xb3>
 6c7:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 6cb:	75 2d                	jne    6fa <printf+0xe0>
        printint(fd, *ap, 16, 0);
 6cd:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6d0:	8b 00                	mov    (%eax),%eax
 6d2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 6d9:	00 
 6da:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6e1:	00 
 6e2:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e6:	8b 45 08             	mov    0x8(%ebp),%eax
 6e9:	89 04 24             	mov    %eax,(%esp)
 6ec:	e8 71 fe ff ff       	call   562 <printint>
        ap++;
 6f1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6f5:	e9 b3 00 00 00       	jmp    7ad <printf+0x193>
      } else if(c == 's'){
 6fa:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6fe:	75 45                	jne    745 <printf+0x12b>
        s = (char*)*ap;
 700:	8b 45 e8             	mov    -0x18(%ebp),%eax
 703:	8b 00                	mov    (%eax),%eax
 705:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 708:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 70c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 710:	75 09                	jne    71b <printf+0x101>
          s = "(null)";
 712:	c7 45 f4 5f 0a 00 00 	movl   $0xa5f,-0xc(%ebp)
        while(*s != 0){
 719:	eb 1e                	jmp    739 <printf+0x11f>
 71b:	eb 1c                	jmp    739 <printf+0x11f>
          putc(fd, *s);
 71d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 720:	0f b6 00             	movzbl (%eax),%eax
 723:	0f be c0             	movsbl %al,%eax
 726:	89 44 24 04          	mov    %eax,0x4(%esp)
 72a:	8b 45 08             	mov    0x8(%ebp),%eax
 72d:	89 04 24             	mov    %eax,(%esp)
 730:	e8 05 fe ff ff       	call   53a <putc>
          s++;
 735:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 739:	8b 45 f4             	mov    -0xc(%ebp),%eax
 73c:	0f b6 00             	movzbl (%eax),%eax
 73f:	84 c0                	test   %al,%al
 741:	75 da                	jne    71d <printf+0x103>
 743:	eb 68                	jmp    7ad <printf+0x193>
        }
      } else if(c == 'c'){
 745:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 749:	75 1d                	jne    768 <printf+0x14e>
        putc(fd, *ap);
 74b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 74e:	8b 00                	mov    (%eax),%eax
 750:	0f be c0             	movsbl %al,%eax
 753:	89 44 24 04          	mov    %eax,0x4(%esp)
 757:	8b 45 08             	mov    0x8(%ebp),%eax
 75a:	89 04 24             	mov    %eax,(%esp)
 75d:	e8 d8 fd ff ff       	call   53a <putc>
        ap++;
 762:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 766:	eb 45                	jmp    7ad <printf+0x193>
      } else if(c == '%'){
 768:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 76c:	75 17                	jne    785 <printf+0x16b>
        putc(fd, c);
 76e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 771:	0f be c0             	movsbl %al,%eax
 774:	89 44 24 04          	mov    %eax,0x4(%esp)
 778:	8b 45 08             	mov    0x8(%ebp),%eax
 77b:	89 04 24             	mov    %eax,(%esp)
 77e:	e8 b7 fd ff ff       	call   53a <putc>
 783:	eb 28                	jmp    7ad <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 785:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 78c:	00 
 78d:	8b 45 08             	mov    0x8(%ebp),%eax
 790:	89 04 24             	mov    %eax,(%esp)
 793:	e8 a2 fd ff ff       	call   53a <putc>
        putc(fd, c);
 798:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 79b:	0f be c0             	movsbl %al,%eax
 79e:	89 44 24 04          	mov    %eax,0x4(%esp)
 7a2:	8b 45 08             	mov    0x8(%ebp),%eax
 7a5:	89 04 24             	mov    %eax,(%esp)
 7a8:	e8 8d fd ff ff       	call   53a <putc>
      }
      state = 0;
 7ad:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 7b4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 7b8:	8b 55 0c             	mov    0xc(%ebp),%edx
 7bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7be:	01 d0                	add    %edx,%eax
 7c0:	0f b6 00             	movzbl (%eax),%eax
 7c3:	84 c0                	test   %al,%al
 7c5:	0f 85 71 fe ff ff    	jne    63c <printf+0x22>
    }
  }
}
 7cb:	c9                   	leave  
 7cc:	c3                   	ret    

000007cd <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7cd:	55                   	push   %ebp
 7ce:	89 e5                	mov    %esp,%ebp
 7d0:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7d3:	8b 45 08             	mov    0x8(%ebp),%eax
 7d6:	83 e8 08             	sub    $0x8,%eax
 7d9:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7dc:	a1 00 0d 00 00       	mov    0xd00,%eax
 7e1:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7e4:	eb 24                	jmp    80a <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e9:	8b 00                	mov    (%eax),%eax
 7eb:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7ee:	77 12                	ja     802 <free+0x35>
 7f0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7f6:	77 24                	ja     81c <free+0x4f>
 7f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fb:	8b 00                	mov    (%eax),%eax
 7fd:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 800:	77 1a                	ja     81c <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 802:	8b 45 fc             	mov    -0x4(%ebp),%eax
 805:	8b 00                	mov    (%eax),%eax
 807:	89 45 fc             	mov    %eax,-0x4(%ebp)
 80a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 810:	76 d4                	jbe    7e6 <free+0x19>
 812:	8b 45 fc             	mov    -0x4(%ebp),%eax
 815:	8b 00                	mov    (%eax),%eax
 817:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 81a:	76 ca                	jbe    7e6 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 81c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 81f:	8b 40 04             	mov    0x4(%eax),%eax
 822:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 829:	8b 45 f8             	mov    -0x8(%ebp),%eax
 82c:	01 c2                	add    %eax,%edx
 82e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 831:	8b 00                	mov    (%eax),%eax
 833:	39 c2                	cmp    %eax,%edx
 835:	75 24                	jne    85b <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 837:	8b 45 f8             	mov    -0x8(%ebp),%eax
 83a:	8b 50 04             	mov    0x4(%eax),%edx
 83d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 840:	8b 00                	mov    (%eax),%eax
 842:	8b 40 04             	mov    0x4(%eax),%eax
 845:	01 c2                	add    %eax,%edx
 847:	8b 45 f8             	mov    -0x8(%ebp),%eax
 84a:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 84d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 850:	8b 00                	mov    (%eax),%eax
 852:	8b 10                	mov    (%eax),%edx
 854:	8b 45 f8             	mov    -0x8(%ebp),%eax
 857:	89 10                	mov    %edx,(%eax)
 859:	eb 0a                	jmp    865 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 85b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85e:	8b 10                	mov    (%eax),%edx
 860:	8b 45 f8             	mov    -0x8(%ebp),%eax
 863:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 865:	8b 45 fc             	mov    -0x4(%ebp),%eax
 868:	8b 40 04             	mov    0x4(%eax),%eax
 86b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 872:	8b 45 fc             	mov    -0x4(%ebp),%eax
 875:	01 d0                	add    %edx,%eax
 877:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 87a:	75 20                	jne    89c <free+0xcf>
    p->s.size += bp->s.size;
 87c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87f:	8b 50 04             	mov    0x4(%eax),%edx
 882:	8b 45 f8             	mov    -0x8(%ebp),%eax
 885:	8b 40 04             	mov    0x4(%eax),%eax
 888:	01 c2                	add    %eax,%edx
 88a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 88d:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 890:	8b 45 f8             	mov    -0x8(%ebp),%eax
 893:	8b 10                	mov    (%eax),%edx
 895:	8b 45 fc             	mov    -0x4(%ebp),%eax
 898:	89 10                	mov    %edx,(%eax)
 89a:	eb 08                	jmp    8a4 <free+0xd7>
  } else
    p->s.ptr = bp;
 89c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 89f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8a2:	89 10                	mov    %edx,(%eax)
  freep = p;
 8a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a7:	a3 00 0d 00 00       	mov    %eax,0xd00
}
 8ac:	c9                   	leave  
 8ad:	c3                   	ret    

000008ae <morecore>:

static Header*
morecore(uint nu)
{
 8ae:	55                   	push   %ebp
 8af:	89 e5                	mov    %esp,%ebp
 8b1:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 8b4:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 8bb:	77 07                	ja     8c4 <morecore+0x16>
    nu = 4096;
 8bd:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 8c4:	8b 45 08             	mov    0x8(%ebp),%eax
 8c7:	c1 e0 03             	shl    $0x3,%eax
 8ca:	89 04 24             	mov    %eax,(%esp)
 8cd:	e8 40 fc ff ff       	call   512 <sbrk>
 8d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 8d5:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8d9:	75 07                	jne    8e2 <morecore+0x34>
    return 0;
 8db:	b8 00 00 00 00       	mov    $0x0,%eax
 8e0:	eb 22                	jmp    904 <morecore+0x56>
  hp = (Header*)p;
 8e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8eb:	8b 55 08             	mov    0x8(%ebp),%edx
 8ee:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f4:	83 c0 08             	add    $0x8,%eax
 8f7:	89 04 24             	mov    %eax,(%esp)
 8fa:	e8 ce fe ff ff       	call   7cd <free>
  return freep;
 8ff:	a1 00 0d 00 00       	mov    0xd00,%eax
}
 904:	c9                   	leave  
 905:	c3                   	ret    

00000906 <malloc>:

void*
malloc(uint nbytes)
{
 906:	55                   	push   %ebp
 907:	89 e5                	mov    %esp,%ebp
 909:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 90c:	8b 45 08             	mov    0x8(%ebp),%eax
 90f:	83 c0 07             	add    $0x7,%eax
 912:	c1 e8 03             	shr    $0x3,%eax
 915:	83 c0 01             	add    $0x1,%eax
 918:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 91b:	a1 00 0d 00 00       	mov    0xd00,%eax
 920:	89 45 f0             	mov    %eax,-0x10(%ebp)
 923:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 927:	75 23                	jne    94c <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 929:	c7 45 f0 f8 0c 00 00 	movl   $0xcf8,-0x10(%ebp)
 930:	8b 45 f0             	mov    -0x10(%ebp),%eax
 933:	a3 00 0d 00 00       	mov    %eax,0xd00
 938:	a1 00 0d 00 00       	mov    0xd00,%eax
 93d:	a3 f8 0c 00 00       	mov    %eax,0xcf8
    base.s.size = 0;
 942:	c7 05 fc 0c 00 00 00 	movl   $0x0,0xcfc
 949:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 94c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 94f:	8b 00                	mov    (%eax),%eax
 951:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 954:	8b 45 f4             	mov    -0xc(%ebp),%eax
 957:	8b 40 04             	mov    0x4(%eax),%eax
 95a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 95d:	72 4d                	jb     9ac <malloc+0xa6>
      if(p->s.size == nunits)
 95f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 962:	8b 40 04             	mov    0x4(%eax),%eax
 965:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 968:	75 0c                	jne    976 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 96a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 96d:	8b 10                	mov    (%eax),%edx
 96f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 972:	89 10                	mov    %edx,(%eax)
 974:	eb 26                	jmp    99c <malloc+0x96>
      else {
        p->s.size -= nunits;
 976:	8b 45 f4             	mov    -0xc(%ebp),%eax
 979:	8b 40 04             	mov    0x4(%eax),%eax
 97c:	2b 45 ec             	sub    -0x14(%ebp),%eax
 97f:	89 c2                	mov    %eax,%edx
 981:	8b 45 f4             	mov    -0xc(%ebp),%eax
 984:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 987:	8b 45 f4             	mov    -0xc(%ebp),%eax
 98a:	8b 40 04             	mov    0x4(%eax),%eax
 98d:	c1 e0 03             	shl    $0x3,%eax
 990:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 993:	8b 45 f4             	mov    -0xc(%ebp),%eax
 996:	8b 55 ec             	mov    -0x14(%ebp),%edx
 999:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 99c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 99f:	a3 00 0d 00 00       	mov    %eax,0xd00
      return (void*)(p + 1);
 9a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a7:	83 c0 08             	add    $0x8,%eax
 9aa:	eb 38                	jmp    9e4 <malloc+0xde>
    }
    if(p == freep)
 9ac:	a1 00 0d 00 00       	mov    0xd00,%eax
 9b1:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 9b4:	75 1b                	jne    9d1 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 9b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9b9:	89 04 24             	mov    %eax,(%esp)
 9bc:	e8 ed fe ff ff       	call   8ae <morecore>
 9c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9c4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9c8:	75 07                	jne    9d1 <malloc+0xcb>
        return 0;
 9ca:	b8 00 00 00 00       	mov    $0x0,%eax
 9cf:	eb 13                	jmp    9e4 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d4:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9da:	8b 00                	mov    (%eax),%eax
 9dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 9df:	e9 70 ff ff ff       	jmp    954 <malloc+0x4e>
}
 9e4:	c9                   	leave  
 9e5:	c3                   	ret    
