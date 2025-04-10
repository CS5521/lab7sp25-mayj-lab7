
_tickettest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  printf(1, "parent pid: %d; tickets should be 10\n", getpid());
   9:	e8 25 05 00 00       	call   533 <getpid>
   e:	89 44 24 08          	mov    %eax,0x8(%esp)
  12:	c7 44 24 04 10 0a 00 	movl   $0xa10,0x4(%esp)
  19:	00 
  1a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  21:	e8 1d 06 00 00       	call   643 <printf>
  ps();
  26:	e8 6d 03 00 00       	call   398 <ps>
  int pid = fork();
  2b:	e8 7b 04 00 00       	call   4ab <fork>
  30:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  if (pid == 0)
  34:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  39:	75 27                	jne    62 <main+0x62>
  {
     printf(1, "first child pid: %d; tickets should be 10\n", getpid());
  3b:	e8 f3 04 00 00       	call   533 <getpid>
  40:	89 44 24 08          	mov    %eax,0x8(%esp)
  44:	c7 44 24 04 38 0a 00 	movl   $0xa38,0x4(%esp)
  4b:	00 
  4c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  53:	e8 eb 05 00 00       	call   643 <printf>
     ps();
  58:	e8 3b 03 00 00       	call   398 <ps>
     exit();
  5d:	e8 51 04 00 00       	call   4b3 <exit>
  }
  wait();
  62:	e8 54 04 00 00       	call   4bb <wait>
  printf(1, "parent pid: %d; setting tickets to 20\n", getpid());
  67:	e8 c7 04 00 00       	call   533 <getpid>
  6c:	89 44 24 08          	mov    %eax,0x8(%esp)
  70:	c7 44 24 04 64 0a 00 	movl   $0xa64,0x4(%esp)
  77:	00 
  78:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7f:	e8 bf 05 00 00       	call   643 <printf>
  settickets(20);
  84:	c7 04 24 14 00 00 00 	movl   $0x14,(%esp)
  8b:	e8 cb 04 00 00       	call   55b <settickets>
  ps();
  90:	e8 03 03 00 00       	call   398 <ps>
  pid = fork();
  95:	e8 11 04 00 00       	call   4ab <fork>
  9a:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  if (pid == 0)
  9e:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  a3:	0f 85 85 00 00 00    	jne    12e <main+0x12e>
  {
     printf(1, "second child pid: %d; tickets should be 20\n", getpid());
  a9:	e8 85 04 00 00       	call   533 <getpid>
  ae:	89 44 24 08          	mov    %eax,0x8(%esp)
  b2:	c7 44 24 04 8c 0a 00 	movl   $0xa8c,0x4(%esp)
  b9:	00 
  ba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c1:	e8 7d 05 00 00       	call   643 <printf>
     ps();
  c6:	e8 cd 02 00 00       	call   398 <ps>
     settickets(30);
  cb:	c7 04 24 1e 00 00 00 	movl   $0x1e,(%esp)
  d2:	e8 84 04 00 00       	call   55b <settickets>
     printf(1, "second child pid: %d; tickets should now be 30\n");
  d7:	c7 44 24 04 b8 0a 00 	movl   $0xab8,0x4(%esp)
  de:	00 
  df:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e6:	e8 58 05 00 00       	call   643 <printf>
     ps();
  eb:	e8 a8 02 00 00       	call   398 <ps>
     pid = fork();
  f0:	e8 b6 03 00 00       	call   4ab <fork>
  f5:	89 44 24 1c          	mov    %eax,0x1c(%esp)
     if (pid == 0)
  f9:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  fe:	75 24                	jne    124 <main+0x124>
     {
        printf(1, "child of second child pid: %d; tickets should be 30\n", getpid());
 100:	e8 2e 04 00 00       	call   533 <getpid>
 105:	89 44 24 08          	mov    %eax,0x8(%esp)
 109:	c7 44 24 04 e8 0a 00 	movl   $0xae8,0x4(%esp)
 110:	00 
 111:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 118:	e8 26 05 00 00       	call   643 <printf>
        ps();
 11d:	e8 76 02 00 00       	call   398 <ps>
 122:	eb 0a                	jmp    12e <main+0x12e>
     } else
     {
        wait();
 124:	e8 92 03 00 00       	call   4bb <wait>
        exit();
 129:	e8 85 03 00 00       	call   4b3 <exit>
     }
  }
  wait();
 12e:	e8 88 03 00 00       	call   4bb <wait>
  exit();
 133:	e8 7b 03 00 00       	call   4b3 <exit>

00000138 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 138:	55                   	push   %ebp
 139:	89 e5                	mov    %esp,%ebp
 13b:	57                   	push   %edi
 13c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 13d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 140:	8b 55 10             	mov    0x10(%ebp),%edx
 143:	8b 45 0c             	mov    0xc(%ebp),%eax
 146:	89 cb                	mov    %ecx,%ebx
 148:	89 df                	mov    %ebx,%edi
 14a:	89 d1                	mov    %edx,%ecx
 14c:	fc                   	cld    
 14d:	f3 aa                	rep stos %al,%es:(%edi)
 14f:	89 ca                	mov    %ecx,%edx
 151:	89 fb                	mov    %edi,%ebx
 153:	89 5d 08             	mov    %ebx,0x8(%ebp)
 156:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 159:	5b                   	pop    %ebx
 15a:	5f                   	pop    %edi
 15b:	5d                   	pop    %ebp
 15c:	c3                   	ret    

0000015d <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 15d:	55                   	push   %ebp
 15e:	89 e5                	mov    %esp,%ebp
 160:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 169:	90                   	nop
 16a:	8b 45 08             	mov    0x8(%ebp),%eax
 16d:	8d 50 01             	lea    0x1(%eax),%edx
 170:	89 55 08             	mov    %edx,0x8(%ebp)
 173:	8b 55 0c             	mov    0xc(%ebp),%edx
 176:	8d 4a 01             	lea    0x1(%edx),%ecx
 179:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 17c:	0f b6 12             	movzbl (%edx),%edx
 17f:	88 10                	mov    %dl,(%eax)
 181:	0f b6 00             	movzbl (%eax),%eax
 184:	84 c0                	test   %al,%al
 186:	75 e2                	jne    16a <strcpy+0xd>
    ;
  return os;
 188:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 18b:	c9                   	leave  
 18c:	c3                   	ret    

0000018d <strcmp>:

int
strcmp(const char *p, const char *q)
{
 18d:	55                   	push   %ebp
 18e:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 190:	eb 08                	jmp    19a <strcmp+0xd>
    p++, q++;
 192:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 196:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 19a:	8b 45 08             	mov    0x8(%ebp),%eax
 19d:	0f b6 00             	movzbl (%eax),%eax
 1a0:	84 c0                	test   %al,%al
 1a2:	74 10                	je     1b4 <strcmp+0x27>
 1a4:	8b 45 08             	mov    0x8(%ebp),%eax
 1a7:	0f b6 10             	movzbl (%eax),%edx
 1aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ad:	0f b6 00             	movzbl (%eax),%eax
 1b0:	38 c2                	cmp    %al,%dl
 1b2:	74 de                	je     192 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 1b4:	8b 45 08             	mov    0x8(%ebp),%eax
 1b7:	0f b6 00             	movzbl (%eax),%eax
 1ba:	0f b6 d0             	movzbl %al,%edx
 1bd:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c0:	0f b6 00             	movzbl (%eax),%eax
 1c3:	0f b6 c0             	movzbl %al,%eax
 1c6:	29 c2                	sub    %eax,%edx
 1c8:	89 d0                	mov    %edx,%eax
}
 1ca:	5d                   	pop    %ebp
 1cb:	c3                   	ret    

000001cc <strlen>:

uint
strlen(const char *s)
{
 1cc:	55                   	push   %ebp
 1cd:	89 e5                	mov    %esp,%ebp
 1cf:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1d2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1d9:	eb 04                	jmp    1df <strlen+0x13>
 1db:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1df:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1e2:	8b 45 08             	mov    0x8(%ebp),%eax
 1e5:	01 d0                	add    %edx,%eax
 1e7:	0f b6 00             	movzbl (%eax),%eax
 1ea:	84 c0                	test   %al,%al
 1ec:	75 ed                	jne    1db <strlen+0xf>
    ;
  return n;
 1ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1f1:	c9                   	leave  
 1f2:	c3                   	ret    

000001f3 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1f3:	55                   	push   %ebp
 1f4:	89 e5                	mov    %esp,%ebp
 1f6:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1f9:	8b 45 10             	mov    0x10(%ebp),%eax
 1fc:	89 44 24 08          	mov    %eax,0x8(%esp)
 200:	8b 45 0c             	mov    0xc(%ebp),%eax
 203:	89 44 24 04          	mov    %eax,0x4(%esp)
 207:	8b 45 08             	mov    0x8(%ebp),%eax
 20a:	89 04 24             	mov    %eax,(%esp)
 20d:	e8 26 ff ff ff       	call   138 <stosb>
  return dst;
 212:	8b 45 08             	mov    0x8(%ebp),%eax
}
 215:	c9                   	leave  
 216:	c3                   	ret    

00000217 <strchr>:

char*
strchr(const char *s, char c)
{
 217:	55                   	push   %ebp
 218:	89 e5                	mov    %esp,%ebp
 21a:	83 ec 04             	sub    $0x4,%esp
 21d:	8b 45 0c             	mov    0xc(%ebp),%eax
 220:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 223:	eb 14                	jmp    239 <strchr+0x22>
    if(*s == c)
 225:	8b 45 08             	mov    0x8(%ebp),%eax
 228:	0f b6 00             	movzbl (%eax),%eax
 22b:	3a 45 fc             	cmp    -0x4(%ebp),%al
 22e:	75 05                	jne    235 <strchr+0x1e>
      return (char*)s;
 230:	8b 45 08             	mov    0x8(%ebp),%eax
 233:	eb 13                	jmp    248 <strchr+0x31>
  for(; *s; s++)
 235:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 239:	8b 45 08             	mov    0x8(%ebp),%eax
 23c:	0f b6 00             	movzbl (%eax),%eax
 23f:	84 c0                	test   %al,%al
 241:	75 e2                	jne    225 <strchr+0xe>
  return 0;
 243:	b8 00 00 00 00       	mov    $0x0,%eax
}
 248:	c9                   	leave  
 249:	c3                   	ret    

0000024a <gets>:

char*
gets(char *buf, int max)
{
 24a:	55                   	push   %ebp
 24b:	89 e5                	mov    %esp,%ebp
 24d:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 250:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 257:	eb 4c                	jmp    2a5 <gets+0x5b>
    cc = read(0, &c, 1);
 259:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 260:	00 
 261:	8d 45 ef             	lea    -0x11(%ebp),%eax
 264:	89 44 24 04          	mov    %eax,0x4(%esp)
 268:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 26f:	e8 57 02 00 00       	call   4cb <read>
 274:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 277:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 27b:	7f 02                	jg     27f <gets+0x35>
      break;
 27d:	eb 31                	jmp    2b0 <gets+0x66>
    buf[i++] = c;
 27f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 282:	8d 50 01             	lea    0x1(%eax),%edx
 285:	89 55 f4             	mov    %edx,-0xc(%ebp)
 288:	89 c2                	mov    %eax,%edx
 28a:	8b 45 08             	mov    0x8(%ebp),%eax
 28d:	01 c2                	add    %eax,%edx
 28f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 293:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 295:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 299:	3c 0a                	cmp    $0xa,%al
 29b:	74 13                	je     2b0 <gets+0x66>
 29d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2a1:	3c 0d                	cmp    $0xd,%al
 2a3:	74 0b                	je     2b0 <gets+0x66>
  for(i=0; i+1 < max; ){
 2a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2a8:	83 c0 01             	add    $0x1,%eax
 2ab:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2ae:	7c a9                	jl     259 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 2b0:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
 2b6:	01 d0                	add    %edx,%eax
 2b8:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2bb:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2be:	c9                   	leave  
 2bf:	c3                   	ret    

000002c0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2c6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2cd:	00 
 2ce:	8b 45 08             	mov    0x8(%ebp),%eax
 2d1:	89 04 24             	mov    %eax,(%esp)
 2d4:	e8 1a 02 00 00       	call   4f3 <open>
 2d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2dc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2e0:	79 07                	jns    2e9 <stat+0x29>
    return -1;
 2e2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2e7:	eb 23                	jmp    30c <stat+0x4c>
  r = fstat(fd, st);
 2e9:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ec:	89 44 24 04          	mov    %eax,0x4(%esp)
 2f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2f3:	89 04 24             	mov    %eax,(%esp)
 2f6:	e8 10 02 00 00       	call   50b <fstat>
 2fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
 301:	89 04 24             	mov    %eax,(%esp)
 304:	e8 d2 01 00 00       	call   4db <close>
  return r;
 309:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 30c:	c9                   	leave  
 30d:	c3                   	ret    

0000030e <atoi>:

int
atoi(const char *s)
{
 30e:	55                   	push   %ebp
 30f:	89 e5                	mov    %esp,%ebp
 311:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 314:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 31b:	eb 25                	jmp    342 <atoi+0x34>
    n = n*10 + *s++ - '0';
 31d:	8b 55 fc             	mov    -0x4(%ebp),%edx
 320:	89 d0                	mov    %edx,%eax
 322:	c1 e0 02             	shl    $0x2,%eax
 325:	01 d0                	add    %edx,%eax
 327:	01 c0                	add    %eax,%eax
 329:	89 c1                	mov    %eax,%ecx
 32b:	8b 45 08             	mov    0x8(%ebp),%eax
 32e:	8d 50 01             	lea    0x1(%eax),%edx
 331:	89 55 08             	mov    %edx,0x8(%ebp)
 334:	0f b6 00             	movzbl (%eax),%eax
 337:	0f be c0             	movsbl %al,%eax
 33a:	01 c8                	add    %ecx,%eax
 33c:	83 e8 30             	sub    $0x30,%eax
 33f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 342:	8b 45 08             	mov    0x8(%ebp),%eax
 345:	0f b6 00             	movzbl (%eax),%eax
 348:	3c 2f                	cmp    $0x2f,%al
 34a:	7e 0a                	jle    356 <atoi+0x48>
 34c:	8b 45 08             	mov    0x8(%ebp),%eax
 34f:	0f b6 00             	movzbl (%eax),%eax
 352:	3c 39                	cmp    $0x39,%al
 354:	7e c7                	jle    31d <atoi+0xf>
  return n;
 356:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 359:	c9                   	leave  
 35a:	c3                   	ret    

0000035b <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 35b:	55                   	push   %ebp
 35c:	89 e5                	mov    %esp,%ebp
 35e:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 361:	8b 45 08             	mov    0x8(%ebp),%eax
 364:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 367:	8b 45 0c             	mov    0xc(%ebp),%eax
 36a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 36d:	eb 17                	jmp    386 <memmove+0x2b>
    *dst++ = *src++;
 36f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 372:	8d 50 01             	lea    0x1(%eax),%edx
 375:	89 55 fc             	mov    %edx,-0x4(%ebp)
 378:	8b 55 f8             	mov    -0x8(%ebp),%edx
 37b:	8d 4a 01             	lea    0x1(%edx),%ecx
 37e:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 381:	0f b6 12             	movzbl (%edx),%edx
 384:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 386:	8b 45 10             	mov    0x10(%ebp),%eax
 389:	8d 50 ff             	lea    -0x1(%eax),%edx
 38c:	89 55 10             	mov    %edx,0x10(%ebp)
 38f:	85 c0                	test   %eax,%eax
 391:	7f dc                	jg     36f <memmove+0x14>
  return vdst;
 393:	8b 45 08             	mov    0x8(%ebp),%eax
}
 396:	c9                   	leave  
 397:	c3                   	ret    

00000398 <ps>:

void
ps() {
 398:	55                   	push   %ebp
 399:	89 e5                	mov    %esp,%ebp
 39b:	57                   	push   %edi
 39c:	56                   	push   %esi
 39d:	53                   	push   %ebx
 39e:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pstat;
  int i = 0;
 3a4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  printf(1, "PID	TKTS	TCKS	STAT	NAME\n");
 3ab:	c7 44 24 04 1d 0b 00 	movl   $0xb1d,0x4(%esp)
 3b2:	00 
 3b3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3ba:	e8 84 02 00 00       	call   643 <printf>
  getpinfo(&pstat);
 3bf:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 3c5:	89 04 24             	mov    %eax,(%esp)
 3c8:	e8 86 01 00 00       	call   553 <getpinfo>
  while (pstat[i].pid != 0) {
 3cd:	e9 ad 00 00 00       	jmp    47f <ps+0xe7>
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
	pstat[i].tickets, pstat[i].ticks, pstat[i].state, pstat[i].name);
 3d2:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 3d8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3db:	89 d0                	mov    %edx,%eax
 3dd:	c1 e0 03             	shl    $0x3,%eax
 3e0:	01 d0                	add    %edx,%eax
 3e2:	c1 e0 02             	shl    $0x2,%eax
 3e5:	83 c0 10             	add    $0x10,%eax
 3e8:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
 3eb:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3ee:	89 d0                	mov    %edx,%eax
 3f0:	c1 e0 03             	shl    $0x3,%eax
 3f3:	01 d0                	add    %edx,%eax
 3f5:	c1 e0 02             	shl    $0x2,%eax
 3f8:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 3fb:	01 d8                	add    %ebx,%eax
 3fd:	2d e4 08 00 00       	sub    $0x8e4,%eax
 402:	0f b6 00             	movzbl (%eax),%eax
      printf(1, "%d	%d	%d	%c	%s\n", pstat[i].pid, 
 405:	0f be f0             	movsbl %al,%esi
 408:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 40b:	89 d0                	mov    %edx,%eax
 40d:	c1 e0 03             	shl    $0x3,%eax
 410:	01 d0                	add    %edx,%eax
 412:	c1 e0 02             	shl    $0x2,%eax
 415:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 418:	01 c8                	add    %ecx,%eax
 41a:	2d f8 08 00 00       	sub    $0x8f8,%eax
 41f:	8b 18                	mov    (%eax),%ebx
 421:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 424:	89 d0                	mov    %edx,%eax
 426:	c1 e0 03             	shl    $0x3,%eax
 429:	01 d0                	add    %edx,%eax
 42b:	c1 e0 02             	shl    $0x2,%eax
 42e:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 431:	01 c8                	add    %ecx,%eax
 433:	2d 00 09 00 00       	sub    $0x900,%eax
 438:	8b 08                	mov    (%eax),%ecx
 43a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 43d:	89 d0                	mov    %edx,%eax
 43f:	c1 e0 03             	shl    $0x3,%eax
 442:	01 d0                	add    %edx,%eax
 444:	c1 e0 02             	shl    $0x2,%eax
 447:	8d 55 e8             	lea    -0x18(%ebp),%edx
 44a:	01 d0                	add    %edx,%eax
 44c:	2d fc 08 00 00       	sub    $0x8fc,%eax
 451:	8b 00                	mov    (%eax),%eax
 453:	89 7c 24 18          	mov    %edi,0x18(%esp)
 457:	89 74 24 14          	mov    %esi,0x14(%esp)
 45b:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 45f:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 463:	89 44 24 08          	mov    %eax,0x8(%esp)
 467:	c7 44 24 04 36 0b 00 	movl   $0xb36,0x4(%esp)
 46e:	00 
 46f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 476:	e8 c8 01 00 00       	call   643 <printf>
      i++;
 47b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  while (pstat[i].pid != 0) {
 47f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 482:	89 d0                	mov    %edx,%eax
 484:	c1 e0 03             	shl    $0x3,%eax
 487:	01 d0                	add    %edx,%eax
 489:	c1 e0 02             	shl    $0x2,%eax
 48c:	8d 75 e8             	lea    -0x18(%ebp),%esi
 48f:	01 f0                	add    %esi,%eax
 491:	2d fc 08 00 00       	sub    $0x8fc,%eax
 496:	8b 00                	mov    (%eax),%eax
 498:	85 c0                	test   %eax,%eax
 49a:	0f 85 32 ff ff ff    	jne    3d2 <ps+0x3a>
  }
}
 4a0:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 4a6:	5b                   	pop    %ebx
 4a7:	5e                   	pop    %esi
 4a8:	5f                   	pop    %edi
 4a9:	5d                   	pop    %ebp
 4aa:	c3                   	ret    

000004ab <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4ab:	b8 01 00 00 00       	mov    $0x1,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <exit>:
SYSCALL(exit)
 4b3:	b8 02 00 00 00       	mov    $0x2,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <wait>:
SYSCALL(wait)
 4bb:	b8 03 00 00 00       	mov    $0x3,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <pipe>:
SYSCALL(pipe)
 4c3:	b8 04 00 00 00       	mov    $0x4,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <read>:
SYSCALL(read)
 4cb:	b8 05 00 00 00       	mov    $0x5,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <write>:
SYSCALL(write)
 4d3:	b8 10 00 00 00       	mov    $0x10,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <close>:
SYSCALL(close)
 4db:	b8 15 00 00 00       	mov    $0x15,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <kill>:
SYSCALL(kill)
 4e3:	b8 06 00 00 00       	mov    $0x6,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <exec>:
SYSCALL(exec)
 4eb:	b8 07 00 00 00       	mov    $0x7,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <open>:
SYSCALL(open)
 4f3:	b8 0f 00 00 00       	mov    $0xf,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <mknod>:
SYSCALL(mknod)
 4fb:	b8 11 00 00 00       	mov    $0x11,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <unlink>:
SYSCALL(unlink)
 503:	b8 12 00 00 00       	mov    $0x12,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <fstat>:
SYSCALL(fstat)
 50b:	b8 08 00 00 00       	mov    $0x8,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <link>:
SYSCALL(link)
 513:	b8 13 00 00 00       	mov    $0x13,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <mkdir>:
SYSCALL(mkdir)
 51b:	b8 14 00 00 00       	mov    $0x14,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <chdir>:
SYSCALL(chdir)
 523:	b8 09 00 00 00       	mov    $0x9,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <dup>:
SYSCALL(dup)
 52b:	b8 0a 00 00 00       	mov    $0xa,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <getpid>:
SYSCALL(getpid)
 533:	b8 0b 00 00 00       	mov    $0xb,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <sbrk>:
SYSCALL(sbrk)
 53b:	b8 0c 00 00 00       	mov    $0xc,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <sleep>:
SYSCALL(sleep)
 543:	b8 0d 00 00 00       	mov    $0xd,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <uptime>:
SYSCALL(uptime)
 54b:	b8 0e 00 00 00       	mov    $0xe,%eax
 550:	cd 40                	int    $0x40
 552:	c3                   	ret    

00000553 <getpinfo>:
SYSCALL(getpinfo)
 553:	b8 16 00 00 00       	mov    $0x16,%eax
 558:	cd 40                	int    $0x40
 55a:	c3                   	ret    

0000055b <settickets>:
SYSCALL(settickets)
 55b:	b8 17 00 00 00       	mov    $0x17,%eax
 560:	cd 40                	int    $0x40
 562:	c3                   	ret    

00000563 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 563:	55                   	push   %ebp
 564:	89 e5                	mov    %esp,%ebp
 566:	83 ec 18             	sub    $0x18,%esp
 569:	8b 45 0c             	mov    0xc(%ebp),%eax
 56c:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 56f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 576:	00 
 577:	8d 45 f4             	lea    -0xc(%ebp),%eax
 57a:	89 44 24 04          	mov    %eax,0x4(%esp)
 57e:	8b 45 08             	mov    0x8(%ebp),%eax
 581:	89 04 24             	mov    %eax,(%esp)
 584:	e8 4a ff ff ff       	call   4d3 <write>
}
 589:	c9                   	leave  
 58a:	c3                   	ret    

0000058b <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 58b:	55                   	push   %ebp
 58c:	89 e5                	mov    %esp,%ebp
 58e:	56                   	push   %esi
 58f:	53                   	push   %ebx
 590:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 593:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 59a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 59e:	74 17                	je     5b7 <printint+0x2c>
 5a0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 5a4:	79 11                	jns    5b7 <printint+0x2c>
    neg = 1;
 5a6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 5ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 5b0:	f7 d8                	neg    %eax
 5b2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5b5:	eb 06                	jmp    5bd <printint+0x32>
  } else {
    x = xx;
 5b7:	8b 45 0c             	mov    0xc(%ebp),%eax
 5ba:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 5bd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 5c4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 5c7:	8d 41 01             	lea    0x1(%ecx),%eax
 5ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5cd:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5d3:	ba 00 00 00 00       	mov    $0x0,%edx
 5d8:	f7 f3                	div    %ebx
 5da:	89 d0                	mov    %edx,%eax
 5dc:	0f b6 80 c4 0d 00 00 	movzbl 0xdc4(%eax),%eax
 5e3:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 5e7:	8b 75 10             	mov    0x10(%ebp),%esi
 5ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5ed:	ba 00 00 00 00       	mov    $0x0,%edx
 5f2:	f7 f6                	div    %esi
 5f4:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5f7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5fb:	75 c7                	jne    5c4 <printint+0x39>
  if(neg)
 5fd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 601:	74 10                	je     613 <printint+0x88>
    buf[i++] = '-';
 603:	8b 45 f4             	mov    -0xc(%ebp),%eax
 606:	8d 50 01             	lea    0x1(%eax),%edx
 609:	89 55 f4             	mov    %edx,-0xc(%ebp)
 60c:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 611:	eb 1f                	jmp    632 <printint+0xa7>
 613:	eb 1d                	jmp    632 <printint+0xa7>
    putc(fd, buf[i]);
 615:	8d 55 dc             	lea    -0x24(%ebp),%edx
 618:	8b 45 f4             	mov    -0xc(%ebp),%eax
 61b:	01 d0                	add    %edx,%eax
 61d:	0f b6 00             	movzbl (%eax),%eax
 620:	0f be c0             	movsbl %al,%eax
 623:	89 44 24 04          	mov    %eax,0x4(%esp)
 627:	8b 45 08             	mov    0x8(%ebp),%eax
 62a:	89 04 24             	mov    %eax,(%esp)
 62d:	e8 31 ff ff ff       	call   563 <putc>
  while(--i >= 0)
 632:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 636:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 63a:	79 d9                	jns    615 <printint+0x8a>
}
 63c:	83 c4 30             	add    $0x30,%esp
 63f:	5b                   	pop    %ebx
 640:	5e                   	pop    %esi
 641:	5d                   	pop    %ebp
 642:	c3                   	ret    

00000643 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 643:	55                   	push   %ebp
 644:	89 e5                	mov    %esp,%ebp
 646:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 649:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 650:	8d 45 0c             	lea    0xc(%ebp),%eax
 653:	83 c0 04             	add    $0x4,%eax
 656:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 659:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 660:	e9 7c 01 00 00       	jmp    7e1 <printf+0x19e>
    c = fmt[i] & 0xff;
 665:	8b 55 0c             	mov    0xc(%ebp),%edx
 668:	8b 45 f0             	mov    -0x10(%ebp),%eax
 66b:	01 d0                	add    %edx,%eax
 66d:	0f b6 00             	movzbl (%eax),%eax
 670:	0f be c0             	movsbl %al,%eax
 673:	25 ff 00 00 00       	and    $0xff,%eax
 678:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 67b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 67f:	75 2c                	jne    6ad <printf+0x6a>
      if(c == '%'){
 681:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 685:	75 0c                	jne    693 <printf+0x50>
        state = '%';
 687:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 68e:	e9 4a 01 00 00       	jmp    7dd <printf+0x19a>
      } else {
        putc(fd, c);
 693:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 696:	0f be c0             	movsbl %al,%eax
 699:	89 44 24 04          	mov    %eax,0x4(%esp)
 69d:	8b 45 08             	mov    0x8(%ebp),%eax
 6a0:	89 04 24             	mov    %eax,(%esp)
 6a3:	e8 bb fe ff ff       	call   563 <putc>
 6a8:	e9 30 01 00 00       	jmp    7dd <printf+0x19a>
      }
    } else if(state == '%'){
 6ad:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 6b1:	0f 85 26 01 00 00    	jne    7dd <printf+0x19a>
      if(c == 'd'){
 6b7:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 6bb:	75 2d                	jne    6ea <printf+0xa7>
        printint(fd, *ap, 10, 1);
 6bd:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6c0:	8b 00                	mov    (%eax),%eax
 6c2:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 6c9:	00 
 6ca:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 6d1:	00 
 6d2:	89 44 24 04          	mov    %eax,0x4(%esp)
 6d6:	8b 45 08             	mov    0x8(%ebp),%eax
 6d9:	89 04 24             	mov    %eax,(%esp)
 6dc:	e8 aa fe ff ff       	call   58b <printint>
        ap++;
 6e1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6e5:	e9 ec 00 00 00       	jmp    7d6 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 6ea:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 6ee:	74 06                	je     6f6 <printf+0xb3>
 6f0:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 6f4:	75 2d                	jne    723 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 6f6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6f9:	8b 00                	mov    (%eax),%eax
 6fb:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 702:	00 
 703:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 70a:	00 
 70b:	89 44 24 04          	mov    %eax,0x4(%esp)
 70f:	8b 45 08             	mov    0x8(%ebp),%eax
 712:	89 04 24             	mov    %eax,(%esp)
 715:	e8 71 fe ff ff       	call   58b <printint>
        ap++;
 71a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 71e:	e9 b3 00 00 00       	jmp    7d6 <printf+0x193>
      } else if(c == 's'){
 723:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 727:	75 45                	jne    76e <printf+0x12b>
        s = (char*)*ap;
 729:	8b 45 e8             	mov    -0x18(%ebp),%eax
 72c:	8b 00                	mov    (%eax),%eax
 72e:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 731:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 735:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 739:	75 09                	jne    744 <printf+0x101>
          s = "(null)";
 73b:	c7 45 f4 46 0b 00 00 	movl   $0xb46,-0xc(%ebp)
        while(*s != 0){
 742:	eb 1e                	jmp    762 <printf+0x11f>
 744:	eb 1c                	jmp    762 <printf+0x11f>
          putc(fd, *s);
 746:	8b 45 f4             	mov    -0xc(%ebp),%eax
 749:	0f b6 00             	movzbl (%eax),%eax
 74c:	0f be c0             	movsbl %al,%eax
 74f:	89 44 24 04          	mov    %eax,0x4(%esp)
 753:	8b 45 08             	mov    0x8(%ebp),%eax
 756:	89 04 24             	mov    %eax,(%esp)
 759:	e8 05 fe ff ff       	call   563 <putc>
          s++;
 75e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 762:	8b 45 f4             	mov    -0xc(%ebp),%eax
 765:	0f b6 00             	movzbl (%eax),%eax
 768:	84 c0                	test   %al,%al
 76a:	75 da                	jne    746 <printf+0x103>
 76c:	eb 68                	jmp    7d6 <printf+0x193>
        }
      } else if(c == 'c'){
 76e:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 772:	75 1d                	jne    791 <printf+0x14e>
        putc(fd, *ap);
 774:	8b 45 e8             	mov    -0x18(%ebp),%eax
 777:	8b 00                	mov    (%eax),%eax
 779:	0f be c0             	movsbl %al,%eax
 77c:	89 44 24 04          	mov    %eax,0x4(%esp)
 780:	8b 45 08             	mov    0x8(%ebp),%eax
 783:	89 04 24             	mov    %eax,(%esp)
 786:	e8 d8 fd ff ff       	call   563 <putc>
        ap++;
 78b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 78f:	eb 45                	jmp    7d6 <printf+0x193>
      } else if(c == '%'){
 791:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 795:	75 17                	jne    7ae <printf+0x16b>
        putc(fd, c);
 797:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 79a:	0f be c0             	movsbl %al,%eax
 79d:	89 44 24 04          	mov    %eax,0x4(%esp)
 7a1:	8b 45 08             	mov    0x8(%ebp),%eax
 7a4:	89 04 24             	mov    %eax,(%esp)
 7a7:	e8 b7 fd ff ff       	call   563 <putc>
 7ac:	eb 28                	jmp    7d6 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7ae:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 7b5:	00 
 7b6:	8b 45 08             	mov    0x8(%ebp),%eax
 7b9:	89 04 24             	mov    %eax,(%esp)
 7bc:	e8 a2 fd ff ff       	call   563 <putc>
        putc(fd, c);
 7c1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7c4:	0f be c0             	movsbl %al,%eax
 7c7:	89 44 24 04          	mov    %eax,0x4(%esp)
 7cb:	8b 45 08             	mov    0x8(%ebp),%eax
 7ce:	89 04 24             	mov    %eax,(%esp)
 7d1:	e8 8d fd ff ff       	call   563 <putc>
      }
      state = 0;
 7d6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 7dd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 7e1:	8b 55 0c             	mov    0xc(%ebp),%edx
 7e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7e7:	01 d0                	add    %edx,%eax
 7e9:	0f b6 00             	movzbl (%eax),%eax
 7ec:	84 c0                	test   %al,%al
 7ee:	0f 85 71 fe ff ff    	jne    665 <printf+0x22>
    }
  }
}
 7f4:	c9                   	leave  
 7f5:	c3                   	ret    

000007f6 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7f6:	55                   	push   %ebp
 7f7:	89 e5                	mov    %esp,%ebp
 7f9:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7fc:	8b 45 08             	mov    0x8(%ebp),%eax
 7ff:	83 e8 08             	sub    $0x8,%eax
 802:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 805:	a1 e0 0d 00 00       	mov    0xde0,%eax
 80a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 80d:	eb 24                	jmp    833 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 80f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 812:	8b 00                	mov    (%eax),%eax
 814:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 817:	77 12                	ja     82b <free+0x35>
 819:	8b 45 f8             	mov    -0x8(%ebp),%eax
 81c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 81f:	77 24                	ja     845 <free+0x4f>
 821:	8b 45 fc             	mov    -0x4(%ebp),%eax
 824:	8b 00                	mov    (%eax),%eax
 826:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 829:	77 1a                	ja     845 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 82b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82e:	8b 00                	mov    (%eax),%eax
 830:	89 45 fc             	mov    %eax,-0x4(%ebp)
 833:	8b 45 f8             	mov    -0x8(%ebp),%eax
 836:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 839:	76 d4                	jbe    80f <free+0x19>
 83b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 83e:	8b 00                	mov    (%eax),%eax
 840:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 843:	76 ca                	jbe    80f <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 845:	8b 45 f8             	mov    -0x8(%ebp),%eax
 848:	8b 40 04             	mov    0x4(%eax),%eax
 84b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 852:	8b 45 f8             	mov    -0x8(%ebp),%eax
 855:	01 c2                	add    %eax,%edx
 857:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85a:	8b 00                	mov    (%eax),%eax
 85c:	39 c2                	cmp    %eax,%edx
 85e:	75 24                	jne    884 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 860:	8b 45 f8             	mov    -0x8(%ebp),%eax
 863:	8b 50 04             	mov    0x4(%eax),%edx
 866:	8b 45 fc             	mov    -0x4(%ebp),%eax
 869:	8b 00                	mov    (%eax),%eax
 86b:	8b 40 04             	mov    0x4(%eax),%eax
 86e:	01 c2                	add    %eax,%edx
 870:	8b 45 f8             	mov    -0x8(%ebp),%eax
 873:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 876:	8b 45 fc             	mov    -0x4(%ebp),%eax
 879:	8b 00                	mov    (%eax),%eax
 87b:	8b 10                	mov    (%eax),%edx
 87d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 880:	89 10                	mov    %edx,(%eax)
 882:	eb 0a                	jmp    88e <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 884:	8b 45 fc             	mov    -0x4(%ebp),%eax
 887:	8b 10                	mov    (%eax),%edx
 889:	8b 45 f8             	mov    -0x8(%ebp),%eax
 88c:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 88e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 891:	8b 40 04             	mov    0x4(%eax),%eax
 894:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 89b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 89e:	01 d0                	add    %edx,%eax
 8a0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8a3:	75 20                	jne    8c5 <free+0xcf>
    p->s.size += bp->s.size;
 8a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a8:	8b 50 04             	mov    0x4(%eax),%edx
 8ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8ae:	8b 40 04             	mov    0x4(%eax),%eax
 8b1:	01 c2                	add    %eax,%edx
 8b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8b9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8bc:	8b 10                	mov    (%eax),%edx
 8be:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c1:	89 10                	mov    %edx,(%eax)
 8c3:	eb 08                	jmp    8cd <free+0xd7>
  } else
    p->s.ptr = bp;
 8c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c8:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8cb:	89 10                	mov    %edx,(%eax)
  freep = p;
 8cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d0:	a3 e0 0d 00 00       	mov    %eax,0xde0
}
 8d5:	c9                   	leave  
 8d6:	c3                   	ret    

000008d7 <morecore>:

static Header*
morecore(uint nu)
{
 8d7:	55                   	push   %ebp
 8d8:	89 e5                	mov    %esp,%ebp
 8da:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 8dd:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 8e4:	77 07                	ja     8ed <morecore+0x16>
    nu = 4096;
 8e6:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 8ed:	8b 45 08             	mov    0x8(%ebp),%eax
 8f0:	c1 e0 03             	shl    $0x3,%eax
 8f3:	89 04 24             	mov    %eax,(%esp)
 8f6:	e8 40 fc ff ff       	call   53b <sbrk>
 8fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 8fe:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 902:	75 07                	jne    90b <morecore+0x34>
    return 0;
 904:	b8 00 00 00 00       	mov    $0x0,%eax
 909:	eb 22                	jmp    92d <morecore+0x56>
  hp = (Header*)p;
 90b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 911:	8b 45 f0             	mov    -0x10(%ebp),%eax
 914:	8b 55 08             	mov    0x8(%ebp),%edx
 917:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 91a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 91d:	83 c0 08             	add    $0x8,%eax
 920:	89 04 24             	mov    %eax,(%esp)
 923:	e8 ce fe ff ff       	call   7f6 <free>
  return freep;
 928:	a1 e0 0d 00 00       	mov    0xde0,%eax
}
 92d:	c9                   	leave  
 92e:	c3                   	ret    

0000092f <malloc>:

void*
malloc(uint nbytes)
{
 92f:	55                   	push   %ebp
 930:	89 e5                	mov    %esp,%ebp
 932:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 935:	8b 45 08             	mov    0x8(%ebp),%eax
 938:	83 c0 07             	add    $0x7,%eax
 93b:	c1 e8 03             	shr    $0x3,%eax
 93e:	83 c0 01             	add    $0x1,%eax
 941:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 944:	a1 e0 0d 00 00       	mov    0xde0,%eax
 949:	89 45 f0             	mov    %eax,-0x10(%ebp)
 94c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 950:	75 23                	jne    975 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 952:	c7 45 f0 d8 0d 00 00 	movl   $0xdd8,-0x10(%ebp)
 959:	8b 45 f0             	mov    -0x10(%ebp),%eax
 95c:	a3 e0 0d 00 00       	mov    %eax,0xde0
 961:	a1 e0 0d 00 00       	mov    0xde0,%eax
 966:	a3 d8 0d 00 00       	mov    %eax,0xdd8
    base.s.size = 0;
 96b:	c7 05 dc 0d 00 00 00 	movl   $0x0,0xddc
 972:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 975:	8b 45 f0             	mov    -0x10(%ebp),%eax
 978:	8b 00                	mov    (%eax),%eax
 97a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 97d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 980:	8b 40 04             	mov    0x4(%eax),%eax
 983:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 986:	72 4d                	jb     9d5 <malloc+0xa6>
      if(p->s.size == nunits)
 988:	8b 45 f4             	mov    -0xc(%ebp),%eax
 98b:	8b 40 04             	mov    0x4(%eax),%eax
 98e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 991:	75 0c                	jne    99f <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 993:	8b 45 f4             	mov    -0xc(%ebp),%eax
 996:	8b 10                	mov    (%eax),%edx
 998:	8b 45 f0             	mov    -0x10(%ebp),%eax
 99b:	89 10                	mov    %edx,(%eax)
 99d:	eb 26                	jmp    9c5 <malloc+0x96>
      else {
        p->s.size -= nunits;
 99f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a2:	8b 40 04             	mov    0x4(%eax),%eax
 9a5:	2b 45 ec             	sub    -0x14(%ebp),%eax
 9a8:	89 c2                	mov    %eax,%edx
 9aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ad:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b3:	8b 40 04             	mov    0x4(%eax),%eax
 9b6:	c1 e0 03             	shl    $0x3,%eax
 9b9:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 9bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9bf:	8b 55 ec             	mov    -0x14(%ebp),%edx
 9c2:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 9c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9c8:	a3 e0 0d 00 00       	mov    %eax,0xde0
      return (void*)(p + 1);
 9cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d0:	83 c0 08             	add    $0x8,%eax
 9d3:	eb 38                	jmp    a0d <malloc+0xde>
    }
    if(p == freep)
 9d5:	a1 e0 0d 00 00       	mov    0xde0,%eax
 9da:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 9dd:	75 1b                	jne    9fa <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 9df:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9e2:	89 04 24             	mov    %eax,(%esp)
 9e5:	e8 ed fe ff ff       	call   8d7 <morecore>
 9ea:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9ed:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9f1:	75 07                	jne    9fa <malloc+0xcb>
        return 0;
 9f3:	b8 00 00 00 00       	mov    $0x0,%eax
 9f8:	eb 13                	jmp    a0d <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a00:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a03:	8b 00                	mov    (%eax),%eax
 a05:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 a08:	e9 70 ff ff ff       	jmp    97d <malloc+0x4e>
}
 a0d:	c9                   	leave  
 a0e:	c3                   	ret    
