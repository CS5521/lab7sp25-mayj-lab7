
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
  54:	c7 04 24 b0 0a 00 00 	movl   $0xab0,(%esp)
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
  b8:	c7 44 24 04 b6 0a 00 	movl   $0xab6,0x4(%esp)
  bf:	00 
  c0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c7:	e8 18 06 00 00       	call   6e4 <printf>
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
  ed:	c7 44 24 04 c6 0a 00 	movl   $0xac6,0x4(%esp)
  f4:	00 
  f5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  fc:	e8 e3 05 00 00       	call   6e4 <printf>
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
 112:	c7 44 24 04 d3 0a 00 	movl   $0xad3,0x4(%esp)
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
 17b:	c7 44 24 04 d4 0a 00 	movl   $0xad4,0x4(%esp)
 182:	00 
 183:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 18a:	e8 55 05 00 00       	call   6e4 <printf>
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
 44c:	c7 44 24 04 e8 0a 00 	movl   $0xae8,0x4(%esp)
 453:	00 
 454:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 45b:	e8 84 02 00 00       	call   6e4 <printf>
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
 508:	c7 44 24 04 01 0b 00 	movl   $0xb01,0x4(%esp)
 50f:	00 
 510:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 517:	e8 c8 01 00 00       	call   6e4 <printf>
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

000005fc <settickets>:
SYSCALL(settickets)
 5fc:	b8 17 00 00 00       	mov    $0x17,%eax
 601:	cd 40                	int    $0x40
 603:	c3                   	ret    

00000604 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 604:	55                   	push   %ebp
 605:	89 e5                	mov    %esp,%ebp
 607:	83 ec 18             	sub    $0x18,%esp
 60a:	8b 45 0c             	mov    0xc(%ebp),%eax
 60d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 610:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 617:	00 
 618:	8d 45 f4             	lea    -0xc(%ebp),%eax
 61b:	89 44 24 04          	mov    %eax,0x4(%esp)
 61f:	8b 45 08             	mov    0x8(%ebp),%eax
 622:	89 04 24             	mov    %eax,(%esp)
 625:	e8 4a ff ff ff       	call   574 <write>
}
 62a:	c9                   	leave  
 62b:	c3                   	ret    

0000062c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 62c:	55                   	push   %ebp
 62d:	89 e5                	mov    %esp,%ebp
 62f:	56                   	push   %esi
 630:	53                   	push   %ebx
 631:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 634:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 63b:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 63f:	74 17                	je     658 <printint+0x2c>
 641:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 645:	79 11                	jns    658 <printint+0x2c>
    neg = 1;
 647:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 64e:	8b 45 0c             	mov    0xc(%ebp),%eax
 651:	f7 d8                	neg    %eax
 653:	89 45 ec             	mov    %eax,-0x14(%ebp)
 656:	eb 06                	jmp    65e <printint+0x32>
  } else {
    x = xx;
 658:	8b 45 0c             	mov    0xc(%ebp),%eax
 65b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 65e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 665:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 668:	8d 41 01             	lea    0x1(%ecx),%eax
 66b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 66e:	8b 5d 10             	mov    0x10(%ebp),%ebx
 671:	8b 45 ec             	mov    -0x14(%ebp),%eax
 674:	ba 00 00 00 00       	mov    $0x0,%edx
 679:	f7 f3                	div    %ebx
 67b:	89 d0                	mov    %edx,%eax
 67d:	0f b6 80 ac 0d 00 00 	movzbl 0xdac(%eax),%eax
 684:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 688:	8b 75 10             	mov    0x10(%ebp),%esi
 68b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 68e:	ba 00 00 00 00       	mov    $0x0,%edx
 693:	f7 f6                	div    %esi
 695:	89 45 ec             	mov    %eax,-0x14(%ebp)
 698:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 69c:	75 c7                	jne    665 <printint+0x39>
  if(neg)
 69e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6a2:	74 10                	je     6b4 <printint+0x88>
    buf[i++] = '-';
 6a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6a7:	8d 50 01             	lea    0x1(%eax),%edx
 6aa:	89 55 f4             	mov    %edx,-0xc(%ebp)
 6ad:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 6b2:	eb 1f                	jmp    6d3 <printint+0xa7>
 6b4:	eb 1d                	jmp    6d3 <printint+0xa7>
    putc(fd, buf[i]);
 6b6:	8d 55 dc             	lea    -0x24(%ebp),%edx
 6b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6bc:	01 d0                	add    %edx,%eax
 6be:	0f b6 00             	movzbl (%eax),%eax
 6c1:	0f be c0             	movsbl %al,%eax
 6c4:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c8:	8b 45 08             	mov    0x8(%ebp),%eax
 6cb:	89 04 24             	mov    %eax,(%esp)
 6ce:	e8 31 ff ff ff       	call   604 <putc>
  while(--i >= 0)
 6d3:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 6d7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6db:	79 d9                	jns    6b6 <printint+0x8a>
}
 6dd:	83 c4 30             	add    $0x30,%esp
 6e0:	5b                   	pop    %ebx
 6e1:	5e                   	pop    %esi
 6e2:	5d                   	pop    %ebp
 6e3:	c3                   	ret    

000006e4 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6e4:	55                   	push   %ebp
 6e5:	89 e5                	mov    %esp,%ebp
 6e7:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 6ea:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 6f1:	8d 45 0c             	lea    0xc(%ebp),%eax
 6f4:	83 c0 04             	add    $0x4,%eax
 6f7:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 6fa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 701:	e9 7c 01 00 00       	jmp    882 <printf+0x19e>
    c = fmt[i] & 0xff;
 706:	8b 55 0c             	mov    0xc(%ebp),%edx
 709:	8b 45 f0             	mov    -0x10(%ebp),%eax
 70c:	01 d0                	add    %edx,%eax
 70e:	0f b6 00             	movzbl (%eax),%eax
 711:	0f be c0             	movsbl %al,%eax
 714:	25 ff 00 00 00       	and    $0xff,%eax
 719:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 71c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 720:	75 2c                	jne    74e <printf+0x6a>
      if(c == '%'){
 722:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 726:	75 0c                	jne    734 <printf+0x50>
        state = '%';
 728:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 72f:	e9 4a 01 00 00       	jmp    87e <printf+0x19a>
      } else {
        putc(fd, c);
 734:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 737:	0f be c0             	movsbl %al,%eax
 73a:	89 44 24 04          	mov    %eax,0x4(%esp)
 73e:	8b 45 08             	mov    0x8(%ebp),%eax
 741:	89 04 24             	mov    %eax,(%esp)
 744:	e8 bb fe ff ff       	call   604 <putc>
 749:	e9 30 01 00 00       	jmp    87e <printf+0x19a>
      }
    } else if(state == '%'){
 74e:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 752:	0f 85 26 01 00 00    	jne    87e <printf+0x19a>
      if(c == 'd'){
 758:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 75c:	75 2d                	jne    78b <printf+0xa7>
        printint(fd, *ap, 10, 1);
 75e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 761:	8b 00                	mov    (%eax),%eax
 763:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 76a:	00 
 76b:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 772:	00 
 773:	89 44 24 04          	mov    %eax,0x4(%esp)
 777:	8b 45 08             	mov    0x8(%ebp),%eax
 77a:	89 04 24             	mov    %eax,(%esp)
 77d:	e8 aa fe ff ff       	call   62c <printint>
        ap++;
 782:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 786:	e9 ec 00 00 00       	jmp    877 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 78b:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 78f:	74 06                	je     797 <printf+0xb3>
 791:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 795:	75 2d                	jne    7c4 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 797:	8b 45 e8             	mov    -0x18(%ebp),%eax
 79a:	8b 00                	mov    (%eax),%eax
 79c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 7a3:	00 
 7a4:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 7ab:	00 
 7ac:	89 44 24 04          	mov    %eax,0x4(%esp)
 7b0:	8b 45 08             	mov    0x8(%ebp),%eax
 7b3:	89 04 24             	mov    %eax,(%esp)
 7b6:	e8 71 fe ff ff       	call   62c <printint>
        ap++;
 7bb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7bf:	e9 b3 00 00 00       	jmp    877 <printf+0x193>
      } else if(c == 's'){
 7c4:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 7c8:	75 45                	jne    80f <printf+0x12b>
        s = (char*)*ap;
 7ca:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7cd:	8b 00                	mov    (%eax),%eax
 7cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 7d2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 7d6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7da:	75 09                	jne    7e5 <printf+0x101>
          s = "(null)";
 7dc:	c7 45 f4 11 0b 00 00 	movl   $0xb11,-0xc(%ebp)
        while(*s != 0){
 7e3:	eb 1e                	jmp    803 <printf+0x11f>
 7e5:	eb 1c                	jmp    803 <printf+0x11f>
          putc(fd, *s);
 7e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ea:	0f b6 00             	movzbl (%eax),%eax
 7ed:	0f be c0             	movsbl %al,%eax
 7f0:	89 44 24 04          	mov    %eax,0x4(%esp)
 7f4:	8b 45 08             	mov    0x8(%ebp),%eax
 7f7:	89 04 24             	mov    %eax,(%esp)
 7fa:	e8 05 fe ff ff       	call   604 <putc>
          s++;
 7ff:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 803:	8b 45 f4             	mov    -0xc(%ebp),%eax
 806:	0f b6 00             	movzbl (%eax),%eax
 809:	84 c0                	test   %al,%al
 80b:	75 da                	jne    7e7 <printf+0x103>
 80d:	eb 68                	jmp    877 <printf+0x193>
        }
      } else if(c == 'c'){
 80f:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 813:	75 1d                	jne    832 <printf+0x14e>
        putc(fd, *ap);
 815:	8b 45 e8             	mov    -0x18(%ebp),%eax
 818:	8b 00                	mov    (%eax),%eax
 81a:	0f be c0             	movsbl %al,%eax
 81d:	89 44 24 04          	mov    %eax,0x4(%esp)
 821:	8b 45 08             	mov    0x8(%ebp),%eax
 824:	89 04 24             	mov    %eax,(%esp)
 827:	e8 d8 fd ff ff       	call   604 <putc>
        ap++;
 82c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 830:	eb 45                	jmp    877 <printf+0x193>
      } else if(c == '%'){
 832:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 836:	75 17                	jne    84f <printf+0x16b>
        putc(fd, c);
 838:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 83b:	0f be c0             	movsbl %al,%eax
 83e:	89 44 24 04          	mov    %eax,0x4(%esp)
 842:	8b 45 08             	mov    0x8(%ebp),%eax
 845:	89 04 24             	mov    %eax,(%esp)
 848:	e8 b7 fd ff ff       	call   604 <putc>
 84d:	eb 28                	jmp    877 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 84f:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 856:	00 
 857:	8b 45 08             	mov    0x8(%ebp),%eax
 85a:	89 04 24             	mov    %eax,(%esp)
 85d:	e8 a2 fd ff ff       	call   604 <putc>
        putc(fd, c);
 862:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 865:	0f be c0             	movsbl %al,%eax
 868:	89 44 24 04          	mov    %eax,0x4(%esp)
 86c:	8b 45 08             	mov    0x8(%ebp),%eax
 86f:	89 04 24             	mov    %eax,(%esp)
 872:	e8 8d fd ff ff       	call   604 <putc>
      }
      state = 0;
 877:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 87e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 882:	8b 55 0c             	mov    0xc(%ebp),%edx
 885:	8b 45 f0             	mov    -0x10(%ebp),%eax
 888:	01 d0                	add    %edx,%eax
 88a:	0f b6 00             	movzbl (%eax),%eax
 88d:	84 c0                	test   %al,%al
 88f:	0f 85 71 fe ff ff    	jne    706 <printf+0x22>
    }
  }
}
 895:	c9                   	leave  
 896:	c3                   	ret    

00000897 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 897:	55                   	push   %ebp
 898:	89 e5                	mov    %esp,%ebp
 89a:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 89d:	8b 45 08             	mov    0x8(%ebp),%eax
 8a0:	83 e8 08             	sub    $0x8,%eax
 8a3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8a6:	a1 c8 0d 00 00       	mov    0xdc8,%eax
 8ab:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8ae:	eb 24                	jmp    8d4 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b3:	8b 00                	mov    (%eax),%eax
 8b5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8b8:	77 12                	ja     8cc <free+0x35>
 8ba:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8bd:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8c0:	77 24                	ja     8e6 <free+0x4f>
 8c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c5:	8b 00                	mov    (%eax),%eax
 8c7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8ca:	77 1a                	ja     8e6 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8cf:	8b 00                	mov    (%eax),%eax
 8d1:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8d4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8d7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8da:	76 d4                	jbe    8b0 <free+0x19>
 8dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8df:	8b 00                	mov    (%eax),%eax
 8e1:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8e4:	76 ca                	jbe    8b0 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8e6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8e9:	8b 40 04             	mov    0x4(%eax),%eax
 8ec:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8f6:	01 c2                	add    %eax,%edx
 8f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8fb:	8b 00                	mov    (%eax),%eax
 8fd:	39 c2                	cmp    %eax,%edx
 8ff:	75 24                	jne    925 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 901:	8b 45 f8             	mov    -0x8(%ebp),%eax
 904:	8b 50 04             	mov    0x4(%eax),%edx
 907:	8b 45 fc             	mov    -0x4(%ebp),%eax
 90a:	8b 00                	mov    (%eax),%eax
 90c:	8b 40 04             	mov    0x4(%eax),%eax
 90f:	01 c2                	add    %eax,%edx
 911:	8b 45 f8             	mov    -0x8(%ebp),%eax
 914:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 917:	8b 45 fc             	mov    -0x4(%ebp),%eax
 91a:	8b 00                	mov    (%eax),%eax
 91c:	8b 10                	mov    (%eax),%edx
 91e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 921:	89 10                	mov    %edx,(%eax)
 923:	eb 0a                	jmp    92f <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 925:	8b 45 fc             	mov    -0x4(%ebp),%eax
 928:	8b 10                	mov    (%eax),%edx
 92a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 92d:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 92f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 932:	8b 40 04             	mov    0x4(%eax),%eax
 935:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 93c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 93f:	01 d0                	add    %edx,%eax
 941:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 944:	75 20                	jne    966 <free+0xcf>
    p->s.size += bp->s.size;
 946:	8b 45 fc             	mov    -0x4(%ebp),%eax
 949:	8b 50 04             	mov    0x4(%eax),%edx
 94c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 94f:	8b 40 04             	mov    0x4(%eax),%eax
 952:	01 c2                	add    %eax,%edx
 954:	8b 45 fc             	mov    -0x4(%ebp),%eax
 957:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 95a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 95d:	8b 10                	mov    (%eax),%edx
 95f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 962:	89 10                	mov    %edx,(%eax)
 964:	eb 08                	jmp    96e <free+0xd7>
  } else
    p->s.ptr = bp;
 966:	8b 45 fc             	mov    -0x4(%ebp),%eax
 969:	8b 55 f8             	mov    -0x8(%ebp),%edx
 96c:	89 10                	mov    %edx,(%eax)
  freep = p;
 96e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 971:	a3 c8 0d 00 00       	mov    %eax,0xdc8
}
 976:	c9                   	leave  
 977:	c3                   	ret    

00000978 <morecore>:

static Header*
morecore(uint nu)
{
 978:	55                   	push   %ebp
 979:	89 e5                	mov    %esp,%ebp
 97b:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 97e:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 985:	77 07                	ja     98e <morecore+0x16>
    nu = 4096;
 987:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 98e:	8b 45 08             	mov    0x8(%ebp),%eax
 991:	c1 e0 03             	shl    $0x3,%eax
 994:	89 04 24             	mov    %eax,(%esp)
 997:	e8 40 fc ff ff       	call   5dc <sbrk>
 99c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 99f:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 9a3:	75 07                	jne    9ac <morecore+0x34>
    return 0;
 9a5:	b8 00 00 00 00       	mov    $0x0,%eax
 9aa:	eb 22                	jmp    9ce <morecore+0x56>
  hp = (Header*)p;
 9ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9af:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 9b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9b5:	8b 55 08             	mov    0x8(%ebp),%edx
 9b8:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 9bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9be:	83 c0 08             	add    $0x8,%eax
 9c1:	89 04 24             	mov    %eax,(%esp)
 9c4:	e8 ce fe ff ff       	call   897 <free>
  return freep;
 9c9:	a1 c8 0d 00 00       	mov    0xdc8,%eax
}
 9ce:	c9                   	leave  
 9cf:	c3                   	ret    

000009d0 <malloc>:

void*
malloc(uint nbytes)
{
 9d0:	55                   	push   %ebp
 9d1:	89 e5                	mov    %esp,%ebp
 9d3:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9d6:	8b 45 08             	mov    0x8(%ebp),%eax
 9d9:	83 c0 07             	add    $0x7,%eax
 9dc:	c1 e8 03             	shr    $0x3,%eax
 9df:	83 c0 01             	add    $0x1,%eax
 9e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 9e5:	a1 c8 0d 00 00       	mov    0xdc8,%eax
 9ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9ed:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 9f1:	75 23                	jne    a16 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 9f3:	c7 45 f0 c0 0d 00 00 	movl   $0xdc0,-0x10(%ebp)
 9fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9fd:	a3 c8 0d 00 00       	mov    %eax,0xdc8
 a02:	a1 c8 0d 00 00       	mov    0xdc8,%eax
 a07:	a3 c0 0d 00 00       	mov    %eax,0xdc0
    base.s.size = 0;
 a0c:	c7 05 c4 0d 00 00 00 	movl   $0x0,0xdc4
 a13:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a16:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a19:	8b 00                	mov    (%eax),%eax
 a1b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a21:	8b 40 04             	mov    0x4(%eax),%eax
 a24:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a27:	72 4d                	jb     a76 <malloc+0xa6>
      if(p->s.size == nunits)
 a29:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a2c:	8b 40 04             	mov    0x4(%eax),%eax
 a2f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a32:	75 0c                	jne    a40 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a34:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a37:	8b 10                	mov    (%eax),%edx
 a39:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a3c:	89 10                	mov    %edx,(%eax)
 a3e:	eb 26                	jmp    a66 <malloc+0x96>
      else {
        p->s.size -= nunits;
 a40:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a43:	8b 40 04             	mov    0x4(%eax),%eax
 a46:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a49:	89 c2                	mov    %eax,%edx
 a4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a4e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a51:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a54:	8b 40 04             	mov    0x4(%eax),%eax
 a57:	c1 e0 03             	shl    $0x3,%eax
 a5a:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a60:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a63:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a66:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a69:	a3 c8 0d 00 00       	mov    %eax,0xdc8
      return (void*)(p + 1);
 a6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a71:	83 c0 08             	add    $0x8,%eax
 a74:	eb 38                	jmp    aae <malloc+0xde>
    }
    if(p == freep)
 a76:	a1 c8 0d 00 00       	mov    0xdc8,%eax
 a7b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a7e:	75 1b                	jne    a9b <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 a80:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a83:	89 04 24             	mov    %eax,(%esp)
 a86:	e8 ed fe ff ff       	call   978 <morecore>
 a8b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a8e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a92:	75 07                	jne    a9b <malloc+0xcb>
        return 0;
 a94:	b8 00 00 00 00       	mov    $0x0,%eax
 a99:	eb 13                	jmp    aae <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a9e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 aa1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aa4:	8b 00                	mov    (%eax),%eax
 aa6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 aa9:	e9 70 ff ff ff       	jmp    a1e <malloc+0x4e>
}
 aae:	c9                   	leave  
 aaf:	c3                   	ret    
