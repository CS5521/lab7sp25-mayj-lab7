
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	81 ec 30 02 00 00    	sub    $0x230,%esp
  int fd, i;
  char path[] = "stressfs0";
   c:	c7 84 24 1e 02 00 00 	movl   $0x65727473,0x21e(%esp)
  13:	73 74 72 65 
  17:	c7 84 24 22 02 00 00 	movl   $0x73667373,0x222(%esp)
  1e:	73 73 66 73 
  22:	66 c7 84 24 26 02 00 	movw   $0x30,0x226(%esp)
  29:	00 30 00 
  char data[512];

  printf(1, "stressfs starting\n");
  2c:	c7 44 24 04 8a 0a 00 	movl   $0xa8a,0x4(%esp)
  33:	00 
  34:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  3b:	e8 7e 06 00 00       	call   6be <printf>
  memset(data, 'a', sizeof(data));
  40:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  47:	00 
  48:	c7 44 24 04 61 00 00 	movl   $0x61,0x4(%esp)
  4f:	00 
  50:	8d 44 24 1e          	lea    0x1e(%esp),%eax
  54:	89 04 24             	mov    %eax,(%esp)
  57:	e8 12 02 00 00       	call   26e <memset>

  for(i = 0; i < 4; i++)
  5c:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
  63:	00 00 00 00 
  67:	eb 13                	jmp    7c <main+0x7c>
    if(fork() > 0)
  69:	e8 b8 04 00 00       	call   526 <fork>
  6e:	85 c0                	test   %eax,%eax
  70:	7e 02                	jle    74 <main+0x74>
      break;
  72:	eb 12                	jmp    86 <main+0x86>
  for(i = 0; i < 4; i++)
  74:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
  7b:	01 
  7c:	83 bc 24 2c 02 00 00 	cmpl   $0x3,0x22c(%esp)
  83:	03 
  84:	7e e3                	jle    69 <main+0x69>

  printf(1, "write %d\n", i);
  86:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
  8d:	89 44 24 08          	mov    %eax,0x8(%esp)
  91:	c7 44 24 04 9d 0a 00 	movl   $0xa9d,0x4(%esp)
  98:	00 
  99:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a0:	e8 19 06 00 00       	call   6be <printf>

  path[8] += i;
  a5:	0f b6 84 24 26 02 00 	movzbl 0x226(%esp),%eax
  ac:	00 
  ad:	89 c2                	mov    %eax,%edx
  af:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
  b6:	01 d0                	add    %edx,%eax
  b8:	88 84 24 26 02 00 00 	mov    %al,0x226(%esp)
  fd = open(path, O_CREATE | O_RDWR);
  bf:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
  c6:	00 
  c7:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
  ce:	89 04 24             	mov    %eax,(%esp)
  d1:	e8 98 04 00 00       	call   56e <open>
  d6:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for(i = 0; i < 20; i++)
  dd:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
  e4:	00 00 00 00 
  e8:	eb 27                	jmp    111 <main+0x111>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  ea:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  f1:	00 
  f2:	8d 44 24 1e          	lea    0x1e(%esp),%eax
  f6:	89 44 24 04          	mov    %eax,0x4(%esp)
  fa:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 101:	89 04 24             	mov    %eax,(%esp)
 104:	e8 45 04 00 00       	call   54e <write>
  for(i = 0; i < 20; i++)
 109:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
 110:	01 
 111:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
 118:	13 
 119:	7e cf                	jle    ea <main+0xea>
  close(fd);
 11b:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 122:	89 04 24             	mov    %eax,(%esp)
 125:	e8 2c 04 00 00       	call   556 <close>

  printf(1, "read\n");
 12a:	c7 44 24 04 a7 0a 00 	movl   $0xaa7,0x4(%esp)
 131:	00 
 132:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 139:	e8 80 05 00 00       	call   6be <printf>

  fd = open(path, O_RDONLY);
 13e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 145:	00 
 146:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
 14d:	89 04 24             	mov    %eax,(%esp)
 150:	e8 19 04 00 00       	call   56e <open>
 155:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for (i = 0; i < 20; i++)
 15c:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
 163:	00 00 00 00 
 167:	eb 27                	jmp    190 <main+0x190>
    read(fd, data, sizeof(data));
 169:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
 170:	00 
 171:	8d 44 24 1e          	lea    0x1e(%esp),%eax
 175:	89 44 24 04          	mov    %eax,0x4(%esp)
 179:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 180:	89 04 24             	mov    %eax,(%esp)
 183:	e8 be 03 00 00       	call   546 <read>
  for (i = 0; i < 20; i++)
 188:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
 18f:	01 
 190:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
 197:	13 
 198:	7e cf                	jle    169 <main+0x169>
  close(fd);
 19a:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 1a1:	89 04 24             	mov    %eax,(%esp)
 1a4:	e8 ad 03 00 00       	call   556 <close>

  wait();
 1a9:	e8 88 03 00 00       	call   536 <wait>

  exit();
 1ae:	e8 7b 03 00 00       	call   52e <exit>

000001b3 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1b3:	55                   	push   %ebp
 1b4:	89 e5                	mov    %esp,%ebp
 1b6:	57                   	push   %edi
 1b7:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1b8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1bb:	8b 55 10             	mov    0x10(%ebp),%edx
 1be:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c1:	89 cb                	mov    %ecx,%ebx
 1c3:	89 df                	mov    %ebx,%edi
 1c5:	89 d1                	mov    %edx,%ecx
 1c7:	fc                   	cld    
 1c8:	f3 aa                	rep stos %al,%es:(%edi)
 1ca:	89 ca                	mov    %ecx,%edx
 1cc:	89 fb                	mov    %edi,%ebx
 1ce:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1d1:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1d4:	5b                   	pop    %ebx
 1d5:	5f                   	pop    %edi
 1d6:	5d                   	pop    %ebp
 1d7:	c3                   	ret    

000001d8 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 1d8:	55                   	push   %ebp
 1d9:	89 e5                	mov    %esp,%ebp
 1db:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1de:	8b 45 08             	mov    0x8(%ebp),%eax
 1e1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1e4:	90                   	nop
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
 1e8:	8d 50 01             	lea    0x1(%eax),%edx
 1eb:	89 55 08             	mov    %edx,0x8(%ebp)
 1ee:	8b 55 0c             	mov    0xc(%ebp),%edx
 1f1:	8d 4a 01             	lea    0x1(%edx),%ecx
 1f4:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 1f7:	0f b6 12             	movzbl (%edx),%edx
 1fa:	88 10                	mov    %dl,(%eax)
 1fc:	0f b6 00             	movzbl (%eax),%eax
 1ff:	84 c0                	test   %al,%al
 201:	75 e2                	jne    1e5 <strcpy+0xd>
    ;
  return os;
 203:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 206:	c9                   	leave  
 207:	c3                   	ret    

00000208 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 208:	55                   	push   %ebp
 209:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 20b:	eb 08                	jmp    215 <strcmp+0xd>
    p++, q++;
 20d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 211:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 215:	8b 45 08             	mov    0x8(%ebp),%eax
 218:	0f b6 00             	movzbl (%eax),%eax
 21b:	84 c0                	test   %al,%al
 21d:	74 10                	je     22f <strcmp+0x27>
 21f:	8b 45 08             	mov    0x8(%ebp),%eax
 222:	0f b6 10             	movzbl (%eax),%edx
 225:	8b 45 0c             	mov    0xc(%ebp),%eax
 228:	0f b6 00             	movzbl (%eax),%eax
 22b:	38 c2                	cmp    %al,%dl
 22d:	74 de                	je     20d <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 22f:	8b 45 08             	mov    0x8(%ebp),%eax
 232:	0f b6 00             	movzbl (%eax),%eax
 235:	0f b6 d0             	movzbl %al,%edx
 238:	8b 45 0c             	mov    0xc(%ebp),%eax
 23b:	0f b6 00             	movzbl (%eax),%eax
 23e:	0f b6 c0             	movzbl %al,%eax
 241:	29 c2                	sub    %eax,%edx
 243:	89 d0                	mov    %edx,%eax
}
 245:	5d                   	pop    %ebp
 246:	c3                   	ret    

00000247 <strlen>:

uint
strlen(const char *s)
{
 247:	55                   	push   %ebp
 248:	89 e5                	mov    %esp,%ebp
 24a:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 24d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 254:	eb 04                	jmp    25a <strlen+0x13>
 256:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 25a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 25d:	8b 45 08             	mov    0x8(%ebp),%eax
 260:	01 d0                	add    %edx,%eax
 262:	0f b6 00             	movzbl (%eax),%eax
 265:	84 c0                	test   %al,%al
 267:	75 ed                	jne    256 <strlen+0xf>
    ;
  return n;
 269:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 26c:	c9                   	leave  
 26d:	c3                   	ret    

0000026e <memset>:

void*
memset(void *dst, int c, uint n)
{
 26e:	55                   	push   %ebp
 26f:	89 e5                	mov    %esp,%ebp
 271:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 274:	8b 45 10             	mov    0x10(%ebp),%eax
 277:	89 44 24 08          	mov    %eax,0x8(%esp)
 27b:	8b 45 0c             	mov    0xc(%ebp),%eax
 27e:	89 44 24 04          	mov    %eax,0x4(%esp)
 282:	8b 45 08             	mov    0x8(%ebp),%eax
 285:	89 04 24             	mov    %eax,(%esp)
 288:	e8 26 ff ff ff       	call   1b3 <stosb>
  return dst;
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 290:	c9                   	leave  
 291:	c3                   	ret    

00000292 <strchr>:

char*
strchr(const char *s, char c)
{
 292:	55                   	push   %ebp
 293:	89 e5                	mov    %esp,%ebp
 295:	83 ec 04             	sub    $0x4,%esp
 298:	8b 45 0c             	mov    0xc(%ebp),%eax
 29b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 29e:	eb 14                	jmp    2b4 <strchr+0x22>
    if(*s == c)
 2a0:	8b 45 08             	mov    0x8(%ebp),%eax
 2a3:	0f b6 00             	movzbl (%eax),%eax
 2a6:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2a9:	75 05                	jne    2b0 <strchr+0x1e>
      return (char*)s;
 2ab:	8b 45 08             	mov    0x8(%ebp),%eax
 2ae:	eb 13                	jmp    2c3 <strchr+0x31>
  for(; *s; s++)
 2b0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2b4:	8b 45 08             	mov    0x8(%ebp),%eax
 2b7:	0f b6 00             	movzbl (%eax),%eax
 2ba:	84 c0                	test   %al,%al
 2bc:	75 e2                	jne    2a0 <strchr+0xe>
  return 0;
 2be:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2c3:	c9                   	leave  
 2c4:	c3                   	ret    

000002c5 <gets>:

char*
gets(char *buf, int max)
{
 2c5:	55                   	push   %ebp
 2c6:	89 e5                	mov    %esp,%ebp
 2c8:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2cb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2d2:	eb 4c                	jmp    320 <gets+0x5b>
    cc = read(0, &c, 1);
 2d4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2db:	00 
 2dc:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2df:	89 44 24 04          	mov    %eax,0x4(%esp)
 2e3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2ea:	e8 57 02 00 00       	call   546 <read>
 2ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 2f2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2f6:	7f 02                	jg     2fa <gets+0x35>
      break;
 2f8:	eb 31                	jmp    32b <gets+0x66>
    buf[i++] = c;
 2fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2fd:	8d 50 01             	lea    0x1(%eax),%edx
 300:	89 55 f4             	mov    %edx,-0xc(%ebp)
 303:	89 c2                	mov    %eax,%edx
 305:	8b 45 08             	mov    0x8(%ebp),%eax
 308:	01 c2                	add    %eax,%edx
 30a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 30e:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 310:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 314:	3c 0a                	cmp    $0xa,%al
 316:	74 13                	je     32b <gets+0x66>
 318:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 31c:	3c 0d                	cmp    $0xd,%al
 31e:	74 0b                	je     32b <gets+0x66>
  for(i=0; i+1 < max; ){
 320:	8b 45 f4             	mov    -0xc(%ebp),%eax
 323:	83 c0 01             	add    $0x1,%eax
 326:	3b 45 0c             	cmp    0xc(%ebp),%eax
 329:	7c a9                	jl     2d4 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 32b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 32e:	8b 45 08             	mov    0x8(%ebp),%eax
 331:	01 d0                	add    %edx,%eax
 333:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 336:	8b 45 08             	mov    0x8(%ebp),%eax
}
 339:	c9                   	leave  
 33a:	c3                   	ret    

0000033b <stat>:

int
stat(const char *n, struct stat *st)
{
 33b:	55                   	push   %ebp
 33c:	89 e5                	mov    %esp,%ebp
 33e:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 341:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 348:	00 
 349:	8b 45 08             	mov    0x8(%ebp),%eax
 34c:	89 04 24             	mov    %eax,(%esp)
 34f:	e8 1a 02 00 00       	call   56e <open>
 354:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 357:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 35b:	79 07                	jns    364 <stat+0x29>
    return -1;
 35d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 362:	eb 23                	jmp    387 <stat+0x4c>
  r = fstat(fd, st);
 364:	8b 45 0c             	mov    0xc(%ebp),%eax
 367:	89 44 24 04          	mov    %eax,0x4(%esp)
 36b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 36e:	89 04 24             	mov    %eax,(%esp)
 371:	e8 10 02 00 00       	call   586 <fstat>
 376:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 379:	8b 45 f4             	mov    -0xc(%ebp),%eax
 37c:	89 04 24             	mov    %eax,(%esp)
 37f:	e8 d2 01 00 00       	call   556 <close>
  return r;
 384:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 387:	c9                   	leave  
 388:	c3                   	ret    

00000389 <atoi>:

int
atoi(const char *s)
{
 389:	55                   	push   %ebp
 38a:	89 e5                	mov    %esp,%ebp
 38c:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 38f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 396:	eb 25                	jmp    3bd <atoi+0x34>
    n = n*10 + *s++ - '0';
 398:	8b 55 fc             	mov    -0x4(%ebp),%edx
 39b:	89 d0                	mov    %edx,%eax
 39d:	c1 e0 02             	shl    $0x2,%eax
 3a0:	01 d0                	add    %edx,%eax
 3a2:	01 c0                	add    %eax,%eax
 3a4:	89 c1                	mov    %eax,%ecx
 3a6:	8b 45 08             	mov    0x8(%ebp),%eax
 3a9:	8d 50 01             	lea    0x1(%eax),%edx
 3ac:	89 55 08             	mov    %edx,0x8(%ebp)
 3af:	0f b6 00             	movzbl (%eax),%eax
 3b2:	0f be c0             	movsbl %al,%eax
 3b5:	01 c8                	add    %ecx,%eax
 3b7:	83 e8 30             	sub    $0x30,%eax
 3ba:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3bd:	8b 45 08             	mov    0x8(%ebp),%eax
 3c0:	0f b6 00             	movzbl (%eax),%eax
 3c3:	3c 2f                	cmp    $0x2f,%al
 3c5:	7e 0a                	jle    3d1 <atoi+0x48>
 3c7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ca:	0f b6 00             	movzbl (%eax),%eax
 3cd:	3c 39                	cmp    $0x39,%al
 3cf:	7e c7                	jle    398 <atoi+0xf>
  return n;
 3d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3d4:	c9                   	leave  
 3d5:	c3                   	ret    

000003d6 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3d6:	55                   	push   %ebp
 3d7:	89 e5                	mov    %esp,%ebp
 3d9:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 3dc:	8b 45 08             	mov    0x8(%ebp),%eax
 3df:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 3e2:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 3e8:	eb 17                	jmp    401 <memmove+0x2b>
    *dst++ = *src++;
 3ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3ed:	8d 50 01             	lea    0x1(%eax),%edx
 3f0:	89 55 fc             	mov    %edx,-0x4(%ebp)
 3f3:	8b 55 f8             	mov    -0x8(%ebp),%edx
 3f6:	8d 4a 01             	lea    0x1(%edx),%ecx
 3f9:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 3fc:	0f b6 12             	movzbl (%edx),%edx
 3ff:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 401:	8b 45 10             	mov    0x10(%ebp),%eax
 404:	8d 50 ff             	lea    -0x1(%eax),%edx
 407:	89 55 10             	mov    %edx,0x10(%ebp)
 40a:	85 c0                	test   %eax,%eax
 40c:	7f dc                	jg     3ea <memmove+0x14>
  return vdst;
 40e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 411:	c9                   	leave  
 412:	c3                   	ret    

00000413 <ps>:

void
ps() {
 413:	55                   	push   %ebp
 414:	89 e5                	mov    %esp,%ebp
 416:	57                   	push   %edi
 417:	56                   	push   %esi
 418:	53                   	push   %ebx
 419:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  int i = 0;
 41f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  printf(1, "PID	TKTS	TCKS	STAT	NAME\n");
 426:	c7 44 24 04 ad 0a 00 	movl   $0xaad,0x4(%esp)
 42d:	00 
 42e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 435:	e8 84 02 00 00       	call   6be <printf>
  getpinfo(&pstat);
 43a:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 440:	89 04 24             	mov    %eax,(%esp)
 443:	e8 86 01 00 00       	call   5ce <getpinfo>
  while (pstat[i].pid != 0) {
 448:	e9 ad 00 00 00       	jmp    4fa <ps+0xe7>
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
	pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 44d:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 453:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 456:	89 d0                	mov    %edx,%eax
 458:	c1 e0 03             	shl    $0x3,%eax
 45b:	01 d0                	add    %edx,%eax
 45d:	c1 e0 02             	shl    $0x2,%eax
 460:	83 c0 10             	add    $0x10,%eax
 463:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 466:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 469:	89 d0                	mov    %edx,%eax
 46b:	c1 e0 03             	shl    $0x3,%eax
 46e:	01 d0                	add    %edx,%eax
 470:	c1 e0 02             	shl    $0x2,%eax
 473:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 476:	01 d8                	add    %ebx,%eax
 478:	2d e4 08 00 00       	sub    $0x8e4,%eax
 47d:	0f b6 00             	movzbl (%eax),%eax
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
 480:	0f be f0             	movsbl %al,%esi
 483:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 486:	89 d0                	mov    %edx,%eax
 488:	c1 e0 03             	shl    $0x3,%eax
 48b:	01 d0                	add    %edx,%eax
 48d:	c1 e0 02             	shl    $0x2,%eax
 490:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 493:	01 c8                	add    %ecx,%eax
 495:	2d f8 08 00 00       	sub    $0x8f8,%eax
 49a:	8b 18                	mov    (%eax),%ebx
 49c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 49f:	89 d0                	mov    %edx,%eax
 4a1:	c1 e0 03             	shl    $0x3,%eax
 4a4:	01 d0                	add    %edx,%eax
 4a6:	c1 e0 02             	shl    $0x2,%eax
 4a9:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 4ac:	01 c8                	add    %ecx,%eax
 4ae:	2d 00 09 00 00       	sub    $0x900,%eax
 4b3:	8b 08                	mov    (%eax),%ecx
 4b5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 4b8:	89 d0                	mov    %edx,%eax
 4ba:	c1 e0 03             	shl    $0x3,%eax
 4bd:	01 d0                	add    %edx,%eax
 4bf:	c1 e0 02             	shl    $0x2,%eax
 4c2:	8d 55 e8             	lea    -0x18(%ebp),%edx
 4c5:	01 d0                	add    %edx,%eax
 4c7:	2d fc 08 00 00       	sub    $0x8fc,%eax
 4cc:	8b 00                	mov    (%eax),%eax
 4ce:	89 7c 24 18          	mov    %edi,0x18(%esp)
 4d2:	89 74 24 14          	mov    %esi,0x14(%esp)
 4d6:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 4da:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 4de:	89 44 24 08          	mov    %eax,0x8(%esp)
 4e2:	c7 44 24 04 c6 0a 00 	movl   $0xac6,0x4(%esp)
 4e9:	00 
 4ea:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4f1:	e8 c8 01 00 00       	call   6be <printf>
      i++;
 4f6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  while (pstat[i].pid != 0) {
 4fa:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 4fd:	89 d0                	mov    %edx,%eax
 4ff:	c1 e0 03             	shl    $0x3,%eax
 502:	01 d0                	add    %edx,%eax
 504:	c1 e0 02             	shl    $0x2,%eax
 507:	8d 75 e8             	lea    -0x18(%ebp),%esi
 50a:	01 f0                	add    %esi,%eax
 50c:	2d fc 08 00 00       	sub    $0x8fc,%eax
 511:	8b 00                	mov    (%eax),%eax
 513:	85 c0                	test   %eax,%eax
 515:	0f 85 32 ff ff ff    	jne    44d <ps+0x3a>
  }
}
 51b:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 521:	5b                   	pop    %ebx
 522:	5e                   	pop    %esi
 523:	5f                   	pop    %edi
 524:	5d                   	pop    %ebp
 525:	c3                   	ret    

00000526 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 526:	b8 01 00 00 00       	mov    $0x1,%eax
 52b:	cd 40                	int    $0x40
 52d:	c3                   	ret    

0000052e <exit>:
SYSCALL(exit)
 52e:	b8 02 00 00 00       	mov    $0x2,%eax
 533:	cd 40                	int    $0x40
 535:	c3                   	ret    

00000536 <wait>:
SYSCALL(wait)
 536:	b8 03 00 00 00       	mov    $0x3,%eax
 53b:	cd 40                	int    $0x40
 53d:	c3                   	ret    

0000053e <pipe>:
SYSCALL(pipe)
 53e:	b8 04 00 00 00       	mov    $0x4,%eax
 543:	cd 40                	int    $0x40
 545:	c3                   	ret    

00000546 <read>:
SYSCALL(read)
 546:	b8 05 00 00 00       	mov    $0x5,%eax
 54b:	cd 40                	int    $0x40
 54d:	c3                   	ret    

0000054e <write>:
SYSCALL(write)
 54e:	b8 10 00 00 00       	mov    $0x10,%eax
 553:	cd 40                	int    $0x40
 555:	c3                   	ret    

00000556 <close>:
SYSCALL(close)
 556:	b8 15 00 00 00       	mov    $0x15,%eax
 55b:	cd 40                	int    $0x40
 55d:	c3                   	ret    

0000055e <kill>:
SYSCALL(kill)
 55e:	b8 06 00 00 00       	mov    $0x6,%eax
 563:	cd 40                	int    $0x40
 565:	c3                   	ret    

00000566 <exec>:
SYSCALL(exec)
 566:	b8 07 00 00 00       	mov    $0x7,%eax
 56b:	cd 40                	int    $0x40
 56d:	c3                   	ret    

0000056e <open>:
SYSCALL(open)
 56e:	b8 0f 00 00 00       	mov    $0xf,%eax
 573:	cd 40                	int    $0x40
 575:	c3                   	ret    

00000576 <mknod>:
SYSCALL(mknod)
 576:	b8 11 00 00 00       	mov    $0x11,%eax
 57b:	cd 40                	int    $0x40
 57d:	c3                   	ret    

0000057e <unlink>:
SYSCALL(unlink)
 57e:	b8 12 00 00 00       	mov    $0x12,%eax
 583:	cd 40                	int    $0x40
 585:	c3                   	ret    

00000586 <fstat>:
SYSCALL(fstat)
 586:	b8 08 00 00 00       	mov    $0x8,%eax
 58b:	cd 40                	int    $0x40
 58d:	c3                   	ret    

0000058e <link>:
SYSCALL(link)
 58e:	b8 13 00 00 00       	mov    $0x13,%eax
 593:	cd 40                	int    $0x40
 595:	c3                   	ret    

00000596 <mkdir>:
SYSCALL(mkdir)
 596:	b8 14 00 00 00       	mov    $0x14,%eax
 59b:	cd 40                	int    $0x40
 59d:	c3                   	ret    

0000059e <chdir>:
SYSCALL(chdir)
 59e:	b8 09 00 00 00       	mov    $0x9,%eax
 5a3:	cd 40                	int    $0x40
 5a5:	c3                   	ret    

000005a6 <dup>:
SYSCALL(dup)
 5a6:	b8 0a 00 00 00       	mov    $0xa,%eax
 5ab:	cd 40                	int    $0x40
 5ad:	c3                   	ret    

000005ae <getpid>:
SYSCALL(getpid)
 5ae:	b8 0b 00 00 00       	mov    $0xb,%eax
 5b3:	cd 40                	int    $0x40
 5b5:	c3                   	ret    

000005b6 <sbrk>:
SYSCALL(sbrk)
 5b6:	b8 0c 00 00 00       	mov    $0xc,%eax
 5bb:	cd 40                	int    $0x40
 5bd:	c3                   	ret    

000005be <sleep>:
SYSCALL(sleep)
 5be:	b8 0d 00 00 00       	mov    $0xd,%eax
 5c3:	cd 40                	int    $0x40
 5c5:	c3                   	ret    

000005c6 <uptime>:
SYSCALL(uptime)
 5c6:	b8 0e 00 00 00       	mov    $0xe,%eax
 5cb:	cd 40                	int    $0x40
 5cd:	c3                   	ret    

000005ce <getpinfo>:
SYSCALL(getpinfo)
 5ce:	b8 16 00 00 00       	mov    $0x16,%eax
 5d3:	cd 40                	int    $0x40
 5d5:	c3                   	ret    

000005d6 <settickets>:
SYSCALL(settickets)
 5d6:	b8 17 00 00 00       	mov    $0x17,%eax
 5db:	cd 40                	int    $0x40
 5dd:	c3                   	ret    

000005de <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5de:	55                   	push   %ebp
 5df:	89 e5                	mov    %esp,%ebp
 5e1:	83 ec 18             	sub    $0x18,%esp
 5e4:	8b 45 0c             	mov    0xc(%ebp),%eax
 5e7:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 5ea:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5f1:	00 
 5f2:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5f5:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f9:	8b 45 08             	mov    0x8(%ebp),%eax
 5fc:	89 04 24             	mov    %eax,(%esp)
 5ff:	e8 4a ff ff ff       	call   54e <write>
}
 604:	c9                   	leave  
 605:	c3                   	ret    

00000606 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 606:	55                   	push   %ebp
 607:	89 e5                	mov    %esp,%ebp
 609:	56                   	push   %esi
 60a:	53                   	push   %ebx
 60b:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 60e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 615:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 619:	74 17                	je     632 <printint+0x2c>
 61b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 61f:	79 11                	jns    632 <printint+0x2c>
    neg = 1;
 621:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 628:	8b 45 0c             	mov    0xc(%ebp),%eax
 62b:	f7 d8                	neg    %eax
 62d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 630:	eb 06                	jmp    638 <printint+0x32>
  } else {
    x = xx;
 632:	8b 45 0c             	mov    0xc(%ebp),%eax
 635:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 638:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 63f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 642:	8d 41 01             	lea    0x1(%ecx),%eax
 645:	89 45 f4             	mov    %eax,-0xc(%ebp)
 648:	8b 5d 10             	mov    0x10(%ebp),%ebx
 64b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 64e:	ba 00 00 00 00       	mov    $0x0,%edx
 653:	f7 f3                	div    %ebx
 655:	89 d0                	mov    %edx,%eax
 657:	0f b6 80 54 0d 00 00 	movzbl 0xd54(%eax),%eax
 65e:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 662:	8b 75 10             	mov    0x10(%ebp),%esi
 665:	8b 45 ec             	mov    -0x14(%ebp),%eax
 668:	ba 00 00 00 00       	mov    $0x0,%edx
 66d:	f7 f6                	div    %esi
 66f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 672:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 676:	75 c7                	jne    63f <printint+0x39>
  if(neg)
 678:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 67c:	74 10                	je     68e <printint+0x88>
    buf[i++] = '-';
 67e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 681:	8d 50 01             	lea    0x1(%eax),%edx
 684:	89 55 f4             	mov    %edx,-0xc(%ebp)
 687:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 68c:	eb 1f                	jmp    6ad <printint+0xa7>
 68e:	eb 1d                	jmp    6ad <printint+0xa7>
    putc(fd, buf[i]);
 690:	8d 55 dc             	lea    -0x24(%ebp),%edx
 693:	8b 45 f4             	mov    -0xc(%ebp),%eax
 696:	01 d0                	add    %edx,%eax
 698:	0f b6 00             	movzbl (%eax),%eax
 69b:	0f be c0             	movsbl %al,%eax
 69e:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a2:	8b 45 08             	mov    0x8(%ebp),%eax
 6a5:	89 04 24             	mov    %eax,(%esp)
 6a8:	e8 31 ff ff ff       	call   5de <putc>
  while(--i >= 0)
 6ad:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 6b1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6b5:	79 d9                	jns    690 <printint+0x8a>
}
 6b7:	83 c4 30             	add    $0x30,%esp
 6ba:	5b                   	pop    %ebx
 6bb:	5e                   	pop    %esi
 6bc:	5d                   	pop    %ebp
 6bd:	c3                   	ret    

000006be <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6be:	55                   	push   %ebp
 6bf:	89 e5                	mov    %esp,%ebp
 6c1:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 6c4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 6cb:	8d 45 0c             	lea    0xc(%ebp),%eax
 6ce:	83 c0 04             	add    $0x4,%eax
 6d1:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 6d4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 6db:	e9 7c 01 00 00       	jmp    85c <printf+0x19e>
    c = fmt[i] & 0xff;
 6e0:	8b 55 0c             	mov    0xc(%ebp),%edx
 6e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6e6:	01 d0                	add    %edx,%eax
 6e8:	0f b6 00             	movzbl (%eax),%eax
 6eb:	0f be c0             	movsbl %al,%eax
 6ee:	25 ff 00 00 00       	and    $0xff,%eax
 6f3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 6f6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6fa:	75 2c                	jne    728 <printf+0x6a>
      if(c == '%'){
 6fc:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 700:	75 0c                	jne    70e <printf+0x50>
        state = '%';
 702:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 709:	e9 4a 01 00 00       	jmp    858 <printf+0x19a>
      } else {
        putc(fd, c);
 70e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 711:	0f be c0             	movsbl %al,%eax
 714:	89 44 24 04          	mov    %eax,0x4(%esp)
 718:	8b 45 08             	mov    0x8(%ebp),%eax
 71b:	89 04 24             	mov    %eax,(%esp)
 71e:	e8 bb fe ff ff       	call   5de <putc>
 723:	e9 30 01 00 00       	jmp    858 <printf+0x19a>
      }
    } else if(state == '%'){
 728:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 72c:	0f 85 26 01 00 00    	jne    858 <printf+0x19a>
      if(c == 'd'){
 732:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 736:	75 2d                	jne    765 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 738:	8b 45 e8             	mov    -0x18(%ebp),%eax
 73b:	8b 00                	mov    (%eax),%eax
 73d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 744:	00 
 745:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 74c:	00 
 74d:	89 44 24 04          	mov    %eax,0x4(%esp)
 751:	8b 45 08             	mov    0x8(%ebp),%eax
 754:	89 04 24             	mov    %eax,(%esp)
 757:	e8 aa fe ff ff       	call   606 <printint>
        ap++;
 75c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 760:	e9 ec 00 00 00       	jmp    851 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 765:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 769:	74 06                	je     771 <printf+0xb3>
 76b:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 76f:	75 2d                	jne    79e <printf+0xe0>
        printint(fd, *ap, 16, 0);
 771:	8b 45 e8             	mov    -0x18(%ebp),%eax
 774:	8b 00                	mov    (%eax),%eax
 776:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 77d:	00 
 77e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 785:	00 
 786:	89 44 24 04          	mov    %eax,0x4(%esp)
 78a:	8b 45 08             	mov    0x8(%ebp),%eax
 78d:	89 04 24             	mov    %eax,(%esp)
 790:	e8 71 fe ff ff       	call   606 <printint>
        ap++;
 795:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 799:	e9 b3 00 00 00       	jmp    851 <printf+0x193>
      } else if(c == 's'){
 79e:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 7a2:	75 45                	jne    7e9 <printf+0x12b>
        s = (char*)*ap;
 7a4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7a7:	8b 00                	mov    (%eax),%eax
 7a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 7ac:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 7b0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7b4:	75 09                	jne    7bf <printf+0x101>
          s = "(null)";
 7b6:	c7 45 f4 d6 0a 00 00 	movl   $0xad6,-0xc(%ebp)
        while(*s != 0){
 7bd:	eb 1e                	jmp    7dd <printf+0x11f>
 7bf:	eb 1c                	jmp    7dd <printf+0x11f>
          putc(fd, *s);
 7c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c4:	0f b6 00             	movzbl (%eax),%eax
 7c7:	0f be c0             	movsbl %al,%eax
 7ca:	89 44 24 04          	mov    %eax,0x4(%esp)
 7ce:	8b 45 08             	mov    0x8(%ebp),%eax
 7d1:	89 04 24             	mov    %eax,(%esp)
 7d4:	e8 05 fe ff ff       	call   5de <putc>
          s++;
 7d9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 7dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e0:	0f b6 00             	movzbl (%eax),%eax
 7e3:	84 c0                	test   %al,%al
 7e5:	75 da                	jne    7c1 <printf+0x103>
 7e7:	eb 68                	jmp    851 <printf+0x193>
        }
      } else if(c == 'c'){
 7e9:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 7ed:	75 1d                	jne    80c <printf+0x14e>
        putc(fd, *ap);
 7ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7f2:	8b 00                	mov    (%eax),%eax
 7f4:	0f be c0             	movsbl %al,%eax
 7f7:	89 44 24 04          	mov    %eax,0x4(%esp)
 7fb:	8b 45 08             	mov    0x8(%ebp),%eax
 7fe:	89 04 24             	mov    %eax,(%esp)
 801:	e8 d8 fd ff ff       	call   5de <putc>
        ap++;
 806:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 80a:	eb 45                	jmp    851 <printf+0x193>
      } else if(c == '%'){
 80c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 810:	75 17                	jne    829 <printf+0x16b>
        putc(fd, c);
 812:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 815:	0f be c0             	movsbl %al,%eax
 818:	89 44 24 04          	mov    %eax,0x4(%esp)
 81c:	8b 45 08             	mov    0x8(%ebp),%eax
 81f:	89 04 24             	mov    %eax,(%esp)
 822:	e8 b7 fd ff ff       	call   5de <putc>
 827:	eb 28                	jmp    851 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 829:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 830:	00 
 831:	8b 45 08             	mov    0x8(%ebp),%eax
 834:	89 04 24             	mov    %eax,(%esp)
 837:	e8 a2 fd ff ff       	call   5de <putc>
        putc(fd, c);
 83c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 83f:	0f be c0             	movsbl %al,%eax
 842:	89 44 24 04          	mov    %eax,0x4(%esp)
 846:	8b 45 08             	mov    0x8(%ebp),%eax
 849:	89 04 24             	mov    %eax,(%esp)
 84c:	e8 8d fd ff ff       	call   5de <putc>
      }
      state = 0;
 851:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 858:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 85c:	8b 55 0c             	mov    0xc(%ebp),%edx
 85f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 862:	01 d0                	add    %edx,%eax
 864:	0f b6 00             	movzbl (%eax),%eax
 867:	84 c0                	test   %al,%al
 869:	0f 85 71 fe ff ff    	jne    6e0 <printf+0x22>
    }
  }
}
 86f:	c9                   	leave  
 870:	c3                   	ret    

00000871 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 871:	55                   	push   %ebp
 872:	89 e5                	mov    %esp,%ebp
 874:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 877:	8b 45 08             	mov    0x8(%ebp),%eax
 87a:	83 e8 08             	sub    $0x8,%eax
 87d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 880:	a1 70 0d 00 00       	mov    0xd70,%eax
 885:	89 45 fc             	mov    %eax,-0x4(%ebp)
 888:	eb 24                	jmp    8ae <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 88a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 88d:	8b 00                	mov    (%eax),%eax
 88f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 892:	77 12                	ja     8a6 <free+0x35>
 894:	8b 45 f8             	mov    -0x8(%ebp),%eax
 897:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 89a:	77 24                	ja     8c0 <free+0x4f>
 89c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 89f:	8b 00                	mov    (%eax),%eax
 8a1:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8a4:	77 1a                	ja     8c0 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a9:	8b 00                	mov    (%eax),%eax
 8ab:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8ae:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8b1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8b4:	76 d4                	jbe    88a <free+0x19>
 8b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b9:	8b 00                	mov    (%eax),%eax
 8bb:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8be:	76 ca                	jbe    88a <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8c0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8c3:	8b 40 04             	mov    0x4(%eax),%eax
 8c6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8cd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8d0:	01 c2                	add    %eax,%edx
 8d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d5:	8b 00                	mov    (%eax),%eax
 8d7:	39 c2                	cmp    %eax,%edx
 8d9:	75 24                	jne    8ff <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 8db:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8de:	8b 50 04             	mov    0x4(%eax),%edx
 8e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e4:	8b 00                	mov    (%eax),%eax
 8e6:	8b 40 04             	mov    0x4(%eax),%eax
 8e9:	01 c2                	add    %eax,%edx
 8eb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8ee:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 8f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f4:	8b 00                	mov    (%eax),%eax
 8f6:	8b 10                	mov    (%eax),%edx
 8f8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8fb:	89 10                	mov    %edx,(%eax)
 8fd:	eb 0a                	jmp    909 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 8ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
 902:	8b 10                	mov    (%eax),%edx
 904:	8b 45 f8             	mov    -0x8(%ebp),%eax
 907:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 909:	8b 45 fc             	mov    -0x4(%ebp),%eax
 90c:	8b 40 04             	mov    0x4(%eax),%eax
 90f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 916:	8b 45 fc             	mov    -0x4(%ebp),%eax
 919:	01 d0                	add    %edx,%eax
 91b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 91e:	75 20                	jne    940 <free+0xcf>
    p->s.size += bp->s.size;
 920:	8b 45 fc             	mov    -0x4(%ebp),%eax
 923:	8b 50 04             	mov    0x4(%eax),%edx
 926:	8b 45 f8             	mov    -0x8(%ebp),%eax
 929:	8b 40 04             	mov    0x4(%eax),%eax
 92c:	01 c2                	add    %eax,%edx
 92e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 931:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 934:	8b 45 f8             	mov    -0x8(%ebp),%eax
 937:	8b 10                	mov    (%eax),%edx
 939:	8b 45 fc             	mov    -0x4(%ebp),%eax
 93c:	89 10                	mov    %edx,(%eax)
 93e:	eb 08                	jmp    948 <free+0xd7>
  } else
    p->s.ptr = bp;
 940:	8b 45 fc             	mov    -0x4(%ebp),%eax
 943:	8b 55 f8             	mov    -0x8(%ebp),%edx
 946:	89 10                	mov    %edx,(%eax)
  freep = p;
 948:	8b 45 fc             	mov    -0x4(%ebp),%eax
 94b:	a3 70 0d 00 00       	mov    %eax,0xd70
}
 950:	c9                   	leave  
 951:	c3                   	ret    

00000952 <morecore>:

static Header*
morecore(uint nu)
{
 952:	55                   	push   %ebp
 953:	89 e5                	mov    %esp,%ebp
 955:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 958:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 95f:	77 07                	ja     968 <morecore+0x16>
    nu = 4096;
 961:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 968:	8b 45 08             	mov    0x8(%ebp),%eax
 96b:	c1 e0 03             	shl    $0x3,%eax
 96e:	89 04 24             	mov    %eax,(%esp)
 971:	e8 40 fc ff ff       	call   5b6 <sbrk>
 976:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 979:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 97d:	75 07                	jne    986 <morecore+0x34>
    return 0;
 97f:	b8 00 00 00 00       	mov    $0x0,%eax
 984:	eb 22                	jmp    9a8 <morecore+0x56>
  hp = (Header*)p;
 986:	8b 45 f4             	mov    -0xc(%ebp),%eax
 989:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 98c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 98f:	8b 55 08             	mov    0x8(%ebp),%edx
 992:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 995:	8b 45 f0             	mov    -0x10(%ebp),%eax
 998:	83 c0 08             	add    $0x8,%eax
 99b:	89 04 24             	mov    %eax,(%esp)
 99e:	e8 ce fe ff ff       	call   871 <free>
  return freep;
 9a3:	a1 70 0d 00 00       	mov    0xd70,%eax
}
 9a8:	c9                   	leave  
 9a9:	c3                   	ret    

000009aa <malloc>:

void*
malloc(uint nbytes)
{
 9aa:	55                   	push   %ebp
 9ab:	89 e5                	mov    %esp,%ebp
 9ad:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9b0:	8b 45 08             	mov    0x8(%ebp),%eax
 9b3:	83 c0 07             	add    $0x7,%eax
 9b6:	c1 e8 03             	shr    $0x3,%eax
 9b9:	83 c0 01             	add    $0x1,%eax
 9bc:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 9bf:	a1 70 0d 00 00       	mov    0xd70,%eax
 9c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9c7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 9cb:	75 23                	jne    9f0 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 9cd:	c7 45 f0 68 0d 00 00 	movl   $0xd68,-0x10(%ebp)
 9d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9d7:	a3 70 0d 00 00       	mov    %eax,0xd70
 9dc:	a1 70 0d 00 00       	mov    0xd70,%eax
 9e1:	a3 68 0d 00 00       	mov    %eax,0xd68
    base.s.size = 0;
 9e6:	c7 05 6c 0d 00 00 00 	movl   $0x0,0xd6c
 9ed:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9f3:	8b 00                	mov    (%eax),%eax
 9f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 9f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9fb:	8b 40 04             	mov    0x4(%eax),%eax
 9fe:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a01:	72 4d                	jb     a50 <malloc+0xa6>
      if(p->s.size == nunits)
 a03:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a06:	8b 40 04             	mov    0x4(%eax),%eax
 a09:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a0c:	75 0c                	jne    a1a <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a11:	8b 10                	mov    (%eax),%edx
 a13:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a16:	89 10                	mov    %edx,(%eax)
 a18:	eb 26                	jmp    a40 <malloc+0x96>
      else {
        p->s.size -= nunits;
 a1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a1d:	8b 40 04             	mov    0x4(%eax),%eax
 a20:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a23:	89 c2                	mov    %eax,%edx
 a25:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a28:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a2e:	8b 40 04             	mov    0x4(%eax),%eax
 a31:	c1 e0 03             	shl    $0x3,%eax
 a34:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a37:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a3a:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a3d:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a40:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a43:	a3 70 0d 00 00       	mov    %eax,0xd70
      return (void*)(p + 1);
 a48:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a4b:	83 c0 08             	add    $0x8,%eax
 a4e:	eb 38                	jmp    a88 <malloc+0xde>
    }
    if(p == freep)
 a50:	a1 70 0d 00 00       	mov    0xd70,%eax
 a55:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a58:	75 1b                	jne    a75 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 a5a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a5d:	89 04 24             	mov    %eax,(%esp)
 a60:	e8 ed fe ff ff       	call   952 <morecore>
 a65:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a68:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a6c:	75 07                	jne    a75 <malloc+0xcb>
        return 0;
 a6e:	b8 00 00 00 00       	mov    $0x0,%eax
 a73:	eb 13                	jmp    a88 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a75:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a78:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a7e:	8b 00                	mov    (%eax),%eax
 a80:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 a83:	e9 70 ff ff ff       	jmp    9f8 <malloc+0x4e>
}
 a88:	c9                   	leave  
 a89:	c3                   	ret    
