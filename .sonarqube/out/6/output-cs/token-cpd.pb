©'
0D:\backend\LXP.Api\Controllers\BaseController.cs
	namespace 	
LXP
 
. 
Api 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
BaseController 
:  !
ControllerBase" 0
{ 
[ 	
	NonAction	 
] 
public 
APIResponse !
CreateSuccessResponse 0
(0 1
dynamic1 8
result9 ?
=@ A
nullB F
)F G
{ 	
return 
new 
APIResponse "
(" #
)# $
{ 

StatusCode 
= 
( 
int !
)! "
HttpStatusCode" 0
.0 1
OK1 3
,3 4
Message 
= 
MessageConstants *
.* +

MsgSuccess+ 5
,5 6
Data 
= 
result 
}   
;   
}!! 	
[&& 	
	NonAction&&	 
]&& 
public'' 
APIResponse'' !
CreateFailureResponse'' 0
(''0 1
string''1 7
message''8 ?
,''? @
int''A D

statusCode''E O
)''O P
{(( 	
return)) 
new)) 
APIResponse)) "
())" #
)))# $
{** 

StatusCode++ 
=++ 

statusCode++ '
,++' (
Message,, 
=,, 
message,, !
,,,! "
Data-- 
=-- 
null-- 
}.. 
;.. 
}// 	
[44 	
	NonAction44	 
]44 
public55 
APIResponse55  
CreateInsertResponse55 /
(55/ 0
dynamic550 7
result558 >
)55> ?
{66 	
return77 
new77 
APIResponse77 "
(77" #
)77# $
{88 

StatusCode99 
=99 
(99 
int99 !
)99! "
HttpStatusCode99" 0
.990 1
Created991 8
,998 9
Message:: 
=:: 
MessageConstants:: *
.::* +

MsgCreated::+ 5
,::5 6
Data;; 
=;; 
result;; 
}<< 
;<< 
}== 	
[BB 	
	NonActionBB	 
]BB 
publicCC 
APIResponseCC #
CreateNoContentResponseCC 2
(CC2 3
dynamicCC3 :
resultCC; A
)CCA B
{DD 	
returnEE 
newEE 
APIResponseEE "
(EE" #
)EE# $
{FF 

StatusCodeGG 
=GG 
(GG 
intGG !
)GG! "
HttpStatusCodeGG" 0
.GG0 1
	NoContentGG1 :
,GG: ;
MessageHH 
=HH 
MessageConstantsHH *
.HH* +
MsgNoContentHH+ 7
,HH7 8
DataII 
=II 
resultII 
}JJ 
;JJ 
}KK 	
[PP 	
	NonActionPP	 
]PP 
publicQQ 
IActionResultQQ 
ValidateModelQQ *
(QQ* +
objectQQ+ 1
modelQQ2 7
)QQ7 8
{RR 	
varSS 
validationContextSS !
=SS" #
newSS$ '
ValidationContextSS( 9
(SS9 :
modelSS: ?
)SS? @
;SS@ A
varTT 
validationResultsTT !
=TT" #
newTT$ '
ListTT( ,
<TT, -
ValidationResultTT- =
>TT= >
(TT> ?
)TT? @
;TT@ A
	ValidatorUU 
.UU 
TryValidateObjectUU '
(UU' (
modelUU( -
,UU- .
validationContextUU/ @
,UU@ A
validationResultsUUB S
,UUS T
trueUUU Y
)UUY Z
;UUZ [
ifWW 
(WW 
validationResultsWW !
.WW! "
AnyWW" %
(WW% &
)WW& '
)WW' (
{XX 
varYY 
errorMessageYY  
=YY! "
stringYY# )
.YY) *
JoinYY* .
(YY. /
$strZZ 
,ZZ 
validationResults[[ %
.[[% &
Select[[& ,
([[, -
x[[- .
=>[[/ 1
x[[2 3
.[[3 4
ErrorMessage[[4 @
)[[@ A
)\\ 
;\\ 
return]] 

BadRequest]] !
(]]! "!
CreateFailureResponse^^ )
(^^) *
errorMessage^^* 6
,^^6 7
(^^8 9
int^^9 <
)^^< =
HttpStatusCode^^= K
.^^K L

BadRequest^^L V
)^^V W
)__ 
;__ 
}`` 
returnbb 
nullbb 
;bb 
}cc 	
}dd 
}ee Û
8D:\backend\LXP.Api\Controllers\BulkQuestionController.cs
	namespace 	
LXP
 
. 
Api 
. 
Controllers 
{		 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class "
BulkQuestionController '
:( )
BaseController* 8
{ 
private 
readonly  
IBulkQuestionService -
_excelService. ;
;; <
public "
BulkQuestionController %
(% & 
IBulkQuestionService& :
excelService; G
)G H
{ 	
_excelService 
= 
excelService (
;( )
} 	
[%% 	
HttpPost%%	 
(%% 
$str%% "
)%%" #
]%%# $
public&& 
async&& 
Task&& 
<&& 
IActionResult&& '
>&&' (
ImportQuizData&&) 7
(&&7 8
	IFormFile&&8 A
file&&B F
,&&F G
Guid&&H L
quizId&&M S
)&&S T
{'' 	
var)) 
validationResponse)) "
=))# $"
ValidateImportQuizData))% ;
()); <
file))< @
,))@ A
quizId))B H
)))H I
;))I J
if** 
(** 
validationResponse** "
!=**# %
null**& *
)*** +
{++ 
return,, 
validationResponse,, )
;,,) *
}-- 
try// 
{00 
var11 
result11 
=11 
await11 "
_excelService11# 0
.110 1
ImportQuizDataAsync111 D
(11D E
file11E I
,11I J
quizId11K Q
)11Q R
;11R S
return22 
Ok22 
(22 !
CreateSuccessResponse22 /
(22/ 0
result220 6
)226 7
)227 8
;228 9
}33 
catch44 
(44 
	Exception44 
ex44 
)44  
{55 
return66 

StatusCode66 !
(66! "
$num77 
,77 !
CreateFailureResponse88 )
(88) *
$"99 
$str99 G
{99G H
ex99H J
.99J K
Message99K R
}99R S
"99S T
,99T U
$num:: 
);; 
)<< 
;<< 
}== 
}>> 	
privateFF 
IActionResultFF "
ValidateImportQuizDataFF 4
(FF4 5
	IFormFileFF5 >
fileFF? C
,FFC D
GuidFFE I
quizIdFFJ P
)FFP Q
{GG 	
ifHH 
(HH 
fileHH 
==HH 
nullHH 
||HH 
fileHH  $
.HH$ %
LengthHH% +
==HH, .
$numHH/ 0
)HH0 1
{II 
returnJJ 

BadRequestJJ !
(JJ! "!
CreateFailureResponseKK )
(KK) *
$strKK* U
,KKU V
$numKKW Z
)KKZ [
)LL 
;LL 
}MM 
ifOO 
(OO 
quizIdOO 
==OO 
GuidOO 
.OO 
EmptyOO $
)OO$ %
{PP 
returnQQ 

BadRequestQQ !
(QQ! "!
CreateFailureResponseQQ" 7
(QQ7 8
$strQQ8 [
,QQ[ \
$numQQ] `
)QQ` a
)QQa b
;QQb c
}RR 
returnTT 
nullTT 
;TT 
}UU 	
}VV 
}WW õ
4D:\backend\LXP.Api\Controllers\CategoryController.cs
	namespace 	
LXP
 
. 
Api 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[		 
ApiController		 
]		 
public 

class 
CategoryController #
:$ %
BaseController& 4
{ 
private 
readonly 
ICategoryServices *
_categoryServices+ <
;< =
public 
CategoryController !
(! "
ICategoryServices" 3
categoryServices4 D
)D E
{ 	
_categoryServices 
= 
categoryServices  0
;0 1
} 	
[ 	
HttpGet	 
( 
$str '
)' (
]( )
public 
async 
Task 
< 
IActionResult '
>' (
GetAllCategory) 7
(7 8
)8 9
{ 	
List 
< '
CourseCategoryListViewModel ,
>, -

categories. 8
=9 :
await; @
_categoryServicesA R
.R S
GetAllCategoryS a
(a b
)b c
;c d
return 
Ok 
( !
CreateSuccessResponse +
(+ ,

categories, 6
)6 7
)7 8
;8 9
}   	
[(( 	
HttpPost((	 
((( 
$str(( (
)((( )
](() *
public)) 
async)) 
Task)) 
<)) 
IActionResult)) '
>))' (
PostCategory))) 5
())5 6#
CourseCategoryViewModel))6 M
category))N V
)))V W
{** 	
bool++ 
categoryExists++ 
=++  !
await++" '
_categoryServices++( 9
.++9 :
AddCategory++: E
(++E F
category++F N
)++N O
;++O P
if,, 
(,, 
categoryExists,, 
),, 
{-- 
List.. 
<.. '
CourseCategoryListViewModel.. 0
>..0 1

categories..2 <
=..= >
await// 
_categoryServices// +
.//+ ,
GetAllCategory//, :
(//: ;
)//; <
;//< =
return00 
Ok00 
(00 !
CreateSuccessResponse00 /
(00/ 0

categories000 :
)00: ;
)00; <
;00< =
}11 
else22 
{33 
return44 
Ok44 
(44 !
CreateFailureResponse44 /
(44/ 0
$str440 K
,44K L
$num44M P
)44P Q
)44Q R
;44R S
}55 
}66 	
}77 
}88 »
2D:\backend\LXP.Api\Controllers\CourseController.cs
	namespace 	
LXP
 
. 
Api 
. 
Controllers 
{ 
[		 
Route		 

(		
 
$str		 
)		 
]		 
[

 
ApiController

 
]

 
public 

class 
CourseController !
:" #
BaseController$ 2
{ 
private 
readonly 
ICourseServices (
_courseServices) 8
;8 9
public 
CourseController 
(  
ICourseServices  /
courseServices0 >
)> ?
{ 	
_courseServices 
= 
courseServices ,
;, -
} 	
[ 	
HttpPost	 
( 
$str 
)  
]  !
public 
async 
Task 
< 
IActionResult '
>' (
	AddCourse) 2
(2 3
CourseViewModel3 B
courseC I
)I J
{ 	
if 
( 
! 

ModelState 
. 
IsValid #
)# $
{ 
return 

BadRequest !
(! "

ModelState" ,
), -
;- .
} 
var 
isCourseCreated 
=  !
_courseServices" 1
.1 2
	AddCourse2 ;
(; <
course< B
)B C
;C D
if 
( 
isCourseCreated 
)  
{ 
return   
Ok   
(   !
CreateSuccessResponse   /
(  / 0
null  0 4
)  4 5
)  5 6
;  6 7
}!! 
return"" 
Ok"" 
("" !
CreateFailureResponse"" +
(""+ ,
$str"", 9
,""9 :
$num""; >
)""> ?
)""? @
;""@ A
}## 	
[%% 	
HttpGet%%	 
(%% 
$str%% #
)%%# $
]%%$ %
public&& 
async&& 
Task&& 
<&& 
IActionResult&& '
>&&' (
GetCourseDetails&&) 9
(&&9 :
string&&: @
id&&A C
)&&C D
{'' 	
Course(( 
course(( 
=(( 
_courseServices(( +
.((+ ,
GetCourseByCourseId((, ?
(((? @
id((@ B
)((B C
;((C D
return)) 
Ok)) 
()) !
CreateSuccessResponse)) +
())+ ,
course)), 2
)))2 3
)))3 4
;))4 5
}** 	
[00 	
HttpGet00	 
(00 
$str00 #
)00# $
]00$ %
public11 
IActionResult11 
GetAllCourseDetails11 0
(110 1
)111 2
{22 	
var33 
course33 
=33 
_courseServices33 (
.33( )
GetAllCourseDetails33) <
(33< =
)33= >
;33> ?
return44 
Ok44 
(44 !
CreateSuccessResponse44 +
(44+ ,
course44, 2
)442 3
)443 4
;444 5
}55 	
}66 
}77 õ
7D:\backend\LXP.Api\Controllers\CourseLevelController.cs
	namespace 	
LXP
 
. 
Api 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public		 

class		 !
CourseLevelController		 &
:		' (
BaseController		) 7
{

 
private 
readonly  
ICourseLevelServices - 
_courseLevelServices. B
;B C
public !
CourseLevelController $
($ % 
ICourseLevelServices% 9
courseLevelServices: M
)M N
{ 	
this 
.  
_courseLevelServices %
=& '
courseLevelServices( ;
;; <
} 	
[ 	
HttpGet	 
( 
$str /
)/ 0
]0 1
public 
async 
Task 
< 
IActionResult '
>' (
GetAllCourseLevel) :
(: ;
string; A
idB D
)D E
{ 	
return 
Ok 
( !
CreateSuccessResponse +
(+ ,
await, 1 
_courseLevelServices2 F
.F G
GetAllCourseLevelG X
(X Y
idY [
)[ \
)\ ]
)] ^
;^ _
} 	
} 
} ≥
7D:\backend\LXP.Api\Controllers\CourseTopicController.cs
	namespace 	
LXP
 
. 
Api 
. 
Controllers 
{ 
[		 
Route		 

(		
 
$str		 
)		 
]		 
[

 
ApiController

 
]

 
public 

class !
CourseTopicController &
:' (
BaseController) 7
{ 
private 
readonly  
ICourseTopicServices - 
_courseTopicServices. B
;B C
public !
CourseTopicController $
($ % 
ICourseTopicServices% 9
courseTopicServices: M
)M N
{ 	 
_courseTopicServices  
=! "
courseTopicServices# 6
;6 7
} 	
[ 	
HttpPost	 
( 
$str %
)% &
]& '
public 
async 
Task 
< 
IActionResult '
>' (
AddCourseTopic) 7
(7 8 
CourseTopicViewModel8 L
courseTopicM X
)X Y
{ 	
bool 
isTopicCreated 
=  !
await" ' 
_courseTopicServices( <
.< =
AddCourseTopic= K
(K L
courseTopicL W
)W X
;X Y
if 
( 
isTopicCreated 
) 
{ 
object 
topic 
=  
_courseTopicServices 3
.3 4
GetTopicDetails4 C
(C D
courseTopicD O
.O P
CourseIdP X
)X Y
;Y Z
return 
Ok 
( !
CreateSuccessResponse /
(/ 0
topic0 5
)5 6
)6 7
;7 8
} 
else 
{ 
return 
Ok 
( !
CreateFailureResponse /
(/ 0
$str0 C
,C D
$numE H
)H I
)I J
;J K
}   
}!! 	
[## 	
HttpGet##	 
(## 
$str## )
)##) *
]##* +
public$$ 
async$$ 
Task$$ 
<$$ 
IActionResult$$ '
>$$' ($
GetCourseTopicByCourseId$$) A
($$A B
string$$B H
id$$I K
)$$K L
{%% 	
var&& 
CourseTopic&& 
=&&  
_courseTopicServices&& 2
.&&2 3
GetTopicDetails&&3 B
(&&B C
id&&C E
)&&E F
;&&F G
return'' 
Ok'' 
('' !
CreateSuccessResponse'' +
(''+ ,
CourseTopic'', 7
)''7 8
)''8 9
;''9 :
}(( 	
[** 	
HttpPut**	 
(** 
$str** 
)** 
]** 
public++ 
async++ 
Task++ 
<++ 
IActionResult++ '
>++' (
UpdateCourseTopic++) :
(++: ;
)++; <
{,, 	
return-- 
Ok-- 
(-- 
)-- 
;-- 
}.. 	
[00 	

HttpDelete00	 
(00 
$str00 ,
)00, -
]00- .
public11 
async11 
Task11 
<11 
IActionResult11 '
>11' (
DeleteCourseTopic11) :
(11: ;
string11; A
id11B D
)11D E
{22 	
return33 
Ok33 
(33 
)33 
;33 
}44 	
}55 
}66 ø"
5D:\backend\LXP.Api\Controllers\DashboardController.cs
	namespace 	
LXP
 
. 
Api 
. 
Controllers 
{ 
[ 
Route 

(
 
$str &
)& '
]' (
[ 
ApiController 
] 
public 

class 
DashboardController $
:% &
BaseController' 5
{ 
private 
readonly 
IDashboardService *
_dashboardService+ <
;< =
public 
DashboardController "
(" #
IDashboardService# 4
dashboardService5 E
)E F
{ 	
_dashboardService 
= 
dashboardService  0
;0 1
} 	
[ 	
HttpGet	 
] 
public 
IActionResult 
GetTotalLearners -
(- .
). /
{ 	
var 
total_learners 
=  
_dashboardService! 2
.2 3#
GetDashboardLearnerList3 J
(J K
)K L
;L M
return 
Ok 
( !
CreateSuccessResponse +
(+ ,
total_learners, :
.: ;
Count; @
(@ A
)A B
)B C
)C D
;D E
} 	
[&& 	
HttpGet&&	 
]&& 
public'' 
ActionResult'' 
GetTotalCourses'' +
(''+ ,
)'', -
{(( 	
var)) 
total_courses)) 
=)) 
_dashboardService))  1
.))1 2#
GetDashboardCoursesList))2 I
())I J
)))J K
;))K L
return** 
Ok** 
(** !
CreateSuccessResponse** +
(**+ ,
total_courses**, 9
.**9 :
Count**: ?
(**? @
)**@ A
)**A B
)**B C
;**C D
}++ 	
[22 	
HttpGet22	 
]22 
public33 
ActionResult33 
GetTotalEnrollments33 /
(33/ 0
)330 1
{44 	
var55 
total_enrollments55 !
=55" #
_dashboardService55$ 5
.555 6&
GetDashboardEnrollmentList556 P
(55P Q
)55Q R
;55R S
return66 
Ok66 
(66 !
CreateSuccessResponse66 +
(66+ ,
total_enrollments66, =
.66= >
Count66> C
(66C D
)66D E
)66E F
)66F G
;66G H
}77 	
[>> 	
HttpGet>>	 
]>> 
public?? 
ActionResult?? 
GetEnrollmentMonth?? .
(??. /
)??/ 0
{@@ 	
varAA 
total_month_wiseAA  
=AA! "
_dashboardServiceAA# 4
.AA4 5"
GetMonthEnrollmentListAA5 K
(AAK L
)AAL M
;AAM N
returnBB 
OkBB 
(BB !
CreateSuccessResponseBB +
(BB+ ,
total_month_wiseBB, <
)BB< =
)BB= >
;BB> ?
}CC 	
[JJ 	
HttpGetJJ	 
]JJ 
publicKK 
ActionResultKK 
GetCourseCreatedKK ,
(KK, -
)KK- .
{LL 	
varMM  
total_course_createdMM $
=MM% &
_dashboardServiceMM' 8
.MM8 9 
GetCourseCreatedListMM9 M
(MMM N
)MMN O
;MMO P
returnNN 
OkNN 
(NN !
CreateSuccessResponseNN +
(NN+ , 
total_course_createdNN, @
)NN@ A
)NNA B
;NNB C
}OO 	
[__ 	
HttpGet__	 
(__ 
$str__ .
)__. /
]__/ 0
public`` 
IActionResult`` 
AdminDashboard`` +
(``+ ,
)``, -
{aa 	
varbb 
adminbb 
=bb 
_dashboardServicebb )
.bb) *$
GetAdminDashboardDetailsbb* B
(bbB C
)bbC D
;bbD E
returncc 
Okcc 
(cc !
CreateSuccessResponsecc +
(cc+ ,
admincc, 1
)cc1 2
)cc2 3
;cc3 4
}dd 	
}ee 
}ff èA
1D:\backend\LXP.Api\Controllers\EmailController.cs
	namespace 	
LXP
 
. 
Api 
. 
Controllers 
{ 
[		 
Route		 

(		
 
$str		 
)		 
]		 
[

 
ApiController

 
]

 
public 

class 
EmailController  
:! "
ControllerBase# 1
{ 
private 
readonly 
IEmailService &
_emailService' 4
;4 5
private 
static  
ConcurrentDictionary +
<+ ,
string, 2
,2 3
string4 :
>: ;
emailOtpMap< G
=H I
new  
ConcurrentDictionary $
<$ %
string% +
,+ ,
string- 3
>3 4
(4 5
)5 6
;6 7
private 
static 
DateTime 
_currentTIme  ,
;, -
public 
EmailController 
( 
IEmailService ,
emailService- 9
)9 :
{ 	
_emailService 
= 
emailService (
;( )
} 	
[ 	
HttpPost	 
( 
$str %
)% &
]& '
public 
async 
Task 
< 
IActionResult '
>' (
GenerateOTP) 4
(4 5
[5 6
FromBody6 >
]> ?
string@ F
emailG L
)L M
{ 	
string 
[ 
] 
saAllowedCharacters (
=) *
{+ ,
$str- 0
,0 1
$str2 5
,5 6
$str7 :
,: ;
$str< ?
,? @
$strA D
,D E
$strF I
,I J
$strK N
,N O
$strP S
,S T
$strU X
,X Y
$strZ ]
}^ _
;_ `
string 
sOTP 
= 
$str 
; 
Random   
rand   
=   
new   
Random   $
(  $ %
)  % &
;  & '
for"" 
("" 
int"" 
i"" 
="" 
$num"" 
;"" 
i"" 
<"" 
$num""  !
;""! "
i""# $
++""$ &
)""& '
{## 
int$$ 
p$$ 
=$$ 
rand$$ 
.$$ 
Next$$ !
($$! "
$num$$" #
,$$# $
saAllowedCharacters$$% 8
.$$8 9
Length$$9 ?
)$$? @
;$$@ A
sOTP%% 
+=%% 
saAllowedCharacters%% +
[%%+ ,
p%%, -
]%%- .
;%%. /
}&& 
emailOtpMap)) 
[)) 
email)) 
])) 
=))  
sOTP))! %
;))% &
string,, 
subject,, 
=,, 
$str,, 5
;,,5 6
string-- 
body-- 
=-- 
$"-- 
$str-- =
{--= >
sOTP--> B
}--B C
"--C D
;--D E
bool11 
	emailSent11 
=11 
await11 "
_emailService11# 0
.110 1
SendEmailAsync111 ?
(11? @
email11@ E
,11E F
subject11G N
,11N O
body11P T
)11T U
;11U V
if33 
(33 
	emailSent33 
)33 
{44 
_currentTIme55 
=55 
DateTime55 '
.55' (
Now55( +
;55+ ,
return77 
Ok77 
(77 
new88 
{99 
Message:: 
=::  !
$str::" ;
,::; <
Email;; 
=;; 
email;;  %
,;;% &
OTP<< 
=<< 
sOTP<< "
}== 
)>> 
;>> 
}?? 
else@@ 
{AA 
returnCC 

BadRequestCC !
(CC! "
newCC" %
{CC& '
MessageCC( /
=CC0 1
$strCC2 G
}CCH I
)CCI J
;CCJ K
}DD 
}EE 	
[JJ 	
HttpPostJJ	 
(JJ 
$strJJ 
)JJ 
]JJ 
publicKK 
IActionResultKK 
	VerifyOTPKK &
(KK& '
[KK' (
FromBodyKK( 0
]KK0 1$
OTPVerificationViewModelKK2 J
	otpverifyKKK T
)KKT U
{LL 	
ifOO 
(OO 
emailOtpMapOO 
.OO 
ContainsKeyOO '
(OO' (
	otpverifyOO( 1
.OO1 2
EmailOO2 7
)OO7 8
)OO8 9
{PP 
varQQ 
otpDataQQ 
=QQ 
emailOtpMapQQ )
[QQ) *
	otpverifyQQ* 3
.QQ3 4
EmailQQ4 9
]QQ9 :
;QQ: ;
DateTimeRR 
storedTimestampRR (
=RR) *
_currentTImeRR+ 7
;RR7 8
DateTimeSS 
currentTimestampSS )
=SS* +
DateTimeSS, 4
.SS4 5
NowSS5 8
;SS8 9
TimeSpanUU 
timeDifferenceUU '
=UU( )
currentTimestampUU* :
-UU; <
storedTimestampUU= L
;UUL M
double\\ 
num\\ 
=\\ 
timeDifference\\ +
.\\+ ,
TotalMinutes\\, 8
;\\8 9
if]] 
(]] 
timeDifference]] "
.]]" #
TotalMinutes]]# /
<]]0 1
$num]]2 3
)]]3 4
{^^ 
if__ 
(__ 
otpData__ 
==__  "
	otpverify__# ,
.__, -
OTP__- 0
)__0 1
{`` 
stringaa 
removeEmailaa *
=aa+ ,
$straa- /
;aa/ 0
emailOtpMapbb #
.bb# $
Removebb$ *
(bb* +
	otpverifybb+ 4
.bb4 5
Emailbb5 :
,bb: ;
outbb< ?
removeEmailbb@ K
)bbK L
;bbL M
Consolecc 
.cc  
	WriteLinecc  )
(cc) *
$"dd 
$strdd C
{ddC D
	otpverifyddD M
.ddM N
EmailddN S
}ddS T
"ddT U
)ee 
;ee 
returngg 
Okgg !
(gg! "
$strgg" >
)gg> ?
;gg? @
}hh 
elseii 
{jj 
Consolell 
.ll  
	WriteLinell  )
(ll) *
$"ll* ,
$strll, L
{llL M
	otpverifyllM V
.llV W
EmailllW \
}ll\ ]
"ll] ^
)ll^ _
;ll_ `
returnmm 

BadRequestmm )
(mm) *
$strmm* A
)mmA B
;mmB C
}nn 
}oo 
elsepp 
{qq 
stringss 
removeEmailss &
=ss' (
$strss) +
;ss+ ,
emailOtpMaptt 
.tt  
Removett  &
(tt& '
	otpverifytt' 0
.tt0 1
Emailtt1 6
,tt6 7
outtt8 ;
removeEmailtt< G
)ttG H
;ttH I
Consoleuu 
.uu 
	WriteLineuu %
(uu% &
$"uu& (
$struu( C
{uuC D
	otpverifyuuD M
.uuM N
EmailuuN S
}uuS T
"uuT U
)uuU V
;uuV W
returnvv 

BadRequestvv %
(vv% &
$strww *
+ww+ ,
storedTimestampww- <
+ww= >
$strww? F
+wwG H
_currentTImewwI U
)xx 
;xx 
}yy 
}zz 
else{{ 
{|| 
Console~~ 
.~~ 
	WriteLine~~ !
(~~! "
$"~~" $
$str~~$ N
{~~N O
	otpverify~~O X
.~~X Y
Email~~Y ^
}~~^ _
"~~_ `
)~~` a
;~~a b
return 

BadRequest !
(! "
$str" M
)M N
;N O
}
ÄÄ 
}
ÅÅ 	
}
ÇÇ 
}ÉÉ ï
6D:\backend\LXP.Api\Controllers\EnrollmentController.cs
	namespace 	
LXP
 
. 
Api 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class  
EnrollmentController %
:& '
BaseController( 6
{ 
private 
readonly 
IEnrollmentService +
_enrollmentService, >
;> ?
public  
EnrollmentController #
(# $
IEnrollmentService$ 6
enrollmentService7 H
)H I
{ 	
_enrollmentService 
=  
enrollmentService! 2
;2 3
} 	
[ 	
HttpPost	 
( 
$str 
)  
]  !
public 
async 
Task 
< 
IActionResult '
>' (
	Addenroll) 2
(2 3
EnrollmentViewModel3 F
enrollG M
)M N
{ 	
if 
( 
! 

ModelState 
. 
IsValid #
)# $
{   
return!! 

BadRequest!! !
(!!! "

ModelState!!" ,
)!!, -
;!!- .
}"" 
var$$ 

isEnrolled$$ 
=$$ 
await$$ "
_enrollmentService$$# 5
.$$5 6
	Addenroll$$6 ?
($$? @
enroll$$@ F
)$$F G
;$$G H
if&& 
(&& 

isEnrolled&& 
)&& 
{'' 
return(( 
Ok(( 
((( !
CreateSuccessResponse(( /
(((/ 0
null((0 4
)((4 5
)((5 6
;((6 7
})) 
return** 
Ok** 
(** !
CreateFailureResponse** +
(**+ ,
$str**, =
,**= >
$num**? B
)**B C
)**C D
;**D E
}++ 	
[-- 	
HttpGet--	 
(-- 
$str-- 7
)--7 8
]--8 9
public.. 
IActionResult.. )
GetCourseandTopicsByLearnerId.. :
(..: ;
Guid..; ?
	learnerId..@ I
)..I J
{// 	
var00 
learner00 
=00 
_enrollmentService00 ,
.00, -)
GetCourseandTopicsByLearnerId00- J
(00J K
	learnerId00K T
)00T U
;00U V
return11 
Ok11 
(11 !
CreateSuccessResponse11 +
(11+ ,
learner11, 3
)113 4
)114 5
;115 6
}22 	
}33 
}44 ⁄(
7D:\backend\LXP.Api\Controllers\ExcelToJsonController.cs
	namespace 	
LXP
 
. 
Api 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public		 

class		 !
ExcelToJsonController		 &
:		' (
BaseController		) 7
{

 
private 
readonly 
IExcelToJsonService ,
_excelToJsonService- @
;@ A
public !
ExcelToJsonController $
($ %
IExcelToJsonService% 8
excelToJsonService9 K
)K L
{ 	
_excelToJsonService 
=  !
excelToJsonService" 4
;4 5
} 	
[ 	
HttpPost	 
( 
$str &
)& '
]' (
[ 	 
ProducesResponseType	 
( 
typeof $
($ %
FileContentResult% 6
)6 7
,7 8
$num9 <
)< =
]= >
[ 	 
ProducesResponseType	 
( 
typeof $
($ %"
BadRequestObjectResult% ;
); <
,< =
$num> A
)A B
]B C
[ 	 
ProducesResponseType	 
( 
typeof $
($ %
ObjectResult% 1
)1 2
,2 3
$num4 7
)7 8
]8 9
public 
async 
Task 
< 
IActionResult '
>' (
ConvertExcelToJson) ;
(; <
	IFormFile< E
fileF J
,J K
GuidL P
quizIdQ W
)W X
{ 	
if 
( 
file 
== 
null 
|| 
file  $
.$ %
Length% +
==, .
$num/ 0
)0 1
{ 
return 

BadRequest !
(! "!
CreateFailureResponse )
() *
$str* U
,U V
$numW Z
)Z [
) 
; 
} 
if 
( 
quizId 
== 
Guid 
. 
Empty $
)$ %
{   
return!! 

BadRequest!! !
(!!! "!
CreateFailureResponse!!" 7
(!!7 8
$str!!8 [
,!![ \
$num!!] `
)!!` a
)!!a b
;!!b c
}"" 
try$$ 
{%% 
var&& 
jsonData&& 
=&& 
await&& $
_excelToJsonService&&% 8
.&&8 9#
ConvertExcelToJsonAsync&&9 P
(&&P Q
file&&Q U
)&&U V
;&&V W
var'' 
validatedJsonData'' %
=''& '
_excelToJsonService''( ;
.''; <
ValidateQuizData''< L
(''L M
jsonData''M U
)''U V
;''V W
await(( 
_excelToJsonService(( )
.(() *
SaveQuizDataAsync((* ;
(((; <
validatedJsonData((< M
,((M N
quizId((O U
)((U V
;((V W
var** 
options** 
=** 
new** !!
JsonSerializerOptions**" 7
{++ 
Encoder,, 
=,, 
System,, $
.,,$ %
Text,,% )
.,,) *
	Encodings,,* 3
.,,3 4
Web,,4 7
.,,7 8
JavaScriptEncoder,,8 I
.,,I J%
UnsafeRelaxedJsonEscaping,,J c
,,,c d
WriteIndented-- !
=--" #
true--$ (
}.. 
;.. 
var00 

jsonString00 
=00  
JsonSerializer00! /
.00/ 0
	Serialize000 9
(009 :
validatedJsonData00: K
,00K L
options00M T
)00T U
;00U V
var11 
	byteArray11 
=11 
System11  &
.11& '
Text11' +
.11+ ,
Encoding11, 4
.114 5
UTF8115 9
.119 :
GetBytes11: B
(11B C

jsonString11C M
)11M N
;11N O
var22 
stream22 
=22 
new22  
MemoryStream22! -
(22- .
	byteArray22. 7
)227 8
;228 9
return44 
File44 
(44 
stream44 "
,44" #
$str44$ 6
,446 7
$str448 L
)44L M
;44M N
}55 
catch66 
(66 
	Exception66 
ex66 
)66  
{77 
return88 

StatusCode88 !
(88! "
$num99 
,99 !
CreateFailureResponse:: )
(::) *
$";; 
$str;; L
{;;L M
ex;;M O
.;;O P
Message;;P W
};;W X
";;X Y
,;;Y Z
$num<< 
)== 
)>> 
;>> 
}?? 
}@@ 	
}AA 
}BB æ%
<D:\backend\LXP.Api\Controllers\FeedbackResponseController.cs
	namespace 	
LXP
 
. 
API 
. 
Controllers 
{		 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class &
FeedbackResponseController +
:, -
ControllerBase. <
{ 
private 
readonly $
IFeedbackResponseService 1$
_feedbackResponseService2 J
;J K
public &
FeedbackResponseController )
() *$
IFeedbackResponseService* B#
feedbackResponseServiceC Z
)Z [
{ 	$
_feedbackResponseService $
=% &#
feedbackResponseService' >
;> ?
} 	
[## 	
HttpPost##	 
(## 
$str## ,
)##, -
]##- .
public$$ 
IActionResult$$ $
AddQuizFeedbackResponses$$ 5
($$5 6
[%% 
FromBody%% 
]%% 
IEnumerable%% "
<%%" #)
QuizFeedbackResponseViewModel%%# @
>%%@ A
feedbackResponses%%B S
)&& 	
{'' 	
if(( 
((( 
!(( 

ModelState(( 
.(( 
IsValid(( #
)((# $
{)) 
return** 

BadRequest** !
(**! "

ModelState**" ,
)**, -
;**- .
}++ 
try-- 
{.. $
_feedbackResponseService// (
.//( )#
SubmitFeedbackResponses//) @
(//@ A
feedbackResponses//A R
)//R S
;//S T
return00 
Ok00 
(00 
new00 
{00 
Message00  '
=00( )
$str00* W
}00X Y
)00Y Z
;00Z [
}11 
catch22 
(22 
ValidationException22 &
ex22' )
)22) *
{33 
return44 

BadRequest44 !
(44! "
new44" %
{44& '
Errors44( .
=44/ 0
ex441 3
.443 4
Errors444 :
.44: ;
Select44; A
(44A B
e44B C
=>44D F
e44G H
.44H I
ErrorMessage44I U
)44U V
}44W X
)44X Y
;44Y Z
}55 
catch66 
(66 
	Exception66 
ex66 
)66  
{77 
return88 

BadRequest88 !
(88! "
new88" %
{88& '
Message88( /
=880 1
ex882 4
.884 5
Message885 <
}88= >
)88> ?
;88? @
}99 
}:: 	
[CC 	
HttpPostCC	 
(CC 
$strCC -
)CC- .
]CC. /
publicDD 
IActionResultDD %
AddTopicFeedbackResponsesDD 6
(DD6 7
[EE 
FromBodyEE 
]EE 
IEnumerableEE "
<EE" #*
TopicFeedbackResponseViewModelEE# A
>EEA B
feedbackResponsesEEC T
)FF 	
{GG 	
ifHH 
(HH 
!HH 

ModelStateHH 
.HH 
IsValidHH #
)HH# $
{II 
returnJJ 

BadRequestJJ !
(JJ! "

ModelStateJJ" ,
)JJ, -
;JJ- .
}KK 
tryMM 
{NN $
_feedbackResponseServiceOO (
.OO( )#
SubmitFeedbackResponsesOO) @
(OO@ A
feedbackResponsesOOA R
)OOR S
;OOS T
returnPP 
OkPP 
(PP 
newPP 
{PP 
MessagePP  '
=PP( )
$strPP* X
}PPY Z
)PPZ [
;PP[ \
}QQ 
catchRR 
(RR 
ValidationExceptionRR &
exRR' )
)RR) *
{SS 
returnTT 

BadRequestTT !
(TT! "
newTT" %
{TT& '
ErrorsTT( .
=TT/ 0
exTT1 3
.TT3 4
ErrorsTT4 :
.TT: ;
SelectTT; A
(TTA B
eTTB C
=>TTD F
eTTG H
.TTH I
ErrorMessageTTI U
)TTU V
}TTW X
)TTX Y
;TTY Z
}UU 
catchVV 
(VV 
	ExceptionVV 
exVV 
)VV  
{WW 
returnXX 

BadRequestXX !
(XX! "
newXX" %
{XX& '
MessageXX( /
=XX0 1
exXX2 4
.XX4 5
MessageXX5 <
}XX= >
)XX> ?
;XX? @
}YY 
}ZZ 	
}[[ 
}\\ í
:D:\backend\LXP.Api\Controllers\ForgetPasswordController.cs
	namespace 	
LXP
 
. 
Api 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public		 

class		 $
ForgetPasswordController		 )
:		* +
ControllerBase		, :
{

 
private 
readonly 
IForgetService '
	_services( 1
;1 2
public $
ForgetPasswordController '
(' (
IForgetService( 6
services7 ?
)? @
{ 	
	_services 
= 
services  
;  !
} 	
[ 	
HttpPost	 
] 
public 
async 
Task 
< 
ActionResult &
>& '
ForgetPassword( 6
(6 7
[ 
FromBody 
] 
RandomPasswordEmail *
randompassword+ 9
) 	
{ 	
var 
randomstore 
= 
	_services '
.' (
ForgetPassword( 6
(6 7
randompassword7 E
.E F
EmailF K
)K L
;L M
return 
Ok 
( 
randomstore !
)! "
;" #
} 	
}   
}!! ¯
/D:\backend\LXP.Api\Controllers\GetController.cs
	namespace 	
LXP
 
. 
Api 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
GetController 
:  
ControllerBase! /
{		 
private

 
readonly

 
IQuizService

 %
_quizService

& 2
;

2 3
private 
readonly  
IQuizFeedbackService - 
_quizFeedbackService. B
;B C
public 
GetController 
( 
IQuizService )
quizService* 5
,5 6 
IQuizFeedbackService7 K
quizFeedbackServiceL _
)_ `
{ 	
_quizService 
= 
quizService &
;& ' 
_quizFeedbackService  
=! "
quizFeedbackService# 6
;6 7
} 	
[ 	
HttpGet	 
( 
$str "
)" #
]# $
public 
ActionResult 
< 
Guid  
?  !
>! "
GetQuizIdByTopicId# 5
(5 6
Guid6 :
topicId; B
)B C
{ 	
var 
quizId 
= 
_quizService %
.% &
GetQuizIdByTopicId& 8
(8 9
topicId9 @
)@ A
;A B
if 
( 
quizId 
== 
null 
) 
{ 
return 
Ok 
( 
null 
) 
;  
} 
else 
{   
return!! 
Ok!! 
(!! 
quizId!!  
)!!  !
;!!! "
}"" 
}## 	
}$$ 
}%% »
3D:\backend\LXP.Api\Controllers\LearnerController.cs
	namespace 	
LXP
 
. 
Api 
. 
Controllers 
{ 
[ 
Route 

(
 
$str &
)& '
]' (
[ 
ApiController 
] 
public 

class 
LearnerController "
:# $
BaseController% 3
{ 
private 
readonly 
ILearnerServices )
_learnerServices* :
;: ;
private 
readonly 
IUserReportServices ,
_userReportServices- @
;@ A
public 
LearnerController  
(  !
ILearnerServices 
learnerServices ,
,, -
IUserReportServices 
userReportServices  2
) 	
{ 	
_learnerServices 
= 
learnerServices .
;. /
_userReportServices 
=  !
userReportServices" 4
;4 5
} 	
["" 	
HttpGet""	 
("" 
$str"" 4
)""4 5
]""5 6
public## 
IActionResult## 
GetAllLearners## +
(##+ ,
)##, -
{$$ 	
var%% 
learners%% 
=%% 
_learnerServices%% +
.%%+ ,
GetLearners%%, 7
(%%7 8
)%%8 9
;%%9 :
return'' 
Ok'' 
('' !
CreateSuccessResponse'' +
(''+ ,
learners'', 4
)''4 5
)''5 6
;''6 7
}(( 	
[.. 	
HttpGet..	 
(.. 
$str.. :
)..: ;
]..; <
public// 
IActionResult// +
GetAllLearnerDetailsByLearnerId// <
(//< =
Guid//= A
	learnerid//B K
)//K L
{00 	
var11 
learner11 
=11 
_learnerServices11 *
.11* ++
GetAllLearnerDetailsByLearnerId11+ J
(11J K
	learnerid11K T
)11T U
;11U V
return22 
Ok22 
(22 !
CreateSuccessResponse22 +
(22+ ,
learner22, 3
)223 4
)224 5
;225 6
}33 	
[:: 	
HttpGet::	 
(:: 
$str:: ;
)::; <
]::< =
public;; 
IActionResult;; 0
$GetLearnerEntrolledcourseByLearnerId;; A
(;;A B
Guid;;B F
	learnerid;;G P
);;P Q
{<< 	
var== 
learner== 
=== 
_learnerServices== *
.==* +/
#GetLearnerEnrolledcourseByLearnerId==+ N
(==N O
	learnerid==O X
)==X Y
;==Y Z
return>> 
Ok>> 
(>> !
CreateSuccessResponse>> +
(>>+ ,
learner>>, 3
)>>3 4
)>>4 5
;>>5 6
}?? 	
[AA 	
HttpGetAA	 
(AA 
$strAA %
)AA% &
]AA& '
publicBB 
IActionResultBB 
GetLearnerReportBB -
(BB- .
)BB. /
{CC 	
varDD 
reportDD 
=DD 
_userReportServicesDD ,
.DD, -
GetUserReportDD- :
(DD: ;
)DD; <
;DD< =
returnEE 
OkEE 
(EE !
CreateSuccessResponseEE +
(EE+ ,
reportEE, 2
)EE2 3
)EE3 4
;EE4 5
}FF 	
}GG 
}HH …
1D:\backend\LXP.Api\Controllers\LoginController.cs
	namespace 	
LXP
 
. 
Api 
. 
Controllers 
{ 
[ 
Route 

(
 
$str &
)& '
]' (
[ 
ApiController 
] 
public		 

class		 
LoginController		  
:		! "
ControllerBase		# 1
{

 
private 
readonly 
ILoginService &
	_services' 0
;0 1
public 
LoginController 
( 
ILoginService ,
services- 5
)5 6
{ 	
	_services 
= 
services  
;  !
} 	
[ 	
HttpPost	 
] 
public 
async 
Task 
< 
ActionResult &
>& '
LoginLearner( 4
(4 5
[5 6
FromBody6 >
]> ?

LoginModel@ J

loginmodelK U
)U V
{ 	
	LoginRole 
data 
= 
await "
	_services# ,
., -
LoginLearner- 9
(9 :

loginmodel: D
)D E
;E F
return 
Ok 
( 
data 
) 
; 
} 	
}'' 
}(( é
4D:\backend\LXP.Api\Controllers\MaterialController.cs
	namespace		 	
LXP		
 
.		 
Api		 
.		 
Controllers		 
{

 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
MaterialController #
:$ %
BaseController& 4
{ 
private 
readonly 
IMaterialServices *
_materialService+ ;
;; <
public 
MaterialController !
(! "
IMaterialServices" 3
materialService4 C
)C D
{ 	
_materialService 
= 
materialService .
;. /
} 	
[ 	
HttpPost	 
( 
$str (
)( )
]) *
public 
async 
Task 
< 
IActionResult '
>' (
AddMaterial) 4
(4 5
[5 6
FromForm6 >
]> ?
MaterialViewModel@ Q
materialR Z
)Z [
{ 	!
MaterialListViewModel !
createdMaterial" 1
=2 3
await4 9
_materialService: J
.J K
AddMaterialK V
(V W
materialW _
)_ `
;` a
if 
( 
createdMaterial 
!=  "
null# '
)' (
{ 
return 
Ok 
(  
CreateInsertResponse .
(. /
createdMaterial/ >
)> ?
)? @
;@ A
} 
else 
{ 
return   
Ok   
(   !
CreateFailureResponse!! )
(!!) *
MessageConstants"" (
.""( )
MsgAlreadyExists"") 9
,""9 :
(## 
int## 
)## 
HttpStatusCode## +
.##+ ,
PreconditionFailed##, >
)$$ 
)%% 
;%% 
}&& 
}'' 	
[)) 	
HttpGet))	 
()) 
$str)) M
)))M N
]))N O
public** 
async** 
Task** 
<** 
List** 
<** !
MaterialListViewModel** 4
>**4 5
>**5 67
+GetAllMaterialDetailsByTopicAndMaterialType**7 b
(**b c
string++ 
topicId++ 
,++ 
string,, 
materialTypeId,, !
)-- 	
{.. 	
return// 
await// 
_materialService// )
.//) */
#GetAllMaterialDetailsByTopicAndType//* M
(//M N
topicId00 
,00 
materialTypeId11 
)22 
;22 
}33 	
}44 
}55 ¸

8D:\backend\LXP.Api\Controllers\MaterialTypeController.cs
	namespace 	
LXP
 
. 
Api 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[		 
ApiController		 
]		 
public

 

class

 "
MaterialTypeController

 '
:

( )
BaseController

* 8
{ 
private 
readonly !
IMaterialTypeServices .!
_materialTypeServices/ D
;D E
public "
MaterialTypeController %
(% &!
IMaterialTypeServices& ; 
materialTypeServices< P
)P Q
{ 	!
_materialTypeServices !
=" # 
materialTypeServices$ 8
;8 9
} 	
[ 	
HttpGet	 
( 
$str +
)+ ,
], -
public 
IActionResult 
GetAllMaterialType /
(/ 0
)0 1
{ 	
return 
Ok 
( !
CreateSuccessResponse +
(+ ,!
_materialTypeServices, A
.A B
GetAllMaterialTypeB T
(T U
)U V
)V W
)W X
;X Y
} 	
} 
} ±@
0D:\backend\LXP.Api\Controllers\QuizController.cs
	namespace 	
LXP
 
. 
Api 
. 
Controllers 
{ 
[

 
Route

 

(


 
$str

 
)

 
]

 
[ 
ApiController 
] 
public 

class 
QuizController 
:  !
BaseController" 0
{ 
private 
readonly 
IQuizService %
_quizService& 2
;2 3
public 
QuizController 
( 
IQuizService *
quizService+ 6
)6 7
{ 	
_quizService 
= 
quizService &
;& '
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
IActionResult 
GetQuizById (
(( )
Guid) -
quizId. 4
)4 5
{ 	
var 
quiz 
= 
_quizService #
.# $
GetQuizById$ /
(/ 0
quizId0 6
)6 7
;7 8
if!! 
(!! 
quiz!! 
==!! 
null!! 
)!! 
return"" 
NotFound"" 
(""  !
CreateFailureResponse""  5
(""5 6
$"""6 8
$str""8 E
{""E F
quizId""F L
}""L M
$str""M X
"""X Y
,""Y Z
$num""[ ^
)""^ _
)""_ `
;""` a
return$$ 
Ok$$ 
($$ !
CreateSuccessResponse$$ +
($$+ ,
quiz$$, 0
)$$0 1
)$$1 2
;$$2 3
}%% 	
[00 	
HttpGet00	 
]00 
public11 
IActionResult11 
GetAllQuizzes11 *
(11* +
)11+ ,
{22 	
var33 
quizzes33 
=33 
_quizService33 &
.33& '
GetAllQuizzes33' 4
(334 5
)335 6
;336 7
return44 
Ok44 
(44 !
CreateSuccessResponse44 +
(44+ ,
quizzes44, 3
)443 4
)444 5
;445 6
}55 	
[>> 	
HttpPost>>	 
]>> 
public?? 
IActionResult?? 

CreateQuiz?? '
(??' (
[??( )
FromBody??) 1
]??1 2
CreateQuizViewModel??3 F
request??G N
)??N O
{@@ 	
varAA 
quizAA 
=AA 
newAA 
QuizViewModelAA (
{BB 
QuizIdCC 
=CC 
GuidCC 
.CC 
NewGuidCC %
(CC% &
)CC& '
,CC' (

NameOfQuizDD 
=DD 
requestDD $
.DD$ %

NameOfQuizDD% /
,DD/ 0
DurationEE 
=EE 
requestEE "
.EE" #
DurationEE# +
,EE+ ,
PassMarkFF 
=FF 
requestFF "
.FF" #
PassMarkFF# +
,FF+ ,
AttemptsAllowedGG 
=GG  !
requestGG" )
.GG) *
AttemptsAllowedGG* 9
,GG9 :
	CreatedByHH 
=HH 
$strHH $
,HH$ %
	CreatedAtII 
=II 
DateTimeII $
.II$ %
NowII% (
}JJ 
;JJ 
_quizServiceLL 
.LL 

CreateQuizLL #
(LL# $
quizLL$ (
,LL( )
requestLL* 1
.LL1 2
TopicIdLL2 9
)LL9 :
;LL: ;
returnNN 
CreatedAtActionNN "
(NN" #
nameofOO 
(OO 
GetQuizByIdOO "
)OO" #
,OO# $
newPP 
{PP 
quizIdPP 
=PP 
quizPP #
.PP# $
QuizIdPP$ *
}PP+ ,
,PP, -!
CreateSuccessResponseQQ %
(QQ% &
quizQQ& *
)QQ* +
)RR 
;RR 
}SS 	
[^^ 	
HttpPut^^	 
(^^ 
$str^^ 
)^^ 
]^^ 
public__ 
IActionResult__ 

UpdateQuiz__ '
(__' (
Guid__( ,
quizId__- 3
,__3 4
[__5 6
FromBody__6 >
]__> ?
UpdateQuizViewModel__@ S
request__T [
)__[ \
{`` 	
varaa 
existingQuizaa 
=aa 
_quizServiceaa +
.aa+ ,
GetQuizByIdaa, 7
(aa7 8
quizIdaa8 >
)aa> ?
;aa? @
ifcc 
(cc 
existingQuizcc 
==cc 
nullcc  $
)cc$ %
returndd 
NotFounddd 
(dd  !
CreateFailureResponsedd  5
(dd5 6
$"dd6 8
$strdd8 E
{ddE F
quizIdddF L
}ddL M
$strddM X
"ddX Y
,ddY Z
$numdd[ ^
)dd^ _
)dd_ `
;dd` a
existingQuizff 
.ff 

NameOfQuizff #
=ff$ %
requestff& -
.ff- .

NameOfQuizff. 8
;ff8 9
existingQuizgg 
.gg 
Durationgg !
=gg" #
requestgg$ +
.gg+ ,
Durationgg, 4
;gg4 5
existingQuizhh 
.hh 
PassMarkhh !
=hh" #
requesthh$ +
.hh+ ,
PassMarkhh, 4
;hh4 5
existingQuizii 
.ii 
AttemptsAllowedii (
=ii) *
requestii+ 2
.ii2 3
AttemptsAllowedii3 B
;iiB C
_quizServicekk 
.kk 

UpdateQuizkk #
(kk# $
existingQuizkk$ 0
)kk0 1
;kk1 2
returnmm 
	NoContentmm 
(mm 
)mm 
;mm 
}nn 	
[pp 	
HttpGetpp	 
(pp 
$strpp "
)pp" #
]pp# $
publicqq 
IActionResultqq 
GetQuizIdByTopicIdqq /
(qq/ 0
Guidqq0 4
topicIdqq5 <
)qq< =
{rr 	
varss 
quizIdss 
=ss 
_quizServicess %
.ss% &
GetQuizIdByTopicIdss& 8
(ss8 9
topicIdss9 @
)ss@ A
;ssA B
ifuu 
(uu 
quizIduu 
==uu 
nulluu 
)uu 
returnvv 
NotFoundvv 
(vv  !
CreateFailureResponseww )
(ww) *
$"ww* ,
$strww, G
{wwG H
topicIdwwH O
}wwO P
$strwwP Q
"wwQ R
,wwR S
$numwwT W
)wwW X
)xx 
;xx 
returnzz 
Okzz 
(zz !
CreateSuccessResponsezz +
(zz+ ,
quizIdzz, 2
)zz2 3
)zz3 4
;zz4 5
}{{ 	
[
ÑÑ 	

HttpDelete
ÑÑ	 
(
ÑÑ 
$str
ÑÑ 
)
ÑÑ 
]
ÑÑ  
public
ÖÖ 
IActionResult
ÖÖ 

DeleteQuiz
ÖÖ '
(
ÖÖ' (
Guid
ÖÖ( ,
quizId
ÖÖ- 3
)
ÖÖ3 4
{
ÜÜ 	
var
áá 
existingQuiz
áá 
=
áá 
_quizService
áá +
.
áá+ ,
GetQuizById
áá, 7
(
áá7 8
quizId
áá8 >
)
áá> ?
;
áá? @
if
ââ 
(
ââ 
existingQuiz
ââ 
==
ââ 
null
ââ  $
)
ââ$ %
return
ää 
NotFound
ää 
(
ää  #
CreateFailureResponse
ää  5
(
ää5 6
$"
ää6 8
$str
ää8 E
{
ääE F
quizId
ääF L
}
ääL M
$str
ääM X
"
ääX Y
,
ääY Z
$num
ää[ ^
)
ää^ _
)
ää_ `
;
ää` a
_quizService
åå 
.
åå 

DeleteQuiz
åå #
(
åå# $
quizId
åå$ *
)
åå* +
;
åå+ ,
return
éé 
	NoContent
éé 
(
éé 
)
éé 
;
éé 
}
èè 	
}
êê 
}ëë «U
6D:\backend\LXP.Api\Controllers\QuizEngineController.cs
	namespace 	
LXP
 
. 
Api 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public		 

class		  
QuizEngineController		 %
:		& '
ControllerBase		( 6
{

 
private 
readonly 
IQuizEngineService +
_quizEngineService, >
;> ?
public  
QuizEngineController #
(# $
IQuizEngineService$ 6
quizEngineService7 H
)H I
{ 	
_quizEngineService 
=  
quizEngineService! 2
;2 3
} 	
[ 	
HttpGet	 
( 
$str  
)  !
]! "
public 
async 
Task 
< 
IActionResult '
>' (
GetQuizDetails) 7
(7 8
Guid8 <
quizId= C
)C D
{ 	
var 
quizDetails 
= 
await #
_quizEngineService$ 6
.6 7
GetQuizByIdAsync7 G
(G H
quizIdH N
)N O
;O P
if 
( 
quizDetails 
== 
null #
)# $
{ 
return 
NotFound 
(  
$"  "
$str" /
{/ 0
quizId0 6
}6 7
$str7 B
"B C
)C D
;D E
} 
return 
Ok 
( 
quizDetails !
)! "
;" #
} 	
[ 	
HttpGet	 
( 
$str '
)' (
]( )
public 
async 
Task 
< 
IActionResult '
>' (#
GetQuizDetailsByTopicId) @
(@ A
GuidA E
topicIdF M
)M N
{ 	
var   
quizDetails   
=   
await   #
_quizEngineService  $ 6
.  6 7(
GetQuizDetailsByTopicIdAsync  7 S
(  S T
topicId  T [
)  [ \
;  \ ]
if!! 
(!! 
quizDetails!! 
==!! 
null!! #
)!!# $
{"" 
return## 
NotFound## 
(##  
$"##  "
$str##" B
{##B C
topicId##C J
}##J K
$str##K L
"##L M
)##M N
;##N O
}$$ 
return%% 
Ok%% 
(%% 
quizDetails%% !
)%%! "
;%%" #
}&& 	
[(( 	
HttpGet((	 
((( 
$str(( *
)((* +
]((+ ,
public)) 
async)) 
Task)) 
<)) 
IActionResult)) '
>))' (
GetQuizQuestions))) 9
())9 :
Guid)): >
quizId))? E
)))E F
{** 	
var++ 
	questions++ 
=++ 
await++ !
_quizEngineService++" 4
.++4 5$
GetQuestionsForQuizAsync++5 M
(++M N
quizId++N T
)++T U
;++U V
return,, 
Ok,, 
(,, 
	questions,, 
),,  
;,,  !
}-- 	
[// 	
HttpPost//	 
(// 
$str// 
)// 
]// 
public00 
async00 
Task00 
<00 
IActionResult00 '
>00' (
StartQuizAttempt00) 9
(009 :
Guid00: >
	learnerId00? H
,00H I
Guid00J N
quizId00O U
)00U V
{11 	
var22 
	attemptId22 
=22 
await22 !
_quizEngineService22" 4
.224 5!
StartQuizAttemptAsync225 J
(22J K
	learnerId22K T
,22T U
quizId22V \
)22\ ]
;22] ^
return33 
Ok33 
(33 
	attemptId33 
)33  
;33  !
}44 	
[66 	
HttpPost66	 
(66 
$str66 
)66 
]66 
public77 
async77 
Task77 
<77 
IActionResult77 '
>77' (
SubmitAnswer77) 5
(775 6!
AnswerSubmissionModel776 K!
answerSubmissionModel77L a
)77a b
{88 	
await99 
_quizEngineService99 $
.99$ %
SubmitAnswerAsync99% 6
(996 7!
answerSubmissionModel997 L
)99L M
;99M N
return:: 
Ok:: 
(:: 
):: 
;:: 
};; 	
[AA 	
HttpPostAA	 
(AA 
$strAA %
)AA% &
]AA& '
publicBB 
asyncBB 
TaskBB 
<BB 
IActionResultBB '
>BB' (
SubmitAnswerBatchBB) :
(BB: ;
[CC 
FromBodyCC 
]CC &
AnswerSubmissionBatchModelCC 1
modelCC2 7
)DD 	
{EE 	
tryFF 
{GG 
awaitHH 
_quizEngineServiceHH (
.HH( )"
SubmitAnswerBatchAsyncHH) ?
(HH? @
modelHH@ E
)HHE F
;HHF G
returnII 
OkII 
(II 
)II 
;II 
}JJ 
catchKK 
(KK 
	ExceptionKK 
exKK 
)KK  
{LL 
returnMM 

BadRequestMM !
(MM! "
newMM" %
{MM& '
MessageMM( /
=MM0 1
exMM2 4
.MM4 5
MessageMM5 <
}MM= >
)MM> ?
;MM? @
}NN 
}OO 	
[TT 	
HttpPostTT	 
(TT 
$strTT )
)TT) *
]TT* +
publicUU 
asyncUU 
TaskUU 
<UU 
IActionResultUU '
>UU' (
CacheAnswersUU) 5
(UU5 6
[UU6 7
FromBodyUU7 ?
]UU? @'
CachedAnswerSubmissionModelUUA \
modelUU] b
)UUb c
{VV 	
tryWW 
{XX 
awaitYY 
_quizEngineServiceYY (
.YY( )
CacheAnswersAsyncYY) :
(YY: ;
modelYY; @
)YY@ A
;YYA B
returnZZ 
OkZZ 
(ZZ 
)ZZ 
;ZZ 
}[[ 
catch\\ 
(\\ 
	Exception\\ 
ex\\ 
)\\  
{]] 
return^^ 

BadRequest^^ !
(^^! "
new^^" %
{^^& '
Message^^( /
=^^0 1
ex^^2 4
.^^4 5
Message^^5 <
}^^= >
)^^> ?
;^^? @
}__ 
}`` 	
[ff 	
HttpPostff	 
(ff 
$strff 1
)ff1 2
]ff2 3
publicgg 
asyncgg 
Taskgg 
<gg 
IActionResultgg '
>gg' (
SubmitCachedAnswersgg) <
(gg< =
Guidgg= A
learnerAttemptIdggB R
)ggR S
{hh 	
tryii 
{jj 
awaitkk 
_quizEngineServicekk (
.kk( )$
SubmitCachedAnswersAsynckk) A
(kkA B
learnerAttemptIdkkB R
)kkR S
;kkS T
returnll 
Okll 
(ll 
)ll 
;ll 
}mm 
catchnn 
(nn 
	Exceptionnn 
exnn 
)nn  
{oo 
returnpp 

BadRequestpp !
(pp! "
newpp" %
{pp& '
Messagepp( /
=pp0 1
expp2 4
.pp4 5
Messagepp5 <
}pp= >
)pp> ?
;pp? @
}qq 
}rr 	
[tt 	
HttpGettt	 
(tt 
$strtt '
)tt' (
]tt( )
publicuu 
asyncuu 
Taskuu 
<uu 
IActionResultuu '
>uu' (!
GetLearnerQuizAttemptuu) >
(uu> ?
Guiduu? C
	attemptIduuD M
)uuM N
{vv 	
varww 
	viewModelww 
=ww 
awaitww !
_quizEngineServiceww" 4
.ww4 5&
GetLearnerQuizAttemptAsyncww5 O
(wwO P
	attemptIdwwP Y
)wwY Z
;wwZ [
returnxx 
Okxx 
(xx 
	viewModelxx 
)xx  
;xx  !
}yy 	
[{{ 	
HttpPost{{	 
({{ 
$str{{ "
){{" #
]{{# $
public|| 
async|| 
Task|| 
<|| 
IActionResult|| '
>||' (
SubmitQuizAttempt||) :
(||: ;
Guid||; ?
	attemptId||@ I
)||I J
{}} 	
await~~ 
_quizEngineService~~ $
.~~$ %"
SubmitQuizAttemptAsync~~% ;
(~~; <
	attemptId~~< E
)~~E F
;~~F G
return 
Ok 
( 
) 
; 
}
ÄÄ 	
[
ÇÇ 	
HttpGet
ÇÇ	 
(
ÇÇ 
$str
ÇÇ .
)
ÇÇ. /
]
ÇÇ/ 0
public
ÉÉ 
async
ÉÉ 
Task
ÉÉ 
<
ÉÉ 
IActionResult
ÉÉ '
>
ÉÉ' ()
GetLearnerQuizAttemptResult
ÉÉ) D
(
ÉÉD E
Guid
ÉÉE I
	attemptId
ÉÉJ S
)
ÉÉS T
{
ÑÑ 	
var
ÖÖ 
	viewModel
ÖÖ 
=
ÖÖ 
await
ÖÖ ! 
_quizEngineService
ÖÖ" 4
.
ÖÖ4 5.
 GetLearnerQuizAttemptResultAsync
ÖÖ5 U
(
ÖÖU V
	attemptId
ÖÖV _
)
ÖÖ_ `
;
ÖÖ` a
return
ÜÜ 
Ok
ÜÜ 
(
ÜÜ 
	viewModel
ÜÜ 
)
ÜÜ  
;
ÜÜ  !
}
áá 	
[
ââ 	
HttpPost
ââ	 
(
ââ 
$str
ââ 
)
ââ 
]
ââ 
public
ää 
async
ää 
Task
ää 
<
ää 
IActionResult
ää '
>
ää' (

RetakeQuiz
ää) 3
(
ää3 4
Guid
ää4 8
	learnerId
ää9 B
,
ääB C
Guid
ääD H
quizId
ääI O
)
ääO P
{
ãã 	
var
åå 
	attemptId
åå 
=
åå 
await
åå ! 
_quizEngineService
åå" 4
.
åå4 5
RetakeQuizAsync
åå5 D
(
ååD E
	learnerId
ååE N
,
ååN O
quizId
ååP V
)
ååV W
;
ååW X
return
çç 
Ok
çç 
(
çç 
	attemptId
çç 
)
çç  
;
çç  !
}
éé 	
}
èè 
}êê ‡Q
8D:\backend\LXP.Api\Controllers\QuizFeedbackController.cs
	namespace 	
LXP
 
. 
Api 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public		 

class		 "
QuizFeedbackController		 '
:		( )
BaseController		* 8
{

 
private 
readonly  
IQuizFeedbackService - 
_quizFeedbackService. B
;B C
public "
QuizFeedbackController %
(% & 
IQuizFeedbackService& :
quizFeedbackService; N
)N O
{ 	 
_quizFeedbackService  
=! "
quizFeedbackService# 6
;6 7
} 	
[ 	
HttpPost	 
( 
$str '
)' (
]( )
public 
IActionResult 
AddFeedbackQuestion 0
(0 1
[ 
FromBody 
] )
QuizfeedbackquestionViewModel 4#
quizfeedbackquestionDto5 L
) 	
{ 	
var 
result 
=  
_quizFeedbackService -
.- .
AddFeedbackQuestion. A
(A B#
quizfeedbackquestionDto '
,' (#
quizfeedbackquestionDto '
.' (
Options( /
)   
;   
return!! 
Ok!! 
(!! !
CreateSuccessResponse!! +
(!!+ ,
result!!, 2
)!!2 3
)!!3 4
;!!4 5
}"" 	
[)) 	
HttpGet))	 
()) 
$str)) *
)))* +
]))+ ,
public** 
IActionResult** #
GetAllFeedbackQuestions** 4
(**4 5
)**5 6
{++ 	
var,, 
	questions,, 
=,,  
_quizFeedbackService,, 0
.,,0 1#
GetAllFeedbackQuestions,,1 H
(,,H I
),,I J
;,,J K
return-- 
Ok-- 
(-- !
CreateSuccessResponse-- +
(--+ ,
	questions--, 5
)--5 6
)--6 7
;--7 8
}.. 	
[77 	
HttpGet77	 
(77 
$str77 C
)77C D
]77D E
public88 
IActionResult88 #
GetFeedbackQuestionById88 4
(884 5
Guid885 9"
quizFeedbackQuestionId88: P
)88P Q
{99 	
var:: 
question:: 
=::  
_quizFeedbackService:: /
.::/ 0#
GetFeedbackQuestionById::0 G
(::G H"
quizFeedbackQuestionId::H ^
)::^ _
;::_ `
if;; 
(;; 
question;; 
==;; 
null;;  
);;  !
return<< 
NotFound<< 
(<<  !
CreateFailureResponse== )
(==) *
$">> 
$str>> 4
{>>4 5"
quizFeedbackQuestionId>>5 K
}>>K L
$str>>L W
">>W X
,>>X Y
$num?? 
)@@ 
)AA 
;AA 
returnBB 
OkBB 
(BB !
CreateSuccessResponseBB +
(BB+ ,
questionBB, 4
)BB4 5
)BB5 6
;BB6 7
}CC 	
[MM 	
HttpPutMM	 
(MM 
$strMM B
)MMB C
]MMC D
publicNN 
IActionResultNN "
UpdateFeedbackQuestionNN 3
(NN3 4
GuidOO "
quizFeedbackQuestionIdOO '
,OO' (
[PP 
FromBodyPP 
]PP )
QuizfeedbackquestionViewModelPP 4#
quizfeedbackquestionDtoPP5 L
)QQ 	
{RR 	
varSS 
existingQuestionSS  
=SS! " 
_quizFeedbackServiceSS# 7
.SS7 8#
GetFeedbackQuestionByIdSS8 O
(SSO P"
quizFeedbackQuestionIdTT &
)UU 
;UU 
ifVV 
(VV 
existingQuestionVV  
==VV! #
nullVV$ (
)VV( )
returnWW 
NotFoundWW 
(WW  !
CreateFailureResponseXX )
(XX) *
$"YY 
$strYY 4
{YY4 5"
quizFeedbackQuestionIdYY5 K
}YYK L
$strYYL W
"YYW X
,YYX Y
$numZZ 
)[[ 
)\\ 
;\\ 
var^^ 
result^^ 
=^^  
_quizFeedbackService^^ -
.^^- ."
UpdateFeedbackQuestion^^. D
(^^D E"
quizFeedbackQuestionId__ &
,__& '#
quizfeedbackquestionDto`` '
,``' (#
quizfeedbackquestionDtoaa '
.aa' (
Optionsaa( /
)bb 
;bb 
ifcc 
(cc 
!cc 
resultcc 
)cc 
returndd 
NotFounddd 
(dd  !
CreateFailureResponseee )
(ee) *
$"ff 
$strff E
{ffE F"
quizFeedbackQuestionIdffF \
}ff\ ]
$strff] ^
"ff^ _
,ff_ `
$numgg 
)hh 
)ii 
;ii 
returnkk 
	NoContentkk 
(kk 
)kk 
;kk 
}ll 	
[uu 	

HttpDeleteuu	 
(uu 
$struu E
)uuE F
]uuF G
publicvv 
IActionResultvv "
DeleteFeedbackQuestionvv 3
(vv3 4
Guidvv4 8"
quizFeedbackQuestionIdvv9 O
)vvO P
{ww 	
varxx 
existingQuestionxx  
=xx! " 
_quizFeedbackServicexx# 7
.xx7 8#
GetFeedbackQuestionByIdxx8 O
(xxO P"
quizFeedbackQuestionIdyy &
)zz 
;zz 
if{{ 
({{ 
existingQuestion{{  
=={{! #
null{{$ (
){{( )
return|| 
NotFound|| 
(||  !
CreateFailureResponse}} )
(}}) *
$"~~ 
$str~~ 4
{~~4 5"
quizFeedbackQuestionId~~5 K
}~~K L
$str~~L W
"~~W X
,~~X Y
$num 
)
ÄÄ 
)
ÅÅ 
;
ÅÅ 
var
ÉÉ 
result
ÉÉ 
=
ÉÉ "
_quizFeedbackService
ÉÉ -
.
ÉÉ- .$
DeleteFeedbackQuestion
ÉÉ. D
(
ÉÉD E$
quizFeedbackQuestionId
ÉÉE [
)
ÉÉ[ \
;
ÉÉ\ ]
if
ÑÑ 
(
ÑÑ 
!
ÑÑ 
result
ÑÑ 
)
ÑÑ 
return
ÖÖ 
NotFound
ÖÖ 
(
ÖÖ  #
CreateFailureResponse
ÜÜ )
(
ÜÜ) *
$"
áá 
$str
áá E
{
ááE F$
quizFeedbackQuestionId
ááF \
}
áá\ ]
$str
áá] ^
"
áá^ _
,
áá_ `
$num
àà 
)
ââ 
)
ää 
;
ää 
return
åå 
	NoContent
åå 
(
åå 
)
åå 
;
åå 
}
çç 	
[
ññ 	
HttpGet
ññ	 
(
ññ 
$str
ññ 8
)
ññ8 9
]
ññ9 :
public
óó 
IActionResult
óó *
GetFeedbackQuestionsByQuizId
óó 9
(
óó9 :
Guid
óó: >
quizId
óó? E
)
óóE F
{
òò 	
var
ôô 
	questions
ôô 
=
ôô "
_quizFeedbackService
ôô 0
.
ôô0 1*
GetFeedbackQuestionsByQuizId
ôô1 M
(
ôôM N
quizId
ôôN T
)
ôôT U
;
ôôU V
if
öö 
(
öö 
	questions
öö 
==
öö 
null
öö !
||
öö" $
	questions
öö% .
.
öö. /
Count
öö/ 4
==
öö5 7
$num
öö8 9
)
öö9 :
{
õõ 
return
úú 
NotFound
úú 
(
úú  #
CreateFailureResponse
ùù )
(
ùù) *
$"
ùù* ,
$str
ùù, T
{
ùùT U
quizId
ùùU [
}
ùù[ \
$str
ùù\ ]
"
ùù] ^
,
ùù^ _
$num
ùù` c
)
ùùc d
)
ûû 
;
ûû 
}
üü 
return
†† 
Ok
†† 
(
†† #
CreateSuccessResponse
†† +
(
††+ ,
	questions
††, 5
)
††5 6
)
††6 7
;
††7 8
}
°° 	
[
™™ 	

HttpDelete
™™	 
(
™™ 
$str
™™ >
)
™™> ?
]
™™? @
public
´´ 
IActionResult
´´ -
DeleteFeedbackQuestionsByQuizId
´´ <
(
´´< =
Guid
´´= A
quizId
´´B H
)
´´H I
{
¨¨ 	
var
≠≠ 
	questions
≠≠ 
=
≠≠ "
_quizFeedbackService
≠≠ 0
.
≠≠0 1*
GetFeedbackQuestionsByQuizId
≠≠1 M
(
≠≠M N
quizId
≠≠N T
)
≠≠T U
;
≠≠U V
if
ÆÆ 
(
ÆÆ 
	questions
ÆÆ 
==
ÆÆ 
null
ÆÆ !
||
ÆÆ" $
	questions
ÆÆ% .
.
ÆÆ. /
Count
ÆÆ/ 4
==
ÆÆ5 7
$num
ÆÆ8 9
)
ÆÆ9 :
{
ØØ 
return
∞∞ 
NotFound
∞∞ 
(
∞∞  #
CreateFailureResponse
±± )
(
±±) *
$"
±±* ,
$str
±±, T
{
±±T U
quizId
±±U [
}
±±[ \
$str
±±\ ]
"
±±] ^
,
±±^ _
$num
±±` c
)
±±c d
)
≤≤ 
;
≤≤ 
}
≥≥ 
var
µµ 
result
µµ 
=
µµ "
_quizFeedbackService
µµ -
.
µµ- .-
DeleteFeedbackQuestionsByQuizId
µµ. M
(
µµM N
quizId
µµN T
)
µµT U
;
µµU V
if
∂∂ 
(
∂∂ 
!
∂∂ 
result
∂∂ 
)
∂∂ 
{
∑∑ 
return
∏∏ 

StatusCode
∏∏ !
(
∏∏! "
$num
ππ 
,
ππ #
CreateFailureResponse
∫∫ )
(
∫∫) *
$"
ªª 
$str
ªª J
{
ªªJ K
quizId
ªªK Q
}
ªªQ R
$str
ªªR S
"
ªªS T
,
ªªT U
$num
ºº 
)
ΩΩ 
)
ææ 
;
ææ 
}
øø 
return
¡¡ 
	NoContent
¡¡ 
(
¡¡ 
)
¡¡ 
;
¡¡ 
}
¬¬ 	
}
√√ 
}ƒƒ È>
8D:\backend\LXP.Api\Controllers\QuizQuestionController.cs
	namespace 	
LXP
 
. 
Api 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[		 
ApiController		 
]		 
public 

class #
QuizQuestionsController (
:) *
BaseController+ 9
{ 
private 
readonly  
IQuizQuestionService - 
_quizQuestionService. B
;B C
public #
QuizQuestionsController &
(& ' 
IQuizQuestionService' ;
quizQuestionService< O
)O P
{ 	 
_quizQuestionService  
=! "
quizQuestionService# 6
;6 7
} 	
[ 	
HttpPost	 
( 
$str 
)  
]  !
public 
async 
Task 
< 
IActionResult '
>' (
AddQuestion) 4
(4 5
[ 
FromBody 
] !
QuizQuestionViewModel ,
quizQuestionDto- <
)   	
{!! 	
var"" 
result"" 
="" 
await""  
_quizQuestionService"" 3
.""3 4
AddQuestionAsync""4 D
(""D E
quizQuestionDto## 
,##  
quizQuestionDto$$ 
.$$  
Options$$  '
)%% 
;%% 
return&& 
Ok&& 
(&& !
CreateSuccessResponse&& +
(&&+ ,
result&&, 2
)&&2 3
)&&3 4
;&&4 5
}'' 	
[22 	
HttpPut22	 
(22 
$str22 !
)22! "
]22" #
public33 
async33 
Task33 
<33 
IActionResult33 '
>33' (
UpdateQuestion33) 7
(337 8
Guid44 
quizQuestionId44 
,44  
[55 
FromBody55 
]55 !
QuizQuestionViewModel55 ,
quizQuestionDto55- <
)66 	
{77 	
var88 
existingQuestion88  
=88! "
await88# ( 
_quizQuestionService88) =
.88= > 
GetQuestionByIdAsync88> R
(88R S
quizQuestionId88S a
)88a b
;88b c
if99 
(99 
existingQuestion99  
==99! #
null99$ (
)99( )
return:: 
NotFound:: 
(::  !
CreateFailureResponse;; )
(;;) *
$";;* ,
$str;;, B
{;;B C
quizQuestionId;;C Q
};;Q R
$str;;R ]
";;] ^
,;;^ _
$num;;` c
);;c d
)<< 
;<< 
var>> 
result>> 
=>> 
await>>  
_quizQuestionService>> 3
.>>3 4
UpdateQuestionAsync>>4 G
(>>G H
quizQuestionId?? 
,?? 
quizQuestionDto@@ 
,@@  
quizQuestionDtoAA 
.AA  
OptionsAA  '
)BB 
;BB 
returnCC 
OkCC 
(CC !
CreateSuccessResponseCC +
(CC+ ,
resultCC, 2
)CC2 3
)CC3 4
;CC4 5
}DD 	
[MM 	

HttpDeleteMM	 
(MM 
$strMM $
)MM$ %
]MM% &
publicNN 
asyncNN 
TaskNN 
<NN 
IActionResultNN '
>NN' (
DeleteQuestionNN) 7
(NN7 8
GuidNN8 <
quizQuestionIdNN= K
)NNK L
{OO 	
varPP 
existingQuestionPP  
=PP! "
awaitPP# ( 
_quizQuestionServicePP) =
.PP= > 
GetQuestionByIdAsyncPP> R
(PPR S
quizQuestionIdPPS a
)PPa b
;PPb c
ifQQ 
(QQ 
existingQuestionQQ  
==QQ! #
nullQQ$ (
)QQ( )
returnRR 
NotFoundRR 
(RR  !
CreateFailureResponseSS )
(SS) *
$"SS* ,
$strSS, B
{SSB C
quizQuestionIdSSC Q
}SSQ R
$strSSR ]
"SS] ^
,SS^ _
$numSS` c
)SSc d
)TT 
;TT 
varVV 
resultVV 
=VV 
awaitVV  
_quizQuestionServiceVV 3
.VV3 4
DeleteQuestionAsyncVV4 G
(VVG H
quizQuestionIdVVH V
)VVV W
;VVW X
returnWW 
OkWW 
(WW !
CreateSuccessResponseWW +
(WW+ ,
resultWW, 2
)WW2 3
)WW3 4
;WW4 5
}XX 	
[ee 	
HttpGetee	 
(ee 
$stree "
)ee" #
]ee# $
publicff 
asyncff 
Taskff 
<ff 
IActionResultff '
>ff' (
GetAllQuestionsff) 8
(ff8 9
)ff9 :
{gg 	
varhh 
resulthh 
=hh 
awaithh  
_quizQuestionServicehh 3
.hh3 4 
GetAllQuestionsAsynchh4 H
(hhH I
)hhI J
;hhJ K
returnii 
Okii 
(ii !
CreateSuccessResponseii +
(ii+ ,
resultii, 2
)ii2 3
)ii3 4
;ii4 5
}jj 	
[tt 	
HttpGettt	 
(tt 
$strtt *
)tt* +
]tt+ ,
publicuu 
asyncuu 
Taskuu 
<uu 
IActionResultuu '
>uu' (#
GetAllQuestionsByQuizIduu) @
(uu@ A
GuiduuA E
quizIduuF L
)uuL M
{vv 	
varww 
resultww 
=ww 
awaitww  
_quizQuestionServiceww 3
.ww3 4(
GetAllQuestionsByQuizIdAsyncww4 P
(wwP Q
quizIdwwQ W
)wwW X
;wwX Y
ifxx 
(xx 
resultxx 
==xx 
nullxx 
||xx !
!xx" #
resultxx# )
.xx) *
Anyxx* -
(xx- .
)xx. /
)xx/ 0
returnyy 
NotFoundyy 
(yy  !
CreateFailureResponsezz )
(zz) *
$"zz* ,
$strzz, P
{zzP Q
quizIdzzQ W
}zzW X
$strzzX Y
"zzY Z
,zzZ [
$numzz\ _
)zz_ `
){{ 
;{{ 
return|| 
Ok|| 
(|| !
CreateSuccessResponse|| +
(||+ ,
result||, 2
)||2 3
)||3 4
;||4 5
}}} 	
[
ÜÜ 	
HttpGet
ÜÜ	 
(
ÜÜ 
$str
ÜÜ "
)
ÜÜ" #
]
ÜÜ# $
public
áá 
async
áá 
Task
áá 
<
áá 
IActionResult
áá '
>
áá' (
GetQuestionById
áá) 8
(
áá8 9
Guid
áá9 =
quizQuestionId
áá> L
)
ááL M
{
àà 	
var
ââ 
result
ââ 
=
ââ 
await
ââ "
_quizQuestionService
ââ 3
.
ââ3 4"
GetQuestionByIdAsync
ââ4 H
(
ââH I
quizQuestionId
ââI W
)
ââW X
;
ââX Y
if
ää 
(
ää 
result
ää 
==
ää 
null
ää 
)
ää 
return
ãã 
NotFound
ãã 
(
ãã  #
CreateFailureResponse
åå )
(
åå) *
$"
åå* ,
$str
åå, B
{
ååB C
quizQuestionId
ååC Q
}
ååQ R
$str
ååR ]
"
åå] ^
,
åå^ _
$num
åå` c
)
ååc d
)
çç 
;
çç 
return
éé 
Ok
éé 
(
éé #
CreateSuccessResponse
éé +
(
éé+ ,
result
éé, 2
)
éé2 3
)
éé3 4
;
éé4 5
}
èè 	
}
êê 
}ëë Ü
:D:\backend\LXP.Api\Controllers\RandomPasswordController.cs
	namespace 	
LXP
 
. 
Api 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public		 

class		 $
RandomPasswordController		 )
:		* +
ControllerBase		, :
{

 
private 
readonly 
IService !
	_services" +
;+ ,
public $
RandomPasswordController '
(' (
IService( 0
services1 9
)9 :
{ 	
	_services 
= 
services  
;  !
} 	
[ 	
HttpPost	 
] 
public 
async 
Task 
< 
ActionResult &
>& '
ForgetPassword( 6
(6 7
[ 
FromBody 
] 
RandomPasswordEmail *
randompassword+ 9
) 	
{ 	
var 
randomstore 
= 
	_services '
.' (
ForgetPassword( 6
(6 7
randompassword7 E
.E F
EmailF K
)K L
;L M
return 
Ok 
( 
randomstore !
)! "
;" #
} 	
} 
} Ãâ
8D:\backend\LXP.Api\Controllers\RegistrationController.cs
	namespace 	
LXP
 
. 
Api 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class "
RegistrationController '
:( )
BaseController* 8
{ 
private 
readonly 
ILearnerService (
_learnerServices) 9
;9 :
private 
readonly 
IProfileService (
_profileService) 8
;8 9
private 
readonly #
IPasswordHistoryService 0#
_passwordHistoryService1 H
;H I
private 
static 
DateTime 
_currentTIme  ,
;, -
public 
readonly 
	Hashtable !
	_otpTable" +
=, -
new. 1
	Hashtable2 ;
(; <
)< =
;= >
private 
static  
ConcurrentDictionary +
<+ ,
string, 2
,2 3
string4 :
>: ;
emailOtpMap< G
=H I
new  
ConcurrentDictionary $
<$ %
string% +
,+ ,
string- 3
>3 4
(4 5
)5 6
;6 7
public "
RegistrationController %
(% &
ILearnerService 
learnerServices +
,+ ,
IProfileService 
profileService *
,* +#
IPasswordHistoryService #"
passwordHistoryService$ :
) 	
{   	
_learnerServices!! 
=!! 
learnerServices!! .
;!!. /
_profileService"" 
="" 
profileService"" ,
;"", -#
_passwordHistoryService## #
=##$ %"
passwordHistoryService##& <
;##< =
}$$ 	
[** 	
HttpPost**	 
(** 
$str** -
)**- .
]**. /
public++ 
async++ 
Task++ 
<++ 
IActionResult++ '
>++' (
Registration++) 5
(++5 6
[++6 7
FromBody++7 ?
]++? @!
RegisterUserViewModel++A V
learner++W ^
)++^ _
{,, 	
bool-- 
learnerservices--  
=--! "
await--# (
_learnerServices--) 9
.--9 :
LearnerRegistration--: M
(--M N
learner--N U
)--U V
;--V W
if.. 
(.. 
learnerservices.. 
)..  
{// 
return00 
Ok00 
(00 !
CreateSuccessResponse00 /
(00/ 0
MessageConstants000 @
.00@ A)
MsgLearnerRegistrationSuccess00A ^
)00^ _
)00_ `
;00` a
}11 
else22 
{33 
return44 
Ok44 
(44 !
CreateFailureResponse44 /
(44/ 0
MessageConstants440 @
.44@ A#
MsgLearnerAlreadyExists44A X
,44X Y
$num44Z ]
)44] ^
)44^ _
;44_ `
}55 
}66 	
[<< 	
HttpGet<<	 
(<< 
$str<< $
)<<$ %
]<<% &
public== 
async== 
Task== 
<== 
IActionResult== '
>==' (
GetAllCategory==) 7
(==7 8
)==8 9
{>> 	
List?? 
<?? 
GetLearnerViewModel?? $
>??$ %

categories??& 0
=??1 2
await??3 8
_learnerServices??9 I
.??I J
GetAllLearner??J W
(??W X
)??X Y
;??Y Z
return@@ 
Ok@@ 
(@@ !
CreateSuccessResponse@@ +
(@@+ ,

categories@@, 6
)@@6 7
)@@7 8
;@@8 9
}AA 	
[FF 	
HttpGetFF	 
(FF 
$strFF +
)FF+ ,
]FF, -
publicGG 
asyncGG 
TaskGG 
<GG 
IActionResultGG '
>GG' ( 
GetAllLearnerProfileGG) =
(GG= >
)GG> ?
{HH 	
ListII 
<II 
GetProfileViewModelII $
>II$ %
LearnerProfileoneII& 7
=II8 9
awaitJJ 
_profileServiceJJ %
.JJ% & 
GetAllLearnerProfileJJ& :
(JJ: ;
)JJ; <
;JJ< =
returnKK 
OkKK 
(KK !
CreateSuccessResponseKK +
(KK+ ,
LearnerProfileoneKK, =
)KK= >
)KK> ?
;KK? @
}LL 	
[QQ 	
HttpGetQQ	 
(QQ 
$strQQ 0
)QQ0 1
]QQ1 2
publicRR 
asyncRR 
TaskRR 
<RR 
IActionResultRR '
>RR' (!
GetLearnerProfileByIdRR) >
(RR> ?
stringRR? E
idRRF H
)RRH I
{SS 	
LearnerProfileTT 
LearnerProfileoneTT ,
=TT- .
_profileServiceTT/ >
.TT> ?!
GetLearnerProfileByIdTT? T
(TTT U
idTTU W
)TTW X
;TTX Y
returnUU 
OkUU 
(UU !
CreateSuccessResponseUU +
(UU+ ,
LearnerProfileoneUU, =
)UU= >
)UU> ?
;UU? @
}VV 	
[[[ 	
HttpGet[[	 
([[ 
$str[[ )
)[[) *
][[* +
public\\ 
async\\ 
Task\\ 
<\\ 
IActionResult\\ '
>\\' (
GetLearnerById\\) 7
(\\7 8
string\\8 >
id\\? A
)\\A B
{]] 	
Learner^^ 
LearnerProfileone^^ %
=^^& '
_learnerServices^^( 8
.^^8 9
GetLearnerById^^9 G
(^^G H
id^^H J
)^^J K
;^^K L
return__ 
Ok__ 
(__ !
CreateSuccessResponse__ +
(__+ ,
LearnerProfileone__, =
)__= >
)__> ?
;__? @
}`` 	
[gg 	
HttpPostgg	 
(gg 
$strgg %
)gg% &
]gg& '
publichh 
IActionResulthh 
GenerateOTPhh (
(hh( )
[hh) *
	FromQueryhh* 3
]hh3 4
stringhh5 ;
emailhh< A
)hhA B
{ii 	
stringkk 
[kk 
]kk 
saAllowedCharacterskk (
=kk) *
{kk+ ,
$strkk- 0
,kk0 1
$strkk2 5
,kk5 6
$strkk7 :
,kk: ;
$strkk< ?
,kk? @
$strkkA D
,kkD E
$strkkF I
,kkI J
$strkkK N
,kkN O
$strkkP S
,kkS T
$strkkU X
,kkX Y
$strkkZ ]
}kk^ _
;kk_ `
stringll 
sOTPll 
=ll 
$strll 
;ll 
Randommm 
randmm 
=mm 
newmm 
Randommm $
(mm$ %
)mm% &
;mm& '
foroo 
(oo 
intoo 
ioo 
=oo 
$numoo 
;oo 
ioo 
<oo 
$numoo  !
;oo! "
ioo# $
++oo$ &
)oo& '
{pp 
intqq 
pqq 
=qq 
randqq 
.qq 
Nextqq !
(qq! "
$numqq" #
,qq# $
saAllowedCharactersqq% 8
.qq8 9
Lengthqq9 ?
)qq? @
;qq@ A
sOTPrr 
+=rr 
saAllowedCharactersrr +
[rr+ ,
prr, -
]rr- .
;rr. /
}ss 
emailOtpMap|| 
[|| 
email|| 
]|| 
=||  
sOTP||! %
;||% &
string 
sender 
= 
$str 5
;5 6
string
ÄÄ 

senderPass
ÄÄ 
=
ÄÄ 
$str
ÄÄ  5
;
ÄÄ5 6
string
ÅÅ 
subject
ÅÅ 
=
ÅÅ 
$str
ÅÅ 5
;
ÅÅ5 6
string
ÇÇ 
body
ÇÇ 
=
ÇÇ 
$"
ÇÇ 
$str
ÇÇ =
{
ÇÇ= >
sOTP
ÇÇ> B
}
ÇÇB C
"
ÇÇC D
;
ÇÇD E
using
ÖÖ 
(
ÖÖ 
var
ÖÖ 
mail
ÖÖ 
=
ÖÖ 
new
ÖÖ !
MailMessage
ÖÖ" -
(
ÖÖ- .
sender
ÖÖ. 4
,
ÖÖ4 5
email
ÖÖ6 ;
)
ÖÖ; <
)
ÖÖ< =
{
ÜÜ 
mail
áá 
.
áá 
Subject
áá 
=
áá 
subject
áá &
;
áá& '
mail
àà 
.
àà 
Body
àà 
=
àà 
body
àà  
;
àà  !
using
ää 
(
ää 
var
ää 

smtpClient
ää %
=
ää& '
new
ää( +

SmtpClient
ää, 6
(
ää6 7
$str
ää7 G
)
ääG H
)
ääH I
{
ãã 

smtpClient
åå 
.
åå 
Port
åå #
=
åå$ %
$num
åå& )
;
åå) *

smtpClient
çç 
.
çç 
Credentials
çç *
=
çç+ ,
new
çç- 0
NetworkCredential
çç1 B
(
ççB C
sender
ççC I
,
ççI J

senderPass
ççK U
)
ççU V
;
ççV W

smtpClient
éé 
.
éé 
	EnableSsl
éé (
=
éé) *
true
éé+ /
;
éé/ 0
try
êê 
{
ëë 

smtpClient
íí "
.
íí" #
Send
íí# '
(
íí' (
mail
íí( ,
)
íí, -
;
íí- .
_currentTIme
ìì $
=
ìì% &
DateTime
ìì' /
.
ìì/ 0
Now
ìì0 3
;
ìì3 4
Console
îî 
.
îî  
	WriteLine
îî  )
(
îî) *
$str
îî* C
)
îîC D
;
îîD E
}
ïï 
catch
ññ 
(
ññ 
	Exception
ññ $
e
ññ% &
)
ññ& '
{
óó 
Console
òò 
.
òò  
	WriteLine
òò  )
(
òò) *
$"
òò* ,
$str
òò, A
{
òòA B
e
òòB C
.
òòC D
Message
òòD K
}
òòK L
"
òòL M
)
òòM N
;
òòN O
}
ôô 
}
öö 
}
õõ 
return
ùù 
Ok
ùù 
(
ùù 
emailOtpMap
ùù !
)
ùù! "
;
ùù" #
}
ûû 	
static
«« 
DateTime
«« %
UnixTimeStampToDateTime
«« /
(
««/ 0
double
««0 6
unixTimeStamp
««7 D
)
««D E
{
»» 	
DateTime
   
epoch
   
=
   
new
    
DateTime
  ! )
(
  ) *
$num
  * .
,
  . /
$num
  0 1
,
  1 2
$num
  3 4
,
  4 5
$num
  6 7
,
  7 8
$num
  9 :
,
  : ;
$num
  < =
,
  = >
DateTimeKind
  ? K
.
  K L
Utc
  L O
)
  O P
;
  P Q
return
ÀÀ 
epoch
ÀÀ 
.
ÀÀ 

AddSeconds
ÀÀ #
(
ÀÀ# $
unixTimeStamp
ÀÀ$ 1
)
ÀÀ1 2
.
ÀÀ2 3
ToLocalTime
ÀÀ3 >
(
ÀÀ> ?
)
ÀÀ? @
;
ÀÀ@ A
}
ÃÃ 	
[
—— 	
HttpGet
——	 
(
—— 
$str
—— 
)
—— 
]
—— 
public
““ 
IActionResult
““ 
	VerifyOTP
““ &
(
““& '
[
““' (
	FromQuery
““( 1
]
““1 2
string
““3 9
email
““: ?
,
““? @
[
““A B
	FromQuery
““B K
]
““K L
string
““M S
userOTP
““T [
)
““[ \
{
”” 	
if
’’ 
(
’’ 
emailOtpMap
’’ 
.
’’ 
ContainsKey
’’ '
(
’’' (
email
’’( -
)
’’- .
)
’’. /
{
÷÷ 
var
◊◊ 
otpData
◊◊ 
=
◊◊ 
emailOtpMap
◊◊ )
[
◊◊) *
email
◊◊* /
]
◊◊/ 0
;
◊◊0 1
DateTime
ÿÿ 
storedTimestamp
ÿÿ (
=
ÿÿ) *
_currentTIme
ÿÿ+ 7
;
ÿÿ7 8
DateTime
ŸŸ 
currentTimestamp
ŸŸ )
=
ŸŸ* +
DateTime
ŸŸ, 4
.
ŸŸ4 5
Now
ŸŸ5 8
;
ŸŸ8 9
TimeSpan
€€ 
timeDifference
€€ '
=
€€( )
currentTimestamp
€€* :
-
€€; <
storedTimestamp
€€= L
;
€€L M
double
‚‚ 
num
‚‚ 
=
‚‚ 
timeDifference
‚‚ +
.
‚‚+ ,
TotalMinutes
‚‚, 8
;
‚‚8 9
if
„„ 
(
„„ 
timeDifference
„„ "
.
„„" #
TotalMinutes
„„# /
<
„„0 1
$num
„„2 3
)
„„3 4
{
‰‰ 
if
ÂÂ 
(
ÂÂ 
otpData
ÂÂ 
==
ÂÂ  "
userOTP
ÂÂ# *
)
ÂÂ* +
{
ÊÊ 
string
ÁÁ 
removeEmail
ÁÁ *
=
ÁÁ+ ,
$str
ÁÁ- /
;
ÁÁ/ 0
emailOtpMap
ËË #
.
ËË# $
Remove
ËË$ *
(
ËË* +
email
ËË+ 0
,
ËË0 1
out
ËË2 5
removeEmail
ËË6 A
)
ËËA B
;
ËËB C
Console
ÈÈ 
.
ÈÈ  
	WriteLine
ÈÈ  )
(
ÈÈ) *
$"
ÈÈ* ,
$str
ÈÈ, Q
{
ÈÈQ R
email
ÈÈR W
}
ÈÈW X
"
ÈÈX Y
)
ÈÈY Z
;
ÈÈZ [
return
ÎÎ 
Ok
ÎÎ !
(
ÎÎ! "
$str
ÎÎ" >
)
ÎÎ> ?
;
ÎÎ? @
}
ÏÏ 
else
ÌÌ 
{
ÓÓ 
Console
 
.
  
	WriteLine
  )
(
) *
$"
* ,
$str
, L
{
L M
email
M R
}
R S
"
S T
)
T U
;
U V
return
ÒÒ 

BadRequest
ÒÒ )
(
ÒÒ) *
$str
ÒÒ* A
)
ÒÒA B
;
ÒÒB C
}
ÚÚ 
}
ÛÛ 
else
ÙÙ 
{
ıı 
string
˜˜ 
removeEmail
˜˜ &
=
˜˜' (
$str
˜˜) +
;
˜˜+ ,
emailOtpMap
¯¯ 
.
¯¯  
Remove
¯¯  &
(
¯¯& '
email
¯¯' ,
,
¯¯, -
out
¯¯. 1
removeEmail
¯¯2 =
)
¯¯= >
;
¯¯> ?
Console
˘˘ 
.
˘˘ 
	WriteLine
˘˘ %
(
˘˘% &
$"
˘˘& (
$str
˘˘( C
{
˘˘C D
email
˘˘D I
}
˘˘I J
"
˘˘J K
)
˘˘K L
;
˘˘L M
return
˙˙ 

BadRequest
˙˙ %
(
˙˙% &
$str
˙˙& 8
)
˙˙8 9
;
˙˙9 :
}
˚˚ 
}
¸¸ 
else
˝˝ 
{
˛˛ 
Console
ÄÄ 
.
ÄÄ 
	WriteLine
ÄÄ !
(
ÄÄ! "
$"
ÄÄ" $
$str
ÄÄ$ N
{
ÄÄN O
email
ÄÄO T
}
ÄÄT U
"
ÄÄU V
)
ÄÄV W
;
ÄÄW X
return
ÅÅ 

BadRequest
ÅÅ !
(
ÅÅ! "
$str
ÅÅ" M
)
ÅÅM N
;
ÅÅN O
}
ÇÇ 
}
ÉÉ 	
[
‚‚ 	
HttpPut
‚‚	 
(
‚‚ 
$str
‚‚ -
)
‚‚- .
]
‚‚. /
public
„„ 
async
„„ 
Task
„„ 
<
„„ 
IActionResult
„„ '
>
„„' (
UpdateProfile
„„) 6
(
„„6 7
[
„„7 8
FromForm
„„8 @
]
„„@ A$
UpdateProfileViewModel
„„B X
model
„„Y ^
)
„„^ _
{
‰‰ 	
await
ÂÂ 
_profileService
ÂÂ !
.
ÂÂ! "
UpdateProfile
ÂÂ" /
(
ÂÂ/ 0
model
ÂÂ0 5
)
ÂÂ5 6
;
ÂÂ6 7
return
ÁÁ 
Ok
ÁÁ 
(
ÁÁ #
CreateSuccessResponse
ÁÁ +
(
ÁÁ+ ,
$num
ÁÁ, /
)
ÁÁ/ 0
)
ÁÁ0 1
;
ÁÁ1 2
}
ËË 	
[
ÍÍ 	
HttpPut
ÍÍ	 
(
ÍÍ 
$str
ÍÍ .
)
ÍÍ. /
]
ÍÍ/ 0
public
ÎÎ 
async
ÎÎ 
Task
ÎÎ 
<
ÎÎ 
IActionResult
ÎÎ '
>
ÎÎ' (
UpdatePassword
ÎÎ) 7
(
ÎÎ7 8
string
ÏÏ 
	learnerId
ÏÏ 
,
ÏÏ 
string
ÌÌ 
oldPassword
ÌÌ 
,
ÌÌ 
string
ÓÓ 
newPassword
ÓÓ 
)
ÔÔ 	
{
 	
var
ÒÒ 
result
ÒÒ 
=
ÒÒ 
await
ÒÒ %
_passwordHistoryService
ÒÒ 6
.
ÒÒ6 7
UpdatePassword
ÒÒ7 E
(
ÒÒE F
	learnerId
ÚÚ 
,
ÚÚ 
oldPassword
ÛÛ 
,
ÛÛ 
newPassword
ÙÙ 
)
ıı 
;
ıı 
if
˜˜ 
(
˜˜ 
!
˜˜ 
result
˜˜ 
)
˜˜ 
{
¯¯ 
return
˘˘ 

BadRequest
˘˘ !
(
˘˘! "
$str
˘˘" =
)
˘˘= >
;
˘˘> ?
}
˙˙ 
return
¸¸ 
Ok
¸¸ 
(
¸¸ 
$str
¸¸ 5
)
¸¸5 6
;
¸¸6 7
}
˝˝ 	
}
˛˛ 
}ˇˇ ’F
9D:\backend\LXP.Api\Controllers\TopicFeedbackController.cs
	namespace 	
LXP
 
. 
Api 
. 
Controllers 
{ 
[ 
ApiController 
] 
[		 
Route		 

(		
 
$str		 
)		 
]		 
public

 

class

 #
TopicFeedbackController

 (
:

) *
BaseController

+ 9
{ 
private 
readonly !
ITopicFeedbackService .
_service/ 7
;7 8
public #
TopicFeedbackController &
(& '!
ITopicFeedbackService' <
service= D
)D E
{ 	
_service 
= 
service 
; 
} 	
[ 	
HttpPost	 
( 
$str 
) 
] 
public 
IActionResult 
AddFeedbackQuestion 0
(0 1*
TopicFeedbackQuestionViewModel1 O
questionP X
)X Y
{ 	
if 
( 
question 
== 
null  
)  !
{ 
return 

BadRequest !
(! "!
CreateFailureResponse" 7
(7 8
$str8 Q
,Q R
$numS V
)V W
)W X
;X Y
}   
var"" 
options"" 
="" 
question"" "
.""" #
Options""# *
??""+ -
new"". 1
List""2 6
<""6 71
%TopicFeedbackQuestionsOptionViewModel""7 \
>""\ ]
(""] ^
)""^ _
;""_ `
var## 

questionId## 
=## 
_service## %
.##% &
AddFeedbackQuestion##& 9
(##9 :
question##: B
,##B C
options##D K
)##K L
;##L M
if%% 
(%% 

questionId%% 
!=%% 
Guid%% "
.%%" #
Empty%%# (
)%%( )
{&& 
return'' 
Ok'' 
('' !
CreateSuccessResponse'' /
(''/ 0
$str''0 M
)''M N
)''N O
;''O P
}(( 
return** 

StatusCode** 
(** 
$num** !
,**! "!
CreateFailureResponse**# 8
(**8 9
$str**9 Q
,**Q R
$num**S V
)**V W
)**W X
;**X Y
}++ 	
[22 	
HttpGet22	 
]22 
public33 
IActionResult33 #
GetAllFeedbackQuestions33 4
(334 5
)335 6
{44 	
var55 
	questions55 
=55 
_service55 $
.55$ %#
GetAllFeedbackQuestions55% <
(55< =
)55= >
;55> ?
return66 
Ok66 
(66 !
CreateSuccessResponse66 +
(66+ ,
	questions66, 5
)665 6
)666 7
;667 8
}77 	
[@@ 	
HttpGet@@	 
(@@ 
$str@@ ,
)@@, -
]@@- .
publicAA 
IActionResultAA #
GetFeedbackQuestionByIdAA 4
(AA4 5
GuidAA5 9#
topicFeedbackQuestionIdAA: Q
)AAQ R
{BB 	
varCC 
questionCC 
=CC 
_serviceCC #
.CC# $#
GetFeedbackQuestionByIdCC$ ;
(CC; <#
topicFeedbackQuestionIdCC< S
)CCS T
;CCT U
ifDD 
(DD 
questionDD 
==DD 
nullDD  
)DD  !
{EE 
returnFF 
NotFoundFF 
(FF  !
CreateFailureResponseFF  5
(FF5 6
$strFF6 S
,FFS T
$numFFU X
)FFX Y
)FFY Z
;FFZ [
}GG 
returnII 
OkII 
(II !
CreateSuccessResponseII +
(II+ ,
questionII, 4
)II4 5
)II5 6
;II6 7
}JJ 	
[UU 	
HttpPutUU	 
(UU 
$strUU ,
)UU, -
]UU- .
publicVV 
IActionResultVV "
UpdateFeedbackQuestionVV 3
(VV3 4
GuidWW #
topicFeedbackQuestionIdWW (
,WW( )*
TopicFeedbackQuestionViewModelXX *
questionXX+ 3
)YY 	
{ZZ 	
var[[ 
existingQuestion[[  
=[[! "
_service[[# +
.[[+ ,#
GetFeedbackQuestionById[[, C
([[C D#
topicFeedbackQuestionId[[D [
)[[[ \
;[[\ ]
if\\ 
(\\ 
existingQuestion\\  
==\\! #
null\\$ (
)\\( )
{]] 
return^^ 
NotFound^^ 
(^^  !
CreateFailureResponse^^  5
(^^5 6
$str^^6 S
,^^S T
$num^^U X
)^^X Y
)^^Y Z
;^^Z [
}__ 
varaa 
optionsaa 
=aa 
questionaa "
.aa" #
Optionsaa# *
??aa+ -
newaa. 1
Listaa2 6
<aa6 71
%TopicFeedbackQuestionsOptionViewModelaa7 \
>aa\ ]
(aa] ^
)aa^ _
;aa_ `
varbb 
resultbb 
=bb 
_servicebb !
.bb! ""
UpdateFeedbackQuestionbb" 8
(bb8 9#
topicFeedbackQuestionIdcc '
,cc' (
questiondd 
,dd 
optionsee 
)ff 
;ff 
ifhh 
(hh 
resulthh 
)hh 
{ii 
returnjj 
Okjj 
(jj !
CreateSuccessResponsejj /
(jj/ 0
$strjj0 X
)jjX Y
)jjY Z
;jjZ [
}kk 
returnmm 

StatusCodemm 
(mm 
$numnn 
,nn !
CreateFailureResponseoo %
(oo% &
$stroo& J
,ooJ K
$numooL O
)ooO P
)pp 
;pp 
}qq 	
[zz 	

HttpDeletezz	 
(zz 
$strzz /
)zz/ 0
]zz0 1
public{{ 
IActionResult{{ "
DeleteFeedbackQuestion{{ 3
({{3 4
Guid{{4 8#
topicFeedbackQuestionId{{9 P
){{P Q
{|| 	
var}} 
existingQuestion}}  
=}}! "
_service}}# +
.}}+ ,#
GetFeedbackQuestionById}}, C
(}}C D#
topicFeedbackQuestionId}}D [
)}}[ \
;}}\ ]
if~~ 
(~~ 
existingQuestion~~  
==~~! #
null~~$ (
)~~( )
{ 
return
ÄÄ 
NotFound
ÄÄ 
(
ÄÄ  #
CreateFailureResponse
ÄÄ  5
(
ÄÄ5 6
$str
ÄÄ6 S
,
ÄÄS T
$num
ÄÄU X
)
ÄÄX Y
)
ÄÄY Z
;
ÄÄZ [
}
ÅÅ 
var
ÉÉ 
result
ÉÉ 
=
ÉÉ 
_service
ÉÉ !
.
ÉÉ! "$
DeleteFeedbackQuestion
ÉÉ" 8
(
ÉÉ8 9%
topicFeedbackQuestionId
ÉÉ9 P
)
ÉÉP Q
;
ÉÉQ R
if
ÖÖ 
(
ÖÖ 
result
ÖÖ 
)
ÖÖ 
{
ÜÜ 
return
áá 
Ok
áá 
(
áá #
CreateSuccessResponse
áá /
(
áá/ 0
$str
áá0 X
)
ááX Y
)
ááY Z
;
ááZ [
}
àà 
return
ää 

StatusCode
ää 
(
ää 
$num
ãã 
,
ãã #
CreateFailureResponse
åå %
(
åå% &
$str
åå& J
,
ååJ K
$num
ååL O
)
ååO P
)
çç 
;
çç 
}
éé 	
[
óó 	
HttpGet
óó	 
(
óó 
$str
óó "
)
óó" #
]
óó# $
public
òò 
IActionResult
òò +
GetFeedbackQuestionsByTopicId
òò :
(
òò: ;
Guid
òò; ?
topicId
òò@ G
)
òòG H
{
ôô 	
var
öö 
	questions
öö 
=
öö 
_service
öö $
.
öö$ %+
GetFeedbackQuestionsByTopicId
öö% B
(
ööB C
topicId
ööC J
)
ööJ K
;
ööK L
if
õõ 
(
õõ 
	questions
õõ 
==
õõ 
null
õõ !
||
õõ" $
!
õõ% &
	questions
õõ& /
.
õõ/ 0
Any
õõ0 3
(
õõ3 4
)
õõ4 5
)
õõ5 6
{
úú 
return
ùù 
NotFound
ùù 
(
ùù  #
CreateFailureResponse
ûû )
(
ûû) *
$str
ûû* R
,
ûûR S
$num
ûûT W
)
ûûW X
)
üü 
;
üü 
}
†† 
return
¢¢ 
Ok
¢¢ 
(
¢¢ #
CreateSuccessResponse
¢¢ +
(
¢¢+ ,
	questions
¢¢, 5
)
¢¢5 6
)
¢¢6 7
;
¢¢7 8
}
££ 	
}
§§ 
}•• ≥
:D:\backend\LXP.Api\Controllers\UpdatePasswordController.cs
	namespace 	
LXP
 
. 
Api 
. 
Controllers 
{ 
[ 
Route 

(
 
$str 
) 
] 
[		 
ApiController		 
]		 
public

 

class

 $
UpdatePasswordController

 )
:

* +
ControllerBase

, :
{ 
private 
readonly "
IUpdatePasswordService /
	_services0 9
;9 :
public $
UpdatePasswordController '
(' ("
IUpdatePasswordService( >
services? G
)G H
{ 	
	_services 
= 
services  
;  !
} 	
[ 	
HttpPut	 
] 
public 
ActionResult  
LeanerUpdatePassword 0
(0 1
[1 2
FromBody2 :
]: ;
UpdatePassword< J
updatepasswordK Y
)Y Z
{ 	
var 
result 
= 
	_services "
." #
UpdatePassword# 1
(1 2
updatepassword2 @
)@ A
;A B
return 
Ok 
( 
result 
) 
; 
} 	
} 
}   Ü0
:D:\backend\LXP.Api\Interceptors\ApiExceptionInterceptor.cs
	namespace		 	
LXP		
 
.		 
Api		 
.		 
Interceptors		 
{

 
public 

class #
ApiExceptionInterceptor (
:) *!
IAsyncExceptionFilter+ @
{ 
private 
readonly 
ILogger  
<  !#
ApiExceptionInterceptor! 8
>8 9
_logger: A
;A B
public #
ApiExceptionInterceptor &
(& '
ILogger' .
<. /#
ApiExceptionInterceptor/ F
>F G
loggerH N
)N O
{ 	
_logger 
= 
logger 
; 
} 	
public!! 
Task!! 
OnExceptionAsync!! $
(!!$ %
ExceptionContext!!% 5
context!!6 =
)!!= >
{"" 	
HttpStatusCode## 

statusCode## %
=##& '
($$ 
(%% 
context%% 
.%% 
	Exception%% &
is%%' )
WebException%%* 6
)%%6 7
&&&& 
(&& 
(&& 
HttpWebResponse&& (
)&&( )
(&&) *
context&&* 1
.&&1 2
	Exception&&2 ;
as&&< >
WebException&&? K
)&&K L
.&&L M
Response&&M U
)&&U V
!=&&W Y
null&&Z ^
)'' 
?(( 
((( 
((( 
HttpWebResponse(( '
)((' (
(((( )
context(() 0
.((0 1
	Exception((1 :
as((; =
WebException((> J
)((J K
.((K L
Response((L T
)((T U
.((U V

StatusCode((V `
:)) 
GetErrorCode)) "
())" #
context))# *
.))* +
	Exception))+ 4
.))4 5
GetType))5 <
())< =
)))= >
)))> ?
;))? @
var++ 
	exception++ 
=++ 
context++ #
.++# $
	Exception++$ -
;++- .
context,, 
.,, 
HttpContext,, 
.,,  
Response,,  (
.,,( )

StatusCode,,) 3
=,,4 5
(,,6 7
int,,7 :
),,: ;

statusCode,,; E
;,,E F
var// 
error// 
=// 
new// 
APIResponse// '
(//' (
)//( )
{00 

StatusCode11 
=11 
(11 
int11 !
)11! "

statusCode11" ,
,11, -
Message22 
=22 
(33 
int33 
)33 

statusCode33 #
==33$ &
(33' (
int33( +
)33+ ,
HttpStatusCode33, :
.33: ;
InternalServerError33; N
?44 
MessageConstants44 *
.44* +
MsgServerError44+ 9
:55 
	exception55 #
.55# $
Message55$ +
??55, .
	exception55/ 8
.558 9
InnerException559 G
.55G H
Message55H O
}66 
;66 
_logger99 
.99 
LogError99 
(99 
$str:: t
,::t u

MethodBase;; 
.;; 
GetCurrentMethod;; +
(;;+ ,
);;, -
.;;- .
DeclaringType;;. ;
.;;; <
FullName;;< D
,;;D E
	exception<< 
.<< 
Message<< !
??<<" $
$str<<% +
,<<+ ,
	exception== 
.== 
InnerException== (
?==( )
.==) *
Message==* 1
??==2 4
$str==5 ;
,==; <
	exception>> 
.>> 

StackTrace>> $
??>>% '
$str>>( .
)?? 
;?? 
contextAA 
.AA 
ResultAA 
=AA 
newAA  

JsonResultAA! +
(AA+ ,
errorAA, 1
)AA1 2
;AA2 3
returnBB 
TaskBB 
.BB 
CompletedTaskBB %
;BB% &
}CC 	
privateEE 
staticEE 
HttpStatusCodeEE %
GetErrorCodeEE& 2
(EE2 3
TypeEE3 7
exceptionTypeEE8 E
)EEE F
{FF 	
ifGG 
(GG 
EnumGG 
.GG 
TryParseGG 
(GG 
exceptionTypeGG +
.GG+ ,
NameGG, 0
,GG0 1
outGG2 5

ExceptionsGG6 @
tryParseResultGGA O
)GGO P
)GGP Q
{HH 
returnII 
tryParseResultII %
switchII& ,
{JJ 

ExceptionsKK 
.KK '
UnauthorizedAccessExceptionKK :
=>KK; =
HttpStatusCodeKK> L
.KKL M
UnauthorizedKKM Y
,KKY Z

ExceptionsLL 
.LL 
ArgumentExceptionLL 0
=>LL1 3
HttpStatusCodeLL4 B
.LLB C

BadRequestLLC M
,LLM N

ExceptionsMM 
.MM !
ArgumentNullExceptionMM 4
=>MM5 7
HttpStatusCodeMM8 F
.MMF G

BadRequestMMG Q
,MMQ R

ExceptionsNN 
.NN '
ArgumentOutOfRangeExceptionNN :
=>NN; =
HttpStatusCodeNN> L
.NNL M

BadRequestNNM W
,NNW X

ExceptionsOO 
.OO 
FormatExceptionOO .
=>OO/ 1
HttpStatusCodeOO2 @
.OO@ A

BadRequestOOA K
,OOK L

ExceptionsPP 
.PP (
InvalidEnumArgumentExceptionPP ;
=>PP< >
HttpStatusCodePP? M
.PPM N

BadRequestPPN X
,PPX Y
_QQ 
=>QQ 
HttpStatusCodeQQ '
.QQ' (
InternalServerErrorQQ( ;
,QQ; <
}RR 
;RR 
}SS 
elseTT 
{UU 
returnVV 
HttpStatusCodeVV %
.VV% &
InternalServerErrorVV& 9
;VV9 :
}WW 
}XX 	
}YY 
}ZZ ï
CD:\backend\LXP.Api\Interceptors\GlobalExceptionHandlerMiddleware.cs
	namespace 	
LXP
 
. 
API 
. 
Interceptors 
{ 
public 
class ,
 GlobalExceptionHandlerMiddleware -
{ 
private		 
readonly		 
RequestDelegate		 $
_next		% *
;		* +
private

 
readonly

 
ILogger

 
<

 ,
 GlobalExceptionHandlerMiddleware

 =
>

= >
_logger

? F
;

F G
public 
,
 GlobalExceptionHandlerMiddleware +
(+ ,
RequestDelegate 
next 
, 
ILogger 
< ,
 GlobalExceptionHandlerMiddleware 0
>0 1
logger2 8
) 
{ 
_next 
= 
next 
; 
_logger 
= 
logger 
; 
} 
public 

async 
Task 
InvokeAsync !
(! "
HttpContext" -
context. 5
)5 6
{ 
try 
{ 	
await 
_next 
( 
context 
)  
;  !
} 	
catch 
( 
	Exception 
ex 
) 
{ 	
_logger 
. 
LogError 
( 
ex 
,  
ex! #
.# $
Message$ +
)+ ,
;, -
await  
HandleExceptionAsync &
(& '
context' .
,. /
ex0 2
)2 3
;3 4
} 	
}   
private"" 
static"" 
Task""  
HandleExceptionAsync"" ,
("", -
HttpContext""- 8
context""9 @
,""@ A
	Exception""B K
ex""L N
)""N O
{## 
context$$ 
.$$ 
Response$$ 
.$$ 
ContentType$$ $
=$$% &
$str$$' 9
;$$9 :
context%% 
.%% 
Response%% 
.%% 

StatusCode%% #
=%%$ %
(%%& '
int%%' *
)%%* +
HttpStatusCode%%+ 9
.%%9 :
InternalServerError%%: M
;%%M N
var&& 
result&& 
=&& 
JsonConvert&&  
.&&  !
SerializeObject&&! 0
(&&0 1
new&&1 4
{&&5 6
error&&7 <
=&&= >
ex&&? A
.&&A B
Message&&B I
}&&J K
)&&K L
;&&L M
return'' 
context'' 
.'' 
Response'' 
.''  

WriteAsync''  *
(''* +
result''+ 1
)''1 2
;''2 3
}(( 
})) 
}** ¸∆
D:\backend\LXP.Api\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
Services 
. 
AddCors 
( 
options  
=>! #
{ 
options 
. 
	AddPolicy 
( 
name 
: 
$str '
,' (
policy 
=> 
{ 	
policy 
. 
AllowAnyOrigin !
(! "
)" #
.# $
AllowAnyHeader$ 2
(2 3
)3 4
.4 5
AllowAnyMethod5 C
(C D
)D E
.E F
AllowAnyMethodF T
(T U
)U V
;V W
} 	
) 
; 
} 
) 
; 
builder## 
.## 
Services## 
.## 
	AddScoped## 
<## 
ILoginService## (
,##( )
LoginService##* 6
>##6 7
(##7 8
)##8 9
;##9 :
builder$$ 
.$$ 
Services$$ 
.$$ 
	AddScoped$$ 
<$$ 
ILoginRepository$$ +
,$$+ ,
LoginRepository$$- <
>$$< =
($$= >
)$$> ?
;$$? @
builder%% 
.%% 
Services%% 
.%% 
	AddScoped%% 
<%% 
IForgetRepository%% ,
,%%, -
ForgetRepository%%. >
>%%> ?
(%%? @
)%%@ A
;%%A B
builder&& 
.&& 
Services&& 
.&& 
	AddScoped&& 
<&& 
IForgetService&& )
,&&) *
ForgetService&&+ 8
>&&8 9
(&&9 :
)&&: ;
;&&; <
builder'' 
.'' 
Services'' 
.'' 
	AddScoped'' 
<''  
IDashboardRepository'' /
,''/ 0
DashboardRepository''1 D
>''D E
(''E F
)''F G
;''G H
builder(( 
.(( 
Services(( 
.(( 
	AddScoped(( 
<(( 
IService(( #
,((# $
Services((% -
>((- .
(((. /
)((/ 0
;((0 1
builder)) 
.)) 
Services)) 
.)) 
	AddScoped)) 
<)) 
IRepository)) &
,))& '

Repository))( 2
>))2 3
())3 4
)))4 5
;))5 6
builder** 
.** 
Services** 
.** 
	AddScoped** 
<** 
IDashboardService** ,
,**, -
DashboardService**. >
>**> ?
(**? @
)**@ A
;**A B
builder++ 
.++ 
Services++ 
.++ 
	AddScoped++ 
<++ "
IUpdatePasswordService++ 1
,++1 2!
UpdatePasswordService++3 H
>++H I
(++I J
)++J K
;++K L
builder,, 
.,, 
Services,, 
.,, 
	AddScoped,, 
<,, %
IUpdatePasswordRepository,, 4
,,,4 5$
UpdatePasswordRepository,,6 N
>,,N O
(,,O P
),,P Q
;,,Q R
builder// 
.// 
Services// 
.// 
	AddScoped// 
<// 
ICategoryServices// ,
,//, -
CategoryServices//. >
>//> ?
(//? @
)//@ A
;//A B
builder00 
.00 
Services00 
.00 
	AddScoped00 
<00 
ICategoryRepository00 .
,00. /
CategoryRepository000 B
>00B C
(00C D
)00D E
;00E F
builder22 
.22 
Services22 
.22 
	AddScoped22 
<22  
ICourseLevelServices22 /
,22/ 0
CourseLevelServices221 D
>22D E
(22E F
)22F G
;22G H
builder33 
.33 
Services33 
.33 
	AddScoped33 
<33 "
ICourseLevelRepository33 1
,331 2!
CourseLevelRepository333 H
>33H I
(33I J
)33J K
;33K L
builder55 
.55 
Services55 
.55 
	AddScoped55 
<55 "
ICourseTopicRepository55 1
,551 2!
CourseTopicRepository553 H
>55H I
(55I J
)55J K
;55K L
builder66 
.66 
Services66 
.66 
	AddScoped66 
<66  
ICourseTopicServices66 /
,66/ 0
CourseTopicServices661 D
>66D E
(66E F
)66F G
;66G H
builder88 
.88 
Services88 
.88 
	AddScoped88 
<88 
ICourseServices88 *
,88* +
CourseServices88, :
>88: ;
(88; <
)88< =
;88= >
builder99 
.99 
Services99 
.99 
	AddScoped99 
<99 
ICourseRepository99 ,
,99, -
CourseRepository99. >
>99> ?
(99? @
)99@ A
;99A B
builder:: 
.:: 
Services:: 
.:: 
	AddScoped:: 
<:: #
IMaterialTypeRepository:: 2
,::2 3"
MaterialTypeRepository::4 J
>::J K
(::K L
)::L M
;::M N
builder;; 
.;; 
Services;; 
.;; 
	AddScoped;; 
<;; !
IMaterialTypeServices;; 0
,;;0 1 
MaterialTypeServices;;2 F
>;;F G
(;;G H
);;H I
;;;I J
builder<< 
.<< 
Services<< 
.<< 
	AddScoped<< 
<<< 
IMaterialRepository<< .
,<<. /
MaterialRepository<<0 B
><<B C
(<<C D
)<<D E
;<<E F
builder== 
.== 
Services== 
.== 
	AddScoped== 
<== 
IMaterialServices== ,
,==, -
MaterialServices==. >
>==> ?
(==? @
)==@ A
;==A B
builder>> 
.>> 
Services>> 
.>> 
	AddScoped>> 
<>> 
IUserReportServices>> .
,>>. /
UserReportServices>>0 B
>>>B C
(>>C D
)>>D E
;>>E F
builder?? 
.?? 
Services?? 
.?? 
	AddScoped?? 
<?? !
IUserReportRepository?? 0
,??0 1 
UserReportRepository??2 F
>??F G
(??G H
)??H I
;??I J
builderBB 
.BB 
ServicesBB 
.BB 
	AddScopedBB 
<BB 
ILearnerServicesBB +
,BB+ ,
LearnerServicesBB- <
>BB< =
(BB= >
)BB> ?
;BB? @
builderCC 
.CC 
ServicesCC 
.CC 
	AddScopedCC 
<CC 
ILearnerRepositoryCC -
,CC- .
LearnerRepositoryCC/ @
>CC@ A
(CCA B
)CCB C
;CCC D
builderEE 
.EE 
ServicesEE 
.EE 
	AddScopedEE 
<EE 
LXPDbContextEE '
>EE' (
(EE( )
)EE) *
;EE* +
builderII 
.II 
ServicesII 
.II 
	AddScopedII 
<II 
IQuizRepositoryII *
,II* +
QuizRepositoryII, :
>II: ;
(II; <
)II< =
;II= >
builderJJ 
.JJ 
ServicesJJ 
.JJ 
	AddScopedJJ 
<JJ  
IQuizQuestionServiceJJ /
,JJ/ 0
QuizQuestionServiceJJ1 D
>JJD E
(JJE F
)JJF G
;JJG H
builderKK 
.KK 
ServicesKK 
.KK 
	AddScopedKK 
<KK #
IQuizQuestionRepositoryKK 2
,KK2 3"
QuizQuestionRepositoryKK4 J
>KKJ K
(KKK L
)KKL M
;KKM N
builderLL 
.LL 
ServicesLL 
.LL 
	AddScopedLL 
<LL #
IBulkQuestionRepositoryLL 2
,LL2 3"
BulkQuestionRepositoryLL4 J
>LLJ K
(LLK L
)LLL M
;LLM N
builderMM 
.MM 
ServicesMM 
.MM 
	AddScopedMM 
<MM  
IBulkQuestionServiceMM /
,MM/ 0
BulkQuestionServiceMM1 D
>MMD E
(MME F
)MMF G
;MMG H
builderNN 
.NN 
ServicesNN 
.NN 
	AddScopedNN 
<NN  
IQuizFeedbackServiceNN /
,NN/ 0
QuizFeedbackServiceNN1 D
>NND E
(NNE F
)NNF G
;NNG H
builderOO 
.OO 
ServicesOO 
.OO 
	AddScopedOO 
<OO #
IQuizFeedbackRepositoryOO 2
,OO2 3"
QuizFeedbackRepositoryOO4 J
>OOJ K
(OOK L
)OOL M
;OOM N
builderPP 
.PP 
ServicesPP 
.PP 
	AddScopedPP 
<PP $
ITopicFeedbackRepositoryPP 3
,PP3 4#
TopicFeedbackRepositoryPP5 L
>PPL M
(PPM N
)PPN O
;PPO P
builderQQ 
.QQ 
ServicesQQ 
.QQ 
	AddScopedQQ 
<QQ !
IQuizEngineRepositoryQQ 0
,QQ0 1 
QuizEngineRepositoryQQ2 F
>QQF G
(QQG H
)QQH I
;QQI J
builderRR 
.RR 
ServicesRR 
.RR 
	AddScopedRR 
<RR 
IQuizEngineServiceRR -
,RR- .
QuizEngineServiceRR/ @
>RR@ A
(RRA B
)RRB C
;RRC D
builderSS 
.SS 
ServicesSS 
.SS 
	AddScopedSS 
<SS  
IQuizFeedbackServiceSS /
,SS/ 0
QuizFeedbackServiceSS1 D
>SSD E
(SSE F
)SSF G
;SSG H
builderTT 
.TT 
ServicesTT 
.TT 
	AddScopedTT 
<TT !
ITopicFeedbackServiceTT 0
,TT0 1 
TopicFeedbackServiceTT2 F
>TTF G
(TTG H
)TTH I
;TTI J
builderUU 
.UU 
ServicesUU 
.UU 
	AddScopedUU 
<UU 
IQuizServiceUU '
,UU' (
QuizServiceUU) 4
>UU4 5
(UU5 6
)UU6 7
;UU7 8
builderVV 
.VV 
ServicesVV 
.VV 
	AddScopedVV 
<VV 
IQuizReportServicesVV .
,VV. /
QuizReportServicesVV0 B
>VVB C
(VVC D
)VVD E
;VVE F
builderWW 
.WW 
ServicesWW 
.WW 
	AddScopedWW 
<WW !
IQuizReportRepositoryWW 0
,WW0 1 
QuizReportRepositoryWW2 F
>WWF G
(WWG H
)WWH I
;WWI J
builderXX 
.XX 
ServicesXX 
.XX 
	AddScopedXX 
<XX '
IFeedbackResponseRepositoryXX 6
,XX6 7&
FeedbackResponseRepositoryXX8 R
>XXR S
(XXS T
)XXT U
;XXU V
builderYY 
.YY 
ServicesYY 
.YY 
	AddScopedYY 
<YY $
IFeedbackResponseServiceYY 3
,YY3 4#
FeedbackResponseServiceYY5 L
>YYL M
(YYM N
)YYN O
;YYO P
builder\\ 
.\\ 
Services\\ 
.\\ 
	AddScoped\\ 
<\\ 
IExcelToJsonService\\ .
,\\. /
ExcelToJsonService\\0 B
>\\B C
(\\C D
)\\D E
;\\E F
builder]] 
.]] 
Services]] 
.]] 
	AddScoped]] 
<]] '
IQuizQuestionJsonRepository]] 6
,]]6 7&
QuizQuestionJsonRepository]]8 R
>]]R S
(]]S T
)]]T U
;]]U V
builder__ 
.__ 
Services__ 
.__ 
	AddScoped__ 
<__ 
ICategoryServices__ ,
,__, -
CategoryServices__. >
>__> ?
(__? @
)__@ A
;__A B
builder`` 
.`` 
Services`` 
.`` 
	AddScoped`` 
<`` 
ICategoryRepository`` .
,``. /
CategoryRepository``0 B
>``B C
(``C D
)``D E
;``E F
builderaa 
.aa 
Servicesaa 
.aa 
AddSingletonaa 
<aa 
LXPDbContextaa *
>aa* +
(aa+ ,
)aa, -
;aa- .
builderbb 
.bb 
Servicesbb 
.bb 
	AddScopedbb 
<bb 
ILearnerRepositorybb -
,bb- .
LearnerRepositorybb/ @
>bb@ A
(bbA B
)bbB C
;bbC D
buildercc 
.cc 
Servicescc 
.cc 
	AddScopedcc 
<cc 
IProfileRepositorycc -
,cc- .
ProfileRepositorycc/ @
>cc@ A
(ccA B
)ccB C
;ccC D
builderdd 
.dd 
Servicesdd 
.dd 
	AddScopeddd 
<dd 
ILearnerServicedd *
,dd* +
LearnerServicedd, :
>dd: ;
(dd; <
)dd< =
;dd= >
builderee 
.ee 
Servicesee 
.ee 
	AddScopedee 
<ee 
IProfileServiceee *
,ee* +
ProfileServiceee, :
>ee: ;
(ee; <
)ee< =
;ee= >
builderff 
.ff 
Servicesff 
.ff 
	AddScopedff 
<ff #
IPasswordHistoryServiceff 2
,ff2 3"
PasswordHistoryServiceff4 J
>ffJ K
(ffK L
)ffL M
;ffM N
buildergg 
.gg 
Servicesgg 
.gg 
	AddScopedgg 
<gg &
IPasswordHistoryRepositorygg 5
,gg5 6%
PasswordHistoryRepositorygg7 P
>ggP Q
(ggQ R
)ggR S
;ggS T
builderii 
.ii 
Servicesii 
.ii 
	AddScopedii 
<ii 
IMaterialServicesii ,
,ii, -
MaterialServicesii. >
>ii> ?
(ii? @
)ii@ A
;iiA B
builderjj 
.jj 
Servicesjj 
.jj 
	AddScopedjj 
<jj 
IMaterialRepositoryjj .
,jj. /
MaterialRepositoryjj0 B
>jjB C
(jjC D
)jjD E
;jjE F
builderkk 
.kk 
Serviceskk 
.kk 
	AddScopedkk 
<kk #
IMaterialTypeRepositorykk 2
,kk2 3"
MaterialTypeRepositorykk4 J
>kkJ K
(kkK L
)kkL M
;kkM N
builderll 
.ll 
Servicesll 
.ll 
	AddScopedll 
<ll !
IMaterialTypeServicesll 0
,ll0 1 
MaterialTypeServicesll2 F
>llF G
(llG H
)llH I
;llI J
buildernn 
.nn 
Servicesnn 
.nn 
	AddScopednn 
<nn -
!IProfilePasswordHistoryRepositorynn <
,nn< =,
 ProfilePasswordHistoryRepositorynn> ^
>nn^ _
(nn_ `
)nn` a
;nna b
builderoo 
.oo 
Servicesoo 
.oo 
	AddScopedoo 
<oo  
ICourseLevelServicesoo /
,oo/ 0
CourseLevelServicesoo1 D
>ooD E
(ooE F
)ooF G
;ooG H
builderpp 
.pp 
Servicespp 
.pp 
	AddScopedpp 
<pp "
ICourseLevelRepositorypp 1
,pp1 2!
CourseLevelRepositorypp3 H
>ppH I
(ppI J
)ppJ K
;ppK L
builderqq 
.qq 
Servicesqq 
.qq 
	AddScopedqq 
<qq "
ICourseTopicRepositoryqq 1
,qq1 2!
CourseTopicRepositoryqq3 H
>qqH I
(qqI J
)qqJ K
;qqK L
builderrr 
.rr 
Servicesrr 
.rr 
	AddScopedrr 
<rr  
ICourseTopicServicesrr /
,rr/ 0
CourseTopicServicesrr1 D
>rrD E
(rrE F
)rrF G
;rrG H
builderss 
.ss 
Servicesss 
.ss 
	AddScopedss 
<ss 
ICourseRepositoryss ,
,ss, -
CourseRepositoryss. >
>ss> ?
(ss? @
)ss@ A
;ssA B
buildertt 
.tt 
Servicestt 
.tt 
	AddScopedtt 
<tt 
IEnrollmentServicett -
,tt- .
EnrollmentServicett/ @
>tt@ A
(ttA B
)ttB C
;ttC D
builderuu 
.uu 
Servicesuu 
.uu 
	AddScopeduu 
<uu !
IEnrollmentRepositoryuu 0
,uu0 1 
EnrollmentRepositoryuu2 F
>uuF G
(uuG H
)uuH I
;uuI J
buildervv 
.vv 
Servicesvv 
.vv 
	AddScopedvv 
<vv 
ICourseServicesvv *
,vv* +
CourseServicesvv, :
>vv: ;
(vv; <
)vv< =
;vv= >
builderww 
.ww 
Servicesww 
.ww 
	Configureww 
<ww 
EmailSettingsww (
>ww( )
(ww) *
builderww* 1
.ww1 2
Configurationww2 ?
.ww? @

GetSectionww@ J
(wwJ K
$strwwK Z
)wwZ [
)ww[ \
;ww\ ]
builderxx 
.xx 
Servicesxx 
.xx 
	AddScopedxx 
<xx 
IEmailServicexx (
,xx( )
EmailServicexx* 6
>xx6 7
(xx7 8
)xx8 9
;xx9 :
builderzz 
.zz 
Serviceszz 
.zz 
AddSwaggerGenzz 
(zz 
optionszz &
=>zz' )
{{{ 
options|| 
.|| 
IncludeXmlComments|| 
(|| 
Path}} 
.}} 
Combine}} 
(}} 

AppContext~~ 
.~~ 
BaseDirectory~~ $
,~~$ %
$" 
{ 
Assembly 
.  
GetExecutingAssembly ,
(, -
)- .
.. /
GetName/ 6
(6 7
)7 8
.8 9
Name9 =
}= >
$str> B
"B C
)
ÄÄ 	
)
ÅÅ 
;
ÅÅ 
}ÇÇ 
)
ÇÇ 
;
ÇÇ 
LogÑÑ 
.
ÑÑ 
Logger
ÑÑ 

=
ÑÑ 
new
ÑÑ !
LoggerConfiguration
ÑÑ $
(
ÑÑ$ %
)
ÑÑ% &
.
ÑÑ& '
ReadFrom
ÑÑ' /
.
ÑÑ/ 0
Configuration
ÑÑ0 =
(
ÑÑ= >
builder
ÑÑ> E
.
ÑÑE F
Configuration
ÑÑF S
)
ÑÑS T
.
ÑÑT U
CreateLogger
ÑÑU a
(
ÑÑa b
)
ÑÑb c
;
ÑÑc d
builderÜÜ 
.
ÜÜ 
Host
ÜÜ 
.
ÜÜ 

UseSerilog
ÜÜ 
(
ÜÜ 
)
ÜÜ 
;
ÜÜ 
ExcelPackageáá 
.
áá 
LicenseContext
áá 
=
áá 
LicenseContext
áá ,
.
áá, -
NonCommercial
áá- :
;
áá: ;
builderéé 
.
èè 
Services
èè 
.
èè 
AddControllers
èè 
(
èè 
)
èè 
.
êê !
AddFluentValidation
êê 
(
êê 
v
êê 
=>
êê 
{
ëë 
v
íí 	
.
íí	 
,
RegisterValidatorsFromAssembly
íí
 (
(
íí( )
Assembly
íí) 1
.
íí1 2"
GetExecutingAssembly
íí2 F
(
ííF G
)
ííG H
)
ííH I
;
ííI J
}
ìì 
)
ìì 
;
ìì 
builderïï 
.
ïï 
Services
ïï 
.
ïï 
AddTransient
ïï 
<
ïï 0
"BulkQuizQuestionViewModelValidator
ïï @
>
ïï@ A
(
ïïA B
)
ïïB C
;
ïïC D
builderññ 
.
ññ 
Services
ññ 
.
ññ 
AddTransient
ññ 
<
ññ 5
'TopicFeedbackResponseViewModelValidator
ññ E
>
ññE F
(
ññF G
)
ññG H
;
ññH I
builderóó 
.
óó 
Services
óó 
.
óó 
AddTransient
óó 
<
óó 4
&QuizFeedbackResponseViewModelValidator
óó D
>
óóD E
(
óóE F
)
óóF G
;
óóG H
builderòò 
.
òò 
Services
òò 
.
òò 
AddMemoryCache
òò 
(
òò  
)
òò  !
;
òò! "
builderöö 
.
öö 
Services
öö 
.
öö 
AddControllers
öö 
(
öö  
)
öö  !
;
öö! "
builderùù 
.
ùù 
Services
ùù 
.
ùù %
AddEndpointsApiExplorer
ùù (
(
ùù( )
)
ùù) *
;
ùù* +
builderûû 
.
ûû 
Services
ûû 
.
ûû 
AddSwaggerGen
ûû 
(
ûû 
)
ûû  
;
ûû  !
builderüü 
.
üü 
Services
üü 
.
üü $
AddHttpContextAccessor
üü '
(
üü' (
)
üü( )
;
üü) *
var°° 
app
°° 
=
°° 	
builder
°°
 
.
°° 
Build
°° 
(
°° 
)
°° 
;
°° 
if§§ 
(
§§ 
app
§§ 
.
§§ 
Environment
§§ 
.
§§ 
IsDevelopment
§§ !
(
§§! "
)
§§" #
)
§§# $
{•• 
app
¶¶ 
.
¶¶ 

UseSwagger
¶¶ 
(
¶¶ 
)
¶¶ 
;
¶¶ 
app
ßß 
.
ßß 
UseSwaggerUI
ßß 
(
ßß 
)
ßß 
;
ßß 
}®® 
app©© 
.
©© 
UseMiddleware
©© 
<
©© .
 GlobalExceptionHandlerMiddleware
©© 2
>
©©2 3
(
©©3 4
)
©©4 5
;
©©5 6
app™™ 
.
™™ 
UseStaticFiles
™™ 
(
™™ 
new
´´ 
StaticFileOptions
´´ 
{
¨¨ 
FileProvider
≠≠ 
=
≠≠ 
new
≠≠ "
PhysicalFileProvider
≠≠ /
(
≠≠/ 0
Path
ÆÆ 
.
ÆÆ 
Combine
ÆÆ 
(
ÆÆ 
app
ÆÆ 
.
ÆÆ 
Environment
ÆÆ (
.
ÆÆ( )
WebRootPath
ÆÆ) 4
,
ÆÆ4 5
$str
ÆÆ6 M
)
ÆÆM N
)
ØØ 	
,
ØØ	 

RequestPath
∞∞ 
=
∞∞ 
$str
∞∞ 6
}
±± 
)≤≤ 
;
≤≤ 
app¥¥ 
.
¥¥ 
UseStaticFiles
¥¥ 
(
¥¥ 
new
µµ 
StaticFileOptions
µµ 
{
∂∂ 
FileProvider
∑∑ 
=
∑∑ 
new
∑∑ "
PhysicalFileProvider
∑∑ /
(
∑∑/ 0
Path
∏∏ 
.
∏∏ 
Combine
∏∏ 
(
∏∏ 
app
∏∏ 
.
∏∏ 
Environment
∏∏ (
.
∏∏( )
WebRootPath
∏∏) 4
,
∏∏4 5
$str
∏∏6 L
)
∏∏L M
)
ππ 	
,
ππ	 

RequestPath
∫∫ 
=
∫∫ 
$str
∫∫ 5
}
ªª 
)ºº 
;
ºº 
appææ 
.
ææ 
UseStaticFiles
ææ 
(
ææ 
new
øø 
StaticFileOptions
øø 
{
¿¿ 
FileProvider
¡¡ 
=
¡¡ 
new
¡¡ "
PhysicalFileProvider
¡¡ /
(
¡¡/ 0
Path
¬¬ 
.
¬¬ 
Combine
¬¬ 
(
¬¬ 
app
¬¬ 
.
¬¬ 
Environment
¬¬ (
.
¬¬( )
WebRootPath
¬¬) 4
,
¬¬4 5
$str
¬¬6 F
)
¬¬F G
)
√√ 	
,
√√	 

RequestPath
ƒƒ 
=
ƒƒ 
$str
ƒƒ /
}
≈≈ 
)∆∆ 
;
∆∆ 
app«« 
.
«« 
UseCors
«« 
(
«« 
$str
«« %
)
««% &
;
««& '
app»» 
.
»» !
UseHttpsRedirection
»» 
(
»» 
)
»» 
;
»» 
app   
.
   
UseAuthorization
   
(
   
)
   
;
   
appÀÀ 
.
ÀÀ 
MapControllers
ÀÀ 
(
ÀÀ 
)
ÀÀ 
;
ÀÀ 
appÕÕ 
.
ÕÕ 
Run
ÕÕ 
(
ÕÕ 
)
ÕÕ 	
;
ÕÕ	 
