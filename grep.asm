
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int n, m;
  char *p, *q;

  m = 0;
   6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
   d:	e9 c6 00 00 00       	jmp    d8 <grep+0xd8>
    m += n;
  12:	8b 45 ec             	mov    -0x14(%ebp),%eax
  15:	01 45 f4             	add    %eax,-0xc(%ebp)
    buf[m] = '\0';
  18:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1b:	05 e0 0f 00 00       	add    $0xfe0,%eax
  20:	c6 00 00             	movb   $0x0,(%eax)
    p = buf;
  23:	c7 45 f0 e0 0f 00 00 	movl   $0xfe0,-0x10(%ebp)
    while((q = strchr(p, '\n')) != 0){
  2a:	eb 51                	jmp    7d <grep+0x7d>
      *q = 0;
  2c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  2f:	c6 00 00             	movb   $0x0,(%eax)
      if(match(pattern, p)){
  32:	8b 45 f0             	mov    -0x10(%ebp),%eax
  35:	89 44 24 04          	mov    %eax,0x4(%esp)
  39:	8b 45 08             	mov    0x8(%ebp),%eax
  3c:	89 04 24             	mov    %eax,(%esp)
  3f:	e8 bc 01 00 00       	call   200 <match>
  44:	85 c0                	test   %eax,%eax
  46:	74 2c                	je     74 <grep+0x74>
        *q = '\n';
  48:	8b 45 e8             	mov    -0x18(%ebp),%eax
  4b:	c6 00 0a             	movb   $0xa,(%eax)
        write(1, p, q+1 - p);
  4e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  51:	83 c0 01             	add    $0x1,%eax
  54:	89 c2                	mov    %eax,%edx
  56:	8b 45 f0             	mov    -0x10(%ebp),%eax
  59:	29 c2                	sub    %eax,%edx
  5b:	89 d0                	mov    %edx,%eax
  5d:	89 44 24 08          	mov    %eax,0x8(%esp)
  61:	8b 45 f0             	mov    -0x10(%ebp),%eax
  64:	89 44 24 04          	mov    %eax,0x4(%esp)
  68:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  6f:	e8 87 06 00 00       	call   6fb <write>
      }
      p = q+1;
  74:	8b 45 e8             	mov    -0x18(%ebp),%eax
  77:	83 c0 01             	add    $0x1,%eax
  7a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    while((q = strchr(p, '\n')) != 0){
  7d:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  84:	00 
  85:	8b 45 f0             	mov    -0x10(%ebp),%eax
  88:	89 04 24             	mov    %eax,(%esp)
  8b:	e8 af 03 00 00       	call   43f <strchr>
  90:	89 45 e8             	mov    %eax,-0x18(%ebp)
  93:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  97:	75 93                	jne    2c <grep+0x2c>
    }
    if(p == buf)
  99:	81 7d f0 e0 0f 00 00 	cmpl   $0xfe0,-0x10(%ebp)
  a0:	75 07                	jne    a9 <grep+0xa9>
      m = 0;
  a2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if(m > 0){
  a9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  ad:	7e 29                	jle    d8 <grep+0xd8>
      m -= p - buf;
  af:	ba e0 0f 00 00       	mov    $0xfe0,%edx
  b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  b7:	29 c2                	sub    %eax,%edx
  b9:	89 d0                	mov    %edx,%eax
  bb:	01 45 f4             	add    %eax,-0xc(%ebp)
      memmove(buf, p, m);
  be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c1:	89 44 24 08          	mov    %eax,0x8(%esp)
  c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c8:	89 44 24 04          	mov    %eax,0x4(%esp)
  cc:	c7 04 24 e0 0f 00 00 	movl   $0xfe0,(%esp)
  d3:	e8 ab 04 00 00       	call   583 <memmove>
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
  d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  db:	ba ff 03 00 00       	mov    $0x3ff,%edx
  e0:	29 c2                	sub    %eax,%edx
  e2:	89 d0                	mov    %edx,%eax
  e4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  e7:	81 c2 e0 0f 00 00    	add    $0xfe0,%edx
  ed:	89 44 24 08          	mov    %eax,0x8(%esp)
  f1:	89 54 24 04          	mov    %edx,0x4(%esp)
  f5:	8b 45 0c             	mov    0xc(%ebp),%eax
  f8:	89 04 24             	mov    %eax,(%esp)
  fb:	e8 f3 05 00 00       	call   6f3 <read>
 100:	89 45 ec             	mov    %eax,-0x14(%ebp)
 103:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 107:	0f 8f 05 ff ff ff    	jg     12 <grep+0x12>
    }
  }
}
 10d:	c9                   	leave  
 10e:	c3                   	ret    

0000010f <main>:

int
main(int argc, char *argv[])
{
 10f:	55                   	push   %ebp
 110:	89 e5                	mov    %esp,%ebp
 112:	83 e4 f0             	and    $0xfffffff0,%esp
 115:	83 ec 20             	sub    $0x20,%esp
  int fd, i;
  char *pattern;

  if(argc <= 1){
 118:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 11c:	7f 19                	jg     137 <main+0x28>
    printf(2, "usage: grep pattern [file ...]\n");
 11e:	c7 44 24 04 38 0c 00 	movl   $0xc38,0x4(%esp)
 125:	00 
 126:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 12d:	e8 39 07 00 00       	call   86b <printf>
    exit();
 132:	e8 a4 05 00 00       	call   6db <exit>
  }
  pattern = argv[1];
 137:	8b 45 0c             	mov    0xc(%ebp),%eax
 13a:	8b 40 04             	mov    0x4(%eax),%eax
 13d:	89 44 24 18          	mov    %eax,0x18(%esp)

  if(argc <= 2){
 141:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
 145:	7f 19                	jg     160 <main+0x51>
    grep(pattern, 0);
 147:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 14e:	00 
 14f:	8b 44 24 18          	mov    0x18(%esp),%eax
 153:	89 04 24             	mov    %eax,(%esp)
 156:	e8 a5 fe ff ff       	call   0 <grep>
    exit();
 15b:	e8 7b 05 00 00       	call   6db <exit>
  }

  for(i = 2; i < argc; i++){
 160:	c7 44 24 1c 02 00 00 	movl   $0x2,0x1c(%esp)
 167:	00 
 168:	e9 81 00 00 00       	jmp    1ee <main+0xdf>
    if((fd = open(argv[i], 0)) < 0){
 16d:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 171:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 178:	8b 45 0c             	mov    0xc(%ebp),%eax
 17b:	01 d0                	add    %edx,%eax
 17d:	8b 00                	mov    (%eax),%eax
 17f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 186:	00 
 187:	89 04 24             	mov    %eax,(%esp)
 18a:	e8 8c 05 00 00       	call   71b <open>
 18f:	89 44 24 14          	mov    %eax,0x14(%esp)
 193:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
 198:	79 2f                	jns    1c9 <main+0xba>
      printf(1, "grep: cannot open %s\n", argv[i]);
 19a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 19e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 1a5:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a8:	01 d0                	add    %edx,%eax
 1aa:	8b 00                	mov    (%eax),%eax
 1ac:	89 44 24 08          	mov    %eax,0x8(%esp)
 1b0:	c7 44 24 04 58 0c 00 	movl   $0xc58,0x4(%esp)
 1b7:	00 
 1b8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1bf:	e8 a7 06 00 00       	call   86b <printf>
      exit();
 1c4:	e8 12 05 00 00       	call   6db <exit>
    }
    grep(pattern, fd);
 1c9:	8b 44 24 14          	mov    0x14(%esp),%eax
 1cd:	89 44 24 04          	mov    %eax,0x4(%esp)
 1d1:	8b 44 24 18          	mov    0x18(%esp),%eax
 1d5:	89 04 24             	mov    %eax,(%esp)
 1d8:	e8 23 fe ff ff       	call   0 <grep>
    close(fd);
 1dd:	8b 44 24 14          	mov    0x14(%esp),%eax
 1e1:	89 04 24             	mov    %eax,(%esp)
 1e4:	e8 1a 05 00 00       	call   703 <close>
  for(i = 2; i < argc; i++){
 1e9:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 1ee:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 1f2:	3b 45 08             	cmp    0x8(%ebp),%eax
 1f5:	0f 8c 72 ff ff ff    	jl     16d <main+0x5e>
  }
  exit();
 1fb:	e8 db 04 00 00       	call   6db <exit>

00000200 <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	83 ec 18             	sub    $0x18,%esp
  if(re[0] == '^')
 206:	8b 45 08             	mov    0x8(%ebp),%eax
 209:	0f b6 00             	movzbl (%eax),%eax
 20c:	3c 5e                	cmp    $0x5e,%al
 20e:	75 17                	jne    227 <match+0x27>
    return matchhere(re+1, text);
 210:	8b 45 08             	mov    0x8(%ebp),%eax
 213:	8d 50 01             	lea    0x1(%eax),%edx
 216:	8b 45 0c             	mov    0xc(%ebp),%eax
 219:	89 44 24 04          	mov    %eax,0x4(%esp)
 21d:	89 14 24             	mov    %edx,(%esp)
 220:	e8 36 00 00 00       	call   25b <matchhere>
 225:	eb 32                	jmp    259 <match+0x59>
  do{  // must look at empty string
    if(matchhere(re, text))
 227:	8b 45 0c             	mov    0xc(%ebp),%eax
 22a:	89 44 24 04          	mov    %eax,0x4(%esp)
 22e:	8b 45 08             	mov    0x8(%ebp),%eax
 231:	89 04 24             	mov    %eax,(%esp)
 234:	e8 22 00 00 00       	call   25b <matchhere>
 239:	85 c0                	test   %eax,%eax
 23b:	74 07                	je     244 <match+0x44>
      return 1;
 23d:	b8 01 00 00 00       	mov    $0x1,%eax
 242:	eb 15                	jmp    259 <match+0x59>
  }while(*text++ != '\0');
 244:	8b 45 0c             	mov    0xc(%ebp),%eax
 247:	8d 50 01             	lea    0x1(%eax),%edx
 24a:	89 55 0c             	mov    %edx,0xc(%ebp)
 24d:	0f b6 00             	movzbl (%eax),%eax
 250:	84 c0                	test   %al,%al
 252:	75 d3                	jne    227 <match+0x27>
  return 0;
 254:	b8 00 00 00 00       	mov    $0x0,%eax
}
 259:	c9                   	leave  
 25a:	c3                   	ret    

0000025b <matchhere>:

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
 25b:	55                   	push   %ebp
 25c:	89 e5                	mov    %esp,%ebp
 25e:	83 ec 18             	sub    $0x18,%esp
  if(re[0] == '\0')
 261:	8b 45 08             	mov    0x8(%ebp),%eax
 264:	0f b6 00             	movzbl (%eax),%eax
 267:	84 c0                	test   %al,%al
 269:	75 0a                	jne    275 <matchhere+0x1a>
    return 1;
 26b:	b8 01 00 00 00       	mov    $0x1,%eax
 270:	e9 9b 00 00 00       	jmp    310 <matchhere+0xb5>
  if(re[1] == '*')
 275:	8b 45 08             	mov    0x8(%ebp),%eax
 278:	83 c0 01             	add    $0x1,%eax
 27b:	0f b6 00             	movzbl (%eax),%eax
 27e:	3c 2a                	cmp    $0x2a,%al
 280:	75 24                	jne    2a6 <matchhere+0x4b>
    return matchstar(re[0], re+2, text);
 282:	8b 45 08             	mov    0x8(%ebp),%eax
 285:	8d 48 02             	lea    0x2(%eax),%ecx
 288:	8b 45 08             	mov    0x8(%ebp),%eax
 28b:	0f b6 00             	movzbl (%eax),%eax
 28e:	0f be c0             	movsbl %al,%eax
 291:	8b 55 0c             	mov    0xc(%ebp),%edx
 294:	89 54 24 08          	mov    %edx,0x8(%esp)
 298:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 29c:	89 04 24             	mov    %eax,(%esp)
 29f:	e8 6e 00 00 00       	call   312 <matchstar>
 2a4:	eb 6a                	jmp    310 <matchhere+0xb5>
  if(re[0] == '$' && re[1] == '\0')
 2a6:	8b 45 08             	mov    0x8(%ebp),%eax
 2a9:	0f b6 00             	movzbl (%eax),%eax
 2ac:	3c 24                	cmp    $0x24,%al
 2ae:	75 1d                	jne    2cd <matchhere+0x72>
 2b0:	8b 45 08             	mov    0x8(%ebp),%eax
 2b3:	83 c0 01             	add    $0x1,%eax
 2b6:	0f b6 00             	movzbl (%eax),%eax
 2b9:	84 c0                	test   %al,%al
 2bb:	75 10                	jne    2cd <matchhere+0x72>
    return *text == '\0';
 2bd:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c0:	0f b6 00             	movzbl (%eax),%eax
 2c3:	84 c0                	test   %al,%al
 2c5:	0f 94 c0             	sete   %al
 2c8:	0f b6 c0             	movzbl %al,%eax
 2cb:	eb 43                	jmp    310 <matchhere+0xb5>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 2cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d0:	0f b6 00             	movzbl (%eax),%eax
 2d3:	84 c0                	test   %al,%al
 2d5:	74 34                	je     30b <matchhere+0xb0>
 2d7:	8b 45 08             	mov    0x8(%ebp),%eax
 2da:	0f b6 00             	movzbl (%eax),%eax
 2dd:	3c 2e                	cmp    $0x2e,%al
 2df:	74 10                	je     2f1 <matchhere+0x96>
 2e1:	8b 45 08             	mov    0x8(%ebp),%eax
 2e4:	0f b6 10             	movzbl (%eax),%edx
 2e7:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ea:	0f b6 00             	movzbl (%eax),%eax
 2ed:	38 c2                	cmp    %al,%dl
 2ef:	75 1a                	jne    30b <matchhere+0xb0>
    return matchhere(re+1, text+1);
 2f1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2f4:	8d 50 01             	lea    0x1(%eax),%edx
 2f7:	8b 45 08             	mov    0x8(%ebp),%eax
 2fa:	83 c0 01             	add    $0x1,%eax
 2fd:	89 54 24 04          	mov    %edx,0x4(%esp)
 301:	89 04 24             	mov    %eax,(%esp)
 304:	e8 52 ff ff ff       	call   25b <matchhere>
 309:	eb 05                	jmp    310 <matchhere+0xb5>
  return 0;
 30b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 310:	c9                   	leave  
 311:	c3                   	ret    

00000312 <matchstar>:

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
 312:	55                   	push   %ebp
 313:	89 e5                	mov    %esp,%ebp
 315:	83 ec 18             	sub    $0x18,%esp
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
 318:	8b 45 10             	mov    0x10(%ebp),%eax
 31b:	89 44 24 04          	mov    %eax,0x4(%esp)
 31f:	8b 45 0c             	mov    0xc(%ebp),%eax
 322:	89 04 24             	mov    %eax,(%esp)
 325:	e8 31 ff ff ff       	call   25b <matchhere>
 32a:	85 c0                	test   %eax,%eax
 32c:	74 07                	je     335 <matchstar+0x23>
      return 1;
 32e:	b8 01 00 00 00       	mov    $0x1,%eax
 333:	eb 29                	jmp    35e <matchstar+0x4c>
  }while(*text!='\0' && (*text++==c || c=='.'));
 335:	8b 45 10             	mov    0x10(%ebp),%eax
 338:	0f b6 00             	movzbl (%eax),%eax
 33b:	84 c0                	test   %al,%al
 33d:	74 1a                	je     359 <matchstar+0x47>
 33f:	8b 45 10             	mov    0x10(%ebp),%eax
 342:	8d 50 01             	lea    0x1(%eax),%edx
 345:	89 55 10             	mov    %edx,0x10(%ebp)
 348:	0f b6 00             	movzbl (%eax),%eax
 34b:	0f be c0             	movsbl %al,%eax
 34e:	3b 45 08             	cmp    0x8(%ebp),%eax
 351:	74 c5                	je     318 <matchstar+0x6>
 353:	83 7d 08 2e          	cmpl   $0x2e,0x8(%ebp)
 357:	74 bf                	je     318 <matchstar+0x6>
  return 0;
 359:	b8 00 00 00 00       	mov    $0x0,%eax
}
 35e:	c9                   	leave  
 35f:	c3                   	ret    

00000360 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 365:	8b 4d 08             	mov    0x8(%ebp),%ecx
 368:	8b 55 10             	mov    0x10(%ebp),%edx
 36b:	8b 45 0c             	mov    0xc(%ebp),%eax
 36e:	89 cb                	mov    %ecx,%ebx
 370:	89 df                	mov    %ebx,%edi
 372:	89 d1                	mov    %edx,%ecx
 374:	fc                   	cld    
 375:	f3 aa                	rep stos %al,%es:(%edi)
 377:	89 ca                	mov    %ecx,%edx
 379:	89 fb                	mov    %edi,%ebx
 37b:	89 5d 08             	mov    %ebx,0x8(%ebp)
 37e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 381:	5b                   	pop    %ebx
 382:	5f                   	pop    %edi
 383:	5d                   	pop    %ebp
 384:	c3                   	ret    

00000385 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 385:	55                   	push   %ebp
 386:	89 e5                	mov    %esp,%ebp
 388:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 38b:	8b 45 08             	mov    0x8(%ebp),%eax
 38e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 391:	90                   	nop
 392:	8b 45 08             	mov    0x8(%ebp),%eax
 395:	8d 50 01             	lea    0x1(%eax),%edx
 398:	89 55 08             	mov    %edx,0x8(%ebp)
 39b:	8b 55 0c             	mov    0xc(%ebp),%edx
 39e:	8d 4a 01             	lea    0x1(%edx),%ecx
 3a1:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 3a4:	0f b6 12             	movzbl (%edx),%edx
 3a7:	88 10                	mov    %dl,(%eax)
 3a9:	0f b6 00             	movzbl (%eax),%eax
 3ac:	84 c0                	test   %al,%al
 3ae:	75 e2                	jne    392 <strcpy+0xd>
    ;
  return os;
 3b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3b3:	c9                   	leave  
 3b4:	c3                   	ret    

000003b5 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3b5:	55                   	push   %ebp
 3b6:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 3b8:	eb 08                	jmp    3c2 <strcmp+0xd>
    p++, q++;
 3ba:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3be:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 3c2:	8b 45 08             	mov    0x8(%ebp),%eax
 3c5:	0f b6 00             	movzbl (%eax),%eax
 3c8:	84 c0                	test   %al,%al
 3ca:	74 10                	je     3dc <strcmp+0x27>
 3cc:	8b 45 08             	mov    0x8(%ebp),%eax
 3cf:	0f b6 10             	movzbl (%eax),%edx
 3d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d5:	0f b6 00             	movzbl (%eax),%eax
 3d8:	38 c2                	cmp    %al,%dl
 3da:	74 de                	je     3ba <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 3dc:	8b 45 08             	mov    0x8(%ebp),%eax
 3df:	0f b6 00             	movzbl (%eax),%eax
 3e2:	0f b6 d0             	movzbl %al,%edx
 3e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e8:	0f b6 00             	movzbl (%eax),%eax
 3eb:	0f b6 c0             	movzbl %al,%eax
 3ee:	29 c2                	sub    %eax,%edx
 3f0:	89 d0                	mov    %edx,%eax
}
 3f2:	5d                   	pop    %ebp
 3f3:	c3                   	ret    

000003f4 <strlen>:

uint
strlen(const char *s)
{
 3f4:	55                   	push   %ebp
 3f5:	89 e5                	mov    %esp,%ebp
 3f7:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3fa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 401:	eb 04                	jmp    407 <strlen+0x13>
 403:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 407:	8b 55 fc             	mov    -0x4(%ebp),%edx
 40a:	8b 45 08             	mov    0x8(%ebp),%eax
 40d:	01 d0                	add    %edx,%eax
 40f:	0f b6 00             	movzbl (%eax),%eax
 412:	84 c0                	test   %al,%al
 414:	75 ed                	jne    403 <strlen+0xf>
    ;
  return n;
 416:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 419:	c9                   	leave  
 41a:	c3                   	ret    

0000041b <memset>:

void*
memset(void *dst, int c, uint n)
{
 41b:	55                   	push   %ebp
 41c:	89 e5                	mov    %esp,%ebp
 41e:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 421:	8b 45 10             	mov    0x10(%ebp),%eax
 424:	89 44 24 08          	mov    %eax,0x8(%esp)
 428:	8b 45 0c             	mov    0xc(%ebp),%eax
 42b:	89 44 24 04          	mov    %eax,0x4(%esp)
 42f:	8b 45 08             	mov    0x8(%ebp),%eax
 432:	89 04 24             	mov    %eax,(%esp)
 435:	e8 26 ff ff ff       	call   360 <stosb>
  return dst;
 43a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 43d:	c9                   	leave  
 43e:	c3                   	ret    

0000043f <strchr>:

char*
strchr(const char *s, char c)
{
 43f:	55                   	push   %ebp
 440:	89 e5                	mov    %esp,%ebp
 442:	83 ec 04             	sub    $0x4,%esp
 445:	8b 45 0c             	mov    0xc(%ebp),%eax
 448:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 44b:	eb 14                	jmp    461 <strchr+0x22>
    if(*s == c)
 44d:	8b 45 08             	mov    0x8(%ebp),%eax
 450:	0f b6 00             	movzbl (%eax),%eax
 453:	3a 45 fc             	cmp    -0x4(%ebp),%al
 456:	75 05                	jne    45d <strchr+0x1e>
      return (char*)s;
 458:	8b 45 08             	mov    0x8(%ebp),%eax
 45b:	eb 13                	jmp    470 <strchr+0x31>
  for(; *s; s++)
 45d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 461:	8b 45 08             	mov    0x8(%ebp),%eax
 464:	0f b6 00             	movzbl (%eax),%eax
 467:	84 c0                	test   %al,%al
 469:	75 e2                	jne    44d <strchr+0xe>
  return 0;
 46b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 470:	c9                   	leave  
 471:	c3                   	ret    

00000472 <gets>:

char*
gets(char *buf, int max)
{
 472:	55                   	push   %ebp
 473:	89 e5                	mov    %esp,%ebp
 475:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 478:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 47f:	eb 4c                	jmp    4cd <gets+0x5b>
    cc = read(0, &c, 1);
 481:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 488:	00 
 489:	8d 45 ef             	lea    -0x11(%ebp),%eax
 48c:	89 44 24 04          	mov    %eax,0x4(%esp)
 490:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 497:	e8 57 02 00 00       	call   6f3 <read>
 49c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 49f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4a3:	7f 02                	jg     4a7 <gets+0x35>
      break;
 4a5:	eb 31                	jmp    4d8 <gets+0x66>
    buf[i++] = c;
 4a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4aa:	8d 50 01             	lea    0x1(%eax),%edx
 4ad:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4b0:	89 c2                	mov    %eax,%edx
 4b2:	8b 45 08             	mov    0x8(%ebp),%eax
 4b5:	01 c2                	add    %eax,%edx
 4b7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4bb:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 4bd:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4c1:	3c 0a                	cmp    $0xa,%al
 4c3:	74 13                	je     4d8 <gets+0x66>
 4c5:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4c9:	3c 0d                	cmp    $0xd,%al
 4cb:	74 0b                	je     4d8 <gets+0x66>
  for(i=0; i+1 < max; ){
 4cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4d0:	83 c0 01             	add    $0x1,%eax
 4d3:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4d6:	7c a9                	jl     481 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 4d8:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4db:	8b 45 08             	mov    0x8(%ebp),%eax
 4de:	01 d0                	add    %edx,%eax
 4e0:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4e3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4e6:	c9                   	leave  
 4e7:	c3                   	ret    

000004e8 <stat>:

int
stat(const char *n, struct stat *st)
{
 4e8:	55                   	push   %ebp
 4e9:	89 e5                	mov    %esp,%ebp
 4eb:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4ee:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4f5:	00 
 4f6:	8b 45 08             	mov    0x8(%ebp),%eax
 4f9:	89 04 24             	mov    %eax,(%esp)
 4fc:	e8 1a 02 00 00       	call   71b <open>
 501:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 504:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 508:	79 07                	jns    511 <stat+0x29>
    return -1;
 50a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 50f:	eb 23                	jmp    534 <stat+0x4c>
  r = fstat(fd, st);
 511:	8b 45 0c             	mov    0xc(%ebp),%eax
 514:	89 44 24 04          	mov    %eax,0x4(%esp)
 518:	8b 45 f4             	mov    -0xc(%ebp),%eax
 51b:	89 04 24             	mov    %eax,(%esp)
 51e:	e8 10 02 00 00       	call   733 <fstat>
 523:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 526:	8b 45 f4             	mov    -0xc(%ebp),%eax
 529:	89 04 24             	mov    %eax,(%esp)
 52c:	e8 d2 01 00 00       	call   703 <close>
  return r;
 531:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 534:	c9                   	leave  
 535:	c3                   	ret    

00000536 <atoi>:

int
atoi(const char *s)
{
 536:	55                   	push   %ebp
 537:	89 e5                	mov    %esp,%ebp
 539:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 53c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 543:	eb 25                	jmp    56a <atoi+0x34>
    n = n*10 + *s++ - '0';
 545:	8b 55 fc             	mov    -0x4(%ebp),%edx
 548:	89 d0                	mov    %edx,%eax
 54a:	c1 e0 02             	shl    $0x2,%eax
 54d:	01 d0                	add    %edx,%eax
 54f:	01 c0                	add    %eax,%eax
 551:	89 c1                	mov    %eax,%ecx
 553:	8b 45 08             	mov    0x8(%ebp),%eax
 556:	8d 50 01             	lea    0x1(%eax),%edx
 559:	89 55 08             	mov    %edx,0x8(%ebp)
 55c:	0f b6 00             	movzbl (%eax),%eax
 55f:	0f be c0             	movsbl %al,%eax
 562:	01 c8                	add    %ecx,%eax
 564:	83 e8 30             	sub    $0x30,%eax
 567:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 56a:	8b 45 08             	mov    0x8(%ebp),%eax
 56d:	0f b6 00             	movzbl (%eax),%eax
 570:	3c 2f                	cmp    $0x2f,%al
 572:	7e 0a                	jle    57e <atoi+0x48>
 574:	8b 45 08             	mov    0x8(%ebp),%eax
 577:	0f b6 00             	movzbl (%eax),%eax
 57a:	3c 39                	cmp    $0x39,%al
 57c:	7e c7                	jle    545 <atoi+0xf>
  return n;
 57e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 581:	c9                   	leave  
 582:	c3                   	ret    

00000583 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 583:	55                   	push   %ebp
 584:	89 e5                	mov    %esp,%ebp
 586:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 589:	8b 45 08             	mov    0x8(%ebp),%eax
 58c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 58f:	8b 45 0c             	mov    0xc(%ebp),%eax
 592:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 595:	eb 17                	jmp    5ae <memmove+0x2b>
    *dst++ = *src++;
 597:	8b 45 fc             	mov    -0x4(%ebp),%eax
 59a:	8d 50 01             	lea    0x1(%eax),%edx
 59d:	89 55 fc             	mov    %edx,-0x4(%ebp)
 5a0:	8b 55 f8             	mov    -0x8(%ebp),%edx
 5a3:	8d 4a 01             	lea    0x1(%edx),%ecx
 5a6:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 5a9:	0f b6 12             	movzbl (%edx),%edx
 5ac:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 5ae:	8b 45 10             	mov    0x10(%ebp),%eax
 5b1:	8d 50 ff             	lea    -0x1(%eax),%edx
 5b4:	89 55 10             	mov    %edx,0x10(%ebp)
 5b7:	85 c0                	test   %eax,%eax
 5b9:	7f dc                	jg     597 <memmove+0x14>
  return vdst;
 5bb:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5be:	c9                   	leave  
 5bf:	c3                   	ret    

000005c0 <ps>:

void
ps() {
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	57                   	push   %edi
 5c4:	56                   	push   %esi
 5c5:	53                   	push   %ebx
 5c6:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  int i = 0;
 5cc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  printf(1, "PID	TKTS	TCKS	STAT	NAME\n");
 5d3:	c7 44 24 04 6e 0c 00 	movl   $0xc6e,0x4(%esp)
 5da:	00 
 5db:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5e2:	e8 84 02 00 00       	call   86b <printf>
  getpinfo(&pstat);
 5e7:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 5ed:	89 04 24             	mov    %eax,(%esp)
 5f0:	e8 86 01 00 00       	call   77b <getpinfo>
  while (pstat[i].pid != 0) {
 5f5:	e9 ad 00 00 00       	jmp    6a7 <ps+0xe7>
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
	pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 5fa:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 600:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 603:	89 d0                	mov    %edx,%eax
 605:	c1 e0 03             	shl    $0x3,%eax
 608:	01 d0                	add    %edx,%eax
 60a:	c1 e0 02             	shl    $0x2,%eax
 60d:	83 c0 10             	add    $0x10,%eax
 610:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 613:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 616:	89 d0                	mov    %edx,%eax
 618:	c1 e0 03             	shl    $0x3,%eax
 61b:	01 d0                	add    %edx,%eax
 61d:	c1 e0 02             	shl    $0x2,%eax
 620:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 623:	01 d8                	add    %ebx,%eax
 625:	2d e4 08 00 00       	sub    $0x8e4,%eax
 62a:	0f b6 00             	movzbl (%eax),%eax
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
 62d:	0f be f0             	movsbl %al,%esi
 630:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 633:	89 d0                	mov    %edx,%eax
 635:	c1 e0 03             	shl    $0x3,%eax
 638:	01 d0                	add    %edx,%eax
 63a:	c1 e0 02             	shl    $0x2,%eax
 63d:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 640:	01 c8                	add    %ecx,%eax
 642:	2d f8 08 00 00       	sub    $0x8f8,%eax
 647:	8b 18                	mov    (%eax),%ebx
 649:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 64c:	89 d0                	mov    %edx,%eax
 64e:	c1 e0 03             	shl    $0x3,%eax
 651:	01 d0                	add    %edx,%eax
 653:	c1 e0 02             	shl    $0x2,%eax
 656:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 659:	01 c8                	add    %ecx,%eax
 65b:	2d 00 09 00 00       	sub    $0x900,%eax
 660:	8b 08                	mov    (%eax),%ecx
 662:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 665:	89 d0                	mov    %edx,%eax
 667:	c1 e0 03             	shl    $0x3,%eax
 66a:	01 d0                	add    %edx,%eax
 66c:	c1 e0 02             	shl    $0x2,%eax
 66f:	8d 55 e8             	lea    -0x18(%ebp),%edx
 672:	01 d0                	add    %edx,%eax
 674:	2d fc 08 00 00       	sub    $0x8fc,%eax
 679:	8b 00                	mov    (%eax),%eax
 67b:	89 7c 24 18          	mov    %edi,0x18(%esp)
 67f:	89 74 24 14          	mov    %esi,0x14(%esp)
 683:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 687:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 68b:	89 44 24 08          	mov    %eax,0x8(%esp)
 68f:	c7 44 24 04 87 0c 00 	movl   $0xc87,0x4(%esp)
 696:	00 
 697:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 69e:	e8 c8 01 00 00       	call   86b <printf>
      i++;
 6a3:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  while (pstat[i].pid != 0) {
 6a7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 6aa:	89 d0                	mov    %edx,%eax
 6ac:	c1 e0 03             	shl    $0x3,%eax
 6af:	01 d0                	add    %edx,%eax
 6b1:	c1 e0 02             	shl    $0x2,%eax
 6b4:	8d 75 e8             	lea    -0x18(%ebp),%esi
 6b7:	01 f0                	add    %esi,%eax
 6b9:	2d fc 08 00 00       	sub    $0x8fc,%eax
 6be:	8b 00                	mov    (%eax),%eax
 6c0:	85 c0                	test   %eax,%eax
 6c2:	0f 85 32 ff ff ff    	jne    5fa <ps+0x3a>
  }
}
 6c8:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 6ce:	5b                   	pop    %ebx
 6cf:	5e                   	pop    %esi
 6d0:	5f                   	pop    %edi
 6d1:	5d                   	pop    %ebp
 6d2:	c3                   	ret    

000006d3 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6d3:	b8 01 00 00 00       	mov    $0x1,%eax
 6d8:	cd 40                	int    $0x40
 6da:	c3                   	ret    

000006db <exit>:
SYSCALL(exit)
 6db:	b8 02 00 00 00       	mov    $0x2,%eax
 6e0:	cd 40                	int    $0x40
 6e2:	c3                   	ret    

000006e3 <wait>:
SYSCALL(wait)
 6e3:	b8 03 00 00 00       	mov    $0x3,%eax
 6e8:	cd 40                	int    $0x40
 6ea:	c3                   	ret    

000006eb <pipe>:
SYSCALL(pipe)
 6eb:	b8 04 00 00 00       	mov    $0x4,%eax
 6f0:	cd 40                	int    $0x40
 6f2:	c3                   	ret    

000006f3 <read>:
SYSCALL(read)
 6f3:	b8 05 00 00 00       	mov    $0x5,%eax
 6f8:	cd 40                	int    $0x40
 6fa:	c3                   	ret    

000006fb <write>:
SYSCALL(write)
 6fb:	b8 10 00 00 00       	mov    $0x10,%eax
 700:	cd 40                	int    $0x40
 702:	c3                   	ret    

00000703 <close>:
SYSCALL(close)
 703:	b8 15 00 00 00       	mov    $0x15,%eax
 708:	cd 40                	int    $0x40
 70a:	c3                   	ret    

0000070b <kill>:
SYSCALL(kill)
 70b:	b8 06 00 00 00       	mov    $0x6,%eax
 710:	cd 40                	int    $0x40
 712:	c3                   	ret    

00000713 <exec>:
SYSCALL(exec)
 713:	b8 07 00 00 00       	mov    $0x7,%eax
 718:	cd 40                	int    $0x40
 71a:	c3                   	ret    

0000071b <open>:
SYSCALL(open)
 71b:	b8 0f 00 00 00       	mov    $0xf,%eax
 720:	cd 40                	int    $0x40
 722:	c3                   	ret    

00000723 <mknod>:
SYSCALL(mknod)
 723:	b8 11 00 00 00       	mov    $0x11,%eax
 728:	cd 40                	int    $0x40
 72a:	c3                   	ret    

0000072b <unlink>:
SYSCALL(unlink)
 72b:	b8 12 00 00 00       	mov    $0x12,%eax
 730:	cd 40                	int    $0x40
 732:	c3                   	ret    

00000733 <fstat>:
SYSCALL(fstat)
 733:	b8 08 00 00 00       	mov    $0x8,%eax
 738:	cd 40                	int    $0x40
 73a:	c3                   	ret    

0000073b <link>:
SYSCALL(link)
 73b:	b8 13 00 00 00       	mov    $0x13,%eax
 740:	cd 40                	int    $0x40
 742:	c3                   	ret    

00000743 <mkdir>:
SYSCALL(mkdir)
 743:	b8 14 00 00 00       	mov    $0x14,%eax
 748:	cd 40                	int    $0x40
 74a:	c3                   	ret    

0000074b <chdir>:
SYSCALL(chdir)
 74b:	b8 09 00 00 00       	mov    $0x9,%eax
 750:	cd 40                	int    $0x40
 752:	c3                   	ret    

00000753 <dup>:
SYSCALL(dup)
 753:	b8 0a 00 00 00       	mov    $0xa,%eax
 758:	cd 40                	int    $0x40
 75a:	c3                   	ret    

0000075b <getpid>:
SYSCALL(getpid)
 75b:	b8 0b 00 00 00       	mov    $0xb,%eax
 760:	cd 40                	int    $0x40
 762:	c3                   	ret    

00000763 <sbrk>:
SYSCALL(sbrk)
 763:	b8 0c 00 00 00       	mov    $0xc,%eax
 768:	cd 40                	int    $0x40
 76a:	c3                   	ret    

0000076b <sleep>:
SYSCALL(sleep)
 76b:	b8 0d 00 00 00       	mov    $0xd,%eax
 770:	cd 40                	int    $0x40
 772:	c3                   	ret    

00000773 <uptime>:
SYSCALL(uptime)
 773:	b8 0e 00 00 00       	mov    $0xe,%eax
 778:	cd 40                	int    $0x40
 77a:	c3                   	ret    

0000077b <getpinfo>:
SYSCALL(getpinfo)
 77b:	b8 16 00 00 00       	mov    $0x16,%eax
 780:	cd 40                	int    $0x40
 782:	c3                   	ret    

00000783 <settickets>:
SYSCALL(settickets)
 783:	b8 17 00 00 00       	mov    $0x17,%eax
 788:	cd 40                	int    $0x40
 78a:	c3                   	ret    

0000078b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 78b:	55                   	push   %ebp
 78c:	89 e5                	mov    %esp,%ebp
 78e:	83 ec 18             	sub    $0x18,%esp
 791:	8b 45 0c             	mov    0xc(%ebp),%eax
 794:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 797:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 79e:	00 
 79f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 7a2:	89 44 24 04          	mov    %eax,0x4(%esp)
 7a6:	8b 45 08             	mov    0x8(%ebp),%eax
 7a9:	89 04 24             	mov    %eax,(%esp)
 7ac:	e8 4a ff ff ff       	call   6fb <write>
}
 7b1:	c9                   	leave  
 7b2:	c3                   	ret    

000007b3 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 7b3:	55                   	push   %ebp
 7b4:	89 e5                	mov    %esp,%ebp
 7b6:	56                   	push   %esi
 7b7:	53                   	push   %ebx
 7b8:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 7bb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 7c2:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 7c6:	74 17                	je     7df <printint+0x2c>
 7c8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 7cc:	79 11                	jns    7df <printint+0x2c>
    neg = 1;
 7ce:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 7d5:	8b 45 0c             	mov    0xc(%ebp),%eax
 7d8:	f7 d8                	neg    %eax
 7da:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7dd:	eb 06                	jmp    7e5 <printint+0x32>
  } else {
    x = xx;
 7df:	8b 45 0c             	mov    0xc(%ebp),%eax
 7e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 7e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 7ec:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 7ef:	8d 41 01             	lea    0x1(%ecx),%eax
 7f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7f5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 7f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7fb:	ba 00 00 00 00       	mov    $0x0,%edx
 800:	f7 f3                	div    %ebx
 802:	89 d0                	mov    %edx,%eax
 804:	0f b6 80 94 0f 00 00 	movzbl 0xf94(%eax),%eax
 80b:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 80f:	8b 75 10             	mov    0x10(%ebp),%esi
 812:	8b 45 ec             	mov    -0x14(%ebp),%eax
 815:	ba 00 00 00 00       	mov    $0x0,%edx
 81a:	f7 f6                	div    %esi
 81c:	89 45 ec             	mov    %eax,-0x14(%ebp)
 81f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 823:	75 c7                	jne    7ec <printint+0x39>
  if(neg)
 825:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 829:	74 10                	je     83b <printint+0x88>
    buf[i++] = '-';
 82b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82e:	8d 50 01             	lea    0x1(%eax),%edx
 831:	89 55 f4             	mov    %edx,-0xc(%ebp)
 834:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 839:	eb 1f                	jmp    85a <printint+0xa7>
 83b:	eb 1d                	jmp    85a <printint+0xa7>
    putc(fd, buf[i]);
 83d:	8d 55 dc             	lea    -0x24(%ebp),%edx
 840:	8b 45 f4             	mov    -0xc(%ebp),%eax
 843:	01 d0                	add    %edx,%eax
 845:	0f b6 00             	movzbl (%eax),%eax
 848:	0f be c0             	movsbl %al,%eax
 84b:	89 44 24 04          	mov    %eax,0x4(%esp)
 84f:	8b 45 08             	mov    0x8(%ebp),%eax
 852:	89 04 24             	mov    %eax,(%esp)
 855:	e8 31 ff ff ff       	call   78b <putc>
  while(--i >= 0)
 85a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 85e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 862:	79 d9                	jns    83d <printint+0x8a>
}
 864:	83 c4 30             	add    $0x30,%esp
 867:	5b                   	pop    %ebx
 868:	5e                   	pop    %esi
 869:	5d                   	pop    %ebp
 86a:	c3                   	ret    

0000086b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 86b:	55                   	push   %ebp
 86c:	89 e5                	mov    %esp,%ebp
 86e:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 871:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 878:	8d 45 0c             	lea    0xc(%ebp),%eax
 87b:	83 c0 04             	add    $0x4,%eax
 87e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 881:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 888:	e9 7c 01 00 00       	jmp    a09 <printf+0x19e>
    c = fmt[i] & 0xff;
 88d:	8b 55 0c             	mov    0xc(%ebp),%edx
 890:	8b 45 f0             	mov    -0x10(%ebp),%eax
 893:	01 d0                	add    %edx,%eax
 895:	0f b6 00             	movzbl (%eax),%eax
 898:	0f be c0             	movsbl %al,%eax
 89b:	25 ff 00 00 00       	and    $0xff,%eax
 8a0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 8a3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8a7:	75 2c                	jne    8d5 <printf+0x6a>
      if(c == '%'){
 8a9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 8ad:	75 0c                	jne    8bb <printf+0x50>
        state = '%';
 8af:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 8b6:	e9 4a 01 00 00       	jmp    a05 <printf+0x19a>
      } else {
        putc(fd, c);
 8bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8be:	0f be c0             	movsbl %al,%eax
 8c1:	89 44 24 04          	mov    %eax,0x4(%esp)
 8c5:	8b 45 08             	mov    0x8(%ebp),%eax
 8c8:	89 04 24             	mov    %eax,(%esp)
 8cb:	e8 bb fe ff ff       	call   78b <putc>
 8d0:	e9 30 01 00 00       	jmp    a05 <printf+0x19a>
      }
    } else if(state == '%'){
 8d5:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 8d9:	0f 85 26 01 00 00    	jne    a05 <printf+0x19a>
      if(c == 'd'){
 8df:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 8e3:	75 2d                	jne    912 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 8e5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8e8:	8b 00                	mov    (%eax),%eax
 8ea:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 8f1:	00 
 8f2:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 8f9:	00 
 8fa:	89 44 24 04          	mov    %eax,0x4(%esp)
 8fe:	8b 45 08             	mov    0x8(%ebp),%eax
 901:	89 04 24             	mov    %eax,(%esp)
 904:	e8 aa fe ff ff       	call   7b3 <printint>
        ap++;
 909:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 90d:	e9 ec 00 00 00       	jmp    9fe <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 912:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 916:	74 06                	je     91e <printf+0xb3>
 918:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 91c:	75 2d                	jne    94b <printf+0xe0>
        printint(fd, *ap, 16, 0);
 91e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 921:	8b 00                	mov    (%eax),%eax
 923:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 92a:	00 
 92b:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 932:	00 
 933:	89 44 24 04          	mov    %eax,0x4(%esp)
 937:	8b 45 08             	mov    0x8(%ebp),%eax
 93a:	89 04 24             	mov    %eax,(%esp)
 93d:	e8 71 fe ff ff       	call   7b3 <printint>
        ap++;
 942:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 946:	e9 b3 00 00 00       	jmp    9fe <printf+0x193>
      } else if(c == 's'){
 94b:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 94f:	75 45                	jne    996 <printf+0x12b>
        s = (char*)*ap;
 951:	8b 45 e8             	mov    -0x18(%ebp),%eax
 954:	8b 00                	mov    (%eax),%eax
 956:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 959:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 95d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 961:	75 09                	jne    96c <printf+0x101>
          s = "(null)";
 963:	c7 45 f4 97 0c 00 00 	movl   $0xc97,-0xc(%ebp)
        while(*s != 0){
 96a:	eb 1e                	jmp    98a <printf+0x11f>
 96c:	eb 1c                	jmp    98a <printf+0x11f>
          putc(fd, *s);
 96e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 971:	0f b6 00             	movzbl (%eax),%eax
 974:	0f be c0             	movsbl %al,%eax
 977:	89 44 24 04          	mov    %eax,0x4(%esp)
 97b:	8b 45 08             	mov    0x8(%ebp),%eax
 97e:	89 04 24             	mov    %eax,(%esp)
 981:	e8 05 fe ff ff       	call   78b <putc>
          s++;
 986:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 98a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 98d:	0f b6 00             	movzbl (%eax),%eax
 990:	84 c0                	test   %al,%al
 992:	75 da                	jne    96e <printf+0x103>
 994:	eb 68                	jmp    9fe <printf+0x193>
        }
      } else if(c == 'c'){
 996:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 99a:	75 1d                	jne    9b9 <printf+0x14e>
        putc(fd, *ap);
 99c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 99f:	8b 00                	mov    (%eax),%eax
 9a1:	0f be c0             	movsbl %al,%eax
 9a4:	89 44 24 04          	mov    %eax,0x4(%esp)
 9a8:	8b 45 08             	mov    0x8(%ebp),%eax
 9ab:	89 04 24             	mov    %eax,(%esp)
 9ae:	e8 d8 fd ff ff       	call   78b <putc>
        ap++;
 9b3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 9b7:	eb 45                	jmp    9fe <printf+0x193>
      } else if(c == '%'){
 9b9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 9bd:	75 17                	jne    9d6 <printf+0x16b>
        putc(fd, c);
 9bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 9c2:	0f be c0             	movsbl %al,%eax
 9c5:	89 44 24 04          	mov    %eax,0x4(%esp)
 9c9:	8b 45 08             	mov    0x8(%ebp),%eax
 9cc:	89 04 24             	mov    %eax,(%esp)
 9cf:	e8 b7 fd ff ff       	call   78b <putc>
 9d4:	eb 28                	jmp    9fe <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 9d6:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 9dd:	00 
 9de:	8b 45 08             	mov    0x8(%ebp),%eax
 9e1:	89 04 24             	mov    %eax,(%esp)
 9e4:	e8 a2 fd ff ff       	call   78b <putc>
        putc(fd, c);
 9e9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 9ec:	0f be c0             	movsbl %al,%eax
 9ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 9f3:	8b 45 08             	mov    0x8(%ebp),%eax
 9f6:	89 04 24             	mov    %eax,(%esp)
 9f9:	e8 8d fd ff ff       	call   78b <putc>
      }
      state = 0;
 9fe:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 a05:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 a09:	8b 55 0c             	mov    0xc(%ebp),%edx
 a0c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a0f:	01 d0                	add    %edx,%eax
 a11:	0f b6 00             	movzbl (%eax),%eax
 a14:	84 c0                	test   %al,%al
 a16:	0f 85 71 fe ff ff    	jne    88d <printf+0x22>
    }
  }
}
 a1c:	c9                   	leave  
 a1d:	c3                   	ret    

00000a1e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a1e:	55                   	push   %ebp
 a1f:	89 e5                	mov    %esp,%ebp
 a21:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a24:	8b 45 08             	mov    0x8(%ebp),%eax
 a27:	83 e8 08             	sub    $0x8,%eax
 a2a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a2d:	a1 c8 0f 00 00       	mov    0xfc8,%eax
 a32:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a35:	eb 24                	jmp    a5b <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a37:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a3a:	8b 00                	mov    (%eax),%eax
 a3c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a3f:	77 12                	ja     a53 <free+0x35>
 a41:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a44:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a47:	77 24                	ja     a6d <free+0x4f>
 a49:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a4c:	8b 00                	mov    (%eax),%eax
 a4e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a51:	77 1a                	ja     a6d <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a53:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a56:	8b 00                	mov    (%eax),%eax
 a58:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a5b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a5e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a61:	76 d4                	jbe    a37 <free+0x19>
 a63:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a66:	8b 00                	mov    (%eax),%eax
 a68:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a6b:	76 ca                	jbe    a37 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a6d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a70:	8b 40 04             	mov    0x4(%eax),%eax
 a73:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 a7a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a7d:	01 c2                	add    %eax,%edx
 a7f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a82:	8b 00                	mov    (%eax),%eax
 a84:	39 c2                	cmp    %eax,%edx
 a86:	75 24                	jne    aac <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 a88:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a8b:	8b 50 04             	mov    0x4(%eax),%edx
 a8e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a91:	8b 00                	mov    (%eax),%eax
 a93:	8b 40 04             	mov    0x4(%eax),%eax
 a96:	01 c2                	add    %eax,%edx
 a98:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a9b:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 a9e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aa1:	8b 00                	mov    (%eax),%eax
 aa3:	8b 10                	mov    (%eax),%edx
 aa5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 aa8:	89 10                	mov    %edx,(%eax)
 aaa:	eb 0a                	jmp    ab6 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 aac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aaf:	8b 10                	mov    (%eax),%edx
 ab1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ab4:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 ab6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ab9:	8b 40 04             	mov    0x4(%eax),%eax
 abc:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 ac3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ac6:	01 d0                	add    %edx,%eax
 ac8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 acb:	75 20                	jne    aed <free+0xcf>
    p->s.size += bp->s.size;
 acd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ad0:	8b 50 04             	mov    0x4(%eax),%edx
 ad3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ad6:	8b 40 04             	mov    0x4(%eax),%eax
 ad9:	01 c2                	add    %eax,%edx
 adb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ade:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 ae1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ae4:	8b 10                	mov    (%eax),%edx
 ae6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ae9:	89 10                	mov    %edx,(%eax)
 aeb:	eb 08                	jmp    af5 <free+0xd7>
  } else
    p->s.ptr = bp;
 aed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 af0:	8b 55 f8             	mov    -0x8(%ebp),%edx
 af3:	89 10                	mov    %edx,(%eax)
  freep = p;
 af5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 af8:	a3 c8 0f 00 00       	mov    %eax,0xfc8
}
 afd:	c9                   	leave  
 afe:	c3                   	ret    

00000aff <morecore>:

static Header*
morecore(uint nu)
{
 aff:	55                   	push   %ebp
 b00:	89 e5                	mov    %esp,%ebp
 b02:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 b05:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 b0c:	77 07                	ja     b15 <morecore+0x16>
    nu = 4096;
 b0e:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 b15:	8b 45 08             	mov    0x8(%ebp),%eax
 b18:	c1 e0 03             	shl    $0x3,%eax
 b1b:	89 04 24             	mov    %eax,(%esp)
 b1e:	e8 40 fc ff ff       	call   763 <sbrk>
 b23:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 b26:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 b2a:	75 07                	jne    b33 <morecore+0x34>
    return 0;
 b2c:	b8 00 00 00 00       	mov    $0x0,%eax
 b31:	eb 22                	jmp    b55 <morecore+0x56>
  hp = (Header*)p;
 b33:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b36:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 b39:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b3c:	8b 55 08             	mov    0x8(%ebp),%edx
 b3f:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 b42:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b45:	83 c0 08             	add    $0x8,%eax
 b48:	89 04 24             	mov    %eax,(%esp)
 b4b:	e8 ce fe ff ff       	call   a1e <free>
  return freep;
 b50:	a1 c8 0f 00 00       	mov    0xfc8,%eax
}
 b55:	c9                   	leave  
 b56:	c3                   	ret    

00000b57 <malloc>:

void*
malloc(uint nbytes)
{
 b57:	55                   	push   %ebp
 b58:	89 e5                	mov    %esp,%ebp
 b5a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b5d:	8b 45 08             	mov    0x8(%ebp),%eax
 b60:	83 c0 07             	add    $0x7,%eax
 b63:	c1 e8 03             	shr    $0x3,%eax
 b66:	83 c0 01             	add    $0x1,%eax
 b69:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 b6c:	a1 c8 0f 00 00       	mov    0xfc8,%eax
 b71:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b74:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 b78:	75 23                	jne    b9d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 b7a:	c7 45 f0 c0 0f 00 00 	movl   $0xfc0,-0x10(%ebp)
 b81:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b84:	a3 c8 0f 00 00       	mov    %eax,0xfc8
 b89:	a1 c8 0f 00 00       	mov    0xfc8,%eax
 b8e:	a3 c0 0f 00 00       	mov    %eax,0xfc0
    base.s.size = 0;
 b93:	c7 05 c4 0f 00 00 00 	movl   $0x0,0xfc4
 b9a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b9d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ba0:	8b 00                	mov    (%eax),%eax
 ba2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 ba5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ba8:	8b 40 04             	mov    0x4(%eax),%eax
 bab:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 bae:	72 4d                	jb     bfd <malloc+0xa6>
      if(p->s.size == nunits)
 bb0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bb3:	8b 40 04             	mov    0x4(%eax),%eax
 bb6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 bb9:	75 0c                	jne    bc7 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 bbb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bbe:	8b 10                	mov    (%eax),%edx
 bc0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bc3:	89 10                	mov    %edx,(%eax)
 bc5:	eb 26                	jmp    bed <malloc+0x96>
      else {
        p->s.size -= nunits;
 bc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bca:	8b 40 04             	mov    0x4(%eax),%eax
 bcd:	2b 45 ec             	sub    -0x14(%ebp),%eax
 bd0:	89 c2                	mov    %eax,%edx
 bd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bd5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 bd8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bdb:	8b 40 04             	mov    0x4(%eax),%eax
 bde:	c1 e0 03             	shl    $0x3,%eax
 be1:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 be4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 be7:	8b 55 ec             	mov    -0x14(%ebp),%edx
 bea:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 bed:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bf0:	a3 c8 0f 00 00       	mov    %eax,0xfc8
      return (void*)(p + 1);
 bf5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bf8:	83 c0 08             	add    $0x8,%eax
 bfb:	eb 38                	jmp    c35 <malloc+0xde>
    }
    if(p == freep)
 bfd:	a1 c8 0f 00 00       	mov    0xfc8,%eax
 c02:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 c05:	75 1b                	jne    c22 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 c07:	8b 45 ec             	mov    -0x14(%ebp),%eax
 c0a:	89 04 24             	mov    %eax,(%esp)
 c0d:	e8 ed fe ff ff       	call   aff <morecore>
 c12:	89 45 f4             	mov    %eax,-0xc(%ebp)
 c15:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 c19:	75 07                	jne    c22 <malloc+0xcb>
        return 0;
 c1b:	b8 00 00 00 00       	mov    $0x0,%eax
 c20:	eb 13                	jmp    c35 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c22:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c25:	89 45 f0             	mov    %eax,-0x10(%ebp)
 c28:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c2b:	8b 00                	mov    (%eax),%eax
 c2d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 c30:	e9 70 ff ff ff       	jmp    ba5 <malloc+0x4e>
}
 c35:	c9                   	leave  
 c36:	c3                   	ret    
