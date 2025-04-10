
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 48             	sub    $0x48,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
   6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10:	89 45 ec             	mov    %eax,-0x14(%ebp)
  13:	8b 45 ec             	mov    -0x14(%ebp),%eax
  16:	89 45 f0             	mov    %eax,-0x10(%ebp)
  inword = 0;
  19:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  20:	eb 68                	jmp    8a <wc+0x8a>
    for(i=0; i<n; i++){
  22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  29:	eb 57                	jmp    82 <wc+0x82>
      c++;
  2b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
      if(buf[i] == '\n')
  2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  32:	05 e0 0d 00 00       	add    $0xde0,%eax
  37:	0f b6 00             	movzbl (%eax),%eax
  3a:	3c 0a                	cmp    $0xa,%al
  3c:	75 04                	jne    42 <wc+0x42>
        l++;
  3e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(strchr(" \r\t\n\v", buf[i]))
  42:	8b 45 f4             	mov    -0xc(%ebp),%eax
  45:	05 e0 0d 00 00       	add    $0xde0,%eax
  4a:	0f b6 00             	movzbl (%eax),%eax
  4d:	0f be c0             	movsbl %al,%eax
  50:	89 44 24 04          	mov    %eax,0x4(%esp)
  54:	c7 04 24 a8 0a 00 00 	movl   $0xaa8,(%esp)
  5b:	e8 58 02 00 00       	call   2b8 <strchr>
  60:	85 c0                	test   %eax,%eax
  62:	74 09                	je     6d <wc+0x6d>
        inword = 0;
  64:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  6b:	eb 11                	jmp    7e <wc+0x7e>
      else if(!inword){
  6d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  71:	75 0b                	jne    7e <wc+0x7e>
        w++;
  73:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
        inword = 1;
  77:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
  7e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  82:	8b 45 f4             	mov    -0xc(%ebp),%eax
  85:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  88:	7c a1                	jl     2b <wc+0x2b>
  while((n = read(fd, buf, sizeof(buf))) > 0){
  8a:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  91:	00 
  92:	c7 44 24 04 e0 0d 00 	movl   $0xde0,0x4(%esp)
  99:	00 
  9a:	8b 45 08             	mov    0x8(%ebp),%eax
  9d:	89 04 24             	mov    %eax,(%esp)
  a0:	e8 c7 04 00 00       	call   56c <read>
  a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  a8:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  ac:	0f 8f 70 ff ff ff    	jg     22 <wc+0x22>
      }
    }
  }
  if(n < 0){
  b2:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  b6:	79 19                	jns    d1 <wc+0xd1>
    printf(1, "wc: read error\n");
  b8:	c7 44 24 04 ae 0a 00 	movl   $0xaae,0x4(%esp)
  bf:	00 
  c0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c7:	e8 10 06 00 00       	call   6dc <printf>
    exit();
  cc:	e8 83 04 00 00       	call   554 <exit>
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  d1:	8b 45 0c             	mov    0xc(%ebp),%eax
  d4:	89 44 24 14          	mov    %eax,0x14(%esp)
  d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  db:	89 44 24 10          	mov    %eax,0x10(%esp)
  df:	8b 45 ec             	mov    -0x14(%ebp),%eax
  e2:	89 44 24 0c          	mov    %eax,0xc(%esp)
  e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  e9:	89 44 24 08          	mov    %eax,0x8(%esp)
  ed:	c7 44 24 04 be 0a 00 	movl   $0xabe,0x4(%esp)
  f4:	00 
  f5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  fc:	e8 db 05 00 00       	call   6dc <printf>
}
 101:	c9                   	leave  
 102:	c3                   	ret    

00000103 <main>:

int
main(int argc, char *argv[])
{
 103:	55                   	push   %ebp
 104:	89 e5                	mov    %esp,%ebp
 106:	83 e4 f0             	and    $0xfffffff0,%esp
 109:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
 10c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 110:	7f 19                	jg     12b <main+0x28>
    wc(0, "");
 112:	c7 44 24 04 cb 0a 00 	movl   $0xacb,0x4(%esp)
 119:	00 
 11a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 121:	e8 da fe ff ff       	call   0 <wc>
    exit();
 126:	e8 29 04 00 00       	call   554 <exit>
  }

  for(i = 1; i < argc; i++){
 12b:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 132:	00 
 133:	e9 8f 00 00 00       	jmp    1c7 <main+0xc4>
    if((fd = open(argv[i], 0)) < 0){
 138:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 13c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 143:	8b 45 0c             	mov    0xc(%ebp),%eax
 146:	01 d0                	add    %edx,%eax
 148:	8b 00                	mov    (%eax),%eax
 14a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 151:	00 
 152:	89 04 24             	mov    %eax,(%esp)
 155:	e8 3a 04 00 00       	call   594 <open>
 15a:	89 44 24 18          	mov    %eax,0x18(%esp)
 15e:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
 163:	79 2f                	jns    194 <main+0x91>
      printf(1, "wc: cannot open %s\n", argv[i]);
 165:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 169:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 170:	8b 45 0c             	mov    0xc(%ebp),%eax
 173:	01 d0                	add    %edx,%eax
 175:	8b 00                	mov    (%eax),%eax
 177:	89 44 24 08          	mov    %eax,0x8(%esp)
 17b:	c7 44 24 04 cc 0a 00 	movl   $0xacc,0x4(%esp)
 182:	00 
 183:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 18a:	e8 4d 05 00 00       	call   6dc <printf>
      exit();
 18f:	e8 c0 03 00 00       	call   554 <exit>
    }
    wc(fd, argv[i]);
 194:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 198:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 19f:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a2:	01 d0                	add    %edx,%eax
 1a4:	8b 00                	mov    (%eax),%eax
 1a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 1aa:	8b 44 24 18          	mov    0x18(%esp),%eax
 1ae:	89 04 24             	mov    %eax,(%esp)
 1b1:	e8 4a fe ff ff       	call   0 <wc>
    close(fd);
 1b6:	8b 44 24 18          	mov    0x18(%esp),%eax
 1ba:	89 04 24             	mov    %eax,(%esp)
 1bd:	e8 ba 03 00 00       	call   57c <close>
  for(i = 1; i < argc; i++){
 1c2:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 1c7:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 1cb:	3b 45 08             	cmp    0x8(%ebp),%eax
 1ce:	0f 8c 64 ff ff ff    	jl     138 <main+0x35>
  }
  exit();
 1d4:	e8 7b 03 00 00       	call   554 <exit>

000001d9 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1d9:	55                   	push   %ebp
 1da:	89 e5                	mov    %esp,%ebp
 1dc:	57                   	push   %edi
 1dd:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1de:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1e1:	8b 55 10             	mov    0x10(%ebp),%edx
 1e4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e7:	89 cb                	mov    %ecx,%ebx
 1e9:	89 df                	mov    %ebx,%edi
 1eb:	89 d1                	mov    %edx,%ecx
 1ed:	fc                   	cld    
 1ee:	f3 aa                	rep stos %al,%es:(%edi)
 1f0:	89 ca                	mov    %ecx,%edx
 1f2:	89 fb                	mov    %edi,%ebx
 1f4:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1f7:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1fa:	5b                   	pop    %ebx
 1fb:	5f                   	pop    %edi
 1fc:	5d                   	pop    %ebp
 1fd:	c3                   	ret    

000001fe <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 1fe:	55                   	push   %ebp
 1ff:	89 e5                	mov    %esp,%ebp
 201:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 204:	8b 45 08             	mov    0x8(%ebp),%eax
 207:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 20a:	90                   	nop
 20b:	8b 45 08             	mov    0x8(%ebp),%eax
 20e:	8d 50 01             	lea    0x1(%eax),%edx
 211:	89 55 08             	mov    %edx,0x8(%ebp)
 214:	8b 55 0c             	mov    0xc(%ebp),%edx
 217:	8d 4a 01             	lea    0x1(%edx),%ecx
 21a:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 21d:	0f b6 12             	movzbl (%edx),%edx
 220:	88 10                	mov    %dl,(%eax)
 222:	0f b6 00             	movzbl (%eax),%eax
 225:	84 c0                	test   %al,%al
 227:	75 e2                	jne    20b <strcpy+0xd>
    ;
  return os;
 229:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 22c:	c9                   	leave  
 22d:	c3                   	ret    

0000022e <strcmp>:

int
strcmp(const char *p, const char *q)
{
 22e:	55                   	push   %ebp
 22f:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 231:	eb 08                	jmp    23b <strcmp+0xd>
    p++, q++;
 233:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 237:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 23b:	8b 45 08             	mov    0x8(%ebp),%eax
 23e:	0f b6 00             	movzbl (%eax),%eax
 241:	84 c0                	test   %al,%al
 243:	74 10                	je     255 <strcmp+0x27>
 245:	8b 45 08             	mov    0x8(%ebp),%eax
 248:	0f b6 10             	movzbl (%eax),%edx
 24b:	8b 45 0c             	mov    0xc(%ebp),%eax
 24e:	0f b6 00             	movzbl (%eax),%eax
 251:	38 c2                	cmp    %al,%dl
 253:	74 de                	je     233 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 255:	8b 45 08             	mov    0x8(%ebp),%eax
 258:	0f b6 00             	movzbl (%eax),%eax
 25b:	0f b6 d0             	movzbl %al,%edx
 25e:	8b 45 0c             	mov    0xc(%ebp),%eax
 261:	0f b6 00             	movzbl (%eax),%eax
 264:	0f b6 c0             	movzbl %al,%eax
 267:	29 c2                	sub    %eax,%edx
 269:	89 d0                	mov    %edx,%eax
}
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret    

0000026d <strlen>:

uint
strlen(const char *s)
{
 26d:	55                   	push   %ebp
 26e:	89 e5                	mov    %esp,%ebp
 270:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 273:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 27a:	eb 04                	jmp    280 <strlen+0x13>
 27c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 280:	8b 55 fc             	mov    -0x4(%ebp),%edx
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	01 d0                	add    %edx,%eax
 288:	0f b6 00             	movzbl (%eax),%eax
 28b:	84 c0                	test   %al,%al
 28d:	75 ed                	jne    27c <strlen+0xf>
    ;
  return n;
 28f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 292:	c9                   	leave  
 293:	c3                   	ret    

00000294 <memset>:

void*
memset(void *dst, int c, uint n)
{
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 29a:	8b 45 10             	mov    0x10(%ebp),%eax
 29d:	89 44 24 08          	mov    %eax,0x8(%esp)
 2a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a4:	89 44 24 04          	mov    %eax,0x4(%esp)
 2a8:	8b 45 08             	mov    0x8(%ebp),%eax
 2ab:	89 04 24             	mov    %eax,(%esp)
 2ae:	e8 26 ff ff ff       	call   1d9 <stosb>
  return dst;
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2b6:	c9                   	leave  
 2b7:	c3                   	ret    

000002b8 <strchr>:

char*
strchr(const char *s, char c)
{
 2b8:	55                   	push   %ebp
 2b9:	89 e5                	mov    %esp,%ebp
 2bb:	83 ec 04             	sub    $0x4,%esp
 2be:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c1:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2c4:	eb 14                	jmp    2da <strchr+0x22>
    if(*s == c)
 2c6:	8b 45 08             	mov    0x8(%ebp),%eax
 2c9:	0f b6 00             	movzbl (%eax),%eax
 2cc:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2cf:	75 05                	jne    2d6 <strchr+0x1e>
      return (char*)s;
 2d1:	8b 45 08             	mov    0x8(%ebp),%eax
 2d4:	eb 13                	jmp    2e9 <strchr+0x31>
  for(; *s; s++)
 2d6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2da:	8b 45 08             	mov    0x8(%ebp),%eax
 2dd:	0f b6 00             	movzbl (%eax),%eax
 2e0:	84 c0                	test   %al,%al
 2e2:	75 e2                	jne    2c6 <strchr+0xe>
  return 0;
 2e4:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2e9:	c9                   	leave  
 2ea:	c3                   	ret    

000002eb <gets>:

char*
gets(char *buf, int max)
{
 2eb:	55                   	push   %ebp
 2ec:	89 e5                	mov    %esp,%ebp
 2ee:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2f1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2f8:	eb 4c                	jmp    346 <gets+0x5b>
    cc = read(0, &c, 1);
 2fa:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 301:	00 
 302:	8d 45 ef             	lea    -0x11(%ebp),%eax
 305:	89 44 24 04          	mov    %eax,0x4(%esp)
 309:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 310:	e8 57 02 00 00       	call   56c <read>
 315:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 318:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 31c:	7f 02                	jg     320 <gets+0x35>
      break;
 31e:	eb 31                	jmp    351 <gets+0x66>
    buf[i++] = c;
 320:	8b 45 f4             	mov    -0xc(%ebp),%eax
 323:	8d 50 01             	lea    0x1(%eax),%edx
 326:	89 55 f4             	mov    %edx,-0xc(%ebp)
 329:	89 c2                	mov    %eax,%edx
 32b:	8b 45 08             	mov    0x8(%ebp),%eax
 32e:	01 c2                	add    %eax,%edx
 330:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 334:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 336:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 33a:	3c 0a                	cmp    $0xa,%al
 33c:	74 13                	je     351 <gets+0x66>
 33e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 342:	3c 0d                	cmp    $0xd,%al
 344:	74 0b                	je     351 <gets+0x66>
  for(i=0; i+1 < max; ){
 346:	8b 45 f4             	mov    -0xc(%ebp),%eax
 349:	83 c0 01             	add    $0x1,%eax
 34c:	3b 45 0c             	cmp    0xc(%ebp),%eax
 34f:	7c a9                	jl     2fa <gets+0xf>
      break;
  }
  buf[i] = '\0';
 351:	8b 55 f4             	mov    -0xc(%ebp),%edx
 354:	8b 45 08             	mov    0x8(%ebp),%eax
 357:	01 d0                	add    %edx,%eax
 359:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 35c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 35f:	c9                   	leave  
 360:	c3                   	ret    

00000361 <stat>:

int
stat(const char *n, struct stat *st)
{
 361:	55                   	push   %ebp
 362:	89 e5                	mov    %esp,%ebp
 364:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 367:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 36e:	00 
 36f:	8b 45 08             	mov    0x8(%ebp),%eax
 372:	89 04 24             	mov    %eax,(%esp)
 375:	e8 1a 02 00 00       	call   594 <open>
 37a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 37d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 381:	79 07                	jns    38a <stat+0x29>
    return -1;
 383:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 388:	eb 23                	jmp    3ad <stat+0x4c>
  r = fstat(fd, st);
 38a:	8b 45 0c             	mov    0xc(%ebp),%eax
 38d:	89 44 24 04          	mov    %eax,0x4(%esp)
 391:	8b 45 f4             	mov    -0xc(%ebp),%eax
 394:	89 04 24             	mov    %eax,(%esp)
 397:	e8 10 02 00 00       	call   5ac <fstat>
 39c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 39f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3a2:	89 04 24             	mov    %eax,(%esp)
 3a5:	e8 d2 01 00 00       	call   57c <close>
  return r;
 3aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 3ad:	c9                   	leave  
 3ae:	c3                   	ret    

000003af <atoi>:

int
atoi(const char *s)
{
 3af:	55                   	push   %ebp
 3b0:	89 e5                	mov    %esp,%ebp
 3b2:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 3b5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3bc:	eb 25                	jmp    3e3 <atoi+0x34>
    n = n*10 + *s++ - '0';
 3be:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3c1:	89 d0                	mov    %edx,%eax
 3c3:	c1 e0 02             	shl    $0x2,%eax
 3c6:	01 d0                	add    %edx,%eax
 3c8:	01 c0                	add    %eax,%eax
 3ca:	89 c1                	mov    %eax,%ecx
 3cc:	8b 45 08             	mov    0x8(%ebp),%eax
 3cf:	8d 50 01             	lea    0x1(%eax),%edx
 3d2:	89 55 08             	mov    %edx,0x8(%ebp)
 3d5:	0f b6 00             	movzbl (%eax),%eax
 3d8:	0f be c0             	movsbl %al,%eax
 3db:	01 c8                	add    %ecx,%eax
 3dd:	83 e8 30             	sub    $0x30,%eax
 3e0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3e3:	8b 45 08             	mov    0x8(%ebp),%eax
 3e6:	0f b6 00             	movzbl (%eax),%eax
 3e9:	3c 2f                	cmp    $0x2f,%al
 3eb:	7e 0a                	jle    3f7 <atoi+0x48>
 3ed:	8b 45 08             	mov    0x8(%ebp),%eax
 3f0:	0f b6 00             	movzbl (%eax),%eax
 3f3:	3c 39                	cmp    $0x39,%al
 3f5:	7e c7                	jle    3be <atoi+0xf>
  return n;
 3f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3fa:	c9                   	leave  
 3fb:	c3                   	ret    

000003fc <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3fc:	55                   	push   %ebp
 3fd:	89 e5                	mov    %esp,%ebp
 3ff:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 402:	8b 45 08             	mov    0x8(%ebp),%eax
 405:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 408:	8b 45 0c             	mov    0xc(%ebp),%eax
 40b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 40e:	eb 17                	jmp    427 <memmove+0x2b>
    *dst++ = *src++;
 410:	8b 45 fc             	mov    -0x4(%ebp),%eax
 413:	8d 50 01             	lea    0x1(%eax),%edx
 416:	89 55 fc             	mov    %edx,-0x4(%ebp)
 419:	8b 55 f8             	mov    -0x8(%ebp),%edx
 41c:	8d 4a 01             	lea    0x1(%edx),%ecx
 41f:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 422:	0f b6 12             	movzbl (%edx),%edx
 425:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 427:	8b 45 10             	mov    0x10(%ebp),%eax
 42a:	8d 50 ff             	lea    -0x1(%eax),%edx
 42d:	89 55 10             	mov    %edx,0x10(%ebp)
 430:	85 c0                	test   %eax,%eax
 432:	7f dc                	jg     410 <memmove+0x14>
  return vdst;
 434:	8b 45 08             	mov    0x8(%ebp),%eax
}
 437:	c9                   	leave  
 438:	c3                   	ret    

00000439 <ps>:

void
ps() {
 439:	55                   	push   %ebp
 43a:	89 e5                	mov    %esp,%ebp
 43c:	57                   	push   %edi
 43d:	56                   	push   %esi
 43e:	53                   	push   %ebx
 43f:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  int i = 0;
 445:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  printf(1, "PID	TKTS	TCKS	STAT	NAME\n");
 44c:	c7 44 24 04 e0 0a 00 	movl   $0xae0,0x4(%esp)
 453:	00 
 454:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 45b:	e8 7c 02 00 00       	call   6dc <printf>
  getpinfo(&pstat);
 460:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 466:	89 04 24             	mov    %eax,(%esp)
 469:	e8 86 01 00 00       	call   5f4 <getpinfo>
  while (pstat[i].pid != 0) {
 46e:	e9 ad 00 00 00       	jmp    520 <ps+0xe7>
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
	pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 473:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 479:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 47c:	89 d0                	mov    %edx,%eax
 47e:	c1 e0 03             	shl    $0x3,%eax
 481:	01 d0                	add    %edx,%eax
 483:	c1 e0 02             	shl    $0x2,%eax
 486:	83 c0 10             	add    $0x10,%eax
 489:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 48c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 48f:	89 d0                	mov    %edx,%eax
 491:	c1 e0 03             	shl    $0x3,%eax
 494:	01 d0                	add    %edx,%eax
 496:	c1 e0 02             	shl    $0x2,%eax
 499:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 49c:	01 d8                	add    %ebx,%eax
 49e:	2d e4 08 00 00       	sub    $0x8e4,%eax
 4a3:	0f b6 00             	movzbl (%eax),%eax
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
 4a6:	0f be f0             	movsbl %al,%esi
 4a9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 4ac:	89 d0                	mov    %edx,%eax
 4ae:	c1 e0 03             	shl    $0x3,%eax
 4b1:	01 d0                	add    %edx,%eax
 4b3:	c1 e0 02             	shl    $0x2,%eax
 4b6:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 4b9:	01 c8                	add    %ecx,%eax
 4bb:	2d f8 08 00 00       	sub    $0x8f8,%eax
 4c0:	8b 18                	mov    (%eax),%ebx
 4c2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 4c5:	89 d0                	mov    %edx,%eax
 4c7:	c1 e0 03             	shl    $0x3,%eax
 4ca:	01 d0                	add    %edx,%eax
 4cc:	c1 e0 02             	shl    $0x2,%eax
 4cf:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 4d2:	01 c8                	add    %ecx,%eax
 4d4:	2d 00 09 00 00       	sub    $0x900,%eax
 4d9:	8b 08                	mov    (%eax),%ecx
 4db:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 4de:	89 d0                	mov    %edx,%eax
 4e0:	c1 e0 03             	shl    $0x3,%eax
 4e3:	01 d0                	add    %edx,%eax
 4e5:	c1 e0 02             	shl    $0x2,%eax
 4e8:	8d 55 e8             	lea    -0x18(%ebp),%edx
 4eb:	01 d0                	add    %edx,%eax
 4ed:	2d fc 08 00 00       	sub    $0x8fc,%eax
 4f2:	8b 00                	mov    (%eax),%eax
 4f4:	89 7c 24 18          	mov    %edi,0x18(%esp)
 4f8:	89 74 24 14          	mov    %esi,0x14(%esp)
 4fc:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 500:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 504:	89 44 24 08          	mov    %eax,0x8(%esp)
 508:	c7 44 24 04 f9 0a 00 	movl   $0xaf9,0x4(%esp)
 50f:	00 
 510:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 517:	e8 c0 01 00 00       	call   6dc <printf>
      i++;
 51c:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  while (pstat[i].pid != 0) {
 520:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 523:	89 d0                	mov    %edx,%eax
 525:	c1 e0 03             	shl    $0x3,%eax
 528:	01 d0                	add    %edx,%eax
 52a:	c1 e0 02             	shl    $0x2,%eax
 52d:	8d 75 e8             	lea    -0x18(%ebp),%esi
 530:	01 f0                	add    %esi,%eax
 532:	2d fc 08 00 00       	sub    $0x8fc,%eax
 537:	8b 00                	mov    (%eax),%eax
 539:	85 c0                	test   %eax,%eax
 53b:	0f 85 32 ff ff ff    	jne    473 <ps+0x3a>
  }
}
 541:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 547:	5b                   	pop    %ebx
 548:	5e                   	pop    %esi
 549:	5f                   	pop    %edi
 54a:	5d                   	pop    %ebp
 54b:	c3                   	ret    

0000054c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 54c:	b8 01 00 00 00       	mov    $0x1,%eax
 551:	cd 40                	int    $0x40
 553:	c3                   	ret    

00000554 <exit>:
SYSCALL(exit)
 554:	b8 02 00 00 00       	mov    $0x2,%eax
 559:	cd 40                	int    $0x40
 55b:	c3                   	ret    

0000055c <wait>:
SYSCALL(wait)
 55c:	b8 03 00 00 00       	mov    $0x3,%eax
 561:	cd 40                	int    $0x40
 563:	c3                   	ret    

00000564 <pipe>:
SYSCALL(pipe)
 564:	b8 04 00 00 00       	mov    $0x4,%eax
 569:	cd 40                	int    $0x40
 56b:	c3                   	ret    

0000056c <read>:
SYSCALL(read)
 56c:	b8 05 00 00 00       	mov    $0x5,%eax
 571:	cd 40                	int    $0x40
 573:	c3                   	ret    

00000574 <write>:
SYSCALL(write)
 574:	b8 10 00 00 00       	mov    $0x10,%eax
 579:	cd 40                	int    $0x40
 57b:	c3                   	ret    

0000057c <close>:
SYSCALL(close)
 57c:	b8 15 00 00 00       	mov    $0x15,%eax
 581:	cd 40                	int    $0x40
 583:	c3                   	ret    

00000584 <kill>:
SYSCALL(kill)
 584:	b8 06 00 00 00       	mov    $0x6,%eax
 589:	cd 40                	int    $0x40
 58b:	c3                   	ret    

0000058c <exec>:
SYSCALL(exec)
 58c:	b8 07 00 00 00       	mov    $0x7,%eax
 591:	cd 40                	int    $0x40
 593:	c3                   	ret    

00000594 <open>:
SYSCALL(open)
 594:	b8 0f 00 00 00       	mov    $0xf,%eax
 599:	cd 40                	int    $0x40
 59b:	c3                   	ret    

0000059c <mknod>:
SYSCALL(mknod)
 59c:	b8 11 00 00 00       	mov    $0x11,%eax
 5a1:	cd 40                	int    $0x40
 5a3:	c3                   	ret    

000005a4 <unlink>:
SYSCALL(unlink)
 5a4:	b8 12 00 00 00       	mov    $0x12,%eax
 5a9:	cd 40                	int    $0x40
 5ab:	c3                   	ret    

000005ac <fstat>:
SYSCALL(fstat)
 5ac:	b8 08 00 00 00       	mov    $0x8,%eax
 5b1:	cd 40                	int    $0x40
 5b3:	c3                   	ret    

000005b4 <link>:
SYSCALL(link)
 5b4:	b8 13 00 00 00       	mov    $0x13,%eax
 5b9:	cd 40                	int    $0x40
 5bb:	c3                   	ret    

000005bc <mkdir>:
SYSCALL(mkdir)
 5bc:	b8 14 00 00 00       	mov    $0x14,%eax
 5c1:	cd 40                	int    $0x40
 5c3:	c3                   	ret    

000005c4 <chdir>:
SYSCALL(chdir)
 5c4:	b8 09 00 00 00       	mov    $0x9,%eax
 5c9:	cd 40                	int    $0x40
 5cb:	c3                   	ret    

000005cc <dup>:
SYSCALL(dup)
 5cc:	b8 0a 00 00 00       	mov    $0xa,%eax
 5d1:	cd 40                	int    $0x40
 5d3:	c3                   	ret    

000005d4 <getpid>:
SYSCALL(getpid)
 5d4:	b8 0b 00 00 00       	mov    $0xb,%eax
 5d9:	cd 40                	int    $0x40
 5db:	c3                   	ret    

000005dc <sbrk>:
SYSCALL(sbrk)
 5dc:	b8 0c 00 00 00       	mov    $0xc,%eax
 5e1:	cd 40                	int    $0x40
 5e3:	c3                   	ret    

000005e4 <sleep>:
SYSCALL(sleep)
 5e4:	b8 0d 00 00 00       	mov    $0xd,%eax
 5e9:	cd 40                	int    $0x40
 5eb:	c3                   	ret    

000005ec <uptime>:
SYSCALL(uptime)
 5ec:	b8 0e 00 00 00       	mov    $0xe,%eax
 5f1:	cd 40                	int    $0x40
 5f3:	c3                   	ret    

000005f4 <getpinfo>:
SYSCALL(getpinfo)
 5f4:	b8 16 00 00 00       	mov    $0x16,%eax
 5f9:	cd 40                	int    $0x40
 5fb:	c3                   	ret    

000005fc <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5fc:	55                   	push   %ebp
 5fd:	89 e5                	mov    %esp,%ebp
 5ff:	83 ec 18             	sub    $0x18,%esp
 602:	8b 45 0c             	mov    0xc(%ebp),%eax
 605:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 608:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 60f:	00 
 610:	8d 45 f4             	lea    -0xc(%ebp),%eax
 613:	89 44 24 04          	mov    %eax,0x4(%esp)
 617:	8b 45 08             	mov    0x8(%ebp),%eax
 61a:	89 04 24             	mov    %eax,(%esp)
 61d:	e8 52 ff ff ff       	call   574 <write>
}
 622:	c9                   	leave  
 623:	c3                   	ret    

00000624 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 624:	55                   	push   %ebp
 625:	89 e5                	mov    %esp,%ebp
 627:	56                   	push   %esi
 628:	53                   	push   %ebx
 629:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 62c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 633:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 637:	74 17                	je     650 <printint+0x2c>
 639:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 63d:	79 11                	jns    650 <printint+0x2c>
    neg = 1;
 63f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 646:	8b 45 0c             	mov    0xc(%ebp),%eax
 649:	f7 d8                	neg    %eax
 64b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 64e:	eb 06                	jmp    656 <printint+0x32>
  } else {
    x = xx;
 650:	8b 45 0c             	mov    0xc(%ebp),%eax
 653:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 656:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 65d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 660:	8d 41 01             	lea    0x1(%ecx),%eax
 663:	89 45 f4             	mov    %eax,-0xc(%ebp)
 666:	8b 5d 10             	mov    0x10(%ebp),%ebx
 669:	8b 45 ec             	mov    -0x14(%ebp),%eax
 66c:	ba 00 00 00 00       	mov    $0x0,%edx
 671:	f7 f3                	div    %ebx
 673:	89 d0                	mov    %edx,%eax
 675:	0f b6 80 a4 0d 00 00 	movzbl 0xda4(%eax),%eax
 67c:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 680:	8b 75 10             	mov    0x10(%ebp),%esi
 683:	8b 45 ec             	mov    -0x14(%ebp),%eax
 686:	ba 00 00 00 00       	mov    $0x0,%edx
 68b:	f7 f6                	div    %esi
 68d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 690:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 694:	75 c7                	jne    65d <printint+0x39>
  if(neg)
 696:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 69a:	74 10                	je     6ac <printint+0x88>
    buf[i++] = '-';
 69c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 69f:	8d 50 01             	lea    0x1(%eax),%edx
 6a2:	89 55 f4             	mov    %edx,-0xc(%ebp)
 6a5:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 6aa:	eb 1f                	jmp    6cb <printint+0xa7>
 6ac:	eb 1d                	jmp    6cb <printint+0xa7>
    putc(fd, buf[i]);
 6ae:	8d 55 dc             	lea    -0x24(%ebp),%edx
 6b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6b4:	01 d0                	add    %edx,%eax
 6b6:	0f b6 00             	movzbl (%eax),%eax
 6b9:	0f be c0             	movsbl %al,%eax
 6bc:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c0:	8b 45 08             	mov    0x8(%ebp),%eax
 6c3:	89 04 24             	mov    %eax,(%esp)
 6c6:	e8 31 ff ff ff       	call   5fc <putc>
  while(--i >= 0)
 6cb:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 6cf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6d3:	79 d9                	jns    6ae <printint+0x8a>
}
 6d5:	83 c4 30             	add    $0x30,%esp
 6d8:	5b                   	pop    %ebx
 6d9:	5e                   	pop    %esi
 6da:	5d                   	pop    %ebp
 6db:	c3                   	ret    

000006dc <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6dc:	55                   	push   %ebp
 6dd:	89 e5                	mov    %esp,%ebp
 6df:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 6e2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 6e9:	8d 45 0c             	lea    0xc(%ebp),%eax
 6ec:	83 c0 04             	add    $0x4,%eax
 6ef:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 6f2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 6f9:	e9 7c 01 00 00       	jmp    87a <printf+0x19e>
    c = fmt[i] & 0xff;
 6fe:	8b 55 0c             	mov    0xc(%ebp),%edx
 701:	8b 45 f0             	mov    -0x10(%ebp),%eax
 704:	01 d0                	add    %edx,%eax
 706:	0f b6 00             	movzbl (%eax),%eax
 709:	0f be c0             	movsbl %al,%eax
 70c:	25 ff 00 00 00       	and    $0xff,%eax
 711:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 714:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 718:	75 2c                	jne    746 <printf+0x6a>
      if(c == '%'){
 71a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 71e:	75 0c                	jne    72c <printf+0x50>
        state = '%';
 720:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 727:	e9 4a 01 00 00       	jmp    876 <printf+0x19a>
      } else {
        putc(fd, c);
 72c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 72f:	0f be c0             	movsbl %al,%eax
 732:	89 44 24 04          	mov    %eax,0x4(%esp)
 736:	8b 45 08             	mov    0x8(%ebp),%eax
 739:	89 04 24             	mov    %eax,(%esp)
 73c:	e8 bb fe ff ff       	call   5fc <putc>
 741:	e9 30 01 00 00       	jmp    876 <printf+0x19a>
      }
    } else if(state == '%'){
 746:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 74a:	0f 85 26 01 00 00    	jne    876 <printf+0x19a>
      if(c == 'd'){
 750:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 754:	75 2d                	jne    783 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 756:	8b 45 e8             	mov    -0x18(%ebp),%eax
 759:	8b 00                	mov    (%eax),%eax
 75b:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 762:	00 
 763:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 76a:	00 
 76b:	89 44 24 04          	mov    %eax,0x4(%esp)
 76f:	8b 45 08             	mov    0x8(%ebp),%eax
 772:	89 04 24             	mov    %eax,(%esp)
 775:	e8 aa fe ff ff       	call   624 <printint>
        ap++;
 77a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 77e:	e9 ec 00 00 00       	jmp    86f <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 783:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 787:	74 06                	je     78f <printf+0xb3>
 789:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 78d:	75 2d                	jne    7bc <printf+0xe0>
        printint(fd, *ap, 16, 0);
 78f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 792:	8b 00                	mov    (%eax),%eax
 794:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 79b:	00 
 79c:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 7a3:	00 
 7a4:	89 44 24 04          	mov    %eax,0x4(%esp)
 7a8:	8b 45 08             	mov    0x8(%ebp),%eax
 7ab:	89 04 24             	mov    %eax,(%esp)
 7ae:	e8 71 fe ff ff       	call   624 <printint>
        ap++;
 7b3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7b7:	e9 b3 00 00 00       	jmp    86f <printf+0x193>
      } else if(c == 's'){
 7bc:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 7c0:	75 45                	jne    807 <printf+0x12b>
        s = (char*)*ap;
 7c2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7c5:	8b 00                	mov    (%eax),%eax
 7c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 7ca:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 7ce:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7d2:	75 09                	jne    7dd <printf+0x101>
          s = "(null)";
 7d4:	c7 45 f4 09 0b 00 00 	movl   $0xb09,-0xc(%ebp)
        while(*s != 0){
 7db:	eb 1e                	jmp    7fb <printf+0x11f>
 7dd:	eb 1c                	jmp    7fb <printf+0x11f>
          putc(fd, *s);
 7df:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e2:	0f b6 00             	movzbl (%eax),%eax
 7e5:	0f be c0             	movsbl %al,%eax
 7e8:	89 44 24 04          	mov    %eax,0x4(%esp)
 7ec:	8b 45 08             	mov    0x8(%ebp),%eax
 7ef:	89 04 24             	mov    %eax,(%esp)
 7f2:	e8 05 fe ff ff       	call   5fc <putc>
          s++;
 7f7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 7fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7fe:	0f b6 00             	movzbl (%eax),%eax
 801:	84 c0                	test   %al,%al
 803:	75 da                	jne    7df <printf+0x103>
 805:	eb 68                	jmp    86f <printf+0x193>
        }
      } else if(c == 'c'){
 807:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 80b:	75 1d                	jne    82a <printf+0x14e>
        putc(fd, *ap);
 80d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 810:	8b 00                	mov    (%eax),%eax
 812:	0f be c0             	movsbl %al,%eax
 815:	89 44 24 04          	mov    %eax,0x4(%esp)
 819:	8b 45 08             	mov    0x8(%ebp),%eax
 81c:	89 04 24             	mov    %eax,(%esp)
 81f:	e8 d8 fd ff ff       	call   5fc <putc>
        ap++;
 824:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 828:	eb 45                	jmp    86f <printf+0x193>
      } else if(c == '%'){
 82a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 82e:	75 17                	jne    847 <printf+0x16b>
        putc(fd, c);
 830:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 833:	0f be c0             	movsbl %al,%eax
 836:	89 44 24 04          	mov    %eax,0x4(%esp)
 83a:	8b 45 08             	mov    0x8(%ebp),%eax
 83d:	89 04 24             	mov    %eax,(%esp)
 840:	e8 b7 fd ff ff       	call   5fc <putc>
 845:	eb 28                	jmp    86f <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 847:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 84e:	00 
 84f:	8b 45 08             	mov    0x8(%ebp),%eax
 852:	89 04 24             	mov    %eax,(%esp)
 855:	e8 a2 fd ff ff       	call   5fc <putc>
        putc(fd, c);
 85a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 85d:	0f be c0             	movsbl %al,%eax
 860:	89 44 24 04          	mov    %eax,0x4(%esp)
 864:	8b 45 08             	mov    0x8(%ebp),%eax
 867:	89 04 24             	mov    %eax,(%esp)
 86a:	e8 8d fd ff ff       	call   5fc <putc>
      }
      state = 0;
 86f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 876:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 87a:	8b 55 0c             	mov    0xc(%ebp),%edx
 87d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 880:	01 d0                	add    %edx,%eax
 882:	0f b6 00             	movzbl (%eax),%eax
 885:	84 c0                	test   %al,%al
 887:	0f 85 71 fe ff ff    	jne    6fe <printf+0x22>
    }
  }
}
 88d:	c9                   	leave  
 88e:	c3                   	ret    

0000088f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 88f:	55                   	push   %ebp
 890:	89 e5                	mov    %esp,%ebp
 892:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 895:	8b 45 08             	mov    0x8(%ebp),%eax
 898:	83 e8 08             	sub    $0x8,%eax
 89b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 89e:	a1 c8 0d 00 00       	mov    0xdc8,%eax
 8a3:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8a6:	eb 24                	jmp    8cc <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ab:	8b 00                	mov    (%eax),%eax
 8ad:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8b0:	77 12                	ja     8c4 <free+0x35>
 8b2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8b5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8b8:	77 24                	ja     8de <free+0x4f>
 8ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8bd:	8b 00                	mov    (%eax),%eax
 8bf:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8c2:	77 1a                	ja     8de <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c7:	8b 00                	mov    (%eax),%eax
 8c9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8cc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8cf:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8d2:	76 d4                	jbe    8a8 <free+0x19>
 8d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d7:	8b 00                	mov    (%eax),%eax
 8d9:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8dc:	76 ca                	jbe    8a8 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8de:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8e1:	8b 40 04             	mov    0x4(%eax),%eax
 8e4:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8eb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8ee:	01 c2                	add    %eax,%edx
 8f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f3:	8b 00                	mov    (%eax),%eax
 8f5:	39 c2                	cmp    %eax,%edx
 8f7:	75 24                	jne    91d <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 8f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8fc:	8b 50 04             	mov    0x4(%eax),%edx
 8ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
 902:	8b 00                	mov    (%eax),%eax
 904:	8b 40 04             	mov    0x4(%eax),%eax
 907:	01 c2                	add    %eax,%edx
 909:	8b 45 f8             	mov    -0x8(%ebp),%eax
 90c:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 90f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 912:	8b 00                	mov    (%eax),%eax
 914:	8b 10                	mov    (%eax),%edx
 916:	8b 45 f8             	mov    -0x8(%ebp),%eax
 919:	89 10                	mov    %edx,(%eax)
 91b:	eb 0a                	jmp    927 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 91d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 920:	8b 10                	mov    (%eax),%edx
 922:	8b 45 f8             	mov    -0x8(%ebp),%eax
 925:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 927:	8b 45 fc             	mov    -0x4(%ebp),%eax
 92a:	8b 40 04             	mov    0x4(%eax),%eax
 92d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 934:	8b 45 fc             	mov    -0x4(%ebp),%eax
 937:	01 d0                	add    %edx,%eax
 939:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 93c:	75 20                	jne    95e <free+0xcf>
    p->s.size += bp->s.size;
 93e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 941:	8b 50 04             	mov    0x4(%eax),%edx
 944:	8b 45 f8             	mov    -0x8(%ebp),%eax
 947:	8b 40 04             	mov    0x4(%eax),%eax
 94a:	01 c2                	add    %eax,%edx
 94c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 94f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 952:	8b 45 f8             	mov    -0x8(%ebp),%eax
 955:	8b 10                	mov    (%eax),%edx
 957:	8b 45 fc             	mov    -0x4(%ebp),%eax
 95a:	89 10                	mov    %edx,(%eax)
 95c:	eb 08                	jmp    966 <free+0xd7>
  } else
    p->s.ptr = bp;
 95e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 961:	8b 55 f8             	mov    -0x8(%ebp),%edx
 964:	89 10                	mov    %edx,(%eax)
  freep = p;
 966:	8b 45 fc             	mov    -0x4(%ebp),%eax
 969:	a3 c8 0d 00 00       	mov    %eax,0xdc8
}
 96e:	c9                   	leave  
 96f:	c3                   	ret    

00000970 <morecore>:

static Header*
morecore(uint nu)
{
 970:	55                   	push   %ebp
 971:	89 e5                	mov    %esp,%ebp
 973:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 976:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 97d:	77 07                	ja     986 <morecore+0x16>
    nu = 4096;
 97f:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 986:	8b 45 08             	mov    0x8(%ebp),%eax
 989:	c1 e0 03             	shl    $0x3,%eax
 98c:	89 04 24             	mov    %eax,(%esp)
 98f:	e8 48 fc ff ff       	call   5dc <sbrk>
 994:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 997:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 99b:	75 07                	jne    9a4 <morecore+0x34>
    return 0;
 99d:	b8 00 00 00 00       	mov    $0x0,%eax
 9a2:	eb 22                	jmp    9c6 <morecore+0x56>
  hp = (Header*)p;
 9a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 9aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9ad:	8b 55 08             	mov    0x8(%ebp),%edx
 9b0:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 9b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9b6:	83 c0 08             	add    $0x8,%eax
 9b9:	89 04 24             	mov    %eax,(%esp)
 9bc:	e8 ce fe ff ff       	call   88f <free>
  return freep;
 9c1:	a1 c8 0d 00 00       	mov    0xdc8,%eax
}
 9c6:	c9                   	leave  
 9c7:	c3                   	ret    

000009c8 <malloc>:

void*
malloc(uint nbytes)
{
 9c8:	55                   	push   %ebp
 9c9:	89 e5                	mov    %esp,%ebp
 9cb:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9ce:	8b 45 08             	mov    0x8(%ebp),%eax
 9d1:	83 c0 07             	add    $0x7,%eax
 9d4:	c1 e8 03             	shr    $0x3,%eax
 9d7:	83 c0 01             	add    $0x1,%eax
 9da:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 9dd:	a1 c8 0d 00 00       	mov    0xdc8,%eax
 9e2:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9e5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 9e9:	75 23                	jne    a0e <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 9eb:	c7 45 f0 c0 0d 00 00 	movl   $0xdc0,-0x10(%ebp)
 9f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9f5:	a3 c8 0d 00 00       	mov    %eax,0xdc8
 9fa:	a1 c8 0d 00 00       	mov    0xdc8,%eax
 9ff:	a3 c0 0d 00 00       	mov    %eax,0xdc0
    base.s.size = 0;
 a04:	c7 05 c4 0d 00 00 00 	movl   $0x0,0xdc4
 a0b:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a11:	8b 00                	mov    (%eax),%eax
 a13:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a16:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a19:	8b 40 04             	mov    0x4(%eax),%eax
 a1c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a1f:	72 4d                	jb     a6e <malloc+0xa6>
      if(p->s.size == nunits)
 a21:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a24:	8b 40 04             	mov    0x4(%eax),%eax
 a27:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a2a:	75 0c                	jne    a38 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a2f:	8b 10                	mov    (%eax),%edx
 a31:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a34:	89 10                	mov    %edx,(%eax)
 a36:	eb 26                	jmp    a5e <malloc+0x96>
      else {
        p->s.size -= nunits;
 a38:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a3b:	8b 40 04             	mov    0x4(%eax),%eax
 a3e:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a41:	89 c2                	mov    %eax,%edx
 a43:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a46:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a49:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a4c:	8b 40 04             	mov    0x4(%eax),%eax
 a4f:	c1 e0 03             	shl    $0x3,%eax
 a52:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a55:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a58:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a5b:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a5e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a61:	a3 c8 0d 00 00       	mov    %eax,0xdc8
      return (void*)(p + 1);
 a66:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a69:	83 c0 08             	add    $0x8,%eax
 a6c:	eb 38                	jmp    aa6 <malloc+0xde>
    }
    if(p == freep)
 a6e:	a1 c8 0d 00 00       	mov    0xdc8,%eax
 a73:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a76:	75 1b                	jne    a93 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 a78:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a7b:	89 04 24             	mov    %eax,(%esp)
 a7e:	e8 ed fe ff ff       	call   970 <morecore>
 a83:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a86:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a8a:	75 07                	jne    a93 <malloc+0xcb>
        return 0;
 a8c:	b8 00 00 00 00       	mov    $0x0,%eax
 a91:	eb 13                	jmp    aa6 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a93:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a96:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a99:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a9c:	8b 00                	mov    (%eax),%eax
 a9e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 aa1:	e9 70 ff ff ff       	jmp    a16 <malloc+0x4e>
}
 aa6:	c9                   	leave  
 aa7:	c3                   	ret    
