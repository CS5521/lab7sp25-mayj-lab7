
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
   6:	eb 39                	jmp    41 <cat+0x41>
    if (write(1, buf, n) != n) {
   8:	8b 45 f4             	mov    -0xc(%ebp),%eax
   b:	89 44 24 08          	mov    %eax,0x8(%esp)
   f:	c7 44 24 04 60 0d 00 	movl   $0xd60,0x4(%esp)
  16:	00 
  17:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1e:	e8 b3 04 00 00       	call   4d6 <write>
  23:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  26:	74 19                	je     41 <cat+0x41>
      printf(1, "cat: write error\n");
  28:	c7 44 24 04 12 0a 00 	movl   $0xa12,0x4(%esp)
  2f:	00 
  30:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  37:	e8 0a 06 00 00       	call   646 <printf>
      exit();
  3c:	e8 75 04 00 00       	call   4b6 <exit>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  41:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  48:	00 
  49:	c7 44 24 04 60 0d 00 	movl   $0xd60,0x4(%esp)
  50:	00 
  51:	8b 45 08             	mov    0x8(%ebp),%eax
  54:	89 04 24             	mov    %eax,(%esp)
  57:	e8 72 04 00 00       	call   4ce <read>
  5c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  5f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  63:	7f a3                	jg     8 <cat+0x8>
    }
  }
  if(n < 0){
  65:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  69:	79 19                	jns    84 <cat+0x84>
    printf(1, "cat: read error\n");
  6b:	c7 44 24 04 24 0a 00 	movl   $0xa24,0x4(%esp)
  72:	00 
  73:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7a:	e8 c7 05 00 00       	call   646 <printf>
    exit();
  7f:	e8 32 04 00 00       	call   4b6 <exit>
  }
}
  84:	c9                   	leave  
  85:	c3                   	ret    

00000086 <main>:

int
main(int argc, char *argv[])
{
  86:	55                   	push   %ebp
  87:	89 e5                	mov    %esp,%ebp
  89:	83 e4 f0             	and    $0xfffffff0,%esp
  8c:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
  8f:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  93:	7f 11                	jg     a6 <main+0x20>
    cat(0);
  95:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  9c:	e8 5f ff ff ff       	call   0 <cat>
    exit();
  a1:	e8 10 04 00 00       	call   4b6 <exit>
  }

  for(i = 1; i < argc; i++){
  a6:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  ad:	00 
  ae:	eb 79                	jmp    129 <main+0xa3>
    if((fd = open(argv[i], 0)) < 0){
  b0:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  b4:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  be:	01 d0                	add    %edx,%eax
  c0:	8b 00                	mov    (%eax),%eax
  c2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  c9:	00 
  ca:	89 04 24             	mov    %eax,(%esp)
  cd:	e8 24 04 00 00       	call   4f6 <open>
  d2:	89 44 24 18          	mov    %eax,0x18(%esp)
  d6:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  db:	79 2f                	jns    10c <main+0x86>
      printf(1, "cat: cannot open %s\n", argv[i]);
  dd:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  e1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  e8:	8b 45 0c             	mov    0xc(%ebp),%eax
  eb:	01 d0                	add    %edx,%eax
  ed:	8b 00                	mov    (%eax),%eax
  ef:	89 44 24 08          	mov    %eax,0x8(%esp)
  f3:	c7 44 24 04 35 0a 00 	movl   $0xa35,0x4(%esp)
  fa:	00 
  fb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 102:	e8 3f 05 00 00       	call   646 <printf>
      exit();
 107:	e8 aa 03 00 00       	call   4b6 <exit>
    }
    cat(fd);
 10c:	8b 44 24 18          	mov    0x18(%esp),%eax
 110:	89 04 24             	mov    %eax,(%esp)
 113:	e8 e8 fe ff ff       	call   0 <cat>
    close(fd);
 118:	8b 44 24 18          	mov    0x18(%esp),%eax
 11c:	89 04 24             	mov    %eax,(%esp)
 11f:	e8 ba 03 00 00       	call   4de <close>
  for(i = 1; i < argc; i++){
 124:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 129:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 12d:	3b 45 08             	cmp    0x8(%ebp),%eax
 130:	0f 8c 7a ff ff ff    	jl     b0 <main+0x2a>
  }
  exit();
 136:	e8 7b 03 00 00       	call   4b6 <exit>

0000013b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 13b:	55                   	push   %ebp
 13c:	89 e5                	mov    %esp,%ebp
 13e:	57                   	push   %edi
 13f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 140:	8b 4d 08             	mov    0x8(%ebp),%ecx
 143:	8b 55 10             	mov    0x10(%ebp),%edx
 146:	8b 45 0c             	mov    0xc(%ebp),%eax
 149:	89 cb                	mov    %ecx,%ebx
 14b:	89 df                	mov    %ebx,%edi
 14d:	89 d1                	mov    %edx,%ecx
 14f:	fc                   	cld    
 150:	f3 aa                	rep stos %al,%es:(%edi)
 152:	89 ca                	mov    %ecx,%edx
 154:	89 fb                	mov    %edi,%ebx
 156:	89 5d 08             	mov    %ebx,0x8(%ebp)
 159:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 15c:	5b                   	pop    %ebx
 15d:	5f                   	pop    %edi
 15e:	5d                   	pop    %ebp
 15f:	c3                   	ret    

00000160 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 166:	8b 45 08             	mov    0x8(%ebp),%eax
 169:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 16c:	90                   	nop
 16d:	8b 45 08             	mov    0x8(%ebp),%eax
 170:	8d 50 01             	lea    0x1(%eax),%edx
 173:	89 55 08             	mov    %edx,0x8(%ebp)
 176:	8b 55 0c             	mov    0xc(%ebp),%edx
 179:	8d 4a 01             	lea    0x1(%edx),%ecx
 17c:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 17f:	0f b6 12             	movzbl (%edx),%edx
 182:	88 10                	mov    %dl,(%eax)
 184:	0f b6 00             	movzbl (%eax),%eax
 187:	84 c0                	test   %al,%al
 189:	75 e2                	jne    16d <strcpy+0xd>
    ;
  return os;
 18b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 18e:	c9                   	leave  
 18f:	c3                   	ret    

00000190 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 193:	eb 08                	jmp    19d <strcmp+0xd>
    p++, q++;
 195:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 199:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 19d:	8b 45 08             	mov    0x8(%ebp),%eax
 1a0:	0f b6 00             	movzbl (%eax),%eax
 1a3:	84 c0                	test   %al,%al
 1a5:	74 10                	je     1b7 <strcmp+0x27>
 1a7:	8b 45 08             	mov    0x8(%ebp),%eax
 1aa:	0f b6 10             	movzbl (%eax),%edx
 1ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b0:	0f b6 00             	movzbl (%eax),%eax
 1b3:	38 c2                	cmp    %al,%dl
 1b5:	74 de                	je     195 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 1b7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ba:	0f b6 00             	movzbl (%eax),%eax
 1bd:	0f b6 d0             	movzbl %al,%edx
 1c0:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c3:	0f b6 00             	movzbl (%eax),%eax
 1c6:	0f b6 c0             	movzbl %al,%eax
 1c9:	29 c2                	sub    %eax,%edx
 1cb:	89 d0                	mov    %edx,%eax
}
 1cd:	5d                   	pop    %ebp
 1ce:	c3                   	ret    

000001cf <strlen>:

uint
strlen(const char *s)
{
 1cf:	55                   	push   %ebp
 1d0:	89 e5                	mov    %esp,%ebp
 1d2:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1d5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1dc:	eb 04                	jmp    1e2 <strlen+0x13>
 1de:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1e2:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
 1e8:	01 d0                	add    %edx,%eax
 1ea:	0f b6 00             	movzbl (%eax),%eax
 1ed:	84 c0                	test   %al,%al
 1ef:	75 ed                	jne    1de <strlen+0xf>
    ;
  return n;
 1f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1f4:	c9                   	leave  
 1f5:	c3                   	ret    

000001f6 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1f6:	55                   	push   %ebp
 1f7:	89 e5                	mov    %esp,%ebp
 1f9:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1fc:	8b 45 10             	mov    0x10(%ebp),%eax
 1ff:	89 44 24 08          	mov    %eax,0x8(%esp)
 203:	8b 45 0c             	mov    0xc(%ebp),%eax
 206:	89 44 24 04          	mov    %eax,0x4(%esp)
 20a:	8b 45 08             	mov    0x8(%ebp),%eax
 20d:	89 04 24             	mov    %eax,(%esp)
 210:	e8 26 ff ff ff       	call   13b <stosb>
  return dst;
 215:	8b 45 08             	mov    0x8(%ebp),%eax
}
 218:	c9                   	leave  
 219:	c3                   	ret    

0000021a <strchr>:

char*
strchr(const char *s, char c)
{
 21a:	55                   	push   %ebp
 21b:	89 e5                	mov    %esp,%ebp
 21d:	83 ec 04             	sub    $0x4,%esp
 220:	8b 45 0c             	mov    0xc(%ebp),%eax
 223:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 226:	eb 14                	jmp    23c <strchr+0x22>
    if(*s == c)
 228:	8b 45 08             	mov    0x8(%ebp),%eax
 22b:	0f b6 00             	movzbl (%eax),%eax
 22e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 231:	75 05                	jne    238 <strchr+0x1e>
      return (char*)s;
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	eb 13                	jmp    24b <strchr+0x31>
  for(; *s; s++)
 238:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 23c:	8b 45 08             	mov    0x8(%ebp),%eax
 23f:	0f b6 00             	movzbl (%eax),%eax
 242:	84 c0                	test   %al,%al
 244:	75 e2                	jne    228 <strchr+0xe>
  return 0;
 246:	b8 00 00 00 00       	mov    $0x0,%eax
}
 24b:	c9                   	leave  
 24c:	c3                   	ret    

0000024d <gets>:

char*
gets(char *buf, int max)
{
 24d:	55                   	push   %ebp
 24e:	89 e5                	mov    %esp,%ebp
 250:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 253:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 25a:	eb 4c                	jmp    2a8 <gets+0x5b>
    cc = read(0, &c, 1);
 25c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 263:	00 
 264:	8d 45 ef             	lea    -0x11(%ebp),%eax
 267:	89 44 24 04          	mov    %eax,0x4(%esp)
 26b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 272:	e8 57 02 00 00       	call   4ce <read>
 277:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 27a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 27e:	7f 02                	jg     282 <gets+0x35>
      break;
 280:	eb 31                	jmp    2b3 <gets+0x66>
    buf[i++] = c;
 282:	8b 45 f4             	mov    -0xc(%ebp),%eax
 285:	8d 50 01             	lea    0x1(%eax),%edx
 288:	89 55 f4             	mov    %edx,-0xc(%ebp)
 28b:	89 c2                	mov    %eax,%edx
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
 290:	01 c2                	add    %eax,%edx
 292:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 296:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 298:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 29c:	3c 0a                	cmp    $0xa,%al
 29e:	74 13                	je     2b3 <gets+0x66>
 2a0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2a4:	3c 0d                	cmp    $0xd,%al
 2a6:	74 0b                	je     2b3 <gets+0x66>
  for(i=0; i+1 < max; ){
 2a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2ab:	83 c0 01             	add    $0x1,%eax
 2ae:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2b1:	7c a9                	jl     25c <gets+0xf>
      break;
  }
  buf[i] = '\0';
 2b3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2b6:	8b 45 08             	mov    0x8(%ebp),%eax
 2b9:	01 d0                	add    %edx,%eax
 2bb:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2be:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c1:	c9                   	leave  
 2c2:	c3                   	ret    

000002c3 <stat>:

int
stat(const char *n, struct stat *st)
{
 2c3:	55                   	push   %ebp
 2c4:	89 e5                	mov    %esp,%ebp
 2c6:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2c9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2d0:	00 
 2d1:	8b 45 08             	mov    0x8(%ebp),%eax
 2d4:	89 04 24             	mov    %eax,(%esp)
 2d7:	e8 1a 02 00 00       	call   4f6 <open>
 2dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2df:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2e3:	79 07                	jns    2ec <stat+0x29>
    return -1;
 2e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2ea:	eb 23                	jmp    30f <stat+0x4c>
  r = fstat(fd, st);
 2ec:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 2f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2f6:	89 04 24             	mov    %eax,(%esp)
 2f9:	e8 10 02 00 00       	call   50e <fstat>
 2fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 301:	8b 45 f4             	mov    -0xc(%ebp),%eax
 304:	89 04 24             	mov    %eax,(%esp)
 307:	e8 d2 01 00 00       	call   4de <close>
  return r;
 30c:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 30f:	c9                   	leave  
 310:	c3                   	ret    

00000311 <atoi>:

int
atoi(const char *s)
{
 311:	55                   	push   %ebp
 312:	89 e5                	mov    %esp,%ebp
 314:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 317:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 31e:	eb 25                	jmp    345 <atoi+0x34>
    n = n*10 + *s++ - '0';
 320:	8b 55 fc             	mov    -0x4(%ebp),%edx
 323:	89 d0                	mov    %edx,%eax
 325:	c1 e0 02             	shl    $0x2,%eax
 328:	01 d0                	add    %edx,%eax
 32a:	01 c0                	add    %eax,%eax
 32c:	89 c1                	mov    %eax,%ecx
 32e:	8b 45 08             	mov    0x8(%ebp),%eax
 331:	8d 50 01             	lea    0x1(%eax),%edx
 334:	89 55 08             	mov    %edx,0x8(%ebp)
 337:	0f b6 00             	movzbl (%eax),%eax
 33a:	0f be c0             	movsbl %al,%eax
 33d:	01 c8                	add    %ecx,%eax
 33f:	83 e8 30             	sub    $0x30,%eax
 342:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 345:	8b 45 08             	mov    0x8(%ebp),%eax
 348:	0f b6 00             	movzbl (%eax),%eax
 34b:	3c 2f                	cmp    $0x2f,%al
 34d:	7e 0a                	jle    359 <atoi+0x48>
 34f:	8b 45 08             	mov    0x8(%ebp),%eax
 352:	0f b6 00             	movzbl (%eax),%eax
 355:	3c 39                	cmp    $0x39,%al
 357:	7e c7                	jle    320 <atoi+0xf>
  return n;
 359:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 35c:	c9                   	leave  
 35d:	c3                   	ret    

0000035e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 35e:	55                   	push   %ebp
 35f:	89 e5                	mov    %esp,%ebp
 361:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 364:	8b 45 08             	mov    0x8(%ebp),%eax
 367:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 36a:	8b 45 0c             	mov    0xc(%ebp),%eax
 36d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 370:	eb 17                	jmp    389 <memmove+0x2b>
    *dst++ = *src++;
 372:	8b 45 fc             	mov    -0x4(%ebp),%eax
 375:	8d 50 01             	lea    0x1(%eax),%edx
 378:	89 55 fc             	mov    %edx,-0x4(%ebp)
 37b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 37e:	8d 4a 01             	lea    0x1(%edx),%ecx
 381:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 384:	0f b6 12             	movzbl (%edx),%edx
 387:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 389:	8b 45 10             	mov    0x10(%ebp),%eax
 38c:	8d 50 ff             	lea    -0x1(%eax),%edx
 38f:	89 55 10             	mov    %edx,0x10(%ebp)
 392:	85 c0                	test   %eax,%eax
 394:	7f dc                	jg     372 <memmove+0x14>
  return vdst;
 396:	8b 45 08             	mov    0x8(%ebp),%eax
}
 399:	c9                   	leave  
 39a:	c3                   	ret    

0000039b <ps>:

void
ps() {
 39b:	55                   	push   %ebp
 39c:	89 e5                	mov    %esp,%ebp
 39e:	57                   	push   %edi
 39f:	56                   	push   %esi
 3a0:	53                   	push   %ebx
 3a1:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  int i = 0;
 3a7:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  printf(1, "PID	TKTS	TCKS	STAT	NAME\n");
 3ae:	c7 44 24 04 4a 0a 00 	movl   $0xa4a,0x4(%esp)
 3b5:	00 
 3b6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3bd:	e8 84 02 00 00       	call   646 <printf>
  getpinfo(&pstat);
 3c2:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 3c8:	89 04 24             	mov    %eax,(%esp)
 3cb:	e8 86 01 00 00       	call   556 <getpinfo>
  while (pstat[i].pid != 0) {
 3d0:	e9 ad 00 00 00       	jmp    482 <ps+0xe7>
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
	pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 3d5:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 3db:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3de:	89 d0                	mov    %edx,%eax
 3e0:	c1 e0 03             	shl    $0x3,%eax
 3e3:	01 d0                	add    %edx,%eax
 3e5:	c1 e0 02             	shl    $0x2,%eax
 3e8:	83 c0 10             	add    $0x10,%eax
 3eb:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 3ee:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3f1:	89 d0                	mov    %edx,%eax
 3f3:	c1 e0 03             	shl    $0x3,%eax
 3f6:	01 d0                	add    %edx,%eax
 3f8:	c1 e0 02             	shl    $0x2,%eax
 3fb:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 3fe:	01 d8                	add    %ebx,%eax
 400:	2d e4 08 00 00       	sub    $0x8e4,%eax
 405:	0f b6 00             	movzbl (%eax),%eax
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
 408:	0f be f0             	movsbl %al,%esi
 40b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 40e:	89 d0                	mov    %edx,%eax
 410:	c1 e0 03             	shl    $0x3,%eax
 413:	01 d0                	add    %edx,%eax
 415:	c1 e0 02             	shl    $0x2,%eax
 418:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 41b:	01 c8                	add    %ecx,%eax
 41d:	2d f8 08 00 00       	sub    $0x8f8,%eax
 422:	8b 18                	mov    (%eax),%ebx
 424:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 427:	89 d0                	mov    %edx,%eax
 429:	c1 e0 03             	shl    $0x3,%eax
 42c:	01 d0                	add    %edx,%eax
 42e:	c1 e0 02             	shl    $0x2,%eax
 431:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 434:	01 c8                	add    %ecx,%eax
 436:	2d 00 09 00 00       	sub    $0x900,%eax
 43b:	8b 08                	mov    (%eax),%ecx
 43d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 440:	89 d0                	mov    %edx,%eax
 442:	c1 e0 03             	shl    $0x3,%eax
 445:	01 d0                	add    %edx,%eax
 447:	c1 e0 02             	shl    $0x2,%eax
 44a:	8d 55 e8             	lea    -0x18(%ebp),%edx
 44d:	01 d0                	add    %edx,%eax
 44f:	2d fc 08 00 00       	sub    $0x8fc,%eax
 454:	8b 00                	mov    (%eax),%eax
 456:	89 7c 24 18          	mov    %edi,0x18(%esp)
 45a:	89 74 24 14          	mov    %esi,0x14(%esp)
 45e:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 462:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 466:	89 44 24 08          	mov    %eax,0x8(%esp)
 46a:	c7 44 24 04 63 0a 00 	movl   $0xa63,0x4(%esp)
 471:	00 
 472:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 479:	e8 c8 01 00 00       	call   646 <printf>
      i++;
 47e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  while (pstat[i].pid != 0) {
 482:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 485:	89 d0                	mov    %edx,%eax
 487:	c1 e0 03             	shl    $0x3,%eax
 48a:	01 d0                	add    %edx,%eax
 48c:	c1 e0 02             	shl    $0x2,%eax
 48f:	8d 75 e8             	lea    -0x18(%ebp),%esi
 492:	01 f0                	add    %esi,%eax
 494:	2d fc 08 00 00       	sub    $0x8fc,%eax
 499:	8b 00                	mov    (%eax),%eax
 49b:	85 c0                	test   %eax,%eax
 49d:	0f 85 32 ff ff ff    	jne    3d5 <ps+0x3a>
  }
}
 4a3:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 4a9:	5b                   	pop    %ebx
 4aa:	5e                   	pop    %esi
 4ab:	5f                   	pop    %edi
 4ac:	5d                   	pop    %ebp
 4ad:	c3                   	ret    

000004ae <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4ae:	b8 01 00 00 00       	mov    $0x1,%eax
 4b3:	cd 40                	int    $0x40
 4b5:	c3                   	ret    

000004b6 <exit>:
SYSCALL(exit)
 4b6:	b8 02 00 00 00       	mov    $0x2,%eax
 4bb:	cd 40                	int    $0x40
 4bd:	c3                   	ret    

000004be <wait>:
SYSCALL(wait)
 4be:	b8 03 00 00 00       	mov    $0x3,%eax
 4c3:	cd 40                	int    $0x40
 4c5:	c3                   	ret    

000004c6 <pipe>:
SYSCALL(pipe)
 4c6:	b8 04 00 00 00       	mov    $0x4,%eax
 4cb:	cd 40                	int    $0x40
 4cd:	c3                   	ret    

000004ce <read>:
SYSCALL(read)
 4ce:	b8 05 00 00 00       	mov    $0x5,%eax
 4d3:	cd 40                	int    $0x40
 4d5:	c3                   	ret    

000004d6 <write>:
SYSCALL(write)
 4d6:	b8 10 00 00 00       	mov    $0x10,%eax
 4db:	cd 40                	int    $0x40
 4dd:	c3                   	ret    

000004de <close>:
SYSCALL(close)
 4de:	b8 15 00 00 00       	mov    $0x15,%eax
 4e3:	cd 40                	int    $0x40
 4e5:	c3                   	ret    

000004e6 <kill>:
SYSCALL(kill)
 4e6:	b8 06 00 00 00       	mov    $0x6,%eax
 4eb:	cd 40                	int    $0x40
 4ed:	c3                   	ret    

000004ee <exec>:
SYSCALL(exec)
 4ee:	b8 07 00 00 00       	mov    $0x7,%eax
 4f3:	cd 40                	int    $0x40
 4f5:	c3                   	ret    

000004f6 <open>:
SYSCALL(open)
 4f6:	b8 0f 00 00 00       	mov    $0xf,%eax
 4fb:	cd 40                	int    $0x40
 4fd:	c3                   	ret    

000004fe <mknod>:
SYSCALL(mknod)
 4fe:	b8 11 00 00 00       	mov    $0x11,%eax
 503:	cd 40                	int    $0x40
 505:	c3                   	ret    

00000506 <unlink>:
SYSCALL(unlink)
 506:	b8 12 00 00 00       	mov    $0x12,%eax
 50b:	cd 40                	int    $0x40
 50d:	c3                   	ret    

0000050e <fstat>:
SYSCALL(fstat)
 50e:	b8 08 00 00 00       	mov    $0x8,%eax
 513:	cd 40                	int    $0x40
 515:	c3                   	ret    

00000516 <link>:
SYSCALL(link)
 516:	b8 13 00 00 00       	mov    $0x13,%eax
 51b:	cd 40                	int    $0x40
 51d:	c3                   	ret    

0000051e <mkdir>:
SYSCALL(mkdir)
 51e:	b8 14 00 00 00       	mov    $0x14,%eax
 523:	cd 40                	int    $0x40
 525:	c3                   	ret    

00000526 <chdir>:
SYSCALL(chdir)
 526:	b8 09 00 00 00       	mov    $0x9,%eax
 52b:	cd 40                	int    $0x40
 52d:	c3                   	ret    

0000052e <dup>:
SYSCALL(dup)
 52e:	b8 0a 00 00 00       	mov    $0xa,%eax
 533:	cd 40                	int    $0x40
 535:	c3                   	ret    

00000536 <getpid>:
SYSCALL(getpid)
 536:	b8 0b 00 00 00       	mov    $0xb,%eax
 53b:	cd 40                	int    $0x40
 53d:	c3                   	ret    

0000053e <sbrk>:
SYSCALL(sbrk)
 53e:	b8 0c 00 00 00       	mov    $0xc,%eax
 543:	cd 40                	int    $0x40
 545:	c3                   	ret    

00000546 <sleep>:
SYSCALL(sleep)
 546:	b8 0d 00 00 00       	mov    $0xd,%eax
 54b:	cd 40                	int    $0x40
 54d:	c3                   	ret    

0000054e <uptime>:
SYSCALL(uptime)
 54e:	b8 0e 00 00 00       	mov    $0xe,%eax
 553:	cd 40                	int    $0x40
 555:	c3                   	ret    

00000556 <getpinfo>:
SYSCALL(getpinfo)
 556:	b8 16 00 00 00       	mov    $0x16,%eax
 55b:	cd 40                	int    $0x40
 55d:	c3                   	ret    

0000055e <settickets>:
SYSCALL(settickets)
 55e:	b8 17 00 00 00       	mov    $0x17,%eax
 563:	cd 40                	int    $0x40
 565:	c3                   	ret    

00000566 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 566:	55                   	push   %ebp
 567:	89 e5                	mov    %esp,%ebp
 569:	83 ec 18             	sub    $0x18,%esp
 56c:	8b 45 0c             	mov    0xc(%ebp),%eax
 56f:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 572:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 579:	00 
 57a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 57d:	89 44 24 04          	mov    %eax,0x4(%esp)
 581:	8b 45 08             	mov    0x8(%ebp),%eax
 584:	89 04 24             	mov    %eax,(%esp)
 587:	e8 4a ff ff ff       	call   4d6 <write>
}
 58c:	c9                   	leave  
 58d:	c3                   	ret    

0000058e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 58e:	55                   	push   %ebp
 58f:	89 e5                	mov    %esp,%ebp
 591:	56                   	push   %esi
 592:	53                   	push   %ebx
 593:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 596:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 59d:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 5a1:	74 17                	je     5ba <printint+0x2c>
 5a3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 5a7:	79 11                	jns    5ba <printint+0x2c>
    neg = 1;
 5a9:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 5b0:	8b 45 0c             	mov    0xc(%ebp),%eax
 5b3:	f7 d8                	neg    %eax
 5b5:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5b8:	eb 06                	jmp    5c0 <printint+0x32>
  } else {
    x = xx;
 5ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 5bd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 5c0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 5c7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 5ca:	8d 41 01             	lea    0x1(%ecx),%eax
 5cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5d0:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5d6:	ba 00 00 00 00       	mov    $0x0,%edx
 5db:	f7 f3                	div    %ebx
 5dd:	89 d0                	mov    %edx,%eax
 5df:	0f b6 80 10 0d 00 00 	movzbl 0xd10(%eax),%eax
 5e6:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 5ea:	8b 75 10             	mov    0x10(%ebp),%esi
 5ed:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5f0:	ba 00 00 00 00       	mov    $0x0,%edx
 5f5:	f7 f6                	div    %esi
 5f7:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5fa:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5fe:	75 c7                	jne    5c7 <printint+0x39>
  if(neg)
 600:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 604:	74 10                	je     616 <printint+0x88>
    buf[i++] = '-';
 606:	8b 45 f4             	mov    -0xc(%ebp),%eax
 609:	8d 50 01             	lea    0x1(%eax),%edx
 60c:	89 55 f4             	mov    %edx,-0xc(%ebp)
 60f:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 614:	eb 1f                	jmp    635 <printint+0xa7>
 616:	eb 1d                	jmp    635 <printint+0xa7>
    putc(fd, buf[i]);
 618:	8d 55 dc             	lea    -0x24(%ebp),%edx
 61b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 61e:	01 d0                	add    %edx,%eax
 620:	0f b6 00             	movzbl (%eax),%eax
 623:	0f be c0             	movsbl %al,%eax
 626:	89 44 24 04          	mov    %eax,0x4(%esp)
 62a:	8b 45 08             	mov    0x8(%ebp),%eax
 62d:	89 04 24             	mov    %eax,(%esp)
 630:	e8 31 ff ff ff       	call   566 <putc>
  while(--i >= 0)
 635:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 639:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 63d:	79 d9                	jns    618 <printint+0x8a>
}
 63f:	83 c4 30             	add    $0x30,%esp
 642:	5b                   	pop    %ebx
 643:	5e                   	pop    %esi
 644:	5d                   	pop    %ebp
 645:	c3                   	ret    

00000646 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 646:	55                   	push   %ebp
 647:	89 e5                	mov    %esp,%ebp
 649:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 64c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 653:	8d 45 0c             	lea    0xc(%ebp),%eax
 656:	83 c0 04             	add    $0x4,%eax
 659:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 65c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 663:	e9 7c 01 00 00       	jmp    7e4 <printf+0x19e>
    c = fmt[i] & 0xff;
 668:	8b 55 0c             	mov    0xc(%ebp),%edx
 66b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 66e:	01 d0                	add    %edx,%eax
 670:	0f b6 00             	movzbl (%eax),%eax
 673:	0f be c0             	movsbl %al,%eax
 676:	25 ff 00 00 00       	and    $0xff,%eax
 67b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 67e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 682:	75 2c                	jne    6b0 <printf+0x6a>
      if(c == '%'){
 684:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 688:	75 0c                	jne    696 <printf+0x50>
        state = '%';
 68a:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 691:	e9 4a 01 00 00       	jmp    7e0 <printf+0x19a>
      } else {
        putc(fd, c);
 696:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 699:	0f be c0             	movsbl %al,%eax
 69c:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a0:	8b 45 08             	mov    0x8(%ebp),%eax
 6a3:	89 04 24             	mov    %eax,(%esp)
 6a6:	e8 bb fe ff ff       	call   566 <putc>
 6ab:	e9 30 01 00 00       	jmp    7e0 <printf+0x19a>
      }
    } else if(state == '%'){
 6b0:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 6b4:	0f 85 26 01 00 00    	jne    7e0 <printf+0x19a>
      if(c == 'd'){
 6ba:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 6be:	75 2d                	jne    6ed <printf+0xa7>
        printint(fd, *ap, 10, 1);
 6c0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6c3:	8b 00                	mov    (%eax),%eax
 6c5:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 6cc:	00 
 6cd:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 6d4:	00 
 6d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 6d9:	8b 45 08             	mov    0x8(%ebp),%eax
 6dc:	89 04 24             	mov    %eax,(%esp)
 6df:	e8 aa fe ff ff       	call   58e <printint>
        ap++;
 6e4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6e8:	e9 ec 00 00 00       	jmp    7d9 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 6ed:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 6f1:	74 06                	je     6f9 <printf+0xb3>
 6f3:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 6f7:	75 2d                	jne    726 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 6f9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6fc:	8b 00                	mov    (%eax),%eax
 6fe:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 705:	00 
 706:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 70d:	00 
 70e:	89 44 24 04          	mov    %eax,0x4(%esp)
 712:	8b 45 08             	mov    0x8(%ebp),%eax
 715:	89 04 24             	mov    %eax,(%esp)
 718:	e8 71 fe ff ff       	call   58e <printint>
        ap++;
 71d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 721:	e9 b3 00 00 00       	jmp    7d9 <printf+0x193>
      } else if(c == 's'){
 726:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 72a:	75 45                	jne    771 <printf+0x12b>
        s = (char*)*ap;
 72c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 72f:	8b 00                	mov    (%eax),%eax
 731:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 734:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 738:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 73c:	75 09                	jne    747 <printf+0x101>
          s = "(null)";
 73e:	c7 45 f4 73 0a 00 00 	movl   $0xa73,-0xc(%ebp)
        while(*s != 0){
 745:	eb 1e                	jmp    765 <printf+0x11f>
 747:	eb 1c                	jmp    765 <printf+0x11f>
          putc(fd, *s);
 749:	8b 45 f4             	mov    -0xc(%ebp),%eax
 74c:	0f b6 00             	movzbl (%eax),%eax
 74f:	0f be c0             	movsbl %al,%eax
 752:	89 44 24 04          	mov    %eax,0x4(%esp)
 756:	8b 45 08             	mov    0x8(%ebp),%eax
 759:	89 04 24             	mov    %eax,(%esp)
 75c:	e8 05 fe ff ff       	call   566 <putc>
          s++;
 761:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 765:	8b 45 f4             	mov    -0xc(%ebp),%eax
 768:	0f b6 00             	movzbl (%eax),%eax
 76b:	84 c0                	test   %al,%al
 76d:	75 da                	jne    749 <printf+0x103>
 76f:	eb 68                	jmp    7d9 <printf+0x193>
        }
      } else if(c == 'c'){
 771:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 775:	75 1d                	jne    794 <printf+0x14e>
        putc(fd, *ap);
 777:	8b 45 e8             	mov    -0x18(%ebp),%eax
 77a:	8b 00                	mov    (%eax),%eax
 77c:	0f be c0             	movsbl %al,%eax
 77f:	89 44 24 04          	mov    %eax,0x4(%esp)
 783:	8b 45 08             	mov    0x8(%ebp),%eax
 786:	89 04 24             	mov    %eax,(%esp)
 789:	e8 d8 fd ff ff       	call   566 <putc>
        ap++;
 78e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 792:	eb 45                	jmp    7d9 <printf+0x193>
      } else if(c == '%'){
 794:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 798:	75 17                	jne    7b1 <printf+0x16b>
        putc(fd, c);
 79a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 79d:	0f be c0             	movsbl %al,%eax
 7a0:	89 44 24 04          	mov    %eax,0x4(%esp)
 7a4:	8b 45 08             	mov    0x8(%ebp),%eax
 7a7:	89 04 24             	mov    %eax,(%esp)
 7aa:	e8 b7 fd ff ff       	call   566 <putc>
 7af:	eb 28                	jmp    7d9 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7b1:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 7b8:	00 
 7b9:	8b 45 08             	mov    0x8(%ebp),%eax
 7bc:	89 04 24             	mov    %eax,(%esp)
 7bf:	e8 a2 fd ff ff       	call   566 <putc>
        putc(fd, c);
 7c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7c7:	0f be c0             	movsbl %al,%eax
 7ca:	89 44 24 04          	mov    %eax,0x4(%esp)
 7ce:	8b 45 08             	mov    0x8(%ebp),%eax
 7d1:	89 04 24             	mov    %eax,(%esp)
 7d4:	e8 8d fd ff ff       	call   566 <putc>
      }
      state = 0;
 7d9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 7e0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 7e4:	8b 55 0c             	mov    0xc(%ebp),%edx
 7e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ea:	01 d0                	add    %edx,%eax
 7ec:	0f b6 00             	movzbl (%eax),%eax
 7ef:	84 c0                	test   %al,%al
 7f1:	0f 85 71 fe ff ff    	jne    668 <printf+0x22>
    }
  }
}
 7f7:	c9                   	leave  
 7f8:	c3                   	ret    

000007f9 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7f9:	55                   	push   %ebp
 7fa:	89 e5                	mov    %esp,%ebp
 7fc:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7ff:	8b 45 08             	mov    0x8(%ebp),%eax
 802:	83 e8 08             	sub    $0x8,%eax
 805:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 808:	a1 48 0d 00 00       	mov    0xd48,%eax
 80d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 810:	eb 24                	jmp    836 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 812:	8b 45 fc             	mov    -0x4(%ebp),%eax
 815:	8b 00                	mov    (%eax),%eax
 817:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 81a:	77 12                	ja     82e <free+0x35>
 81c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 81f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 822:	77 24                	ja     848 <free+0x4f>
 824:	8b 45 fc             	mov    -0x4(%ebp),%eax
 827:	8b 00                	mov    (%eax),%eax
 829:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 82c:	77 1a                	ja     848 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 82e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 831:	8b 00                	mov    (%eax),%eax
 833:	89 45 fc             	mov    %eax,-0x4(%ebp)
 836:	8b 45 f8             	mov    -0x8(%ebp),%eax
 839:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 83c:	76 d4                	jbe    812 <free+0x19>
 83e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 841:	8b 00                	mov    (%eax),%eax
 843:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 846:	76 ca                	jbe    812 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 848:	8b 45 f8             	mov    -0x8(%ebp),%eax
 84b:	8b 40 04             	mov    0x4(%eax),%eax
 84e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 855:	8b 45 f8             	mov    -0x8(%ebp),%eax
 858:	01 c2                	add    %eax,%edx
 85a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85d:	8b 00                	mov    (%eax),%eax
 85f:	39 c2                	cmp    %eax,%edx
 861:	75 24                	jne    887 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 863:	8b 45 f8             	mov    -0x8(%ebp),%eax
 866:	8b 50 04             	mov    0x4(%eax),%edx
 869:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86c:	8b 00                	mov    (%eax),%eax
 86e:	8b 40 04             	mov    0x4(%eax),%eax
 871:	01 c2                	add    %eax,%edx
 873:	8b 45 f8             	mov    -0x8(%ebp),%eax
 876:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 879:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87c:	8b 00                	mov    (%eax),%eax
 87e:	8b 10                	mov    (%eax),%edx
 880:	8b 45 f8             	mov    -0x8(%ebp),%eax
 883:	89 10                	mov    %edx,(%eax)
 885:	eb 0a                	jmp    891 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 887:	8b 45 fc             	mov    -0x4(%ebp),%eax
 88a:	8b 10                	mov    (%eax),%edx
 88c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 88f:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 891:	8b 45 fc             	mov    -0x4(%ebp),%eax
 894:	8b 40 04             	mov    0x4(%eax),%eax
 897:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 89e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a1:	01 d0                	add    %edx,%eax
 8a3:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8a6:	75 20                	jne    8c8 <free+0xcf>
    p->s.size += bp->s.size;
 8a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ab:	8b 50 04             	mov    0x4(%eax),%edx
 8ae:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8b1:	8b 40 04             	mov    0x4(%eax),%eax
 8b4:	01 c2                	add    %eax,%edx
 8b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b9:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8bc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8bf:	8b 10                	mov    (%eax),%edx
 8c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c4:	89 10                	mov    %edx,(%eax)
 8c6:	eb 08                	jmp    8d0 <free+0xd7>
  } else
    p->s.ptr = bp;
 8c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8cb:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8ce:	89 10                	mov    %edx,(%eax)
  freep = p;
 8d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d3:	a3 48 0d 00 00       	mov    %eax,0xd48
}
 8d8:	c9                   	leave  
 8d9:	c3                   	ret    

000008da <morecore>:

static Header*
morecore(uint nu)
{
 8da:	55                   	push   %ebp
 8db:	89 e5                	mov    %esp,%ebp
 8dd:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 8e0:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 8e7:	77 07                	ja     8f0 <morecore+0x16>
    nu = 4096;
 8e9:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 8f0:	8b 45 08             	mov    0x8(%ebp),%eax
 8f3:	c1 e0 03             	shl    $0x3,%eax
 8f6:	89 04 24             	mov    %eax,(%esp)
 8f9:	e8 40 fc ff ff       	call   53e <sbrk>
 8fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 901:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 905:	75 07                	jne    90e <morecore+0x34>
    return 0;
 907:	b8 00 00 00 00       	mov    $0x0,%eax
 90c:	eb 22                	jmp    930 <morecore+0x56>
  hp = (Header*)p;
 90e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 911:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 914:	8b 45 f0             	mov    -0x10(%ebp),%eax
 917:	8b 55 08             	mov    0x8(%ebp),%edx
 91a:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 91d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 920:	83 c0 08             	add    $0x8,%eax
 923:	89 04 24             	mov    %eax,(%esp)
 926:	e8 ce fe ff ff       	call   7f9 <free>
  return freep;
 92b:	a1 48 0d 00 00       	mov    0xd48,%eax
}
 930:	c9                   	leave  
 931:	c3                   	ret    

00000932 <malloc>:

void*
malloc(uint nbytes)
{
 932:	55                   	push   %ebp
 933:	89 e5                	mov    %esp,%ebp
 935:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 938:	8b 45 08             	mov    0x8(%ebp),%eax
 93b:	83 c0 07             	add    $0x7,%eax
 93e:	c1 e8 03             	shr    $0x3,%eax
 941:	83 c0 01             	add    $0x1,%eax
 944:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 947:	a1 48 0d 00 00       	mov    0xd48,%eax
 94c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 94f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 953:	75 23                	jne    978 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 955:	c7 45 f0 40 0d 00 00 	movl   $0xd40,-0x10(%ebp)
 95c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 95f:	a3 48 0d 00 00       	mov    %eax,0xd48
 964:	a1 48 0d 00 00       	mov    0xd48,%eax
 969:	a3 40 0d 00 00       	mov    %eax,0xd40
    base.s.size = 0;
 96e:	c7 05 44 0d 00 00 00 	movl   $0x0,0xd44
 975:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 978:	8b 45 f0             	mov    -0x10(%ebp),%eax
 97b:	8b 00                	mov    (%eax),%eax
 97d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 980:	8b 45 f4             	mov    -0xc(%ebp),%eax
 983:	8b 40 04             	mov    0x4(%eax),%eax
 986:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 989:	72 4d                	jb     9d8 <malloc+0xa6>
      if(p->s.size == nunits)
 98b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 98e:	8b 40 04             	mov    0x4(%eax),%eax
 991:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 994:	75 0c                	jne    9a2 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 996:	8b 45 f4             	mov    -0xc(%ebp),%eax
 999:	8b 10                	mov    (%eax),%edx
 99b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 99e:	89 10                	mov    %edx,(%eax)
 9a0:	eb 26                	jmp    9c8 <malloc+0x96>
      else {
        p->s.size -= nunits;
 9a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a5:	8b 40 04             	mov    0x4(%eax),%eax
 9a8:	2b 45 ec             	sub    -0x14(%ebp),%eax
 9ab:	89 c2                	mov    %eax,%edx
 9ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b0:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b6:	8b 40 04             	mov    0x4(%eax),%eax
 9b9:	c1 e0 03             	shl    $0x3,%eax
 9bc:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 9bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c2:	8b 55 ec             	mov    -0x14(%ebp),%edx
 9c5:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 9c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9cb:	a3 48 0d 00 00       	mov    %eax,0xd48
      return (void*)(p + 1);
 9d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d3:	83 c0 08             	add    $0x8,%eax
 9d6:	eb 38                	jmp    a10 <malloc+0xde>
    }
    if(p == freep)
 9d8:	a1 48 0d 00 00       	mov    0xd48,%eax
 9dd:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 9e0:	75 1b                	jne    9fd <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 9e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9e5:	89 04 24             	mov    %eax,(%esp)
 9e8:	e8 ed fe ff ff       	call   8da <morecore>
 9ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9f0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9f4:	75 07                	jne    9fd <malloc+0xcb>
        return 0;
 9f6:	b8 00 00 00 00       	mov    $0x0,%eax
 9fb:	eb 13                	jmp    a10 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a00:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a03:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a06:	8b 00                	mov    (%eax),%eax
 a08:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 a0b:	e9 70 ff ff ff       	jmp    980 <malloc+0x4e>
}
 a10:	c9                   	leave  
 a11:	c3                   	ret    
