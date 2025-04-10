
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
  1b:	05 c0 0f 00 00       	add    $0xfc0,%eax
  20:	c6 00 00             	movb   $0x0,(%eax)
    p = buf;
  23:	c7 45 f0 c0 0f 00 00 	movl   $0xfc0,-0x10(%ebp)
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
  99:	81 7d f0 c0 0f 00 00 	cmpl   $0xfc0,-0x10(%ebp)
  a0:	75 07                	jne    a9 <grep+0xa9>
      m = 0;
  a2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if(m > 0){
  a9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  ad:	7e 29                	jle    d8 <grep+0xd8>
      m -= p - buf;
  af:	ba c0 0f 00 00       	mov    $0xfc0,%edx
  b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  b7:	29 c2                	sub    %eax,%edx
  b9:	89 d0                	mov    %edx,%eax
  bb:	01 45 f4             	add    %eax,-0xc(%ebp)
      memmove(buf, p, m);
  be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c1:	89 44 24 08          	mov    %eax,0x8(%esp)
  c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c8:	89 44 24 04          	mov    %eax,0x4(%esp)
  cc:	c7 04 24 c0 0f 00 00 	movl   $0xfc0,(%esp)
  d3:	e8 ab 04 00 00       	call   583 <memmove>
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
  d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  db:	ba ff 03 00 00       	mov    $0x3ff,%edx
  e0:	29 c2                	sub    %eax,%edx
  e2:	89 d0                	mov    %edx,%eax
  e4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  e7:	81 c2 c0 0f 00 00    	add    $0xfc0,%edx
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
 11e:	c7 44 24 04 30 0c 00 	movl   $0xc30,0x4(%esp)
 125:	00 
 126:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 12d:	e8 31 07 00 00       	call   863 <printf>
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
 1b0:	c7 44 24 04 50 0c 00 	movl   $0xc50,0x4(%esp)
 1b7:	00 
 1b8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1bf:	e8 9f 06 00 00       	call   863 <printf>
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
 5d3:	c7 44 24 04 66 0c 00 	movl   $0xc66,0x4(%esp)
 5da:	00 
 5db:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5e2:	e8 7c 02 00 00       	call   863 <printf>
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
 68f:	c7 44 24 04 7f 0c 00 	movl   $0xc7f,0x4(%esp)
 696:	00 
 697:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 69e:	e8 c0 01 00 00       	call   863 <printf>
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

00000783 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 783:	55                   	push   %ebp
 784:	89 e5                	mov    %esp,%ebp
 786:	83 ec 18             	sub    $0x18,%esp
 789:	8b 45 0c             	mov    0xc(%ebp),%eax
 78c:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 78f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 796:	00 
 797:	8d 45 f4             	lea    -0xc(%ebp),%eax
 79a:	89 44 24 04          	mov    %eax,0x4(%esp)
 79e:	8b 45 08             	mov    0x8(%ebp),%eax
 7a1:	89 04 24             	mov    %eax,(%esp)
 7a4:	e8 52 ff ff ff       	call   6fb <write>
}
 7a9:	c9                   	leave  
 7aa:	c3                   	ret    

000007ab <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 7ab:	55                   	push   %ebp
 7ac:	89 e5                	mov    %esp,%ebp
 7ae:	56                   	push   %esi
 7af:	53                   	push   %ebx
 7b0:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 7b3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 7ba:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 7be:	74 17                	je     7d7 <printint+0x2c>
 7c0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 7c4:	79 11                	jns    7d7 <printint+0x2c>
    neg = 1;
 7c6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 7cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 7d0:	f7 d8                	neg    %eax
 7d2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7d5:	eb 06                	jmp    7dd <printint+0x32>
  } else {
    x = xx;
 7d7:	8b 45 0c             	mov    0xc(%ebp),%eax
 7da:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 7dd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 7e4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 7e7:	8d 41 01             	lea    0x1(%ecx),%eax
 7ea:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7ed:	8b 5d 10             	mov    0x10(%ebp),%ebx
 7f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7f3:	ba 00 00 00 00       	mov    $0x0,%edx
 7f8:	f7 f3                	div    %ebx
 7fa:	89 d0                	mov    %edx,%eax
 7fc:	0f b6 80 8c 0f 00 00 	movzbl 0xf8c(%eax),%eax
 803:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 807:	8b 75 10             	mov    0x10(%ebp),%esi
 80a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80d:	ba 00 00 00 00       	mov    $0x0,%edx
 812:	f7 f6                	div    %esi
 814:	89 45 ec             	mov    %eax,-0x14(%ebp)
 817:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 81b:	75 c7                	jne    7e4 <printint+0x39>
  if(neg)
 81d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 821:	74 10                	je     833 <printint+0x88>
    buf[i++] = '-';
 823:	8b 45 f4             	mov    -0xc(%ebp),%eax
 826:	8d 50 01             	lea    0x1(%eax),%edx
 829:	89 55 f4             	mov    %edx,-0xc(%ebp)
 82c:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 831:	eb 1f                	jmp    852 <printint+0xa7>
 833:	eb 1d                	jmp    852 <printint+0xa7>
    putc(fd, buf[i]);
 835:	8d 55 dc             	lea    -0x24(%ebp),%edx
 838:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83b:	01 d0                	add    %edx,%eax
 83d:	0f b6 00             	movzbl (%eax),%eax
 840:	0f be c0             	movsbl %al,%eax
 843:	89 44 24 04          	mov    %eax,0x4(%esp)
 847:	8b 45 08             	mov    0x8(%ebp),%eax
 84a:	89 04 24             	mov    %eax,(%esp)
 84d:	e8 31 ff ff ff       	call   783 <putc>
  while(--i >= 0)
 852:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 856:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 85a:	79 d9                	jns    835 <printint+0x8a>
}
 85c:	83 c4 30             	add    $0x30,%esp
 85f:	5b                   	pop    %ebx
 860:	5e                   	pop    %esi
 861:	5d                   	pop    %ebp
 862:	c3                   	ret    

00000863 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 863:	55                   	push   %ebp
 864:	89 e5                	mov    %esp,%ebp
 866:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 869:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 870:	8d 45 0c             	lea    0xc(%ebp),%eax
 873:	83 c0 04             	add    $0x4,%eax
 876:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 879:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 880:	e9 7c 01 00 00       	jmp    a01 <printf+0x19e>
    c = fmt[i] & 0xff;
 885:	8b 55 0c             	mov    0xc(%ebp),%edx
 888:	8b 45 f0             	mov    -0x10(%ebp),%eax
 88b:	01 d0                	add    %edx,%eax
 88d:	0f b6 00             	movzbl (%eax),%eax
 890:	0f be c0             	movsbl %al,%eax
 893:	25 ff 00 00 00       	and    $0xff,%eax
 898:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 89b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 89f:	75 2c                	jne    8cd <printf+0x6a>
      if(c == '%'){
 8a1:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 8a5:	75 0c                	jne    8b3 <printf+0x50>
        state = '%';
 8a7:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 8ae:	e9 4a 01 00 00       	jmp    9fd <printf+0x19a>
      } else {
        putc(fd, c);
 8b3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8b6:	0f be c0             	movsbl %al,%eax
 8b9:	89 44 24 04          	mov    %eax,0x4(%esp)
 8bd:	8b 45 08             	mov    0x8(%ebp),%eax
 8c0:	89 04 24             	mov    %eax,(%esp)
 8c3:	e8 bb fe ff ff       	call   783 <putc>
 8c8:	e9 30 01 00 00       	jmp    9fd <printf+0x19a>
      }
    } else if(state == '%'){
 8cd:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 8d1:	0f 85 26 01 00 00    	jne    9fd <printf+0x19a>
      if(c == 'd'){
 8d7:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 8db:	75 2d                	jne    90a <printf+0xa7>
        printint(fd, *ap, 10, 1);
 8dd:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8e0:	8b 00                	mov    (%eax),%eax
 8e2:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 8e9:	00 
 8ea:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 8f1:	00 
 8f2:	89 44 24 04          	mov    %eax,0x4(%esp)
 8f6:	8b 45 08             	mov    0x8(%ebp),%eax
 8f9:	89 04 24             	mov    %eax,(%esp)
 8fc:	e8 aa fe ff ff       	call   7ab <printint>
        ap++;
 901:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 905:	e9 ec 00 00 00       	jmp    9f6 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 90a:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 90e:	74 06                	je     916 <printf+0xb3>
 910:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 914:	75 2d                	jne    943 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 916:	8b 45 e8             	mov    -0x18(%ebp),%eax
 919:	8b 00                	mov    (%eax),%eax
 91b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 922:	00 
 923:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 92a:	00 
 92b:	89 44 24 04          	mov    %eax,0x4(%esp)
 92f:	8b 45 08             	mov    0x8(%ebp),%eax
 932:	89 04 24             	mov    %eax,(%esp)
 935:	e8 71 fe ff ff       	call   7ab <printint>
        ap++;
 93a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 93e:	e9 b3 00 00 00       	jmp    9f6 <printf+0x193>
      } else if(c == 's'){
 943:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 947:	75 45                	jne    98e <printf+0x12b>
        s = (char*)*ap;
 949:	8b 45 e8             	mov    -0x18(%ebp),%eax
 94c:	8b 00                	mov    (%eax),%eax
 94e:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 951:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 955:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 959:	75 09                	jne    964 <printf+0x101>
          s = "(null)";
 95b:	c7 45 f4 8f 0c 00 00 	movl   $0xc8f,-0xc(%ebp)
        while(*s != 0){
 962:	eb 1e                	jmp    982 <printf+0x11f>
 964:	eb 1c                	jmp    982 <printf+0x11f>
          putc(fd, *s);
 966:	8b 45 f4             	mov    -0xc(%ebp),%eax
 969:	0f b6 00             	movzbl (%eax),%eax
 96c:	0f be c0             	movsbl %al,%eax
 96f:	89 44 24 04          	mov    %eax,0x4(%esp)
 973:	8b 45 08             	mov    0x8(%ebp),%eax
 976:	89 04 24             	mov    %eax,(%esp)
 979:	e8 05 fe ff ff       	call   783 <putc>
          s++;
 97e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 982:	8b 45 f4             	mov    -0xc(%ebp),%eax
 985:	0f b6 00             	movzbl (%eax),%eax
 988:	84 c0                	test   %al,%al
 98a:	75 da                	jne    966 <printf+0x103>
 98c:	eb 68                	jmp    9f6 <printf+0x193>
        }
      } else if(c == 'c'){
 98e:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 992:	75 1d                	jne    9b1 <printf+0x14e>
        putc(fd, *ap);
 994:	8b 45 e8             	mov    -0x18(%ebp),%eax
 997:	8b 00                	mov    (%eax),%eax
 999:	0f be c0             	movsbl %al,%eax
 99c:	89 44 24 04          	mov    %eax,0x4(%esp)
 9a0:	8b 45 08             	mov    0x8(%ebp),%eax
 9a3:	89 04 24             	mov    %eax,(%esp)
 9a6:	e8 d8 fd ff ff       	call   783 <putc>
        ap++;
 9ab:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 9af:	eb 45                	jmp    9f6 <printf+0x193>
      } else if(c == '%'){
 9b1:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 9b5:	75 17                	jne    9ce <printf+0x16b>
        putc(fd, c);
 9b7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 9ba:	0f be c0             	movsbl %al,%eax
 9bd:	89 44 24 04          	mov    %eax,0x4(%esp)
 9c1:	8b 45 08             	mov    0x8(%ebp),%eax
 9c4:	89 04 24             	mov    %eax,(%esp)
 9c7:	e8 b7 fd ff ff       	call   783 <putc>
 9cc:	eb 28                	jmp    9f6 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 9ce:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 9d5:	00 
 9d6:	8b 45 08             	mov    0x8(%ebp),%eax
 9d9:	89 04 24             	mov    %eax,(%esp)
 9dc:	e8 a2 fd ff ff       	call   783 <putc>
        putc(fd, c);
 9e1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 9e4:	0f be c0             	movsbl %al,%eax
 9e7:	89 44 24 04          	mov    %eax,0x4(%esp)
 9eb:	8b 45 08             	mov    0x8(%ebp),%eax
 9ee:	89 04 24             	mov    %eax,(%esp)
 9f1:	e8 8d fd ff ff       	call   783 <putc>
      }
      state = 0;
 9f6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 9fd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 a01:	8b 55 0c             	mov    0xc(%ebp),%edx
 a04:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a07:	01 d0                	add    %edx,%eax
 a09:	0f b6 00             	movzbl (%eax),%eax
 a0c:	84 c0                	test   %al,%al
 a0e:	0f 85 71 fe ff ff    	jne    885 <printf+0x22>
    }
  }
}
 a14:	c9                   	leave  
 a15:	c3                   	ret    

00000a16 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a16:	55                   	push   %ebp
 a17:	89 e5                	mov    %esp,%ebp
 a19:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a1c:	8b 45 08             	mov    0x8(%ebp),%eax
 a1f:	83 e8 08             	sub    $0x8,%eax
 a22:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a25:	a1 a8 0f 00 00       	mov    0xfa8,%eax
 a2a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a2d:	eb 24                	jmp    a53 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a2f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a32:	8b 00                	mov    (%eax),%eax
 a34:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a37:	77 12                	ja     a4b <free+0x35>
 a39:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a3c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a3f:	77 24                	ja     a65 <free+0x4f>
 a41:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a44:	8b 00                	mov    (%eax),%eax
 a46:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a49:	77 1a                	ja     a65 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a4b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a4e:	8b 00                	mov    (%eax),%eax
 a50:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a53:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a56:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a59:	76 d4                	jbe    a2f <free+0x19>
 a5b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a5e:	8b 00                	mov    (%eax),%eax
 a60:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a63:	76 ca                	jbe    a2f <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a65:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a68:	8b 40 04             	mov    0x4(%eax),%eax
 a6b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 a72:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a75:	01 c2                	add    %eax,%edx
 a77:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a7a:	8b 00                	mov    (%eax),%eax
 a7c:	39 c2                	cmp    %eax,%edx
 a7e:	75 24                	jne    aa4 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 a80:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a83:	8b 50 04             	mov    0x4(%eax),%edx
 a86:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a89:	8b 00                	mov    (%eax),%eax
 a8b:	8b 40 04             	mov    0x4(%eax),%eax
 a8e:	01 c2                	add    %eax,%edx
 a90:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a93:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 a96:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a99:	8b 00                	mov    (%eax),%eax
 a9b:	8b 10                	mov    (%eax),%edx
 a9d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 aa0:	89 10                	mov    %edx,(%eax)
 aa2:	eb 0a                	jmp    aae <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 aa4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aa7:	8b 10                	mov    (%eax),%edx
 aa9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 aac:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 aae:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ab1:	8b 40 04             	mov    0x4(%eax),%eax
 ab4:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 abb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 abe:	01 d0                	add    %edx,%eax
 ac0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 ac3:	75 20                	jne    ae5 <free+0xcf>
    p->s.size += bp->s.size;
 ac5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ac8:	8b 50 04             	mov    0x4(%eax),%edx
 acb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ace:	8b 40 04             	mov    0x4(%eax),%eax
 ad1:	01 c2                	add    %eax,%edx
 ad3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ad6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 ad9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 adc:	8b 10                	mov    (%eax),%edx
 ade:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ae1:	89 10                	mov    %edx,(%eax)
 ae3:	eb 08                	jmp    aed <free+0xd7>
  } else
    p->s.ptr = bp;
 ae5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ae8:	8b 55 f8             	mov    -0x8(%ebp),%edx
 aeb:	89 10                	mov    %edx,(%eax)
  freep = p;
 aed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 af0:	a3 a8 0f 00 00       	mov    %eax,0xfa8
}
 af5:	c9                   	leave  
 af6:	c3                   	ret    

00000af7 <morecore>:

static Header*
morecore(uint nu)
{
 af7:	55                   	push   %ebp
 af8:	89 e5                	mov    %esp,%ebp
 afa:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 afd:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 b04:	77 07                	ja     b0d <morecore+0x16>
    nu = 4096;
 b06:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 b0d:	8b 45 08             	mov    0x8(%ebp),%eax
 b10:	c1 e0 03             	shl    $0x3,%eax
 b13:	89 04 24             	mov    %eax,(%esp)
 b16:	e8 48 fc ff ff       	call   763 <sbrk>
 b1b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 b1e:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 b22:	75 07                	jne    b2b <morecore+0x34>
    return 0;
 b24:	b8 00 00 00 00       	mov    $0x0,%eax
 b29:	eb 22                	jmp    b4d <morecore+0x56>
  hp = (Header*)p;
 b2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b2e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 b31:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b34:	8b 55 08             	mov    0x8(%ebp),%edx
 b37:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 b3a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b3d:	83 c0 08             	add    $0x8,%eax
 b40:	89 04 24             	mov    %eax,(%esp)
 b43:	e8 ce fe ff ff       	call   a16 <free>
  return freep;
 b48:	a1 a8 0f 00 00       	mov    0xfa8,%eax
}
 b4d:	c9                   	leave  
 b4e:	c3                   	ret    

00000b4f <malloc>:

void*
malloc(uint nbytes)
{
 b4f:	55                   	push   %ebp
 b50:	89 e5                	mov    %esp,%ebp
 b52:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b55:	8b 45 08             	mov    0x8(%ebp),%eax
 b58:	83 c0 07             	add    $0x7,%eax
 b5b:	c1 e8 03             	shr    $0x3,%eax
 b5e:	83 c0 01             	add    $0x1,%eax
 b61:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 b64:	a1 a8 0f 00 00       	mov    0xfa8,%eax
 b69:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b6c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 b70:	75 23                	jne    b95 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 b72:	c7 45 f0 a0 0f 00 00 	movl   $0xfa0,-0x10(%ebp)
 b79:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b7c:	a3 a8 0f 00 00       	mov    %eax,0xfa8
 b81:	a1 a8 0f 00 00       	mov    0xfa8,%eax
 b86:	a3 a0 0f 00 00       	mov    %eax,0xfa0
    base.s.size = 0;
 b8b:	c7 05 a4 0f 00 00 00 	movl   $0x0,0xfa4
 b92:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b95:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b98:	8b 00                	mov    (%eax),%eax
 b9a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 b9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ba0:	8b 40 04             	mov    0x4(%eax),%eax
 ba3:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 ba6:	72 4d                	jb     bf5 <malloc+0xa6>
      if(p->s.size == nunits)
 ba8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bab:	8b 40 04             	mov    0x4(%eax),%eax
 bae:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 bb1:	75 0c                	jne    bbf <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 bb3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bb6:	8b 10                	mov    (%eax),%edx
 bb8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bbb:	89 10                	mov    %edx,(%eax)
 bbd:	eb 26                	jmp    be5 <malloc+0x96>
      else {
        p->s.size -= nunits;
 bbf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bc2:	8b 40 04             	mov    0x4(%eax),%eax
 bc5:	2b 45 ec             	sub    -0x14(%ebp),%eax
 bc8:	89 c2                	mov    %eax,%edx
 bca:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bcd:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 bd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bd3:	8b 40 04             	mov    0x4(%eax),%eax
 bd6:	c1 e0 03             	shl    $0x3,%eax
 bd9:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 bdc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bdf:	8b 55 ec             	mov    -0x14(%ebp),%edx
 be2:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 be5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 be8:	a3 a8 0f 00 00       	mov    %eax,0xfa8
      return (void*)(p + 1);
 bed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bf0:	83 c0 08             	add    $0x8,%eax
 bf3:	eb 38                	jmp    c2d <malloc+0xde>
    }
    if(p == freep)
 bf5:	a1 a8 0f 00 00       	mov    0xfa8,%eax
 bfa:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 bfd:	75 1b                	jne    c1a <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 bff:	8b 45 ec             	mov    -0x14(%ebp),%eax
 c02:	89 04 24             	mov    %eax,(%esp)
 c05:	e8 ed fe ff ff       	call   af7 <morecore>
 c0a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 c0d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 c11:	75 07                	jne    c1a <malloc+0xcb>
        return 0;
 c13:	b8 00 00 00 00       	mov    $0x0,%eax
 c18:	eb 13                	jmp    c2d <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c1d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 c20:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c23:	8b 00                	mov    (%eax),%eax
 c25:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 c28:	e9 70 ff ff ff       	jmp    b9d <malloc+0x4e>
}
 c2d:	c9                   	leave  
 c2e:	c3                   	ret    
