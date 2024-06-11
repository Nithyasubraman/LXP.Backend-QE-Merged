ô
5D:\backend\LXP.Core\IServices\IBulkQuestionService.cs
	namespace 	
LXP
 
. 
Core 
. 
	IServices 
{ 
public 

	interface  
IBulkQuestionService )
{ 
Task 
< 
object 
> 
ImportQuizDataAsync (
(( )
	IFormFile) 2
file3 7
,7 8
Guid9 =
quizId> D
)D E
;E F
}		 
}

 ∏
2D:\backend\LXP.Core\IServices\ICategoryServices.cs
	namespace		 	
LXP		
 
.		 
Core		 
.		 
	IServices		 
{

 
public 

	interface 
ICategoryServices &
{ 
Task 
< 
bool 
> 
AddCategory 
( #
CourseCategoryViewModel 6
category7 ?
)? @
;@ A
Task 
< 
List 
< '
CourseCategoryListViewModel -
>- .
>. /
GetAllCategory0 >
(> ?
)? @
;@ A
} 
} ‚
5D:\backend\LXP.Core\IServices\ICourseLevelServices.cs
	namespace		 	
LXP		
 
.		 
Core		 
.		 
	IServices		 
{

 
public 

	interface  
ICourseLevelServices )
{ 
Task 
< 
List 
< $
CourseLevelListViewModel *
>* +
>+ ,
GetAllCourseLevel- >
(> ?
string? E
	CreatedByF O
)O P
;P Q
Task 
AddCourseLevel 
( 
string "
Level# (
,( )
string* 0
	CreatedBy1 :
): ;
;; <
} 
} ÿ
0D:\backend\LXP.Core\IServices\ICourseServices.cs
	namespace		 	
LXP		
 
.		 
Core		 
.		 
	IServices		 
{

 
public 

	interface 
ICourseServices $
{ 
Course 
GetCourseByCourseId "
(" #
string# )
courseId* 2
)2 3
;3 4
bool 
	AddCourse 
( 
CourseViewModel &
course' -
)- .
;. /
IEnumerable 
< 
CourseListViewModel '
>' (
GetAllCourseDetails) <
(< =
)= >
;> ?
} 
} Ò
5D:\backend\LXP.Core\IServices\ICourseTopicServices.cs
	namespace		 	
LXP		
 
.		 
Core		 
.		 
	IServices		 
{

 
public 

	interface  
ICourseTopicServices )
{ 
object 
GetTopicDetails 
( 
string %
courseId& .
). /
;/ 0
Task 
< 
bool 
> 
AddCourseTopic !
(! " 
CourseTopicViewModel" 6
topic7 <
)< =
;= >
} 
} ™

2D:\backend\LXP.Core\IServices\IDashboardService.cs
	namespace 	
LXP
 
. 
Core 
. 
	IServices 
{ 
public 

	interface 
IDashboardService &
{ 
IEnumerable 
< %
DashboardLearnerViewModel -
>- .#
GetDashboardLearnerList/ F
(F G
)G H
;H I
IEnumerable 
< $
DashboardCourseViewModel ,
>, -#
GetDashboardCoursesList. E
(E F
)F G
;G H
IEnumerable		 
<		 (
DashboardEnrollmentViewModel		 0
>		0 1&
GetDashboardEnrollmentList		2 L
(		L M
)		M N
;		N O
public

 
Array

 "
GetMonthEnrollmentList

 +
(

+ ,
)

, -
;

- .
public 
Array  
GetCourseCreatedList )
() *
)* +
;+ ,
public 
string !
GetMostEnrolledCourse +
(+ ,
), -
;- .
public #
AdminDashboardViewModel &$
GetAdminDashboardDetails' ?
(? @
)@ A
;A B
} 
} √
.D:\backend\LXP.Core\IServices\IEmailService.cs
	namespace 	
LXP
 
. 
Core 
. 
	IServices 
{ 
public		 

	interface		 
IEmailService		 "
{

 
Task 
< 
bool 
> 
SendEmailAsync !
(! "
string" (
recipientEmail) 7
,7 8
string9 ?
subject@ G
,G H
stringI O
bodyP T
)T U
;U V
} 
} ˘
3D:\backend\LXP.Core\IServices\IEnrollmentService.cs
	namespace		 	
LXP		
 
.		 
Core		 
.		 
	IServices		 
{

 
public 

	interface 
IEnrollmentService '
{ 
Task 
< 
bool 
> 
	Addenroll 
( 
EnrollmentViewModel 0

enrollment1 ;
); <
;< =
object )
GetCourseandTopicsByLearnerId ,
(, -
Guid- 1
	learnerId2 ;
); <
;< =
} 
} ¥
4D:\backend\LXP.Core\IServices\IExcelToJsonService.cs
	namespace 	
LXP
 
. 
Core 
. 
	IServices 
{ 
public 
	interface 
IExcelToJsonService $
{ 
Task 
< 	
List	 
< %
QuizQuestionJsonViewModel '
>' (
>( )#
ConvertExcelToJsonAsync* A
(A B
	IFormFileB K
fileL P
)P Q
;Q R
Task		 
SaveQuizDataAsync			 
(		 
List		 
<		  %
QuizQuestionJsonViewModel		  9
>		9 :
quizData		; C
,		C D
Guid		E I
quizId		J P
)		P Q
;		Q R
List

 
<

 	%
QuizQuestionJsonViewModel

	 "
>

" #
ValidateQuizData

$ 4
(

4 5
List

5 9
<

9 :%
QuizQuestionJsonViewModel

: S
>

S T
quizData

U ]
)

] ^
;

^ _
} 
} Ÿ
9D:\backend\LXP.Core\IServices\IFeedbackResponseService.cs
	namespace 	
LXP
 
. 
Services 
. 
	IServices  
{ 
public 

	interface $
IFeedbackResponseService -
{ 
void "
SubmitFeedbackResponse #
(# $)
QuizFeedbackResponseViewModel$ A
feedbackResponseB R
)R S
;S T
void		 "
SubmitFeedbackResponse		 #
(		# $*
TopicFeedbackResponseViewModel		$ B
feedbackResponse		C S
)		S T
;		T U
void

 #
SubmitFeedbackResponses

 $
(

$ %
IEnumerable

% 0
<

0 1)
QuizFeedbackResponseViewModel

1 N
>

N O
feedbackResponses

P a
)

a b
;

b c
void #
SubmitFeedbackResponses $
($ %
IEnumerable% 0
<0 1*
TopicFeedbackResponseViewModel1 O
>O P
feedbackResponsesQ b
)b c
;c d
} 
} ü
/D:\backend\LXP.Core\IServices\IForgetService.cs
	namespace 	
LXP
 
. 
Core 
. 
	IServices 
{ 
public 

	interface 
IForgetService #
{ 
bool 
ForgetPassword 
( 
string "
Email# (
)( )
;) *
} 
} ¿
0D:\backend\LXP.Core\IServices\ILearnerService.cs
	namespace		 	
LXP		
 
.		 
Core		 
.		 
	IServices		 
{

 
public 

	interface 
ILearnerService $
{ 
Task 
< 
bool 
> 
LearnerRegistration &
(& '!
RegisterUserViewModel' <!
registerUserViewModel= R
)R S
;S T
Task 
< 
List 
< 
GetLearnerViewModel %
>% &
>& '
GetAllLearner( 5
(5 6
)6 7
;7 8
Learner 
GetLearnerById 
( 
string %
id& (
)( )
;) *
} 
} Ü
1D:\backend\LXP.Core\IServices\ILearnerServices.cs
	namespace 	
LXP
 
. 
Core 
. 
	IServices 
{ 
public 

	interface 
ILearnerServices %
{ 
public 
IEnumerable 
<  
AllLearnersViewModel /
>/ 0
GetLearners1 <
(< =
)= >
;> ?
object +
GetAllLearnerDetailsByLearnerId .
(. /
Guid/ 3
	learnerid4 =
)= >
;> ?
object

 /
#GetLearnerEnrolledcourseByLearnerId

 2
(

2 3
Guid

3 7
	learnerid

8 A
)

A B
;

B C
} 
} Ì
.D:\backend\LXP.Core\IServices\ILoginService.cs
	namespace 	
LXP
 
. 
Core 
. 
	IServices 
{ 
public 

	interface 
ILoginService "
{ 
public 
Task 
< 
	LoginRole 
> 
LoginLearner +
(+ ,

LoginModel, 6

loginmodel7 A
)A B
;B C
} 
} œ
2D:\backend\LXP.Core\IServices\IMaterialServices.cs
	namespace

 	
LXP


 
.

 
Core

 
.

 
	IServices

 
{ 
public 

	interface 
IMaterialServices &
{ 
Task 
< 
List 
< !
MaterialListViewModel '
>' (
>( )/
#GetAllMaterialDetailsByTopicAndType* M
(M N
stringN T
topicIdU \
,\ ]
string^ d
materialTypeIde s
)s t
;t u
Task 
< !
MaterialListViewModel "
>" #
AddMaterial$ /
(/ 0
MaterialViewModel0 A
materialB J
)J K
;K L
Task 
< !
MaterialListViewModel "
>" #-
!GetMaterialByMaterialNameAndTopic$ E
(E F
stringF L
materialNameM Y
,Y Z
string[ a
topicIdb i
)i j
;j k
} 
} À
6D:\backend\LXP.Core\IServices\IMaterialTypeServices.cs
	namespace		 	
LXP		
 
.		 
Core		 
.		 
	IServices		 
{

 
public 

	interface !
IMaterialTypeServices *
{ 
List 
< !
MaterialTypeViewModel "
>" #
GetAllMaterialType$ 6
(6 7
)7 8
;8 9
} 
} ›
8D:\backend\LXP.Core\IServices\IPasswordHistoryService.cs
	namespace 	
LXP
 
. 
Core 
. 
	IServices 
{ 
public		 

	interface		 #
IPasswordHistoryService		 ,
{

 
Task 
< 
bool 
> 
UpdatePassword !
(! "
string" (
	learnerId) 2
,2 3
string4 :
oldPassword; F
,F G
stringH N
newPasswordO Z
)Z [
;[ \
} 
} ê
0D:\backend\LXP.Core\IServices\IProfileService.cs
	namespace 	
LXP
 
. 
Core 
. 
	IServices 
{ 
public 

	interface 
IProfileService $
{ 
Task!! 
<!! 
List!! 
<!! 
GetProfileViewModel!! %
>!!% &
>!!& ' 
GetAllLearnerProfile!!( <
(!!< =
)!!= >
;!!> ?
LearnerProfile"" !
GetLearnerProfileById"" ,
("", -
string""- 3
id""4 6
)""6 7
;""7 8
Task$$ 
UpdateProfile$$ 
($$ "
UpdateProfileViewModel$$ 1
model$$2 7
)$$7 8
;$$8 9
}%% 
}&& ⁄
3D:\backend\LXP.Core\IServices\IQuizEngineService.cs
	namespace 	
LXP
 
. 
Core 
. 
	IServices 
{ 
public 

	interface 
IQuizEngineService '
{ 
Task 
< $
ViewQuizDetailsViewModel %
>% &
GetQuizByIdAsync' 7
(7 8
Guid8 <
quizId= C
)C D
;D E
Task		 
<		 
IEnumerable		 
<		 '
QuizEngineQuestionViewModel		 4
>		4 5
>		5 6$
GetQuestionsForQuizAsync		7 O
(		O P
Guid		P T
quizId		U [
)		[ \
;		\ ]
Task

 
<

 
Guid

 
>

 !
StartQuizAttemptAsync

 (
(

( )
Guid

) -
	learnerId

. 7
,

7 8
Guid

9 =
quizId

> D
)

D E
;

E F
Task 
SubmitAnswerAsync 
( !
AnswerSubmissionModel 4!
answerSubmissionModel5 J
)J K
;K L
Task 
< 
Guid 
> 
RetakeQuizAsync "
(" #
Guid# '
	learnerId( 1
,1 2
Guid3 7
quizId8 >
)> ?
;? @
Task 
< $
ViewQuizDetailsViewModel %
>% &(
GetQuizDetailsByTopicIdAsync' C
(C D
GuidD H
topicIdI P
)P Q
;Q R
Task "
SubmitQuizAttemptAsync #
(# $
Guid$ (
	attemptId) 2
)2 3
;3 4
Task 
< '
LearnerQuizAttemptViewModel (
>( )&
GetLearnerQuizAttemptAsync* D
(D E
GuidE I
	attemptIdJ S
)S T
;T U
Task 
< -
!LearnerQuizAttemptResultViewModel .
>. /,
 GetLearnerQuizAttemptResultAsync0 P
(P Q
GuidQ U
	attemptIdV _
)_ `
;` a
Task "
SubmitAnswerBatchAsync #
(# $&
AnswerSubmissionBatchModel$ >
model? D
)D E
;E F
Task 
CacheAnswersAsync 
( '
CachedAnswerSubmissionModel 9
model: ?
)? @
;@ A
Task $
SubmitCachedAnswersAsync $
($ %
Guid% )
learnerAttemptId* :
): ;
;; <
} 
} ÿ
5D:\backend\LXP.Core\IServices\IQuizFeedbackService.cs
	namespace 	
LXP
 
. 
Core 
. 
	IServices 
{ 
public 

	interface  
IQuizFeedbackService )
{ 
Guid		 
AddFeedbackQuestion		  
(		  !)
QuizfeedbackquestionViewModel		! >#
quizfeedbackquestionDto		? V
,		V W
List		X \
<		\ ]1
$QuizFeedbackQuestionsOptionViewModel			] Å
>
		Å Ç
options
		É ä
)
		ä ã
;
		ã å
List 
< +
QuizfeedbackquestionNoViewModel ,
>, -#
GetAllFeedbackQuestions. E
(E F
)F G
;G H+
QuizfeedbackquestionNoViewModel '#
GetFeedbackQuestionById( ?
(? @
Guid@ D"
QuizFeedbackQuestionIdE [
)[ \
;\ ]
bool "
UpdateFeedbackQuestion #
(# $
Guid$ ("
quizFeedbackQuestionId) ?
,? @)
QuizfeedbackquestionViewModelA ^#
quizfeedbackquestionDto_ v
,v w
Listx |
<| }1
$QuizFeedbackQuestionsOptionViewModel	} °
>
° ¢
options
£ ™
)
™ ´
;
´ ¨
bool "
DeleteFeedbackQuestion #
(# $
Guid$ ("
quizFeedbackQuestionId) ?
)? @
;@ A
List 
< +
QuizfeedbackquestionNoViewModel ,
>, -(
GetFeedbackQuestionsByQuizId. J
(J K
GuidK O
quizIdP V
)V W
;W X
bool +
DeleteFeedbackQuestionsByQuizId ,
(, -
Guid- 1
quizId2 8
)8 9
;9 :
} 
} ‚
5D:\backend\LXP.Core\IServices\IQuizQuestionService.cs
	namespace 	
LXP
 
. 
Core 
. 
	IServices 
{ 
public		 

	interface		  
IQuizQuestionService		 )
{

 
Task 
< 
Guid 
> 
AddQuestionAsync #
(# $!
QuizQuestionViewModel$ 9
quizQuestionDto: I
,I J
ListK O
<O P#
QuestionOptionViewModelP g
>g h
optionsi p
)p q
;q r
Task 
< 
bool 
> 
UpdateQuestionAsync &
(& '
Guid' +
quizQuestionId, :
,: ;!
QuizQuestionViewModel< Q
quizQuestionDtoR a
,a b
Listc g
<g h#
QuestionOptionViewModelh 
>	 Ä
options
Å à
)
à â
;
â ä
Task 
< 
bool 
> 
DeleteQuestionAsync &
(& '
Guid' +
quizQuestionId, :
): ;
;; <
Task 
< 
List 
< #
QuizQuestionNoViewModel )
>) *
>* +(
GetAllQuestionsByQuizIdAsync, H
(H I
GuidI M
quizIdN T
)T U
;U V
Task 
< 
List 
< #
QuizQuestionNoViewModel )
>) *
>* + 
GetAllQuestionsAsync, @
(@ A
)A B
;B C
Task 
< #
QuizQuestionNoViewModel $
>$ % 
GetQuestionByIdAsync& :
(: ;
Guid; ?
quizQuestionId@ N
)N O
;O P
} 
} »
4D:\backend\LXP.Core\IServices\IQuizReportServices.cs
	namespace 	
LXP
 
. 
Core 
. 
	IServices 
{		 
public

 

	interface

 
IQuizReportServices

 (
{ 
IEnumerable 
< 
QuizReportViewModel '
>' (
GetQuizReports) 7
(7 8
)8 9
;9 :
} 
} ä	
-D:\backend\LXP.Core\IServices\IQuizService.cs
	namespace 	
LXP
 
. 
Core 
. 
	IServices 
{ 
public 

	interface 
IQuizService !
{ 
QuizViewModel 
GetQuizById !
(! "
Guid" &
quizId' -
)- .
;. /
IEnumerable 
< 
QuizViewModel !
>! "
GetAllQuizzes# 0
(0 1
)1 2
;2 3
void		 

CreateQuiz		 
(		 
QuizViewModel		 %
quiz		& *
,		* +
Guid		, 0
topicId		1 8
)		8 9
;		9 :
void

 

UpdateQuiz

 
(

 
QuizViewModel

 %
quiz

& *
)

* +
;

+ ,
void 

DeleteQuiz 
( 
Guid 
quizId #
)# $
;$ %
Guid 
? 
GetQuizIdByTopicId  
(  !
Guid! %
topicId& -
)- .
;. /
} 
} È
*D:\backend\LXP.Core\IServices\IServices.cs
	namespace 	
LXP
 
. 
Core 
. 
	IServices 
{ 
public 

	interface 
IService 
{ 
public 
Task 
< 
	LoginRole 
> 
CheckLearner +
(+ ,

LoginModel, 6

loginmodel7 A
)A B
;B C
Task

 
<

 
bool

 
>

 
ForgetPassword

 !
(

! "
string

" (
Email

) .
)

. /
;

/ 0
Task 
<  
ResultUpdatePassword !
>! "
UpdatePassword# 1
(1 2
UpdatePassword2 @
updatePasswordA O
)O P
;P Q
} 
} ‰
6D:\backend\LXP.Core\IServices\ITopicFeedbackService.cs
	namespace 	
LXP
 
. 
Core 
. 
	IServices 
{ 
public 

	interface !
ITopicFeedbackService *
{ 
Guid		 
AddFeedbackQuestion		  
(		  !*
TopicFeedbackQuestionViewModel		! ?!
topicFeedbackQuestion		@ U
,		U V
List		W [
<		[ \2
%TopicFeedbackQuestionsOptionViewModel			\ Å
>
		Å Ç
options
		É ä
)
		ä ã
;
		ã å
List

 
<

 ,
 TopicFeedbackQuestionNoViewModel

 -
>

- .#
GetAllFeedbackQuestions

/ F
(

F G
)

G H
;

H I,
 TopicFeedbackQuestionNoViewModel (#
GetFeedbackQuestionById) @
(@ A
GuidA E#
topicFeedbackQuestionIdF ]
)] ^
;^ _
bool "
UpdateFeedbackQuestion #
(# $
Guid$ (#
topicFeedbackQuestionId) @
,@ A*
TopicFeedbackQuestionViewModelB `!
topicFeedbackQuestiona v
,v w
Listx |
<| }2
%TopicFeedbackQuestionsOptionViewModel	} ¢
>
¢ £
options
§ ´
)
´ ¨
;
¨ ≠
bool "
DeleteFeedbackQuestion #
(# $
Guid$ (#
topicFeedbackQuestionId) @
)@ A
;A B
List 
< ,
 TopicFeedbackQuestionNoViewModel -
>- .)
GetFeedbackQuestionsByTopicId/ L
(L M
GuidM Q
topicIdR Y
)Y Z
;Z [
bool ,
 DeleteFeedbackQuestionsByTopicId -
(- .
Guid. 2
topicId3 :
): ;
;; <
} 
} Ä
7D:\backend\LXP.Core\IServices\IUpdatePasswordService.cs
	namespace 	
LXP
 
. 
Core 
. 
	IServices 
{ 
public 

	interface "
IUpdatePasswordService +
{ 
Task 
<  
ResultUpdatePassword !
>! "
UpdatePassword# 1
(1 2
UpdatePassword2 @
updatePasswordA O
)O P
;P Q
} 
}		 «
4D:\backend\LXP.Core\IServices\IUserReportServices.cs
	namespace 	
LXP
 
. 
Core 
. 
	IServices 
{		 
public

 

	interface

 
IUserReportServices

 (
{ 
IEnumerable 
< 
UserReportViewModel '
>' (
GetUserReport) 6
(6 7
)7 8
;8 9
} 
} œ∫
3D:\backend\LXP.Core\Services\BulkQuestionService.cs
	namespace 	
LXP
 
. 
Core 
. 
Services 
{ 
public 

class 
BulkQuestionService $
:% & 
IBulkQuestionService' ;
{ 
private 
readonly #
IBulkQuestionRepository 0#
_bulkQuestionRepository1 H
;H I
private 
readonly #
IQuizQuestionRepository 0#
_quizQuestionRepository1 H
;H I
private 
readonly 
IQuizRepository (
_quizRepository) 8
;8 9
private 
readonly .
"BulkQuizQuestionViewModelValidator ;

_validator< F
;F G
public 
BulkQuestionService "
(" ##
IBulkQuestionRepository# :"
bulkQuestionRepository; Q
,Q R#
IQuizQuestionRepository# :"
quizQuestionRepository; Q
,Q R
IQuizRepository# 2
quizRepository3 A
,A B.
"BulkQuizQuestionViewModelValidator# E
	validatorF O
)O P
{ 	#
_bulkQuestionRepository #
=$ %"
bulkQuestionRepository& <
;< =#
_quizQuestionRepository #
=$ %"
quizQuestionRepository& <
;< =
_quizRepository 
= 
quizRepository ,
;, -

_validator 
= 
	validator "
;" #
} 	
public   
async   
Task   
<   
object    
>    !
ImportQuizDataAsync  " 5
(  5 6
	IFormFile  6 ?
file  @ D
,  D E
Guid  F J
quizId  K Q
)  Q R
{!! 	
if"" 
("" 
file"" 
=="" 
null"" 
||"" 
file""  $
.""$ %
Length""% +
<="", .
$num""/ 0
)""0 1
throw## 
new## 
ArgumentException## +
(##+ ,
$str##, <
)##< =
;##= >
using%% 
(%% 
var%% 
stream%% 
=%% 
new%%  #
MemoryStream%%$ 0
(%%0 1
)%%1 2
)%%2 3
{&& 
await'' 
file'' 
.'' 
CopyToAsync'' &
(''& '
stream''' -
)''- .
;''. /
stream(( 
.(( 
Position(( 
=((  !
$num((" #
;((# $
try** 
{++ 
using,, 
(,, 
ExcelPackage,, '
package,,( /
=,,0 1
new,,2 5
ExcelPackage,,6 B
(,,B C
stream,,C I
),,I J
),,J K
{-- 
ExcelWorksheet.. &
	worksheet..' 0
=..1 2
package..3 :
...: ;
Workbook..; C
...C D

Worksheets..D N
...N O
FirstOrDefault..O ]
(..] ^
)..^ _
;.._ `
if// 
(// 
	worksheet// %
==//& (
null//) -
)//- .
throw00 !
new00" %
ArgumentException00& 7
(007 8
$str008 N
)00N O
;00O P
List22 
<22 %
BulkQuizQuestionViewModel22 6
>226 7
quizQuestions228 E
=22F G
new22H K
List22L P
<22P Q%
BulkQuizQuestionViewModel22Q j
>22j k
(22k l
)22l m
;22m n
for55 
(55 
int55  
row55! $
=55% &
$num55' (
;55( )
row55* -
<=55. 0
	worksheet551 :
.55: ;
	Dimension55; D
.55D E
End55E H
.55H I
Row55I L
;55L M
row55N Q
++55Q S
)55S T
{66 
string77 "
type77# '
=77( )
	worksheet77* 3
.773 4
Cells774 9
[779 :
row77: =
,77= >
$num77? @
]77@ A
.77A B
Value77B G
?77G H
.77H I
ToString77I Q
(77Q R
)77R S
;77S T
if88 
(88  
string88  &
.88& '
IsNullOrEmpty88' 4
(884 5
type885 9
)889 :
||88; =
!88> ? 
ValidateQuestionType88? S
(88S T
type88T X
)88X Y
)88Y Z
continue99  (
;99( )
string;; "
question;;# +
=;;, -
	worksheet;;. 7
.;;7 8
Cells;;8 =
[;;= >
row;;> A
,;;A B
$num;;C D
];;D E
.;;E F
Value;;F K
?;;K L
.;;L M
ToString;;M U
(;;U V
);;V W
;;;W X
if<< 
(<<  
string<<  &
.<<& '
IsNullOrEmpty<<' 4
(<<4 5
question<<5 =
)<<= >
)<<> ?
continue==  (
;==( )%
BulkQuizQuestionViewModel?? 5
quizQuestion??6 B
=??C D
new??E H%
BulkQuizQuestionViewModel??I b
{@@ 
QuestionTypeAA  ,
=AA- .
typeAA/ 3
,AA3 4
QuestionBB  (
=BB) *
questionBB+ 3
,BB3 4
}CC 
;CC 
ifFF 
(FF  
typeFF  $
==FF% '
$strFF( -
)FF- .
{GG 
quizQuestionHH  ,
.HH, -
OptionsHH- 4
=HH5 6
ExtractOptionsHH7 E
(HHE F
	worksheetHHF O
,HHO P
rowHHQ T
,HHT U
$numHHV W
,HHW X
$numHHY Z
)HHZ [
;HH[ \
quizQuestionII  ,
.II, -
CorrectOptionsII- ;
=II< =
ExtractOptionsII> L
(IIL M
	worksheetIIM V
,IIV W
rowIIX [
,II[ \
$numII] _
,II_ `
$numIIa b
)IIb c
;IIc d
ifKK  "
(KK# $
!KK$ %
ValidateMCQOptionsKK% 7
(KK7 8
quizQuestionKK8 D
)KKD E
)KKE F
continueLL$ ,
;LL, -
}MM 
elseNN  
ifNN! #
(NN$ %
typeNN% )
==NN* ,
$strNN- 2
)NN2 3
{OO 
quizQuestionPP  ,
.PP, -
OptionsPP- 4
=PP5 6
ExtractOptionsPP7 E
(PPE F
	worksheetPPF O
,PPO P
rowPPQ T
,PPT U
$numPPV W
,PPW X
$numPPY Z
)PPZ [
;PP[ \
quizQuestionQQ  ,
.QQ, -
CorrectOptionsQQ- ;
=QQ< =
ExtractOptionsQQ> L
(QQL M
	worksheetQQM V
,QQV W
rowQQX [
,QQ[ \
$numQQ] _
,QQ_ `
$numQQa b
)QQb c
;QQc d
ifSS  "
(SS# $
!SS$ %
ValidateTFOptionsSS% 6
(SS6 7
quizQuestionSS7 C
)SSC D
)SSD E
continueTT$ ,
;TT, -
}UU 
elseVV  
ifVV! #
(VV$ %
typeVV% )
==VV* ,
$strVV- 2
)VV2 3
{WW 
intXX  #
optionCountXX$ /
=XX0 1
GetMSQOptionCountXX2 C
(XXC D
	worksheetXXD M
,XXM N
rowXXO R
)XXR S
;XXS T
ifYY  "
(YY# $
optionCountYY$ /
<YY0 1
$numYY2 3
||YY4 6
optionCountYY7 B
>YYC D
$numYYE G
)YYG H
continueZZ$ ,
;ZZ, -
quizQuestion\\  ,
.\\, -
Options\\- 4
=\\5 6
ExtractOptions\\7 E
(\\E F
	worksheet\\F O
,\\O P
row\\Q T
,\\T U
$num\\V W
,\\W X
optionCount\\Y d
)\\d e
;\\e f
quizQuestion]]  ,
.]], -
CorrectOptions]]- ;
=]]< =
ExtractOptions]]> L
(]]L M
	worksheet]]M V
,]]V W
row]]X [
,]][ \
$num]]] _
,]]_ `$
GetMSQCorrectOptionCount]]a y
(]]y z
optionCount	]]z Ö
)
]]Ö Ü
)
]]Ü á
;
]]á à
if__  "
(__# $
!__$ %
ValidateMSQOptions__% 7
(__7 8
quizQuestion__8 D
)__D E
)__E F
continue``$ ,
;``, -
}aa 
quizQuestionscc )
.cc) *
Addcc* -
(cc- .
quizQuestioncc. :
)cc: ;
;cc; <
}dd 
foreachgg 
(gg  !
vargg! $
quizQuestiongg% 1
ingg2 4
quizQuestionsgg5 B
)ggB C
{hh 
varjj 
validationResultjj  0
=jj1 2

_validatorjj3 =
.jj= >
Validatejj> F
(jjF G
quizQuestionjjG S
)jjS T
;jjT U
ifkk 
(kk  
!kk  !
validationResultkk! 1
.kk1 2
IsValidkk2 9
)kk9 :
throwll  %
newll& )
ArgumentExceptionll* ;
(ll; <
stringll< B
.llB C
JoinllC G
(llG H
$strllH K
,llK L
validationResultllM ]
.ll] ^
Errorsll^ d
.lld e
Selectlle k
(llk l
elll m
=>lln p
ellq r
.llr s
ErrorMessagells 
)	ll Ä
)
llÄ Å
)
llÅ Ç
;
llÇ É
usingoo !
(oo" #
varoo# &
transactionoo' 2
=oo3 4
newoo5 8
TransactionScopeoo9 I
(ooI J+
TransactionScopeAsyncFlowOptionooJ i
.ooi j
Enabledooj q
)ooq r
)oor s
{pp 
intrr  #
nextQuestionNorr$ 2
=rr3 4
awaitrr5 :#
_quizQuestionRepositoryrr; R
.rrR S"
GetNextQuestionNoAsyncrrS i
(rri j
quizIdrrj p
)rrp q
;rrq r
QuizQuestionuu  ,
questionEntityuu- ;
=uu< =
newuu> A
QuizQuestionuuB N
{vv  !
QuizIdww$ *
=ww+ ,
quizIdww- 3
,ww3 4

QuestionNoxx$ .
=xx/ 0
nextQuestionNoxx1 ?
,xx? @
QuestionTypeyy$ 0
=yy1 2
quizQuestionyy3 ?
.yy? @
QuestionTypeyy@ L
,yyL M
Questionzz$ ,
=zz- .
quizQuestionzz/ ;
.zz; <
Questionzz< D
,zzD E
	CreatedBy{{$ -
={{. /
$str{{0 7
,{{7 8
	CreatedAt||$ -
=||. /
DateTime||0 8
.||8 9
Now||9 <
}}}  !
;}}! "
await
ÄÄ  %%
_bulkQuestionRepository
ÄÄ& =
.
ÄÄ= >
AddQuestionsAsync
ÄÄ> O
(
ÄÄO P
new
ÄÄP S
List
ÄÄT X
<
ÄÄX Y
QuizQuestion
ÄÄY e
>
ÄÄe f
{
ÄÄg h
questionEntity
ÄÄi w
}
ÄÄx y
)
ÄÄy z
;
ÄÄz {
List
ÉÉ  $
<
ÉÉ$ %
QuestionOption
ÉÉ% 3
>
ÉÉ3 4
optionEntities
ÉÉ5 C
=
ÉÉD E
new
ÉÉF I
List
ÉÉJ N
<
ÉÉN O
QuestionOption
ÉÉO ]
>
ÉÉ] ^
(
ÉÉ^ _
)
ÉÉ_ `
;
ÉÉ` a
for
ÑÑ  #
(
ÑÑ$ %
int
ÑÑ% (
i
ÑÑ) *
=
ÑÑ+ ,
$num
ÑÑ- .
;
ÑÑ. /
i
ÑÑ0 1
<
ÑÑ2 3
quizQuestion
ÑÑ4 @
.
ÑÑ@ A
Options
ÑÑA H
.
ÑÑH I
Length
ÑÑI O
;
ÑÑO P
i
ÑÑQ R
++
ÑÑR T
)
ÑÑT U
{
ÖÖ  !
if
ÜÜ$ &
(
ÜÜ' (
!
ÜÜ( )
string
ÜÜ) /
.
ÜÜ/ 0
IsNullOrEmpty
ÜÜ0 =
(
ÜÜ= >
quizQuestion
ÜÜ> J
.
ÜÜJ K
Options
ÜÜK R
[
ÜÜR S
i
ÜÜS T
]
ÜÜT U
)
ÜÜU V
)
ÜÜV W
{
áá$ %
QuestionOption
àà( 6
optionEntity
àà7 C
=
ààD E
new
ààF I
QuestionOption
ààJ X
{
ââ( )
QuizQuestionId
ää, :
=
ää; <
questionEntity
ää= K
.
ääK L
QuizQuestionId
ääL Z
,
ääZ [
Option
ãã, 2
=
ãã3 4
quizQuestion
ãã5 A
.
ããA B
Options
ããB I
[
ããI J
i
ããJ K
]
ããK L
,
ããL M
	IsCorrect
åå, 5
=
åå6 7
quizQuestion
åå8 D
.
ååD E
CorrectOptions
ååE S
.
ååS T
Contains
ååT \
(
åå\ ]
quizQuestion
åå] i
.
ååi j
Options
ååj q
[
ååq r
i
åår s
]
åås t
)
ååt u
,
ååu v
	CreatedAt
çç, 5
=
çç6 7
DateTime
çç8 @
.
çç@ A
Now
ççA D
,
ççD E
	CreatedBy
éé, 5
=
éé6 7
$str
éé8 ?
,
éé? @

ModifiedBy
èè, 6
=
èè7 8
$str
èè9 @
}
êê( )
;
êê) *
optionEntities
íí( 6
.
íí6 7
Add
íí7 :
(
íí: ;
optionEntity
íí; G
)
ííG H
;
ííH I
}
ìì$ %
}
îî  !
await
ññ  %%
_bulkQuestionRepository
ññ& =
.
ññ= >
AddOptionsAsync
ññ> M
(
ññM N
optionEntities
ññN \
,
ññ\ ]
questionEntity
ññ^ l
.
ññl m
QuizQuestionId
ññm {
)
ññ{ |
;
ññ| }
transaction
ôô  +
.
ôô+ ,
Complete
ôô, 4
(
ôô4 5
)
ôô5 6
;
ôô6 7
}
öö 
}
õõ 
return
úú 
quizQuestions
úú ,
;
úú, -
}
ùù 
}
ûû 
catch
üü 
(
üü 
DbException
üü "
dbEx
üü# '
)
üü' (
{
†† 
throw
¢¢ 
new
¢¢ 
ArgumentException
¢¢ /
(
¢¢/ 0
$str
¢¢0 d
,
¢¢d e
dbEx
¢¢f j
)
¢¢j k
;
¢¢k l
}
££ 
catch
§§ 
(
§§ 
	Exception
§§  
ex
§§! #
)
§§# $
{
•• 
throw
ßß 
new
ßß 
ArgumentException
ßß /
(
ßß/ 0
$strßß0 è
,ßßè ê
exßßë ì
)ßßì î
;ßßî ï
}
®® 
}
©© 
}
™™ 	
private
≠≠ 
bool
≠≠ "
ValidateQuestionType
≠≠ )
(
≠≠) *
string
≠≠* 0
questionType
≠≠1 =
)
≠≠= >
{
ÆÆ 	
return
ØØ 
questionType
ØØ 
==
ØØ  "
$str
ØØ# (
||
ØØ) +
questionType
ØØ, 8
==
ØØ9 ;
$str
ØØ< A
||
ØØB D
questionType
ØØE Q
==
ØØR T
$str
ØØU Z
;
ØØZ [
}
∞∞ 	
private
≥≥ 
bool
≥≥ 
ValidateTFOptions
≥≥ &
(
≥≥& ''
BulkQuizQuestionViewModel
≥≥' @
quizQuestion
≥≥A M
)
≥≥M N
{
¥¥ 	
return
µµ 
quizQuestion
µµ 
.
µµ  
Options
µµ  '
.
µµ' (
Length
µµ( .
==
µµ/ 1
$num
µµ2 3
&&
µµ4 6
!
∂∂ 
string
∂∂ 
.
∂∂ 
IsNullOrEmpty
∂∂ (
(
∂∂( )
quizQuestion
∂∂) 5
.
∂∂5 6
Options
∂∂6 =
[
∂∂= >
$num
∂∂> ?
]
∂∂? @
)
∂∂@ A
&&
∂∂B D
!
∑∑ 
string
∑∑ 
.
∑∑ 
IsNullOrEmpty
∑∑ (
(
∑∑( )
quizQuestion
∑∑) 5
.
∑∑5 6
Options
∑∑6 =
[
∑∑= >
$num
∑∑> ?
]
∑∑? @
)
∑∑@ A
&&
∑∑B D
!
∏∏ 
quizQuestion
∏∏  
.
∏∏  !
Options
∏∏! (
[
∏∏( )
$num
∏∏) *
]
∏∏* +
.
∏∏+ ,
Equals
∏∏, 2
(
∏∏2 3
quizQuestion
∏∏3 ?
.
∏∏? @
Options
∏∏@ G
[
∏∏G H
$num
∏∏H I
]
∏∏I J
,
∏∏J K
StringComparison
∏∏L \
.
∏∏\ ]
OrdinalIgnoreCase
∏∏] n
)
∏∏n o
&&
∏∏p r
(
ππ 
quizQuestion
ππ  
.
ππ  !
CorrectOptions
ππ! /
.
ππ/ 0
Length
ππ0 6
==
ππ7 9
$num
ππ: ;
&&
ππ< >
(
ππ? @
quizQuestion
ππ@ L
.
ππL M
CorrectOptions
ππM [
[
ππ[ \
$num
ππ\ ]
]
ππ] ^
.
ππ^ _
Equals
ππ_ e
(
ππe f
$str
ππf l
,
ππl m
StringComparison
ππn ~
.
ππ~  
OrdinalIgnoreCaseππ ê
)ππê ë
||ππí î
quizQuestionππï °
.ππ° ¢
CorrectOptionsππ¢ ∞
[ππ∞ ±
$numππ± ≤
]ππ≤ ≥
.ππ≥ ¥
Equalsππ¥ ∫
(ππ∫ ª
$strππª ¬
,ππ¬ √ 
StringComparisonππƒ ‘
.ππ‘ ’!
OrdinalIgnoreCaseππ’ Ê
)ππÊ Á
)ππÁ Ë
)ππË È
;ππÈ Í
}
∫∫ 	
private
ΩΩ 
bool
ΩΩ  
ValidateMCQOptions
ΩΩ '
(
ΩΩ' ('
BulkQuizQuestionViewModel
ΩΩ( A
quizQuestion
ΩΩB N
)
ΩΩN O
{
ææ 	
return
øø 
quizQuestion
øø 
.
øø  
Options
øø  '
.
øø' (
Length
øø( .
==
øø/ 1
$num
øø2 3
&&
øø4 6
quizQuestion
¿¿ 
.
¿¿  
Options
¿¿  '
.
¿¿' (
Distinct
¿¿( 0
(
¿¿0 1
)
¿¿1 2
.
¿¿2 3
Count
¿¿3 8
(
¿¿8 9
)
¿¿9 :
==
¿¿; =
$num
¿¿> ?
&&
¿¿@ B
quizQuestion
¡¡ 
.
¡¡  
CorrectOptions
¡¡  .
.
¡¡. /
Length
¡¡/ 5
==
¡¡6 8
$num
¡¡9 :
&&
¡¡; =
quizQuestion
¬¬ 
.
¬¬  
Options
¬¬  '
.
¬¬' (
Contains
¬¬( 0
(
¬¬0 1
quizQuestion
¬¬1 =
.
¬¬= >
CorrectOptions
¬¬> L
[
¬¬L M
$num
¬¬M N
]
¬¬N O
)
¬¬O P
;
¬¬P Q
}
√√ 	
private
∆∆ 
bool
∆∆  
ValidateMSQOptions
∆∆ '
(
∆∆' ('
BulkQuizQuestionViewModel
∆∆( A
quizQuestion
∆∆B N
)
∆∆N O
{
«« 	
int
»» 
optionCount
»» 
=
»» 
quizQuestion
»» *
.
»»* +
Options
»»+ 2
.
»»2 3
Length
»»3 9
;
»»9 :
int
……  
correctOptionCount
…… "
=
……# $
quizQuestion
……% 1
.
……1 2
CorrectOptions
……2 @
.
……@ A
Length
……A G
;
……G H
return
ÀÀ 
(
ÀÀ 
optionCount
ÀÀ 
>=
ÀÀ  "
$num
ÀÀ# $
&&
ÀÀ% '
optionCount
ÀÀ( 3
<=
ÀÀ4 6
$num
ÀÀ7 9
)
ÀÀ9 :
&&
ÀÀ; =
quizQuestion
ÃÃ 
.
ÃÃ  
Options
ÃÃ  '
.
ÃÃ' (
Distinct
ÃÃ( 0
(
ÃÃ0 1
)
ÃÃ1 2
.
ÃÃ2 3
Count
ÃÃ3 8
(
ÃÃ8 9
)
ÃÃ9 :
==
ÃÃ; =
optionCount
ÃÃ> I
&&
ÃÃJ L
(
ÕÕ  
correctOptionCount
ÕÕ &
>=
ÕÕ' )
$num
ÕÕ* +
&&
ÕÕ, . 
correctOptionCount
ÕÕ/ A
<=
ÕÕB D
$num
ÕÕE F
)
ÕÕF G
&&
ÕÕH J
quizQuestion
ŒŒ 
.
ŒŒ  
CorrectOptions
ŒŒ  .
.
ŒŒ. /
All
ŒŒ/ 2
(
ŒŒ2 3
opt
ŒŒ3 6
=>
ŒŒ7 9
quizQuestion
ŒŒ: F
.
ŒŒF G
Options
ŒŒG N
.
ŒŒN O
Contains
ŒŒO W
(
ŒŒW X
opt
ŒŒX [
)
ŒŒ[ \
)
ŒŒ\ ]
;
ŒŒ] ^
}
œœ 	
private
““ 
int
““ 
GetMSQOptionCount
““ %
(
““% &
ExcelWorksheet
““& 4
	worksheet
““5 >
,
““> ?
int
““@ C
row
““D G
)
““G H
{
”” 	
int
‘‘ 
count
‘‘ 
=
‘‘ 
$num
‘‘ 
;
‘‘ 
for
’’ 
(
’’ 
int
’’ 
i
’’ 
=
’’ 
$num
’’ 
;
’’ 
i
’’ 
<=
’’  
$num
’’! #
;
’’# $
i
’’% &
++
’’& (
)
’’( )
{
÷÷ 
if
◊◊ 
(
◊◊ 
!
◊◊ 
string
◊◊ 
.
◊◊ 
IsNullOrEmpty
◊◊ )
(
◊◊) *
	worksheet
◊◊* 3
.
◊◊3 4
Cells
◊◊4 9
[
◊◊9 :
row
◊◊: =
,
◊◊= >
i
◊◊? @
]
◊◊@ A
.
◊◊A B
Value
◊◊B G
?
◊◊G H
.
◊◊H I
ToString
◊◊I Q
(
◊◊Q R
)
◊◊R S
)
◊◊S T
)
◊◊T U
count
ÿÿ 
++
ÿÿ 
;
ÿÿ 
else
ŸŸ 
break
⁄⁄ 
;
⁄⁄ 
}
€€ 
return
‹‹ 
count
‹‹ 
;
‹‹ 
}
›› 	
private
‡‡ 
int
‡‡ &
GetMSQCorrectOptionCount
‡‡ ,
(
‡‡, -
int
‡‡- 0
optionCount
‡‡1 <
)
‡‡< =
{
·· 	
if
‚‚ 
(
‚‚ 
optionCount
‚‚ 
>=
‚‚ 
$num
‚‚  
&&
‚‚! #
optionCount
‚‚$ /
<=
‚‚0 2
$num
‚‚3 4
)
‚‚4 5
return
„„ 
$num
„„ 
;
„„ 
else
‰‰ 
if
‰‰ 
(
‰‰ 
optionCount
‰‰  
>=
‰‰! #
$num
‰‰$ %
&&
‰‰& (
optionCount
‰‰) 4
<=
‰‰5 7
$num
‰‰8 :
)
‰‰: ;
return
ÂÂ 
$num
ÂÂ 
;
ÂÂ 
else
ÊÊ 
return
ÁÁ 
$num
ÁÁ 
;
ÁÁ 
}
ËË 	
private
ÎÎ 
string
ÎÎ 
[
ÎÎ 
]
ÎÎ 
ExtractOptions
ÎÎ '
(
ÎÎ' (
ExcelWorksheet
ÎÎ( 6
	worksheet
ÎÎ7 @
,
ÎÎ@ A
int
ÎÎB E
row
ÎÎF I
,
ÎÎI J
int
ÎÎK N
startColumn
ÎÎO Z
,
ÎÎZ [
int
ÎÎ\ _
count
ÎÎ` e
)
ÎÎe f
{
ÏÏ 	
string
ÌÌ 
[
ÌÌ 
]
ÌÌ 
options
ÌÌ 
=
ÌÌ 
new
ÌÌ "
string
ÌÌ# )
[
ÌÌ) *
count
ÌÌ* /
]
ÌÌ/ 0
;
ÌÌ0 1
for
ÓÓ 
(
ÓÓ 
int
ÓÓ 
i
ÓÓ 
=
ÓÓ 
$num
ÓÓ 
;
ÓÓ 
i
ÓÓ 
<
ÓÓ 
count
ÓÓ  %
;
ÓÓ% &
i
ÓÓ' (
++
ÓÓ( *
)
ÓÓ* +
{
ÔÔ 
string
 
option
 
=
 
	worksheet
  )
.
) *
Cells
* /
[
/ 0
row
0 3
,
3 4
startColumn
5 @
+
A B
i
C D
]
D E
.
E F
Value
F K
?
K L
.
L M
ToString
M U
(
U V
)
V W
??
X Z
$str
[ ]
;
] ^
options
ÒÒ 
[
ÒÒ 
i
ÒÒ 
]
ÒÒ 
=
ÒÒ 
option
ÒÒ #
;
ÒÒ# $
}
ÚÚ 
return
ÛÛ 
options
ÛÛ 
;
ÛÛ 
}
ÙÙ 	
}
ˆˆ 
}¯¯  
0D:\backend\LXP.Core\Services\CategoryServices.cs
	namespace 	
LXP
 
. 
Core 
. 
Services 
{ 
public 

class 
CategoryServices !
:! "
ICategoryServices" 3
{ 
private 
readonly 
ICategoryRepository ,
_categoryRepository- @
;@ A
private 
Mapper 
_categoryMapper &
;& '
public 
CategoryServices 
(  
ICategoryRepository  3
categoryRepository4 F
)F G
{ 	
_categoryRepository 
=  !
categoryRepository" 4
;4 5
var 
_configCategory 
=  
new  #
MapperConfiguration$ 7
(7 8
cfg8 ;
=>; =
cfg= @
.@ A
	CreateMapA J
<J K
CourseCategoryK Y
,Y Z'
CourseCategoryListViewModelZ u
>u v
(v w
)w x
.x y

ReverseMap	y É
(
É Ñ
)
Ñ Ö
)
Ö Ü
;
Ü á
_categoryMapper 
= 
new !
Mapper" (
(( )
_configCategory) 8
)8 9
;9 :
} 	
public 
async 
Task 
< 
bool 
> 
AddCategory  +
(+ ,#
CourseCategoryViewModel, C
categoryD L
)L M
{ 	
bool 
isCategoryExists !
=" #
await$ )
_categoryRepository* =
.= >%
AnyCategoryByCategoryName> W
(W X
categoryX `
.` a
Categorya i
)i j
;j k
if 
( 
isCategoryExists 
)  
{   
return!! 
false!! 
;!! 
}## 
else$$ 
{%% 
CourseCategory&& 
courseCategory&& -
=&&. /
new&&0 3
CourseCategory&&4 B
(&&B C
)&&C D
{'' 

CategoryId(( 
=((  
Guid((! %
.((% &
NewGuid((& -
(((- .
)((. /
,((/ 0
Category)) 
=)) 
category)) '
.))' (
Category))( 0
,))0 1
	CreatedAt** 
=** 
DateTime**  (
.**( )
Now**) ,
,**, -
	CreatedBy++ 
=++ 
category++  (
.++( )
	CreatedBy++) 2
},, 
;,, 
_categoryRepository-- #
.--# $
AddCategory--$ /
(--/ 0
courseCategory--0 >
)--> ?
;--? @
return.. 
true.. 
;.. 
}// 
}11 	
public22 
async22 
Task22 
<22 
List22 
<22 '
CourseCategoryListViewModel22 :
>22: ;
>22; <
GetAllCategory22= K
(22K L
)22L M
{33 	
List44 
<44 '
CourseCategoryListViewModel44 ,
>44, -
category44. 6
=447 8
_categoryMapper449 H
.44H I
Map44I L
<44L M
List44M Q
<44Q R
CourseCategory44R `
>44` a
,44a b
List44c g
<44g h(
CourseCategoryListViewModel	44h É
>
44É Ñ
>
44Ñ Ö
(
44Ö Ü
await
44Ü ã!
_categoryRepository
44å ü
.
44ü †
GetAllCategory
44† Æ
(
44Æ Ø
)
44Ø ∞
)
44∞ ±
;
44± ≤
return55 
category55 
;55 
}66 	
}88 
}99 Á
3D:\backend\LXP.Core\Services\CourseLevelServices.cs
	namespace 	
LXP
 
. 
Core 
. 
Services 
{		 
public

 

class

 
CourseLevelServices

 $
:

% & 
ICourseLevelServices

' ;
{ 
private 
readonly "
ICourseLevelRepository /"
_courseLevelRepository0 F
;F G
private 
Mapper 
_levelMapper #
;# $
public 
CourseLevelServices "
(" #"
ICourseLevelRepository# 9!
courseLevelRepository: O
)O P
{ 	
this 
. "
_courseLevelRepository '
=( )!
courseLevelRepository* ?
;? @
var 
_configLevel 
= 
new "
MapperConfiguration# 6
(6 7
cfg7 :
=>; =
cfg> A
.A B
	CreateMapB K
<K L
CourseLevelL W
,W X$
CourseLevelListViewModelY q
>q r
(r s
)s t
.t u

ReverseMapu 
(	 Ä
)
Ä Å
)
Å Ç
;
Ç É
_levelMapper 
= 
new 
Mapper %
(% &
_configLevel& 2
)2 3
;3 4
} 	
public 
async 
Task 
< 
List 
< $
CourseLevelListViewModel 7
>7 8
>8 9
GetAllCourseLevel: K
(K L
stringL R
	CreatedByS \
)\ ]
{ 	
List 
< 
CourseLevel 
> 
CourseLevel )
=* +
await, 1"
_courseLevelRepository2 H
.H I
GetAllCourseLevelI Z
(Z [
)[ \
;\ ]
if 
( 
CourseLevel 
. 
Count !
==" $
$num% &
)& '
{ 
await 
AddCourseLevel $
($ %
$str% /
,/ 0
	CreatedBy1 :
): ;
;; <
await 
AddCourseLevel $
($ %
$str% /
,/ 0
	CreatedBy1 :
): ;
;; <
await 
AddCourseLevel $
($ %
$str% 3
,3 4
	CreatedBy5 >
)> ?
;? @
} 
return 
_levelMapper 
.  
Map  #
<# $
List$ (
<( )
CourseLevel) 4
>4 5
,5 6
List7 ;
<; <$
CourseLevelListViewModel< T
>T U
>U V
(V W
awaitW \"
_courseLevelRepository] s
.s t
GetAllCourseLevel	t Ö
(
Ö Ü
)
Ü á
)
á à
;
à â
}   	
public!! 
async!! 
Task!! 
AddCourseLevel!! (
(!!( )
string!!) /
Level!!0 5
,!!5 6
string!!7 =
	CreatedBy!!> G
)!!G H
{"" 	
CourseLevel## 
course## 
=##  
new##! $
CourseLevel##% 0
(##0 1
)##1 2
{$$ 
LevelId%% 
=%% 
Guid%% 
.%% 
NewGuid%% &
(%%& '
)%%' (
,%%( )
Level&& 
=&& 
Level&& 
,&& 
	CreatedAt'' 
='' 
DateTime'' $
.''$ %
Now''% (
,''( )
	CreatedBy(( 
=(( 
	CreatedBy(( %
})) 
;)) 
await** "
_courseLevelRepository** (
.**( )
AddCourseLevel**) 7
(**7 8
course**8 >
)**> ?
;**? @
}++ 	
}-- 
}.. ÑH
.D:\backend\LXP.Core\Services\CourseServices.cs
	namespace 	
LXP
 
. 
Core 
. 
Services 
{ 
public 

class 
CourseServices 
:  !
ICourseServices" 1
{ 
private 
readonly 
ICourseRepository *
_courseRepository+ <
;< =
private 
readonly 
ICategoryRepository ,
_categoryRepository- @
;@ A
private 
readonly "
ICourseLevelRepository /"
_courseLevelRepository0 F
;F G
private 
readonly 
IWebHostEnvironment ,
_environment- 9
;9 :
private 
readonly  
IHttpContextAccessor -
_contextAccessor. >
;> ?
private 
Mapper 
_courseMapper $
;$ %
public 
CourseServices 
( 
ICourseRepository /
courseRepository0 @
,@ A
ICategoryRepositoryB U
categoryRepositoryV h
,h i#
ICourseLevelRepository	j Ä#
courseLevelRepository
Å ñ
,
ñ ó!
IWebHostEnvironment
ò ´
environment
¨ ∑
,
∑ ∏"
IHttpContextAccessor
π Õ!
httpContextAccessor
Œ ·
)
· ‚
{ 	
_courseRepository 
= 
courseRepository  0
;0 1"
_courseLevelRepository "
=# $!
courseLevelRepository% :
;: ;
_categoryRepository 
=  !
categoryRepository" 4
;4 5
_environment 
= 
environment &
;& '
_contextAccessor   
=   
httpContextAccessor   2
;  2 3
var!! 
_configCategory!! 
=!!  !
new!!" %
MapperConfiguration!!& 9
(!!9 :
cfg!!: =
=>!!> @
cfg!!A D
.!!D E
	CreateMap!!E N
<!!N O
Course!!O U
,!!U V
CourseViewModel!!W f
>!!f g
(!!g h
)!!h i
.!!i j

ReverseMap!!j t
(!!t u
)!!u v
)!!v w
;!!w x
_courseMapper"" 
="" 
new"" 
Mapper""  &
(""& '
_configCategory""' 6
)""6 7
;""7 8
}$$ 	
public%% 
bool%% 
	AddCourse%% 
(%% 
CourseViewModel%% -
course%%. 4
)%%4 5
{&& 	
bool'' 
isCourseExists'' 
=''  !
_courseRepository''" 3
.''3 4"
AnyCourseByCourseTitle''4 J
(''J K
course''K Q
.''Q R
Title''R W
)''W X
;''X Y
if)) 
()) 
!)) 
isCourseExists)) 
)))  
{** 
Guid-- 
levelId-- 
=-- 
Guid-- #
.--# $
Parse--$ )
(--) *
course--* 0
.--0 1
Level--1 6
)--6 7
;--7 8
CourseLevel.. 
level.. !
=.." #"
_courseLevelRepository..$ :
...: ;)
GetCourseLevelByCourseLevelId..; X
(..X Y
levelId..Y `
)..` a
;..a b
Guid// 

categoryId// 
=//  !
Guid//" &
.//& '
Parse//' ,
(//, -
course//- 3
.//3 4
Catagory//4 <
)//< =
;//= >
CourseCategory00 
category00 '
=00( )
_categoryRepository00* =
.00= >#
GetCategoryByCategoryId00> U
(00U V

categoryId00V `
)00` a
;00a b
var33 
uniqueFileName33 "
=33# $
$"33% '
{33' (
Guid33( ,
.33, -
NewGuid33- 4
(334 5
)335 6
}336 7
$str337 8
{338 9
course339 ?
.33? @
Thumbnailimage33@ N
.33N O
FileName33O W
}33W X
"33X Y
;33Y Z
var66 
uploadsFolder66 !
=66" #
Path66$ (
.66( )
Combine66) 0
(660 1
_environment661 =
.66= >
WebRootPath66> I
,66I J
$str66K b
)66b c
;66c d
var77 
filePath77 
=77 
Path77 #
.77# $
Combine77$ +
(77+ ,
uploadsFolder77, 9
,779 :
uniqueFileName77; I
)77I J
;77J K
using99 
(99 
var99 
stream99 !
=99" #
new99$ '

FileStream99( 2
(992 3
filePath993 ;
,99; <
FileMode99= E
.99E F
Create99F L
)99L M
)99M N
{:: 
course;; 
.;; 
Thumbnailimage;; )
.;;) *
CopyTo;;* 0
(;;0 1
stream;;1 7
);;7 8
;;;8 9
}<< 
Course>> 
	newcourse>>  
=>>! "
new>># &
Course>>' -
{?? 
CourseId@@ 
=@@ 
Guid@@ #
.@@# $
NewGuid@@$ +
(@@+ ,
)@@, -
,@@- .
CategoryAA 
=AA 
categoryAA '
,AA' (
LevelBB 
=BB 
levelBB !
,BB! "
TitleCC 
=CC 
courseCC "
.CC" #
TitleCC# (
,CC( )
DescriptionDD 
=DD  !
courseDD" (
.DD( )
DescriptionDD) 4
,DD4 5
DurationEE 
=EE 
courseEE %
.EE% &
DurationEE& .
,EE. /
	ThumbnailFF 
=FF 
uniqueFileNameFF  .
,FF. /
	CreatedByGG 
=GG 
$strGG  '
,GG' (
	CreatedAtHH 
=HH 
newHH  #
DateTimeHH$ ,
(HH, -
)HH- .
,HH. /
IsActiveII 
=II 
trueII #
,II# $
IsAvailableJJ 
=JJ  !
trueJJ" &
,JJ& '

ModifiedAtKK 
=KK  
newKK! $
DateTimeKK% -
(KK- .
)KK. /
,KK/ 0

ModifiedByLL 
=LL  
$strLL! (
}OO 
;OO 
_courseRepositoryPP !
.PP! "
	AddCoursePP" +
(PP+ ,
	newcoursePP, 5
)PP5 6
;PP6 7
returnRR 
trueRR 
;RR 
}SS 
elseTT 
{UU 
returnVV 
falseVV 
;VV 
}WW 
}XX 	
publicZZ 
CourseZZ 
GetCourseByCourseIdZZ )
(ZZ) *
stringZZ* 0
courseIdZZ1 9
)ZZ9 :
{[[ 	
Guid\\ 
CourseId\\ 
=\\ 
Guid\\  
.\\  !
Parse\\! &
(\\& '
courseId\\' /
)\\/ 0
;\\0 1
var]] 
course]] 
=]] 
_courseRepository]] *
.]]* +&
GetCourseDetailsByCourseId]]+ E
(]]E F
CourseId]]F N
)]]N O
;]]O P
var^^ 

courseView^^ 
=^^ 
new^^  
Course^^! '
{__ 
Titleaa 
=aa 
courseaa 
.aa 
Titleaa $
,aa$ %
Descriptionbb 
=bb 
coursebb $
.bb$ %
Descriptionbb% 0
,bb0 1
Categorycc 
=cc 
coursecc !
.cc! "
Categorycc" *
,cc* +
Leveldd 
=dd 
coursedd 
.dd 
Leveldd $
,dd$ %
Durationee 
=ee 
courseee !
.ee! "
Durationee" *
,ee* +
	Thumbnailff 
=ff 
Stringff "
.ff" #
Formatff# )
(ff) *
$strff* Z
,ffZ [
_contextAccessorgg- =
.gg= >
HttpContextgg> I
.ggI J
RequestggJ Q
.ggQ R
SchemeggR X
,ggX Y
_contextAccessorhh- =
.hh= >
HttpContexthh> I
.hhI J
RequesthhJ Q
.hhQ R
HosthhR V
,hhV W
_contextAccessorii- =
.ii= >
HttpContextii> I
.iiI J
RequestiiJ Q
.iiQ R
PathBaseiiR Z
,iiZ [
coursejj- 3
.jj3 4
	Thumbnailjj4 =
)jj= >
}ll 
;ll 
returnmm 

courseViewmm 
;mm 
}qq 	
publicss 
IEnumerabless 
<ss 
CourseListViewModelss .
>ss. /
GetAllCourseDetailsss0 C
(ssC D
)ssD E
{tt 	
returnuu 
_courseRepositoryuu $
.uu$ %
GetAllCourseDetailsuu% 8
(uu8 9
)uu9 :
;uu: ;
}vv 	
}ww 
}xx ≈
3D:\backend\LXP.Core\Services\CourseTopicServices.cs
	namespace 	
LXP
 
. 
Core 
. 
Services 
{ 
public 

class 
CourseTopicServices $
:% & 
ICourseTopicServices' ;
{ 
private 
readonly "
ICourseTopicRepository /"
_courseTopicRepository0 F
;F G
private 
readonly 
ICourseRepository *
_courseRepository+ <
;< =
public 
CourseTopicServices "
(" #"
ICourseTopicRepository# 9!
courseTopicRepository: O
,O P
ICourseRepositoryQ b
courseRepositoryc s
)s t
{ 	"
_courseTopicRepository "
=# $!
courseTopicRepository% :
;: ;
_courseRepository 
= 
courseRepository  0
;0 1
} 	
public 
object 
GetTopicDetails %
(% &
string& ,
courseId- 5
)5 6
{ 	
return "
_courseTopicRepository )
.) *
GetTopicDetails* 9
(9 :
courseId: B
)B C
;C D
} 	
public 
async 
Task 
< 
bool 
> 
AddCourseTopic  .
(. / 
CourseTopicViewModel/ C
courseTopicD O
)O P
{ 	
bool 
isTopicExists 
=  "
_courseTopicRepository! 7
.7 8
AnyTopicByTopicName8 K
(K L
courseTopicL W
.W X
NameX \
)\ ]
;] ^
Guid 
CourseId 
= 
Guid  
.  !
Parse! &
(& '
(' (
courseTopic( 3
.3 4
CourseId4 <
)< =
)= >
;> ?
Course 
course 
= 
_courseRepository -
.- .&
GetCourseDetailsByCourseId. H
(H I
CourseIdI Q
)Q R
;R S
if   
(   
!   
isTopicExists   
)   
{!! 
Topic"" 
topic"" 
="" 
new"" !
Topic""" '
(""' (
)""( )
{## 
TopicId$$ 
=$$ 
Guid$$ "
.$$" #
NewGuid$$# *
($$* +
)$$+ ,
,$$, -
Name%% 
=%% 
courseTopic%% &
.%%& '
Name%%' +
,%%+ ,
Description&& 
=&&  !
courseTopic&&" -
.&&- .
Description&&. 9
,&&9 :
Course'' 
='' 
course'' #
,''# $
IsActive(( 
=(( 
true(( #
,((# $
	CreatedAt)) 
=)) 
DateTime))  (
.))( )
Now))) ,
,)), -
	CreatedBy** 
=** 
courseTopic**  +
.**+ ,
	CreatedBy**, 5
,**5 6

ModifiedAt++ 
=++  
null++! %
,++% &

ModifiedBy,, 
=,,  
null,,! %
}-- 
;-- 
await.. "
_courseTopicRepository.. ,
..., -
AddCourseTopic..- ;
(..; <
topic..< A
)..A B
;..B C
return// 
true// 
;// 
}00 
else11 
{22 
return33 
false33 
;33 
}44 
}88 	
}<< 
}== ä3
0D:\backend\LXP.Core\Services\DashboardService.cs
	namespace 	
LXP
 
. 
Core 
. 
Services 
{ 
public 

class 
DashboardService !
:" #
IDashboardService$ 5
{ 
private		 
readonly		  
IDashboardRepository		 - 
_dashboardRepository		. B
;		B C
public

 
DashboardService

 
(

   
IDashboardRepository

  4
dashboardRepository

5 H
)

H I
{ 	 
_dashboardRepository  
=! "
dashboardRepository# 6
;6 7
} 	
public 
IEnumerable 
< %
DashboardLearnerViewModel 4
>4 5#
GetDashboardLearnerList6 M
(M N
)N O
{ 	
return  
_dashboardRepository '
.' (
GetTotalLearners( 8
(8 9
)9 :
;: ;
} 	
IEnumerable 
< $
DashboardCourseViewModel ,
>, -
IDashboardService. ?
.? @#
GetDashboardCoursesList@ W
(W X
)X Y
{ 	
return  
_dashboardRepository '
.' (
GetTotalCourses( 7
(7 8
)8 9
;9 :
} 	
IEnumerable 
< (
DashboardEnrollmentViewModel 0
>0 1
IDashboardService2 C
.C D&
GetDashboardEnrollmentListD ^
(^ _
)_ `
{ 	
return  
_dashboardRepository '
.' (
GetTotalEnrollments( ;
(; <
)< =
;= >
} 	
public 
Array "
GetMonthEnrollmentList +
(+ ,
), -
{ 	
var   
list   
=    
_dashboardRepository   +
.  + ,#
GetMonthWiseEnrollments  , C
(  C D
)  D E
.  E F
ToList  F L
(  L M
)  M N
;  N O
var!! 
query!! 
=!! 
from!! 
c!! 
in!! !
list!!" &
group"" 
c"" 
by""  "
c""# $
.""$ %
EnrollmentDate""% 3
.""3 4
Month""4 9
into"": >
g""? @
select## 
new## "
{### $
EnrollMonth##% 0
=##1 2
g##3 4
.##4 5
Key##5 8
,##8 9
EnrollCount##: E
=##F G
g##H I
.##I J
Count##J O
(##O P
)##P Q
}##R S
;##S T
Console$$ 
.$$ 
	WriteLine$$ 
($$ 
query$$ #
)$$# $
;$$$ %
var%% 
output%% 
=%% 
query%% 
.%% 
ToList%% %
(%%% &
)%%& '
;%%' (
return&& 
output&& 
.&& 
ToArray&& !
(&&! "
)&&" #
;&&# $
}// 	
public11 
Array11  
GetCourseCreatedList11 )
(11) *
)11* +
{22 	
var33 
list33 
=33  
_dashboardRepository33 +
.33+ ,
GetCourseCreated33, <
(33< =
)33= >
.33> ?
ToList33? E
(33E F
)33F G
;33G H
var44 
query44 
=44 
from44 
c44 
in44 !
list44" &
group55 
c55 
by55  "
c55# $
.55$ %
	CreatedAt55% .
.55. /
Year55/ 3
into554 8
g559 :
select66 
new66 "
{66# $
CreatedYear66% 0
=661 2
g663 4
.664 5
Key665 8
,668 9
CourseCount66: E
=66F G
g66H I
.66I J
Count66J O
(66O P
)66P Q
}66R S
;66S T
Console77 
.77 
	WriteLine77 
(77 
query77 #
)77# $
;77$ %
var88 
output88 
=88 
query88 
.88 
ToList88 %
(88% &
)88& '
;88' (
return99 
output99 
.99 
ToArray99 !
(99! "
)99" #
;99# $
}:: 	
public<< 
string<< !
GetMostEnrolledCourse<< +
(<<+ ,
)<<, -
{== 	
var>> 
course>> 
=>>  
_dashboardRepository>> -
.>>- .!
GetMoreEnrolledCourse>>. C
(>>C D
)>>D E
;>>E F
return?? 
$str?? 
;?? 
}@@ 	
publicII #
AdminDashboardViewModelII &$
GetAdminDashboardDetailsII' ?
(II? @
)II@ A
{JJ 	
varKK 
AdminDashboardKK 
=KK  
newKK! $#
AdminDashboardViewModelKK% <
{LL 
NoOfLearnersMM 
=MM  
_dashboardRepositoryMM 3
.MM3 4
GetNoOfLearnersMM4 C
(MMC D
)MMD E
.MME F
CountMMF K
(MMK L
)MML M
,MMM N

NoOfCourseNN 
=NN  
_dashboardRepositoryNN 1
.NN1 2
GetNoOfCourseNN2 ?
(NN? @
)NN@ A
.NNA B
CountNNB G
(NNG H
)NNH I
,NNI J
NoOfActiveLearnersOO "
=OO# $ 
_dashboardRepositoryOO% 9
.OO9 :!
GetNoOfActiveLearnersOO: O
(OOO P
)OOP Q
.OOQ R
CountOOR W
(OOW X
)OOX Y
,OOY Z!
HighestEnrolledCoursePP %
=PP& ' 
_dashboardRepositoryPP( <
.PP< =$
GetHighestEnrolledCoursePP= U
(PPU V
)PPV W
,PPW X
GetTopLearnersQQ 
=QQ   
_dashboardRepositoryQQ! 5
.QQ5 6
GetTopLearnersQQ6 D
(QQD E
)QQE F
,QQF G
GetTopFeedbackRR 
=RR   
_dashboardRepositoryRR! 5
.RR5 6 
GetFeedbackresponsesRR6 J
(RRJ K
)RRK L
,RRL M
}SS 
;SS 
returnTT 
AdminDashboardTT !
;TT! "
}VV 	
}XX 
}YY Í
,D:\backend\LXP.Core\Services\EmailService.cs
	namespace 	
LXP
 
. 
Core 
. 
Services 
{ 
public 

class 
EmailService 
: 
IEmailService  -
{ 
private 
readonly 
EmailSettings &
_emailSettings' 5
;5 6
public 
EmailService 
( 
IOptions $
<$ %
EmailSettings% 2
>2 3
emailSettings4 A
)A B
{ 	
_emailSettings 
= 
emailSettings *
.* +
Value+ 0
;0 1
} 	
public 
async 
Task 
< 
bool 
> 
SendEmailAsync  .
(. /
string/ 5
recipientEmail6 D
,D E
stringF L
subjectM T
,T U
stringV \
body] a
)a b
{ 	
try 
{ 
using   
(   
var   
mail   
=    !
new  " %
MailMessage  & 1
(  1 2
_emailSettings  2 @
.  @ A
SenderEmail  A L
,  L M
recipientEmail  N \
)  \ ]
)  ] ^
{!! 
mail"" 
."" 
Subject""  
=""! "
subject""# *
;""* +
mail## 
.## 
Body## 
=## 
body##  $
;##$ %
using%% 
(%% 
var%% 

smtpClient%% )
=%%* +
new%%, /

SmtpClient%%0 :
(%%: ;
$str%%; K
)%%K L
)%%L M
{&& 

smtpClient'' "
.''" #
Port''# '
=''( )
$num''* -
;''- .

smtpClient(( "
.((" #
Credentials((# .
=((/ 0
new((1 4
NetworkCredential((5 F
(((F G
_emailSettings((G U
.((U V
SenderEmail((V a
,((a b
_emailSettings((c q
.((q r
SenderPassword	((r Ä
)
((Ä Å
;
((Å Ç

smtpClient)) "
.))" #
	EnableSsl))# ,
=))- .
true))/ 3
;))3 4
await++ 

smtpClient++ (
.++( )
SendMailAsync++) 6
(++6 7
mail++7 ;
)++; <
;++< =
return,, 
true,, #
;,,# $
}-- 
}.. 
}// 
catch00 
(00 
	Exception00 
e00 
)00 
{11 
Console22 
.22 
	WriteLine22 !
(22! "
$"22" $
$str22$ 9
{229 :
e22: ;
.22; <
Message22< C
}22C D
"22D E
)22E F
;22F G
return33 
false33 
;33 
}44 
}55 	
}77 
}88 œ&
1D:\backend\LXP.Core\Services\EnrollmentService.cs
	namespace 	
LXP
 
. 
Core 
. 
Services 
{ 
public 

class 
EnrollmentService "
:# $
IEnrollmentService% 7
{ 
private 
readonly !
IEnrollmentRepository .!
_enrollmentRepository/ D
;D E
private 
readonly 
ILearnerRepository +
_learnerRepository, >
;> ?
private 
readonly 
ICourseRepository *
_courseRepository+ <
;< =
private 
readonly 
IWebHostEnvironment ,
_webHostEnvironment- @
;@ A
private 
readonly  
IHttpContextAccessor - 
_httpContextAccessor. B
;B C
public 
EnrollmentService  
(  !!
IEnrollmentRepository! 6 
enrollmentRepository7 K
,K L
ILearnerRepositoryM _
learnerRepository` q
,q r
ICourseRepository	s Ñ
courseRepository
Ö ï
,
ï ñ!
IWebHostEnvironment
ó ™ 
webHostEnvironment
´ Ω
,
Ω æ"
IHttpContextAccessor
ø ”!
httpContextAccessor
‘ Á
)
Á Ë
{ 	!
_enrollmentRepository   !
=  " # 
enrollmentRepository  $ 8
;  8 9
_learnerRepository!! 
=!!  
learnerRepository!!! 2
;!!2 3
_courseRepository"" 
="" 
courseRepository""  0
;""0 1
_webHostEnvironment## 
=##  !
webHostEnvironment##" 4
;##4 5 
_httpContextAccessor$$  
=$$! "
httpContextAccessor$$# 6
;$$6 7
}'' 	
public)) 
async)) 
Task)) 
<)) 
bool)) 
>)) 
	Addenroll))  )
())) *
EnrollmentViewModel))* =

enrollment))> H
)))H I
{** 	
bool++ 
isEnrolledExists++ !
=++" #!
_enrollmentRepository++$ 9
.++9 :+
AnyEnrollmentByLearnerAndCourse++: Y
(++Y Z

enrollment++Z d
.++d e
	LearnerId++e n
,++n o

enrollment++p z
.++z {
CourseId	++{ É
)
++É Ñ
;
++Ñ Ö
if.. 
(.. 
!.. 
isEnrolledExists.. !
)..! "
{// 
Learner00 
learner00 
=00  !
_learnerRepository00" 4
.004 5(
GetLearnerDetailsByLearnerId005 Q
(00Q R

enrollment00R \
.00\ ]
	LearnerId00] f
)00f g
;00g h
Course22 
course22 
=22 
_courseRepository22  1
.221 2&
GetCourseDetailsByCourseId222 L
(22L M

enrollment22M W
.22W X
CourseId22X `
)22` a
;22a b

Enrollment77 
newEnrollment77 (
=77) *
new77+ .

Enrollment77/ 9
{88 
EnrollmentId99  
=99! "
Guid99# '
.99' (
NewGuid99( /
(99/ 0
)990 1
,991 2
	LearnerId:: 
=:: 

enrollment::  *
.::* +
	LearnerId::+ 4
,::4 5
CourseId;; 
=;; 

enrollment;; )
.;;) *
CourseId;;* 2
,;;2 3
EnrollmentDate<< "
=<<# $
DateTime<<% -
.<<- .
Now<<. 1
,<<1 2
EnrollStatus==  
===! "
true==# '
,==' (
CompletedStatus>> #
=>>$ %
$num>>& '
,>>' (
	CreatedBy?? 
=?? 
$str??  '
,??' (
	CreatedAt@@ 
=@@ 
DateTime@@  (
.@@( )
Now@@) ,
,@@, -

ModifiedAtAA 
=AA  
DateTimeAA! )
.AA) *
NowAA* -
,AA- .

ModifiedByBB 
=BB  
$strBB! (
}CC 
;CC !
_enrollmentRepositoryEE %
.EE% &
	AddenrollEE& /
(EE/ 0
newEnrollmentEE0 =
)EE= >
;EE> ?
returnGG 
trueGG 
;GG 
}II 
elseJJ 
{KK 
returnLL 
falseLL 
;LL 
}MM 
}OO 	
publicQQ 
objectQQ )
GetCourseandTopicsByLearnerIdQQ 3
(QQ3 4
GuidQQ4 8
	learnerIdQQ9 B
)QQB C
{RR 	
returnTT !
_enrollmentRepositoryTT (
.TT( ))
GetCourseandTopicsByLearnerIdTT) F
(TTF G
	learnerIdTTG P
)TTP Q
;TTQ R
}VV 	
}WW 
}ZZ Éw
2D:\backend\LXP.Core\Services\ExcelToJsonService.cs
	namespace

 	
LXP


 
.

 
Core

 
.

 
Services

 
{ 
public 

class 
ExcelToJsonService #
:$ %
IExcelToJsonService& 9
{ 
private 
readonly '
IQuizQuestionJsonRepository 4#
_quizQuestionRepository5 L
;L M
public 
ExcelToJsonService !
(! "'
IQuizQuestionJsonRepository" ="
quizQuestionRepository> T
)T U
{ 	#
_quizQuestionRepository #
=$ %"
quizQuestionRepository& <
;< =
} 	
public 
async 
Task 
< 
List 
< %
QuizQuestionJsonViewModel 8
>8 9
>9 :#
ConvertExcelToJsonAsync; R
(R S
	IFormFileS \
file] a
)a b
{ 	
var 
quizQuestions 
= 
new  #
List$ (
<( )%
QuizQuestionJsonViewModel) B
>B C
(C D
)D E
;E F
using 
( 
var 
stream 
= 
new  #
MemoryStream$ 0
(0 1
)1 2
)2 3
{ 
await 
file 
. 
CopyToAsync &
(& '
stream' -
)- .
;. /
stream 
. 
Position 
=  !
$num" #
;# $
using 
( 
var 
package "
=# $
new% (
ExcelPackage) 5
(5 6
stream6 <
)< =
)= >
{ 
var   
	worksheet   !
=  " #
package  $ +
.  + ,
Workbook  , 4
.  4 5

Worksheets  5 ?
.  ? @
FirstOrDefault  @ N
(  N O
)  O P
;  P Q
if!! 
(!! 
	worksheet!! !
==!!" $
null!!% )
)!!) *
throw"" 
new"" !
ArgumentException""" 3
(""3 4
$str""4 J
)""J K
;""K L
for$$ 
($$ 
int$$ 
row$$  
=$$! "
$num$$# $
;$$$ %
row$$& )
<=$$* ,
	worksheet$$- 6
.$$6 7
	Dimension$$7 @
.$$@ A
End$$A D
.$$D E
Row$$E H
;$$H I
row$$J M
++$$M O
)$$O P
{%% 
var&& 
questionType&& (
=&&) *
	worksheet&&+ 4
.&&4 5
Cells&&5 :
[&&: ;
row&&; >
,&&> ?
$num&&@ A
]&&A B
.&&B C
Value&&C H
?&&H I
.&&I J
ToString&&J R
(&&R S
)&&S T
;&&T U
var'' 
question'' $
=''% &
	worksheet''' 0
.''0 1
Cells''1 6
[''6 7
row''7 :
,'': ;
$num''< =
]''= >
.''> ?
Value''? D
?''D E
.''E F
ToString''F N
(''N O
)''O P
;''P Q
if(( 
((( 
string(( "
.((" #
IsNullOrEmpty((# 0
(((0 1
questionType((1 =
)((= >
||((? A
string((B H
.((H I
IsNullOrEmpty((I V
(((V W
question((W _
)((_ `
)((` a
continue)) $
;))$ %
var++ 
quizQuestion++ (
=++) *
new+++ .%
QuizQuestionJsonViewModel++/ H
{,, 
QuestionNumber-- *
=--+ ,
row--- 0
---1 2
$num--3 4
,--4 5
QuestionType.. (
=..) *
questionType..+ 7
,..7 8
Question// $
=//% &
question//' /
,/// 0
Options00 #
=00$ %
ExtractOptions00& 4
(004 5
	worksheet005 >
,00> ?
row00@ C
,00C D
$num00E F
,00F G
$num00H I
)00I J
,00J K
CorrectOptions11 *
=11+ ,
ExtractOptions11- ;
(11; <
	worksheet11< E
,11E F
row11G J
,11J K
$num11L N
,11N O
$num11P Q
)11Q R
}22 
;22 
quizQuestions44 %
.44% &
Add44& )
(44) *
quizQuestion44* 6
)446 7
;447 8
}55 
}66 
}77 
return99 
quizQuestions99  
;99  !
}:: 	
public<< 
List<< 
<<< %
QuizQuestionJsonViewModel<< -
><<- .
ValidateQuizData<</ ?
(<<? @
List<<@ D
<<<D E%
QuizQuestionJsonViewModel<<E ^
><<^ _
quizData<<` h
)<<h i
{== 	
var>> 
validQuizData>> 
=>> 
new>>  #
List>>$ (
<>>( )%
QuizQuestionJsonViewModel>>) B
>>>B C
(>>C D
)>>D E
;>>E F
foreach@@ 
(@@ 
var@@ 
question@@ !
in@@" $
quizData@@% -
)@@- .
{AA 
ifBB 
(BB 
questionBB 
.BB 
QuestionTypeBB )
==BB* ,
$strBB- 2
)BB2 3
{CC 
ifDD 
(DD 
questionDD  
.DD  !
OptionsDD! (
.DD( )
LengthDD) /
!=DD0 2
$numDD3 4
||DD5 7
questionEE  
.EE  !
OptionsEE! (
.EE( )
DistinctEE) 1
(EE1 2
)EE2 3
.EE3 4
CountEE4 9
(EE9 :
)EE: ;
!=EE< >
$numEE? @
||EEA C
questionFF  
.FF  !
CorrectOptionsFF! /
.FF/ 0
LengthFF0 6
!=FF7 9
$numFF: ;
||FF< >
!GG 
questionGG !
.GG! "
OptionsGG" )
.GG) *
ContainsGG* 2
(GG2 3
questionGG3 ;
.GG; <
CorrectOptionsGG< J
.GGJ K
FirstGGK P
(GGP Q
)GGQ R
)GGR S
)GGS T
{HH 
continueII  
;II  !
}JJ 
}KK 
elseLL 
ifLL 
(LL 
questionLL !
.LL! "
QuestionTypeLL" .
==LL/ 1
$strLL2 6
)LL6 7
{MM 
ifNN 
(NN 
questionNN  
.NN  !
OptionsNN! (
.NN( )
LengthNN) /
!=NN0 2
$numNN3 4
||NN5 7
!OO 
questionOO !
.OO! "
OptionsOO" )
.OO) *
ContainsOO* 2
(OO2 3
$strOO3 9
,OO9 :
StringComparerOO; I
.OOI J
OrdinalIgnoreCaseOOJ [
)OO[ \
||OO] _
!PP 
questionPP !
.PP! "
OptionsPP" )
.PP) *
ContainsPP* 2
(PP2 3
$strPP3 :
,PP: ;
StringComparerPP< J
.PPJ K
OrdinalIgnoreCasePPK \
)PP\ ]
||PP^ `
questionQQ  
.QQ  !
CorrectOptionsQQ! /
.QQ/ 0
LengthQQ0 6
!=QQ7 9
$numQQ: ;
||QQ< >
(RR 
questionRR !
.RR! "
CorrectOptionsRR" 0
.RR0 1
FirstRR1 6
(RR6 7
)RR7 8
.RR8 9
ToLowerRR9 @
(RR@ A
)RRA B
!=RRC E
$strRRF L
&&RRM O
questionRRP X
.RRX Y
CorrectOptionsRRY g
.RRg h
FirstRRh m
(RRm n
)RRn o
.RRo p
ToLowerRRp w
(RRw x
)RRx y
!=RRz |
$str	RR} Ñ
)
RRÑ Ö
)
RRÖ Ü
{SS 
continueTT  
;TT  !
}UU 
}VV 
elseWW 
ifWW 
(WW 
questionWW !
.WW! "
QuestionTypeWW" .
==WW/ 1
$strWW2 7
)WW7 8
{XX 
ifYY 
(YY 
questionYY  
.YY  !
OptionsYY! (
.YY( )
LengthYY) /
<YY0 1
$numYY2 3
||YY4 6
questionYY7 ?
.YY? @
OptionsYY@ G
.YYG H
LengthYYH N
>YYO P
$numYYQ R
||YYS U
questionZZ  
.ZZ  !
OptionsZZ! (
.ZZ( )
DistinctZZ) 1
(ZZ1 2
)ZZ2 3
.ZZ3 4
CountZZ4 9
(ZZ9 :
)ZZ: ;
!=ZZ< >
questionZZ? G
.ZZG H
OptionsZZH O
.ZZO P
LengthZZP V
||ZZW Y
question[[  
.[[  !
CorrectOptions[[! /
.[[/ 0
Length[[0 6
<[[7 8
$num[[9 :
||[[; =
question[[> F
.[[F G
CorrectOptions[[G U
.[[U V
Length[[V \
>[[] ^
$num[[_ `
||[[a c
!\\ 
question\\ !
.\\! "
CorrectOptions\\" 0
.\\0 1
All\\1 4
(\\4 5
co\\5 7
=>\\8 :
question\\; C
.\\C D
Options\\D K
.\\K L
Contains\\L T
(\\T U
co\\U W
)\\W X
)\\X Y
)\\Y Z
{]] 
continue^^  
;^^  !
}__ 
}`` 
validQuizDataaa 
.aa 
Addaa !
(aa! "
questionaa" *
)aa* +
;aa+ ,
}bb 
returndd 
validQuizDatadd  
;dd  !
}ee 	
publicgg 
asyncgg 
Taskgg 
SaveQuizDataAsyncgg +
(gg+ ,
Listgg, 0
<gg0 1%
QuizQuestionJsonViewModelgg1 J
>ggJ K
quizQuestionsggL Y
,ggY Z
Guidgg[ _
quizIdgg` f
)ggf g
{hh 	
foreachii 
(ii 
varii 
quizQuestionii %
inii& (
quizQuestionsii) 6
)ii6 7
{jj 
usingkk 
(kk 
varkk 
transactionkk &
=kk' (
newkk) ,
TransactionScopekk- =
(kk= >+
TransactionScopeAsyncFlowOptionkk> ]
.kk] ^
Enabledkk^ e
)kke f
)kkf g
{ll 
intmm 
nextQuestionNomm &
=mm' (
awaitmm) .#
_quizQuestionRepositorymm/ F
.mmF G"
GetNextQuestionNoAsyncmmG ]
(mm] ^
quizIdmm^ d
)mmd e
;mme f
varoo 
questionEntityoo &
=oo' (
newoo) ,
QuizQuestionoo- 9
{pp 
QuizIdqq 
=qq  
quizIdqq! '
,qq' (

QuestionNorr "
=rr# $
nextQuestionNorr% 3
,rr3 4
QuestionTypess $
=ss% &
quizQuestionss' 3
.ss3 4
QuestionTypess4 @
,ss@ A
Questiontt  
=tt! "
quizQuestiontt# /
.tt/ 0
Questiontt0 8
,tt8 9
	CreatedByuu !
=uu" #
$struu$ +
,uu+ ,
	CreatedAtvv !
=vv" #
DateTimevv$ ,
.vv, -
Nowvv- 0
}ww 
;ww 
awaityy #
_quizQuestionRepositoryyy 1
.yy1 2
AddQuestionsAsyncyy2 C
(yyC D
newyyD G
ListyyH L
<yyL M
QuizQuestionyyM Y
>yyY Z
{yy[ \
questionEntityyy] k
}yyl m
)yym n
;yyn o
var{{ 
optionEntities{{ &
={{' (
quizQuestion{{) 5
.{{5 6
Options{{6 =
.{{= >
Select{{> D
({{D E
({{E F
option{{F L
,{{L M
index{{N S
){{S T
=>{{U W
new{{X [
QuestionOption{{\ j
{|| 
QuizQuestionId}} &
=}}' (
questionEntity}}) 7
.}}7 8
QuizQuestionId}}8 F
,}}F G
Option~~ 
=~~  
option~~! '
,~~' (
	IsCorrect !
=" #
quizQuestion$ 0
.0 1
CorrectOptions1 ?
.? @
Contains@ H
(H I
optionI O
)O P
,P Q
	CreatedAt
ÄÄ !
=
ÄÄ" #
DateTime
ÄÄ$ ,
.
ÄÄ, -
Now
ÄÄ- 0
,
ÄÄ0 1
	CreatedBy
ÅÅ !
=
ÅÅ" #
$str
ÅÅ$ +
,
ÅÅ+ ,

ModifiedBy
ÇÇ "
=
ÇÇ# $
$str
ÇÇ% ,
}
ÉÉ 
)
ÉÉ 
.
ÉÉ 
ToList
ÉÉ 
(
ÉÉ 
)
ÉÉ 
;
ÉÉ  
await
ÖÖ %
_quizQuestionRepository
ÖÖ 1
.
ÖÖ1 2
AddOptionsAsync
ÖÖ2 A
(
ÖÖA B
optionEntities
ÖÖB P
,
ÖÖP Q
questionEntity
ÖÖR `
.
ÖÖ` a
QuizQuestionId
ÖÖa o
)
ÖÖo p
;
ÖÖp q
transaction
áá 
.
áá  
Complete
áá  (
(
áá( )
)
áá) *
;
áá* +
}
àà 
}
ââ 
}
ää 	
private
åå 
string
åå 
[
åå 
]
åå 
ExtractOptions
åå '
(
åå' (
ExcelWorksheet
åå( 6
	worksheet
åå7 @
,
åå@ A
int
ååB E
row
ååF I
,
ååI J
int
ååK N
startColumn
ååO Z
,
ååZ [
int
åå\ _
count
åå` e
)
ååe f
{
çç 	
var
éé 
options
éé 
=
éé 
new
éé 
List
éé "
<
éé" #
string
éé# )
>
éé) *
(
éé* +
)
éé+ ,
;
éé, -
for
èè 
(
èè 
int
èè 
i
èè 
=
èè 
$num
èè 
;
èè 
i
èè 
<
èè 
count
èè  %
;
èè% &
i
èè' (
++
èè( *
)
èè* +
{
êê 
var
ëë 
option
ëë 
=
ëë 
	worksheet
ëë &
.
ëë& '
Cells
ëë' ,
[
ëë, -
row
ëë- 0
,
ëë0 1
startColumn
ëë2 =
+
ëë> ?
i
ëë@ A
]
ëëA B
.
ëëB C
Value
ëëC H
?
ëëH I
.
ëëI J
ToString
ëëJ R
(
ëëR S
)
ëëS T
;
ëëT U
if
íí 
(
íí 
!
íí 
string
íí 
.
íí 
IsNullOrEmpty
íí )
(
íí) *
option
íí* 0
)
íí0 1
)
íí1 2
options
ìì 
.
ìì 
Add
ìì 
(
ìì  
option
ìì  &
)
ìì& '
;
ìì' (
}
îî 
return
ïï 
options
ïï 
.
ïï 
ToArray
ïï "
(
ïï" #
)
ïï# $
;
ïï$ %
}
ññ 	
}
óó 
}òò ís
7D:\backend\LXP.Core\Services\FeedbackResponseService.cs
	namespace

 	
LXP


 
.

 
Services

 
{ 
public 

class #
FeedbackResponseService (
:) *$
IFeedbackResponseService+ C
{ 
private 
readonly '
IFeedbackResponseRepository 4'
_feedbackResponseRepository5 P
;P Q
private 
readonly 2
&QuizFeedbackResponseViewModelValidator ?"
_quizFeedbackValidator@ V
;V W
private 
readonly 3
'TopicFeedbackResponseViewModelValidator @#
_topicFeedbackValidatorA X
;X Y
public #
FeedbackResponseService &
(& ''
IFeedbackResponseRepository' B&
feedbackResponseRepositoryC ]
)] ^
{ 	'
_feedbackResponseRepository '
=( )&
feedbackResponseRepository* D
;D E"
_quizFeedbackValidator "
=# $
new% (2
&QuizFeedbackResponseViewModelValidator) O
(O P
)P Q
;Q R#
_topicFeedbackValidator #
=$ %
new& )3
'TopicFeedbackResponseViewModelValidator* Q
(Q R
)R S
;S T
} 	
public 
void "
SubmitFeedbackResponse *
(* +)
QuizFeedbackResponseViewModel+ H
feedbackResponseI Y
)Y Z
{ 	)
ValidateAndSubmitQuizFeedback )
() *
feedbackResponse* :
): ;
;; <
} 	
public 
void "
SubmitFeedbackResponse *
(* +*
TopicFeedbackResponseViewModel+ I
feedbackResponseJ Z
)Z [
{ 	*
ValidateAndSubmitTopicFeedback   *
(  * +
feedbackResponse  + ;
)  ; <
;  < =
}!! 	
public## 
void## #
SubmitFeedbackResponses## +
(##+ ,
IEnumerable##, 7
<##7 8)
QuizFeedbackResponseViewModel##8 U
>##U V
feedbackResponses##W h
)##h i
{$$ 	
foreach%% 
(%% 
var%% 
feedbackResponse%% )
in%%* ,
feedbackResponses%%- >
)%%> ?
{&& )
ValidateAndSubmitQuizFeedback'' -
(''- .
feedbackResponse''. >
)''> ?
;''? @
}(( 
})) 	
public++ 
void++ #
SubmitFeedbackResponses++ +
(+++ ,
IEnumerable++, 7
<++7 8*
TopicFeedbackResponseViewModel++8 V
>++V W
feedbackResponses++X i
)++i j
{,, 	
foreach-- 
(-- 
var-- 
feedbackResponse-- )
in--* ,
feedbackResponses--- >
)--> ?
{.. *
ValidateAndSubmitTopicFeedback// .
(//. /
feedbackResponse/// ?
)//? @
;//@ A
}00 
}11 	
private33 
void33 )
ValidateAndSubmitQuizFeedback33 2
(332 3)
QuizFeedbackResponseViewModel333 P
feedbackResponse33Q a
)33a b
{44 	
var55 
validationResult55  
=55! ""
_quizFeedbackValidator55# 9
.559 :
Validate55: B
(55B C
feedbackResponse55C S
)55S T
;55T U
if66 
(66 
!66 
validationResult66 !
.66! "
IsValid66" )
)66) *
{77 
throw88 
new88 
ValidationException88 -
(88- .
validationResult88. >
.88> ?
Errors88? E
)88E F
;88F G
}99 
if;; 
(;; 
feedbackResponse;;  
==;;! #
null;;$ (
);;( )
throw<< 
new<< !
ArgumentNullException<< /
(<</ 0
nameof<<0 6
(<<6 7
feedbackResponse<<7 G
)<<G H
)<<H I
;<<I J
var>> 
question>> 
=>> '
_feedbackResponseRepository>> 6
.>>6 7#
GetQuizFeedbackQuestion>>7 N
(>>N O
feedbackResponse>>O _
.>>_ `"
QuizFeedbackQuestionId>>` v
)>>v w
;>>w x
if@@ 
(@@ 
question@@ 
==@@ 
null@@  
)@@  !
throwAA 
newAA 
ArgumentExceptionAA +
(AA+ ,
$strAA, K
,AAK L
nameofAAM S
(AAS T
feedbackResponseAAT d
.AAd e"
QuizFeedbackQuestionIdAAe {
)AA{ |
)AA| }
;AA} ~
varCC 
learnerCC 
=CC '
_feedbackResponseRepositoryCC 5
.CC5 6

GetLearnerCC6 @
(CC@ A
feedbackResponseCCA Q
.CCQ R
	LearnerIdCCR [
)CC[ \
;CC\ ]
ifEE 
(EE 
learnerEE 
==EE 
nullEE 
)EE  
throwFF 
newFF 
ArgumentExceptionFF +
(FF+ ,
$strFF, A
,FFA B
nameofFFC I
(FFI J
feedbackResponseFFJ Z
.FFZ [
	LearnerIdFF[ d
)FFd e
)FFe f
;FFf g
varHH 
existingResponseHH  
=HH! "'
_feedbackResponseRepositoryHH# >
.HH> ?+
GetExistingQuizFeedbackResponseHH? ^
(HH^ _
feedbackResponseHH_ o
.HHo p#
QuizFeedbackQuestionId	HHp Ü
,
HHÜ á
feedbackResponse
HHà ò
.
HHò ô
	LearnerId
HHô ¢
)
HH¢ £
;
HH£ §
ifJJ 
(JJ 
existingResponseJJ  
!=JJ! #
nullJJ$ (
)JJ( )
throwKK 
newKK %
InvalidOperationExceptionKK 3
(KK3 4
$strKK4 n
)KKn o
;KKo p
GuidMM 
?MM 
optionIdMM 
=MM 
nullMM !
;MM! "
ifOO 
(OO 
questionOO 
.OO 
QuestionTypeOO %
==OO& (%
QuizFeedbackQuestionTypesOO) B
.OOB C
MultiChoiceQuestionOOC V
.OOV W
ToUpperOOW ^
(OO^ _
)OO_ `
)OO` a
{PP 
ifQQ 
(QQ 
stringQQ 
.QQ 
IsNullOrEmptyQQ (
(QQ( )
feedbackResponseQQ) 9
.QQ9 :

OptionTextQQ: D
)QQD E
)QQE F
throwRR 
newRR 
ArgumentExceptionRR /
(RR/ 0
$strRR0 a
)RRa b
;RRb c
optionIdTT 
=TT '
_feedbackResponseRepositoryTT 6
.TT6 7
GetOptionIdByTextTT7 H
(TTH I
feedbackResponseTTI Y
.TTY Z"
QuizFeedbackQuestionIdTTZ p
,TTp q
feedbackResponse	TTr Ç
.
TTÇ É

OptionText
TTÉ ç
)
TTç é
;
TTé è
ifUU 
(UU 
optionIdUU 
==UU 
nullUU  $
)UU$ %
throwVV 
newVV 
ArgumentExceptionVV /
(VV/ 0
$strVV0 O
,VVO P
nameofVVQ W
(VVW X
feedbackResponseVVX h
.VVh i

OptionTextVVi s
)VVs t
)VVt u
;VVu v
feedbackResponseXX  
.XX  !
ResponseXX! )
=XX* +
nullXX, 0
;XX0 1
}YY 
var^^ 
response^^ 
=^^ 
new^^ 
Feedbackresponse^^ /
{__ "
QuizFeedbackQuestionId`` &
=``' (
feedbackResponse``) 9
.``9 :"
QuizFeedbackQuestionId``: P
,``P Q
	LearnerIdaa 
=aa 
feedbackResponseaa ,
.aa, -
	LearnerIdaa- 6
,aa6 7
Responsebb 
=bb 
feedbackResponsebb +
.bb+ ,
Responsebb, 4
,bb4 5
OptionIdcc 
=cc 
optionIdcc #
,cc# $
GeneratedAtdd 
=dd 
DateTimedd &
.dd& '
Nowdd' *
,dd* +
GeneratedByee 
=ee 
$stree '
}ff 
;ff '
_feedbackResponseRepositoryhh '
.hh' (
AddFeedbackResponsehh( ;
(hh; <
responsehh< D
)hhD E
;hhE F
feedbackResponseii 
.ii 
QuizIdii #
=ii$ %
questionii& .
.ii. /
QuizIdii/ 5
;ii5 6
}jj 	
privatell 
voidll *
ValidateAndSubmitTopicFeedbackll 3
(ll3 4*
TopicFeedbackResponseViewModelll4 R
feedbackResponsellS c
)llc d
{mm 	
varnn 
validationResultnn  
=nn! "#
_topicFeedbackValidatornn# :
.nn: ;
Validatenn; C
(nnC D
feedbackResponsennD T
)nnT U
;nnU V
ifoo 
(oo 
!oo 
validationResultoo !
.oo! "
IsValidoo" )
)oo) *
{pp 
throwqq 
newqq 
ValidationExceptionqq -
(qq- .
validationResultqq. >
.qq> ?
Errorsqq? E
)qqE F
;qqF G
}rr 
iftt 
(tt 
feedbackResponsett  
==tt! #
nulltt$ (
)tt( )
throwuu 
newuu !
ArgumentNullExceptionuu /
(uu/ 0
nameofuu0 6
(uu6 7
feedbackResponseuu7 G
)uuG H
)uuH I
;uuI J
varww 
questionww 
=ww '
_feedbackResponseRepositoryww 6
.ww6 7$
GetTopicFeedbackQuestionww7 O
(wwO P
feedbackResponsewwP `
.ww` a#
TopicFeedbackQuestionIdwwa x
)wwx y
;wwy z
ifyy 
(yy 
questionyy 
==yy 
nullyy  
)yy  !
throwzz 
newzz 
ArgumentExceptionzz +
(zz+ ,
$strzz, K
,zzK L
nameofzzM S
(zzS T
feedbackResponsezzT d
.zzd e#
TopicFeedbackQuestionIdzze |
)zz| }
)zz} ~
;zz~ 
var|| 
learner|| 
=|| '
_feedbackResponseRepository|| 5
.||5 6

GetLearner||6 @
(||@ A
feedbackResponse||A Q
.||Q R
	LearnerId||R [
)||[ \
;||\ ]
if~~ 
(~~ 
learner~~ 
==~~ 
null~~ 
)~~  
throw 
new 
ArgumentException +
(+ ,
$str, A
,A B
nameofC I
(I J
feedbackResponseJ Z
.Z [
	LearnerId[ d
)d e
)e f
;f g
var
ÅÅ 
existingResponse
ÅÅ  
=
ÅÅ! ")
_feedbackResponseRepository
ÅÅ# >
.
ÅÅ> ?.
 GetExistingTopicFeedbackResponse
ÅÅ? _
(
ÅÅ_ `
feedbackResponse
ÅÅ` p
.
ÅÅp q&
TopicFeedbackQuestionIdÅÅq à
,ÅÅà â 
feedbackResponseÅÅä ö
.ÅÅö õ
	LearnerIdÅÅõ §
)ÅÅ§ •
;ÅÅ• ¶
if
ÉÉ 
(
ÉÉ 
existingResponse
ÉÉ  
!=
ÉÉ! #
null
ÉÉ$ (
)
ÉÉ( )
throw
ÑÑ 
new
ÑÑ '
InvalidOperationException
ÑÑ 3
(
ÑÑ3 4
$str
ÑÑ4 n
)
ÑÑn o
;
ÑÑo p
Guid
ÜÜ 
?
ÜÜ 
optionId
ÜÜ 
=
ÜÜ 
null
ÜÜ !
;
ÜÜ! "
if
àà 
(
àà 
question
àà 
.
àà 
QuestionType
àà %
==
àà& ((
TopicFeedbackQuestionTypes
àà) C
.
ààC D!
MultiChoiceQuestion
ààD W
.
ààW X
ToUpper
ààX _
(
àà_ `
)
àà` a
)
ààa b
{
ââ 
if
ää 
(
ää 
string
ää 
.
ää 
IsNullOrEmpty
ää (
(
ää( )
feedbackResponse
ää) 9
.
ää9 :

OptionText
ää: D
)
ääD E
)
ääE F
throw
ãã 
new
ãã 
ArgumentException
ãã /
(
ãã/ 0
$str
ãã0 a
)
ããa b
;
ããb c
optionId
çç 
=
çç )
_feedbackResponseRepository
çç 6
.
çç6 7
GetOptionIdByText
çç7 H
(
ççH I
feedbackResponse
ççI Y
.
ççY Z%
TopicFeedbackQuestionId
ççZ q
,
ççq r
feedbackResponseççs É
.ççÉ Ñ

OptionTextççÑ é
)ççé è
;ççè ê
if
éé 
(
éé 
optionId
éé 
==
éé 
null
éé  $
)
éé$ %
throw
èè 
new
èè 
ArgumentException
èè /
(
èè/ 0
$str
èè0 O
,
èèO P
nameof
èèQ W
(
èèW X
feedbackResponse
èèX h
.
èèh i

OptionText
èèi s
)
èès t
)
èèt u
;
èèu v
feedbackResponse
ëë  
.
ëë  !
Response
ëë! )
=
ëë* +
null
ëë, 0
;
ëë0 1
}
íí 
var
óó 
response
óó 
=
óó 
new
óó 
Feedbackresponse
óó /
{
òò %
TopicFeedbackQuestionId
ôô '
=
ôô( )
feedbackResponse
ôô* :
.
ôô: ;%
TopicFeedbackQuestionId
ôô; R
,
ôôR S
	LearnerId
öö 
=
öö 
feedbackResponse
öö ,
.
öö, -
	LearnerId
öö- 6
,
öö6 7
Response
õõ 
=
õõ 
feedbackResponse
õõ +
.
õõ+ ,
Response
õõ, 4
,
õõ4 5
OptionId
úú 
=
úú 
optionId
úú #
,
úú# $
GeneratedAt
ùù 
=
ùù 
DateTime
ùù &
.
ùù& '
Now
ùù' *
,
ùù* +
GeneratedBy
ûû 
=
ûû 
$str
ûû '
}
üü 
;
üü )
_feedbackResponseRepository
°° '
.
°°' (!
AddFeedbackResponse
°°( ;
(
°°; <
response
°°< D
)
°°D E
;
°°E F
feedbackResponse
¢¢ 
.
¢¢ 
TopicId
¢¢ $
=
¢¢% &
question
¢¢' /
.
¢¢/ 0
TopicId
¢¢0 7
;
¢¢7 8
}
££ 	
}
§§ 
}•• ó
-D:\backend\LXP.Core\Services\ForgetService.cs
	namespace 	
LXP
 
. 
Core 
. 
Services 
{ 
public 

class 
ForgetService 
:  
IForgetService! /
{

 
private 
readonly 
IForgetRepository *
_repository+ 6
;6 7
public 
ForgetService 
( 
IForgetRepository .

repository/ 9
)9 :
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
bool 
ForgetPassword "
(" #
string# )
Email* /
)/ 0
{ 	
var 
getleareremail 
=  
_repository! ,
., -
AnyUserByEmail- ;
(; <
Email< A
)A B
;B C
if 
( 
getleareremail 
!= !
null" &
)& '
{ 
string 
password 
=  !
RandomPassword" 0
.0 1#
Randompasswordgenerator1 H
(H I
)I J
;J K
string 
encryptPassword &
=' (

Encryption) 3
.3 4'
ComputePasswordToSha256Hash4 O
(O P
passwordP X
)X Y
;Y Z
_repository 
. !
UpdateLearnerPassword 1
(1 2
Email2 7
,7 8
encryptPassword9 H
)H I
;I J
EmailGenerator!! 
.!! 
Sendpassword!! +
(!!+ ,
password!!, 4
,!!4 5
Email!!6 ;
)!!; <
;!!< =
return## 
true## 
;## 
}$$ 
else&& 
{'' 
return(( 
false(( 
;(( 
})) 
},, 	
}.. 
}// èY
.D:\backend\LXP.Core\Services\LearnerService.cs
	namespaceúú 	
LXP
úú
 
.
úú 
Core
úú 
.
úú 
Services
úú 
{ùù 
public
ûû 

class
ûû 
LearnerService
ûû 
:
ûû  !
ILearnerService
ûû" 1
{
üü 
private
†† 
readonly
††  
ILearnerRepository
†† + 
_learnerRepository
††, >
;
††> ?
private
°° 
readonly
°°  
IProfileRepository
°° + 
_profileRepository
°°, >
;
°°> ?
private
¢¢ 
readonly
¢¢ /
!IProfilePasswordHistoryRepository
¢¢ :/
!_profilePasswordHistoryRepository
¢¢; \
;
¢¢\ ]
private
§§ 
Mapper
§§ 
_learnerMapper
§§ %
;
§§% &
public
¶¶ 
LearnerService
¶¶ 
(
¶¶  
ILearnerRepository
¶¶ 0
learnerRepository
¶¶1 B
,
¶¶B C 
IProfileRepository
¶¶D V
profileRepository
¶¶W h
,
¶¶h i0
!IProfilePasswordHistoryRepository¶¶j ã0
 profilePasswordHistoryRepository¶¶å ¨
)¶¶¨ ≠
{
ßß 	
this
®® 
.
®®  
_learnerRepository
®® #
=
®®$ %
learnerRepository
®®& 7
;
®®7 8
this
©© 
.
©©  
_profileRepository
©© #
=
©©$ %
profileRepository
©©& 7
;
©©7 8
this
™™ 
.
™™ /
!_profilePasswordHistoryRepository
™™ 2
=
™™3 4.
 profilePasswordHistoryRepository
™™5 U
;
™™U V
var
´´ 
_configCategory
´´ 
=
´´  !
new
´´" %!
MapperConfiguration
´´& 9
(
´´9 :
cfg
´´: =
=>
´´> @
cfg
´´A D
.
´´D E
	CreateMap
´´E N
<
´´N O
Learner
´´O V
,
´´V W!
GetLearnerViewModel
´´X k
>
´´k l
(
´´l m
)
´´m n
.
´´n o

ReverseMap
´´o y
(
´´y z
)
´´z {
)
´´{ |
;
´´| }
_learnerMapper
¨¨ 
=
¨¨ 
new
¨¨  
Mapper
¨¨! '
(
¨¨' (
_configCategory
¨¨( 7
)
¨¨7 8
;
¨¨8 9/
!_profilePasswordHistoryRepository
≠≠ -
=
≠≠. /.
 profilePasswordHistoryRepository
≠≠0 P
;
≠≠P Q
}
ÆÆ 	
public
∞∞ 
async
∞∞ 
Task
∞∞ 
<
∞∞ 
bool
∞∞ 
>
∞∞ !
LearnerRegistration
∞∞  3
(
∞∞3 4#
RegisterUserViewModel
∞∞4 I#
registerUserViewModel
∞∞J _
)
∞∞_ `
{
±± 	
bool
≤≤ 
isLearnerExists
≤≤  
=
≤≤! "
await
≤≤# ( 
_learnerRepository
≤≤) ;
.
≤≤; <
AnyLearnerByEmail
≤≤< M
(
≤≤M N#
registerUserViewModel
≤≤N c
.
≤≤c d
email
≤≤d i
)
≤≤i j
;
≤≤j k
if
≥≥ 
(
≥≥ 
!
≥≥ 
isLearnerExists
≥≥  
)
≥≥  !
{
¥¥ 
Learner
µµ 

newlearner
µµ "
=
µµ# $
new
µµ% (
Learner
µµ) 0
(
µµ0 1
)
µµ1 2
{
∂∂ 
	LearnerId
∑∑ 
=
∑∑ 
Guid
∑∑  $
.
∑∑$ %
NewGuid
∑∑% ,
(
∑∑, -
)
∑∑- .
,
∑∑. /
Email
∏∏ 
=
∏∏ #
registerUserViewModel
∏∏ 1
.
∏∏1 2
email
∏∏2 7
,
∏∏7 8
Password
ππ 
=
ππ 
SHA256Encrypt
ππ ,
.
ππ, -)
ComputePasswordToSha256Hash
ππ- H
(
ππH I#
registerUserViewModel
ππI ^
.
ππ^ _
password
ππ_ g
)
ππg h
,
ππh i
Role
∫∫ 
=
∫∫ #
registerUserViewModel
∫∫ 0
.
∫∫0 1
role
∫∫1 5
,
∫∫5 6
UnblockRequest
ªª "
=
ªª# $
false
ªª% *
,
ªª* +
AccountStatus
ºº !
=
ºº" #
true
ºº$ (
,
ºº( )
UserLastLogin
ΩΩ !
=
ΩΩ" #
DateTime
ΩΩ$ ,
.
ΩΩ, -
Now
ΩΩ- 0
,
ΩΩ0 1
	CreatedAt
ææ 
=
ææ 
DateTime
ææ  (
.
ææ( )
Now
ææ) ,
,
ææ, -
	CreatedBy
øø 
=
øø 
$"
øø  "
{
øø" ##
registerUserViewModel
øø# 8
.
øø8 9
	firstName
øø9 B
}
øøB C
$str
øøC D
{
øøD E#
registerUserViewModel
øøE Z
.
øøZ [
lastName
øø[ c
}
øøc d
"
øød e
,
øøe f

ModifiedAt
¿¿ 
=
¿¿  
DateTime
¿¿! )
.
¿¿) *
Now
¿¿* -
,
¿¿- .

ModifiedBy
¡¡ 
=
¡¡  
$"
¡¡! #
{
¡¡# $#
registerUserViewModel
¡¡$ 9
.
¡¡9 :
	firstName
¡¡: C
}
¡¡C D
$str
¡¡D E
{
¡¡E F#
registerUserViewModel
¡¡F [
.
¡¡[ \
lastName
¡¡\ d
}
¡¡d e
"
¡¡e f
}
¬¬ 
;
¬¬  
_learnerRepository
√√ "
.
√√" #

AddLearner
√√# -
(
√√- .

newlearner
√√. 8
)
√√8 9
;
√√9 :
Learner
ƒƒ 
learner
ƒƒ 
=
ƒƒ  ! 
_learnerRepository
ƒƒ" 4
.
ƒƒ4 5&
GetLearnerByLearnerEmail
ƒƒ5 M
(
ƒƒM N

newlearner
ƒƒN X
.
ƒƒX Y
Email
ƒƒY ^
)
ƒƒ^ _
;
ƒƒ_ `
LearnerProfile
≈≈ 
profile
≈≈ &
=
≈≈' (
new
≈≈) ,
LearnerProfile
≈≈- ;
(
≈≈; <
)
≈≈< =
{
∆∆ 
	ProfileId
«« 
=
«« 
Guid
««  $
.
««$ %
NewGuid
««% ,
(
««, -
)
««- .
,
««. /
	FirstName
»» 
=
»» #
registerUserViewModel
»»  5
.
»»5 6
	firstName
»»6 ?
,
»»? @
LastName
…… 
=
…… #
registerUserViewModel
…… 4
.
……4 5
lastName
……5 =
,
……= >
Dob
   
=
   
DateOnly
   "
.
  " #

ParseExact
  # -
(
  - .#
registerUserViewModel
  . C
.
  C D
dob
  D G
,
  G H
$str
  I U
,
  U V
null
  W [
)
  [ \
,
  \ ]
Gender
ÀÀ 
=
ÀÀ #
registerUserViewModel
ÀÀ 2
.
ÀÀ2 3
gender
ÀÀ3 9
,
ÀÀ9 :
ContactNumber
ÃÃ !
=
ÃÃ" ##
registerUserViewModel
ÃÃ$ 9
.
ÃÃ9 :
contactNumber
ÃÃ: G
,
ÃÃG H
Stream
ÕÕ 
=
ÕÕ #
registerUserViewModel
ÕÕ 2
.
ÕÕ2 3
stream
ÕÕ3 9
,
ÕÕ9 :
	CreatedAt
ŒŒ 
=
ŒŒ 
DateTime
ŒŒ  (
.
ŒŒ( )
Now
ŒŒ) ,
,
ŒŒ, -
	CreatedBy
œœ 
=
œœ 
$"
œœ  "
{
œœ" ##
registerUserViewModel
œœ# 8
.
œœ8 9
	firstName
œœ9 B
}
œœB C
$str
œœC D
{
œœD E#
registerUserViewModel
œœE Z
.
œœZ [
lastName
œœ[ c
}
œœc d
"
œœd e
,
œœe f
	LearnerId
–– 
=
–– 
learner
––  '
.
––' (
	LearnerId
––( 1
,
––1 2

ModifiedBy
—— 
=
——  
$"
——! #
{
——# $#
registerUserViewModel
——$ 9
.
——9 :
	firstName
——: C
}
——C D
$str
——D E
{
——E F#
registerUserViewModel
——F [
.
——[ \
lastName
——\ d
}
——d e
"
——e f
,
——f g
}
““ 
;
““ 
PasswordHistory
’’ 
passwordHistory
’’  /
=
’’0 1
new
’’2 5
PasswordHistory
’’6 E
(
’’E F
)
’’F G
{
÷÷ 

PasswordId
ŸŸ 
=
ŸŸ  
Guid
ŸŸ! %
.
ŸŸ% &
NewGuid
ŸŸ& -
(
ŸŸ- .
)
ŸŸ. /
,
ŸŸ/ 0
	LearnerId
€€ 
=
€€ 
learner
€€  '
.
€€' (
	LearnerId
€€( 1
,
€€1 2
NewPassword
›› 
=
››  !
learner
››" )
.
››) *
Password
››* 2
,
››2 3
	CreatedBy
ﬂﬂ 
=
ﬂﬂ 
$"
ﬂﬂ  "
{
ﬂﬂ" ##
registerUserViewModel
ﬂﬂ# 8
.
ﬂﬂ8 9
	firstName
ﬂﬂ9 B
}
ﬂﬂB C
$str
ﬂﬂC D
{
ﬂﬂD E#
registerUserViewModel
ﬂﬂE Z
.
ﬂﬂZ [
lastName
ﬂﬂ[ c
}
ﬂﬂc d
"
ﬂﬂd e
,
ﬂﬂe f
	CreatedAt
·· 
=
·· 
DateTime
··  (
.
··( )
Now
··) ,
,
··, -

ModifiedAt
„„ 
=
„„  
DateTime
„„! )
.
„„) *
Now
„„* -
,
„„- .

ModifiedBy
ÂÂ 
=
ÂÂ  
$"
ÂÂ! #
{
ÂÂ# $#
registerUserViewModel
ÂÂ$ 9
.
ÂÂ9 :
	firstName
ÂÂ: C
}
ÂÂC D
$str
ÂÂD E
{
ÂÂE F#
registerUserViewModel
ÂÂF [
.
ÂÂ[ \
lastName
ÂÂ\ d
}
ÂÂd e
"
ÂÂe f
}
ÈÈ 
;
ÈÈ /
!_profilePasswordHistoryRepository
ÎÎ 1
.
ÎÎ1 2!
AddPasswordHistory1
ÎÎ2 E
(
ÎÎE F
passwordHistory
ÎÎF U
)
ÎÎU V
;
ÎÎV W 
_profileRepository
ÏÏ "
.
ÏÏ" #

AddProfile
ÏÏ# -
(
ÏÏ- .
profile
ÏÏ. 5
)
ÏÏ5 6
;
ÏÏ6 7
return
ÌÌ 
true
ÌÌ 
;
ÌÌ 
}
ÓÓ 
else
ÔÔ 
{
 
return
ÒÒ 
false
ÒÒ 
;
ÒÒ 
}
ÚÚ 
}
ÛÛ 	
public
ıı 
async
ıı 
Task
ıı 
<
ıı 
List
ıı 
<
ıı !
GetLearnerViewModel
ıı 2
>
ıı2 3
>
ıı3 4
GetAllLearner
ıı5 B
(
ııB C
)
ııC D
{
ˆˆ 	
List
˜˜ 
<
˜˜ !
GetLearnerViewModel
˜˜ $
>
˜˜$ %
learner
˜˜& -
=
˜˜. /
_learnerMapper
˜˜0 >
.
˜˜> ?
Map
˜˜? B
<
˜˜B C
List
˜˜C G
<
˜˜G H
Learner
˜˜H O
>
˜˜O P
,
˜˜P Q
List
˜˜R V
<
˜˜V W!
GetLearnerViewModel
˜˜W j
>
˜˜j k
>
˜˜k l
(
˜˜l m
await
˜˜m r!
_learnerRepository˜˜s Ö
.˜˜Ö Ü
GetAllLearner˜˜Ü ì
(˜˜ì î
)˜˜î ï
)˜˜ï ñ
;˜˜ñ ó
return
¯¯ 
learner
¯¯ 
;
¯¯ 
}
˘˘ 	
public
ÜÜ 
Learner
ÜÜ 
GetLearnerById
ÜÜ %
(
ÜÜ% &
string
ÜÜ& ,
id
ÜÜ- /
)
ÜÜ/ 0
{
áá 	
return
ââ  
_learnerRepository
ââ %
.
ââ% &*
GetLearnerDetailsByLearnerId
ââ& B
(
ââB C
Guid
ââC G
.
ââG H
Parse
ââH M
(
ââM N
id
ââN P
)
ââP Q
)
ââQ R
;
ââR S
}
ãã 	
}
çç 
}éé Ñ
/D:\backend\LXP.Core\Services\LearnerServices.cs
	namespace 	
LXP
 
. 
Core 
. 
Services 
{ 
public		 

class		 
LearnerServices		  
:		! "
ILearnerServices		# 3
{

 
private 
readonly 
ILearnerRepository +
_LearnerRepository, >
;> ?
private 
readonly 
IWebHostEnvironment ,
_environment- 9
;9 :
private 
readonly  
IHttpContextAccessor -
_contextAccessor. >
;> ?
public 
LearnerServices 
( 
ILearnerRepository 1
courseRepository2 B
,B C
IWebHostEnvironmentD W
environmentX c
,c d 
IHttpContextAccessore y
httpContextAccess	z ã
)
ã å
{ 	
_LearnerRepository 
=  
courseRepository! 1
;1 2
_environment 
= 
environment &
;& '
_contextAccessor 
= 
httpContextAccess 0
;0 1
} 	
public 
IEnumerable 
<  
AllLearnersViewModel /
>/ 0
GetLearners1 <
(< =
)= >
{ 	
var 
result 
= 
_LearnerRepository +
.+ ,
GetLearners, 7
(7 8
)8 9
;9 :
return 
result 
; 
} 	
public 
object +
GetAllLearnerDetailsByLearnerId 5
(5 6
Guid6 :
	LearnerId; D
)D E
{ 	
return   
_LearnerRepository   %
.  % &+
GetAllLearnerDetailsByLearnerId  & E
(  E F
	LearnerId  F O
)  O P
;  P Q
}"" 	
public$$ 
object$$ /
#GetLearnerEnrolledcourseByLearnerId$$ 9
($$9 :
Guid$$: >
	LearnerId$$? H
)$$H I
{%% 	
return&& 
_LearnerRepository&& %
.&&% &/
#GetLearnerEnrolledcourseByLearnerId&&& I
(&&I J
	LearnerId&&J S
)&&S T
;&&T U
}(( 	
}33 
}44 â5
,D:\backend\LXP.Core\Services\LoginService.cs
	namespace 	
LXP
 
. 
Core 
. 
Services 
{ 
public 

class 
LoginService 
: 
ILoginService  -
{ 
private 
readonly 
ILoginRepository )
_repository* 5
;5 6
private 
Mapper 
_moviemapper #
;# $
private 
readonly 
LXPDbContext %

_dbcontext& 0
;0 1
public 
LoginService 
( 
ILoginRepository ,

repository- 7
,7 8
LXPDbContext9 E
	dbcontextF O
)O P
{ 	
_repository 
= 

repository $
;$ %
var 
_configlogin 
= 
new "
MapperConfiguration# 6
(6 7
cfg7 :
=>; =
cfg> A
.A B
	CreateMapB K
<K L
LearnerL S
,S T

LoginModelU _
>_ `
(` a
)a b
)b c
;c d
_moviemapper!! 
=!! 
new!! 
Mapper!! %
(!!% &
_configlogin!!& 2
)!!2 3
;!!3 4

_dbcontext## 
=## 
	dbcontext## "
;##" #
}$$ 	
public(( 
async(( 
Task(( 
<(( 
	LoginRole(( #
>((# $
LoginLearner((% 1
(((1 2

LoginModel((2 <

loginmodel((= G
)((G H
{** 	
	LoginRole++ 
	loginRole++ 
;++  
	LoginRole-- 
message-- 
=-- 
new--  #
	LoginRole--$ -
(--- .
)--. /
;--/ 0
var00 
getlearners00 
=00 
await00 #
_repository00$ /
.00/ 0
GetLearnerByEmail000 A
(00A B

loginmodel00B L
.00L M
Email00M R
)00R S
;00S T
var22 
user22 
=22 
await22 
_repository22 (
.22( )
AnyUserByEmail22) 7
(227 8

loginmodel228 B
.22B C
Email22C H
)22H I
;22I J
if55 
(55 
user55 
==55 
true55 
)55 
{66 
using99 
(99 
SHA25699 
sha25699 $
=99% &
SHA25699' -
.99- .
Create99. 4
(994 5
)995 6
)996 7
{:: 
byte;; 
[;; 
];; 
inputHashPassword;; ,
=;;- .
sha256;;/ 5
.;;5 6
ComputeHash;;6 A
(;;A B
Encoding;;B J
.;;J K
UTF8;;K O
.;;O P
GetBytes;;P X
(;;X Y

loginmodel;;Y c
.;;c d
Password;;d l
);;l m
);;m n
;;;n o
StringBuilder== !
stringBuilder==" /
===0 1
new==2 5
StringBuilder==6 C
(==C D
)==D E
;==E F
for?? 
(?? 
int?? 
i?? 
=??  
$num??! "
;??" #
i??$ %
<??& '
inputHashPassword??( 9
.??9 :
Length??: @
;??@ A
i??B C
++??C E
)??E F
{AA 
stringBuilderCC %
.CC% &
AppendCC& ,
(CC, -
inputHashPasswordCC- >
[CC> ?
iCC? @
]CC@ A
.CCA B
ToStringCCB J
(CCJ K
$strCCK O
)CCO P
)CCP Q
;CCQ R
}EE 
stringGG 
inputPasswordHashedGG .
=GG/ 0
stringBuilderGG1 >
.GG> ?
ToStringGG? G
(GGG H
)GGH I
;GGI J
boolJJ 
checkpasswordJJ &
=JJ' (
awaitJJ) .
_repositoryJJ/ :
.JJ: ;(
AnyLearnerByEmailAndPasswordJJ; W
(JJW X

loginmodelJJX b
.JJb c
EmailJJc h
,JJh i
inputPasswordHashedJJj }
)JJ} ~
;JJ~ 
messageLL 
.LL 
RoleLL  
=LL! "
getlearnersLL# .
.LL. /
RoleLL/ 3
;LL3 4
messageNN 
.NN 
AccountStatusNN )
=NN* +
getlearnersNN, 7
.NN7 8
AccountStatusNN8 E
;NNE F
messageOO 
.OO 
GetLearnerIdOO (
=OO) *
getlearnersOO+ 6
.OO6 7
	LearnerIdOO7 @
;OO@ A
ifQQ 
(QQ 
checkpasswordQQ %
)QQ% &
{RR 
	loginRoleSS !
=SS" #
newSS$ '
	LoginRoleSS( 1
(SS1 2
)SS2 3
;SS3 4
{UU 
	loginRoleVV %
.VV% &
EmailVV& +
=VV, -
trueVV. 2
;VV2 3
	loginRoleXX %
.XX% &
PasswordXX& .
=XX/ 0
trueXX1 5
;XX5 6
	loginRoleZZ %
.ZZ% &
RoleZZ& *
=ZZ+ ,
messageZZ- 4
.ZZ4 5
RoleZZ5 9
;ZZ9 :
	loginRole\\ %
.\\% &
AccountStatus\\& 3
=\\4 5
message\\6 =
.\\= >
AccountStatus\\> K
;\\K L
	loginRole^^ %
.^^% &
GetLearnerId^^& 2
=^^3 4
message^^5 <
.^^< =
GetLearnerId^^= I
;^^I J
}cc 
returnee 
	loginRoleee (
;ee( )
}ff 
elsehh 
{ii 
	loginRolejj !
=jj" #
newjj$ '
	LoginRolejj( 1
(jj1 2
)jj2 3
;jj3 4
{ll 
	loginRolemm %
.mm% &
Emailmm& +
=mm, -
truemm. 2
;mm2 3
	loginRoleoo %
.oo% &
Passwordoo& .
=oo/ 0
falseoo1 6
;oo6 7
}pp 
returnqq 
	loginRoleqq (
;qq( )
}rr 
}tt 
}vv 
elsexx 
{yy 
	loginRolezz 
=zz 
newzz 
	LoginRolezz  )
(zz) *
)zz* +
;zz+ ,
{|| 
	loginRole}} 
.}} 
Email}} #
=}}$ %
false}}& +
;}}+ ,
	loginRole 
. 
Password &
=' (
false) .
;. /
}
ÅÅ 
return
ÇÇ 
	loginRole
ÇÇ  
;
ÇÇ  !
}
ÖÖ 
}
àà 	
}
ÀÀ 
}ÕÕ äo
0D:\backend\LXP.Core\Services\MaterialServices.cs
	namespace 	
LXP
 
. 
Core 
. 
Services 
{ 
public 

class 
MaterialServices !
:" #
IMaterialServices$ 5
{ 
private 
readonly 
IMaterialRepository ,
_materialRepository- @
;@ A
private 
readonly "
ICourseTopicRepository /"
_courseTopicRepository0 F
;F G
private 
readonly #
IMaterialTypeRepository /#
_materialTypeRepository0 G
;G H
private 
readonly 
IWebHostEnvironment ,
_environment- 9
;9 :
private 
readonly  
IHttpContextAccessor -
_contextAccessor. >
;> ?
private 
Mapper !
_courseMaterialMapper ,
;, -
public 
MaterialServices 
(  #
IMaterialTypeRepository  7"
materialTypeRepository8 N
,N O
IMaterialRepositoryO b
materialRepositoryc u
,u v#
ICourseTopicRepository	v å#
courseTopicRepository
ç ¢
,
¢ £!
IWebHostEnvironment
§ ∑
environment
∏ √
,
√ ƒ"
IHttpContextAccessor
≈ Ÿ!
httpContextAccessor
⁄ Ì
)
Ì Ó
{ 	
_materialRepository 
=  !
materialRepository" 4
;4 5"
_courseTopicRepository "
=# $!
courseTopicRepository% :
;: ;#
_materialTypeRepository   #
=  $ %"
materialTypeRepository  & <
;  < =
_environment!! 
=!! 
environment!! &
;!!& '
_contextAccessor"" 
="" 
httpContextAccessor"" 2
;""2 3
var## !
_configCourseMaterial## %
=##& '
new##( +
MapperConfiguration##, ?
(##? @
cfg##@ C
=>##D F
cfg##G J
.##J K
	CreateMap##K T
<##T U
Material##U ]
,##] ^!
MaterialListViewModel##_ t
>##t u
(##u v
)##v w
.##w x

ReverseMap	##x Ç
(
##Ç É
)
##É Ñ
)
##Ñ Ö
;
##Ö Ü!
_courseMaterialMapper$$ !
=$$" #
new$$$ '
Mapper$$( .
($$. /!
_configCourseMaterial$$/ D
)$$D E
;$$E F
}'' 	
public(( 
async(( 
Task(( 
<(( !
MaterialListViewModel(( /
>((/ 0
AddMaterial((1 <
(((< =
MaterialViewModel((= N
material((O W
)((W X
{)) 	
Topic** 
topic** 
=** 
await** "
_courseTopicRepository**  6
.**6 7
GetTopicByTopicId**7 H
(**H I
Guid**I M
.**M N
Parse**N S
(**S T
material**T \
.**\ ]
TopicId**] d
)**d e
)**e f
;**f g
MaterialType++ 
materialType++ %
=++& '#
_materialTypeRepository++( ?
.++? @+
GetMaterialTypeByMaterialTypeId++@ _
(++_ `
Guid++` d
.++d e
Parse++e j
(++j k
material++k s
.++s t
MaterialTypeId	++t Ç
)
++Ç É
)
++É Ñ
;
++Ñ Ö
bool,, 
isMaterialExists,, !
=,," #
await,,$ )
_materialRepository,,* =
.,,= >-
!AnyMaterialByMaterialNameAndTopic,,> _
(,,_ `
material,,` h
.,,h i
Name,,i m
,,,m n
topic,,o t
),,t u
;,,u v
if-- 
(-- 
!-- 
isMaterialExists-- !
)--! "
{.. 
var00 
uniqueFileName00 "
=00# $
$"00% '
{00' (
Guid00( ,
.00, -
NewGuid00- 4
(004 5
)005 6
}006 7
$str007 8
{008 9
material009 A
.00A B
Material00B J
.00J K
FileName00K S
}00S T
"00T U
;00U V
var33 
uploadsFolder33 !
=33" #
Path33$ (
.33( )
Combine33) 0
(330 1
_environment331 =
.33= >
WebRootPath33> I
,33I J
$str33K [
)33[ \
;33\ ]
var44 
filePath44 
=44 
Path44 #
.44# $
Combine44$ +
(44+ ,
uploadsFolder44, 9
,449 :
uniqueFileName44; I
)44I J
;44J K
using66 
(66 
var66 
stream66 !
=66" #
new66$ '

FileStream66( 2
(662 3
filePath663 ;
,66; <
FileMode66= E
.66E F
Create66F L
)66L M
)66M N
{77 
material88 
.88 
Material88 %
.88% &
CopyTo88& ,
(88, -
stream88- 3
)883 4
;884 5
}99 
Material:: 
materialCreation:: )
=::* +
new::, /
Material::0 8
(::8 9
)::9 :
{;; 

MaterialId<< 
=<<  
Guid<<! %
.<<% &
NewGuid<<& -
(<<- .
)<<. /
,<</ 0
Name== 
=== 
material== #
.==# $
Name==$ (
,==( )
MaterialType>>  
=>>! "
materialType>># /
,>>/ 0
	CreatedBy@@ 
=@@ 
material@@  (
.@@( )
	CreatedBy@@) 2
,@@2 3
	CreatedAtAA 
=AA 
DateTimeAA  (
.AA( )
NowAA) ,
,AA, -
FilePathBB 
=BB 
uniqueFileNameBB -
,BB- .
IsActiveDD 
=DD 
trueDD #
,DD# $
IsAvailableEE 
=EE  !
trueEE" &
,EE& '
DurationFF 
=FF 
materialFF '
.FF' (
DurationFF( 0
,FF0 1
TopicGG 
=GG 
topicGG !
,GG! "

ModifiedAtHH 
=HH  
nullHH! %
,HH% &

ModifiedByII 
=II  
nullII! %
}JJ 
;JJ 
awaitKK 
_materialRepositoryKK )
.KK) *
AddMaterialKK* 5
(KK5 6
materialCreationKK6 F
)KKF G
;KKG H
returnLL !
_courseMaterialMapperLL ,
.LL, -
MapLL- 0
<LL0 1
MaterialLL1 9
,LL9 :!
MaterialListViewModelLL; P
>LLP Q
(LLQ R
materialCreationLLR b
)LLb c
;LLc d
}MM 
elseNN 
{OO 
returnPP 
nullPP 
;PP 
}QQ 
}RR 	
publicTT 
asyncTT 
TaskTT 
<TT 
ListTT 
<TT !
MaterialListViewModelTT 4
>TT4 5
>TT5 6/
#GetAllMaterialDetailsByTopicAndTypeTT7 Z
(TTZ [
stringTT[ a
topicIdTTb i
,TTi j
stringTTj p
materialTypeIdTTq 
)	TT Ä
{UU 	
TopicVV 
topicVV 
=VV 
awaitVV "
_courseTopicRepositoryVV  6
.VV6 7
GetTopicByTopicIdVV7 H
(VVH I
GuidVVI M
.VVM N
ParseVVN S
(VVS T
topicIdVVT [
)VV[ \
)VV\ ]
;VV] ^
MaterialTypeWW 
materialTypeWW %
=WW& '#
_materialTypeRepositoryWW( ?
.WW? @+
GetMaterialTypeByMaterialTypeIdWW@ _
(WW_ `
GuidWW` d
.WWd e
ParseWWe j
(WWj k
materialTypeIdWWk y
)WWy z
)WWz {
;WW{ |
ListYY 
<YY 
MaterialYY 
>YY 
materialYY #
=YY# $
_materialRepositoryYY% 8
.YY8 9/
#GetAllMaterialDetailsByTopicAndTypeYY9 \
(YY\ ]
topicYY] b
,YYb c
materialTypeYYc o
)YYo p
;YYp q
List[[ 
<[[ !
MaterialListViewModel[[ &
>[[& '
materialLists[[( 5
=[[6 7
new[[8 ;
List[[< @
<[[@ A!
MaterialListViewModel[[A V
>[[V W
([[W X
)[[X Y
;[[Y Z
foreach]] 
(]] 
var]] 
item]] 
in]]  
material]]! )
)]]) *
{^^ !
MaterialListViewModelaa %
materialListaa& 2
=aa3 4
newaa5 8!
MaterialListViewModelaa9 N
(aaN O
)aaO P
{bb 

MaterialIdcc 
=cc  
itemcc! %
.cc% &

MaterialIdcc& 0
,cc0 1
	TopicNamedd 
=dd 
itemdd  $
.dd$ %
Topicdd% *
.dd* +
Namedd+ /
,dd/ 0
MaterialTypeee  
=ee! "
itemee# '
.ee' (
MaterialTypeee( 4
.ee4 5
Typeee5 9
,ee9 :
Nameff 
=ff 
itemff 
.ff  
Nameff  $
,ff$ %
FilePathjj 
=jj 
Stringjj %
.jj% &
Formatjj& ,
(jj, -
$strjj- V
,jjV W
_contextAccessorkk- =
.kk= >
HttpContextkk> I
.kkI J
RequestkkJ Q
.kkQ R
SchemekkR X
,kkX Y
_contextAccessorll- =
.ll= >
HttpContextll> I
.llI J
RequestllJ Q
.llQ R
HostllR V
,llV W
_contextAccessormm- =
.mm= >
HttpContextmm> I
.mmI J
RequestmmJ Q
.mmQ R
PathBasemmR Z
,mmZ [
itemnn- 1
.nn1 2
FilePathnn2 :
)nn: ;
,nn; <
Durationqq 
=qq 
itemqq #
.qq# $
Durationqq$ ,
,qq, -
IsActiverr 
=rr 
itemrr #
.rr# $
IsActiverr$ ,
,rr, -
IsAvailabless 
=ss  !
itemss" &
.ss& '
IsAvailabless' 2
,ss2 3
	CreatedAttt 
=tt 
itemtt  $
.tt$ %
	CreatedAttt% .
,tt. /
	CreatedByuu 
=uu 
itemuu  $
.uu$ %
	CreatedByuu% .
,uu. /

ModifiedAtvv 
=vv  
itemvv! %
.vv% &

ModifiedAtvv& 0
.vv0 1
ToStringvv1 9
(vv9 :
)vv: ;
,vv; <

ModifiedByww 
=ww  
itemww! %
.ww% &

ModifiedByww& 0
}}} 
;}} 
materialLists~~ 
.~~ 
Add~~ !
(~~! "
materialList~~" .
)~~. /
;~~/ 0
} 
return
ÄÄ 
materialLists
ÄÄ  
;
ÄÄ  !
}
ÅÅ 	
public
ÉÉ 
async
ÉÉ 
Task
ÉÉ 
<
ÉÉ #
MaterialListViewModel
ÉÉ /
>
ÉÉ/ 0/
!GetMaterialByMaterialNameAndTopic
ÉÉ1 R
(
ÉÉR S
string
ÉÉS Y
materialName
ÉÉZ f
,
ÉÉf g
string
ÉÉh n
topicId
ÉÉo v
)
ÉÉv w
{
ÑÑ 	
Topic
ÖÖ 
topic
ÖÖ 
=
ÖÖ 
await
ÖÖ $
_courseTopicRepository
ÖÖ  6
.
ÖÖ6 7
GetTopicByTopicId
ÖÖ7 H
(
ÖÖH I
Guid
ÖÖI M
.
ÖÖM N
Parse
ÖÖN S
(
ÖÖS T
topicId
ÖÖT [
)
ÖÖ[ \
)
ÖÖ\ ]
;
ÖÖ] ^
Material
ÜÜ 
material
ÜÜ 
=
ÜÜ 
await
ÜÜ  %!
_materialRepository
ÜÜ& 9
.
ÜÜ9 :/
!GetMaterialByMaterialNameAndTopic
ÜÜ: [
(
ÜÜ[ \
materialName
ÜÜ\ h
,
ÜÜh i
topic
ÜÜj o
)
ÜÜo p
;
ÜÜp q#
MaterialListViewModel
áá !
materialView
áá" .
=
áá/ 0
new
áá1 4#
MaterialListViewModel
áá5 J
(
ááJ K
)
ááK L
{
àà 

MaterialId
ââ 
=
ââ 
material
ââ %
.
ââ% &

MaterialId
ââ& 0
,
ââ0 1
	TopicName
ää 
=
ää 
material
ää $
.
ää$ %
Topic
ää% *
.
ää* +
Name
ää+ /
,
ää/ 0
MaterialType
ãã 
=
ãã 
material
ãã '
.
ãã' (
MaterialType
ãã( 4
.
ãã4 5
Type
ãã5 9
,
ãã9 :
Name
åå 
=
åå 
material
åå 
.
åå  
Name
åå  $
,
åå$ %
FilePath
çç 
=
çç 
material
çç #
.
çç# $
FilePath
çç$ ,
,
çç, -
Duration
éé 
=
éé 
material
éé #
.
éé# $
Duration
éé$ ,
,
éé, -
IsActive
èè 
=
èè 
material
èè #
.
èè# $
IsActive
èè$ ,
,
èè, -
IsAvailable
êê 
=
êê 
material
êê &
.
êê& '
IsAvailable
êê' 2
,
êê2 3
	CreatedAt
ëë 
=
ëë 
material
ëë $
.
ëë$ %
	CreatedAt
ëë% .
,
ëë. /

ModifiedAt
íí 
=
íí 
material
íí %
.
íí% &

ModifiedAt
íí& 0
.
íí0 1
ToString
íí1 9
(
íí9 :
)
íí: ;
,
íí; <

ModifiedBy
ìì 
=
ìì 
material
ìì %
.
ìì% &

ModifiedBy
ìì& 0
,
ìì0 1
	CreatedBy
îî 
=
îî 
material
îî $
.
îî$ %
	CreatedBy
îî% .
}
úú 
;
úú 
return
ùù 
materialView
ùù 
;
ùù  
}
ûû 	
}
üü 
}†† –
4D:\backend\LXP.Core\Services\MaterialTypeServices.cs
	namespace 	
LXP
 
. 
Core 
. 
Services 
{ 
public 

class  
MaterialTypeServices %
:% &!
IMaterialTypeServices& ;
{ 
private 
readonly #
IMaterialTypeRepository 0#
_materialTypeRepository1 H
;H I
private 
Mapper 
_materialTypeMapper *
;* +
public  
MaterialTypeServices #
(# $#
IMaterialTypeRepository$ ;"
materialTypeRepository< R
)R S
{ 	
var 
_configMaterialType #
=$ %
new& )
MapperConfiguration* =
(= >
cfg> A
=>B D
cfgE H
.H I
	CreateMapI R
<R S
MaterialTypeS _
,_ `!
MaterialTypeViewModel` u
>u v
(v w
)w x
.x y

ReverseMap	y É
(
É Ñ
)
Ñ Ö
)
Ö Ü
;
Ü á
_materialTypeMapper 
=  !
new" %
Mapper& ,
(, -
_configMaterialType- @
)@ A
;A B#
_materialTypeRepository	  
=! ""
materialTypeRepository# 9
;9 :
} 	
public 
List 
< !
MaterialTypeViewModel )
>) *
GetAllMaterialType+ =
(= >
)> ?
{ 	
return 
_materialTypeMapper &
.& '
Map' *
<* +
List+ /
</ 0
MaterialType0 <
>< =
,= >
List> B
<B C!
MaterialTypeViewModelC X
>X Y
>Y Z
(Z [#
_materialTypeRepository[ r
.r s 
GetAllMaterialTypes	s Ü
(
Ü á
)
á à
)
à â
;
â ä
} 	
} 
} ¸'
6D:\backend\LXP.Core\Services\PasswordHistoryService.cs
	namespacell 	
LXPll
 
.ll 
Corell 
.ll 
Servicesll 
{mm 
publicnn 

classnn "
PasswordHistoryServicenn '
:nn( )#
IPasswordHistoryServicenn* A
{oo 
privatepp 
readonlypp &
IPasswordHistoryRepositorypp 3&
_passwordHistoryRepositorypp4 N
;ppN O
privateqq 
readonlyqq 
ILearnerRepositoryqq +
_learnerRepositoryqq, >
;qq> ?
publicss "
PasswordHistoryServicess %
(ss% &&
IPasswordHistoryRepositoryss& @%
passwordHistoryRepositoryssA Z
,ssZ [
ILearnerRepositoryss\ n
learnerRepository	sso Ä
)
ssÄ Å
{tt 	&
_passwordHistoryRepositoryuu &
=uu' (%
passwordHistoryRepositoryuu) B
;uuB C
_learnerRepositoryvv 
=vv  
learnerRepositoryvv! 2
;vv2 3
}ww 	
publicyy 
asyncyy 
Taskyy 
<yy 
boolyy 
>yy 
UpdatePasswordyy  .
(yy. /
stringyy/ 5
	learnerIdyy6 ?
,yy? @
stringyyA G
oldPasswordyyH S
,yyS T
stringyyU [
newPasswordyy\ g
)yyg h
{zz 	
var{{ 
passwordHistory{{ 
={{  !
await{{" '&
_passwordHistoryRepository{{( B
.{{B C
GetPasswordHistory{{C U
({{U V
Guid{{V Z
.{{Z [
Parse{{[ `
({{` a
	learnerId{{a j
){{j k
){{k l
;{{l m
var|| 
oldPasswordHash|| 
=||  !
HashPassword||" .
(||. /
oldPassword||/ :
)||: ;
;||; <
if}} 
(}} 
passwordHistory}} 
.}}  
NewPassword}}  +
!=}}, .
oldPasswordHash}}/ >
)}}> ?
{~~ 
return 
false 
; 
}
ÄÄ 
passwordHistory
ÅÅ 
.
ÅÅ 
OldPassword
ÅÅ '
=
ÅÅ( )
passwordHistory
ÅÅ* 9
.
ÅÅ9 :
NewPassword
ÅÅ: E
;
ÅÅE F
var
ÇÇ 
newPasswordHash
ÇÇ 
=
ÇÇ  !
HashPassword
ÇÇ" .
(
ÇÇ. /
newPassword
ÇÇ/ :
)
ÇÇ: ;
;
ÇÇ; <
passwordHistory
ÉÉ 
.
ÉÉ 
NewPassword
ÉÉ '
=
ÉÉ( )
newPasswordHash
ÉÉ* 9
;
ÉÉ9 :
await
ÑÑ (
_passwordHistoryRepository
ÑÑ ,
.
ÑÑ, -#
UpdatePasswordHistory
ÑÑ- B
(
ÑÑB C
passwordHistory
ÑÑC R
)
ÑÑR S
;
ÑÑS T
var
áá 
learner
áá 
=
áá  
_learnerRepository
áá ,
.
áá, -*
GetLearnerDetailsByLearnerId
áá- I
(
ááI J
Guid
ááJ N
.
ááN O
Parse
ááO T
(
ááT U
	learnerId
ááU ^
)
áá^ _
)
áá_ `
;
áá` a
learner
àà 
.
àà 
Password
àà 
=
àà 
newPasswordHash
àà .
;
àà. / 
_learnerRepository
ââ 
.
ââ 
UpdateLearner
ââ ,
(
ââ, -
learner
ââ- 4
)
ââ4 5
;
ââ5 6
return
ãã 
true
ãã 
;
ãã 
}
åå 	
private
éé 
string
éé 
HashPassword
éé #
(
éé# $
string
éé$ *
password
éé+ 3
)
éé3 4
{
èè 	
using
êê 
(
êê 
var
êê 
sha256
êê 
=
êê 
System
êê  &
.
êê& '
Security
êê' /
.
êê/ 0
Cryptography
êê0 <
.
êê< =
SHA256
êê= C
.
êêC D
Create
êêD J
(
êêJ K
)
êêK L
)
êêL M
{
ëë 
var
íí 
hashedBytes
íí 
=
íí  !
sha256
íí" (
.
íí( )
ComputeHash
íí) 4
(
íí4 5
Encoding
íí5 =
.
íí= >
UTF8
íí> B
.
ííB C
GetBytes
ííC K
(
ííK L
password
ííL T
)
ííT U
)
ííU V
;
ííV W
return
ìì 
BitConverter
ìì #
.
ìì# $
ToString
ìì$ ,
(
ìì, -
hashedBytes
ìì- 8
)
ìì8 9
.
ìì9 :
Replace
ìì: A
(
ììA B
$str
ììB E
,
ììE F
$str
ììG I
)
ììI J
.
ììJ K
ToLower
ììK R
(
ììR S
)
ììS T
;
ììT U
}
îî 
}
ïï 	
private
óó 
string
óó 
SomeHashFunction
óó '
(
óó' (
string
óó( .
password
óó/ 7
)
óó7 8
{
òò 	
throw
ôô 
new
ôô %
NotImplementedException
ôô -
(
ôô- .
)
ôô. /
;
ôô/ 0
}
öö 	
}
õõ 
}úú àH
.D:\backend\LXP.Core\Services\ProfileService.cs
	namespaceDD 	
LXPDD
 
.DD 
CoreDD 
.DD 
ServicesDD 
{EE 
publicFF 

classFF 
ProfileServiceFF 
:FF  !
IProfileServiceFF" 1
{GG 
privateHH 
readonlyHH 
IProfileRepositoryHH +
_profileRepositoryHH, >
;HH> ?
privateII 
MapperII !
_learnerProfileMapperII ,
;II, -
privateJJ 
readonlyJJ 
IWebHostEnvironmentJJ ,
_environmentJJ- 9
;JJ9 :
privateKK 
readonlyKK  
IHttpContextAccessorKK -
_contextAccessorKK. >
;KK> ?
publicLL 
ProfileServiceLL 
(LL 
IProfileRepositoryLL 0
profileRepositoryLL1 B
,LLB C
IWebHostEnvironmentLLD W
environmentLLX c
,LLc d 
IHttpContextAccessorLLe y 
httpContextAccessor	LLz ç
)
LLç é
{MM 	
thisOO 
.OO 
_profileRepositoryOO #
=OO$ %
profileRepositoryOO& 7
;OO7 8
varPP 
_configCategoryPP 
=PP  !
newPP" %
MapperConfigurationPP& 9
(PP9 :
cfgPP: =
=>PP> @
cfgPPA D
.PPD E
	CreateMapPPE N
<PPN O
LearnerProfilePPO ]
,PP] ^
GetProfileViewModelPP_ r
>PPr s
(PPs t
)PPt u
.PPu v

ReverseMap	PPv Ä
(
PPÄ Å
)
PPÅ Ç
)
PPÇ É
;
PPÉ Ñ!
_learnerProfileMapperQQ !
=QQ" #
newQQ$ '
MapperQQ( .
(QQ. /
_configCategoryQQ/ >
)QQ> ?
;QQ? @
_environmentRR 
=RR 
environmentRR &
;RR& '
_contextAccessorSS 
=SS 
httpContextAccessorSS 2
;SS2 3
}UU 	
publicWW 
asyncWW 
TaskWW 
<WW 
ListWW 
<WW 
GetProfileViewModelWW 2
>WW2 3
>WW3 4 
GetAllLearnerProfileWW5 I
(WWI J
)WWJ K
{XX 	
ListYY 
<YY 
GetProfileViewModelYY $
>YY$ %
learnerProfileYY& 4
=YY5 6!
_learnerProfileMapperYY7 L
.YYL M
MapYYM P
<YYP Q
ListYYQ U
<YYU V
LearnerProfileYYV d
>YYd e
,YYe f
ListYYg k
<YYk l
GetProfileViewModelYYl 
>	YY Ä
>
YYÄ Å
(
YYÅ Ç
await
YYÇ á 
_profileRepository
YYà ö
.
YYö õ"
GetAllLearnerProfile
YYõ Ø
(
YYØ ∞
)
YY∞ ±
)
YY± ≤
;
YY≤ ≥
returnZZ 
learnerProfileZZ !
;ZZ! "
}[[ 	
public]] 
LearnerProfile]] !
GetLearnerProfileById]] 3
(]]3 4
string]]4 :
id]]; =
)]]= >
{^^ 	
varbb 
profilebb 
=bb 
_profileRepositorybb ,
.bb, -6
*GetLearnerprofileDetailsByLearnerprofileIdbb- W
(bbW X
GuidbbX \
.bb\ ]
Parsebb] b
(bbb c
idbbc e
)bbe f
)bbf g
;bbg h
varcc 
profileIndividualcc !
=cc" #
newcc$ '
LearnerProfilecc( 6
{dd 
	ProfileIdee 
=ee 
profileee #
.ee# $
	ProfileIdee$ -
,ee- .
	FirstNamegg 
=gg 
profilegg #
.gg# $
	FirstNamegg$ -
,gg- .
LastNamehh 
=hh 
profilehh "
.hh" #
LastNamehh# +
,hh+ ,
Dobii 
=ii 
profileii 
.ii 
Dobii !
,ii! "
Genderjj 
=jj 
profilejj  
.jj  !
Genderjj! '
,jj' (
Streamkk 
=kk 
profilekk  
.kk  !
Streamkk! '
,kk' (
ContactNumberll 
=ll 
profilell  '
.ll' (
ContactNumberll( 5
,ll5 6
ProfilePhotomm 
=mm 
Stringmm %
.mm% &
Formatmm& ,
(mm, -
$strmm- ]
,mm] ^
_contextAccessornn- =
.nn= >
HttpContextnn> I
.nnI J
RequestnnJ Q
.nnQ R
SchemennR X
,nnX Y
_contextAccessoroo- =
.oo= >
HttpContextoo> I
.ooI J
RequestooJ Q
.ooQ R
HostooR V
,ooV W
_contextAccessorpp- =
.pp= >
HttpContextpp> I
.ppI J
RequestppJ Q
.ppQ R
PathBaseppR Z
,ppZ [
profileqq- 4
.qq4 5
ProfilePhotoqq5 A
)qqA B
}rr 
;rr 
returnss 
profileIndividualss $
;ss$ %
}tt 	
publicww 
asyncww 
Taskww 
UpdateProfileww '
(ww' ("
UpdateProfileViewModelww( >
modelww? D
)wwD E
{xx 	
LearnerProfileyy 
learnerProfileyy )
=yy* +
_profileRepositoryyy, >
.yy> ?6
*GetLearnerprofileDetailsByLearnerprofileIdyy? i
(yyi j
Guidyyj n
.yyn o
Parseyyo t
(yyt u
modelyyu z
.yyz {
	ProfileId	yy{ Ñ
)
yyÑ Ö
)
yyÖ Ü
;
yyÜ á
if{{ 
({{ 
model{{ 
.{{ 
ProfilePhoto{{ "
!={{# %
null{{& *
){{* +
{|| 
var}} 
uniqueFileName}} "
=}}# $
$"}}% '
{}}' (
Guid}}( ,
.}}, -
NewGuid}}- 4
(}}4 5
)}}5 6
}}}6 7
$str}}7 8
{}}8 9
model}}9 >
.}}> ?
ProfilePhoto}}? K
.}}K L
FileName}}L T
}}}T U
"}}U V
;}}V W
var~~ 
uploadsFolder~~ !
=~~" #
Path~~$ (
.~~( )
Combine~~) 0
(~~0 1
_environment~~1 =
.~~= >
WebRootPath~~> I
,~~I J
$str~~K S
)~~S T
;~~T U
var 
filePath 
= 
Path #
.# $
Combine$ +
(+ ,
uploadsFolder, 9
,9 :
uniqueFileName; I
)I J
;J K
using
ÅÅ 
(
ÅÅ 
var
ÅÅ 
stream
ÅÅ !
=
ÅÅ" #
new
ÅÅ$ '

FileStream
ÅÅ( 2
(
ÅÅ2 3
filePath
ÅÅ3 ;
,
ÅÅ; <
FileMode
ÅÅ= E
.
ÅÅE F
Create
ÅÅF L
)
ÅÅL M
)
ÅÅM N
{
ÇÇ 
await
ÉÉ 
model
ÉÉ 
.
ÉÉ  
ProfilePhoto
ÉÉ  ,
.
ÉÉ, -
CopyToAsync
ÉÉ- 8
(
ÉÉ8 9
stream
ÉÉ9 ?
)
ÉÉ? @
;
ÉÉ@ A
}
ÑÑ 
learnerProfile
ÜÜ 
.
ÜÜ 
ProfilePhoto
ÜÜ +
=
ÜÜ, -
uniqueFileName
ÜÜ. <
;
ÜÜ< =
}
áá 
learnerProfile
ââ 
.
ââ 
	FirstName
ââ $
=
ââ% &
model
ââ' ,
.
ââ, -
	FirstName
ââ- 6
;
ââ6 7
learnerProfile
ää 
.
ää 
LastName
ää #
=
ää$ %
model
ää& +
.
ää+ ,
LastName
ää, 4
;
ää4 5
learnerProfile
ãã 
.
ãã 

ModifiedBy
ãã %
=
ãã& '
$"
ãã( *
{
ãã* +
model
ãã+ 0
.
ãã0 1
	FirstName
ãã1 :
}
ãã: ;
$str
ãã; <
{
ãã< =
model
ãã= B
.
ããB C
LastName
ããC K
}
ããK L
"
ããL M
;
ããM N
learnerProfile
åå 
.
åå 

ModifiedAt
åå %
=
åå& '
DateTime
åå( 0
.
åå0 1
Now
åå1 4
;
åå4 5
learnerProfile
çç 
.
çç 
ContactNumber
çç (
=
çç) *
model
çç+ 0
.
çç0 1
ContactNumber
çç1 >
;
çç> ?
learnerProfile
éé 
.
éé 
Dob
éé 
=
éé  
DateOnly
éé! )
.
éé) *

ParseExact
éé* 4
(
éé4 5
model
éé5 :
.
éé: ;
Dob
éé; >
,
éé> ?
$str
éé@ L
,
ééL M
null
ééN R
)
ééR S
;
ééS T
learnerProfile
èè 
.
èè 
Gender
èè !
=
èè" #
model
èè$ )
.
èè) *
Gender
èè* 0
;
èè0 1
learnerProfile
êê 
.
êê 
Stream
êê !
=
êê" #
model
êê$ )
.
êê) *
Stream
êê* 0
;
êê0 1
await
íí  
_profileRepository
íí $
.
íí$ %
UpdateProfile
íí% 2
(
íí2 3
learnerProfile
íí3 A
)
ííA B
;
ííB C
}
ìì 	
}
ññ 
}óó ¥É
1D:\backend\LXP.Core\Services\QuizEngineService.cs
	namespace 	
LXP
 
. 
Core 
. 
Services 
{		 
public 

class 
QuizEngineService "
:# $
IQuizEngineService% 7
{ 
private 
readonly !
IQuizEngineRepository .!
_quizEngineRepository/ D
;D E
private 
readonly 
IMemoryCache %
_memoryCache& 2
;2 3
public 
QuizEngineService  
(  !!
IQuizEngineRepository! 6 
quizEngineRepository7 K
,K L
IMemoryCacheM Y
memoryCacheZ e
)e f
{ 	!
_quizEngineRepository !
=" # 
quizEngineRepository$ 8
;8 9
_memoryCache 
= 
memoryCache &
;& '
} 	
public 
async 
Task 
< $
ViewQuizDetailsViewModel 2
>2 3
GetQuizByIdAsync4 D
(D E
GuidE I
quizIdJ P
)P Q
{ 	
return 
await !
_quizEngineRepository .
.. /
GetQuizByIdAsync/ ?
(? @
quizId@ F
)F G
;G H
} 	
public 
async 
Task 
< 
IEnumerable %
<% &'
QuizEngineQuestionViewModel& A
>A B
>B C$
GetQuestionsForQuizAsyncD \
(\ ]
Guid] a
quizIdb h
)h i
{ 	
return 
await !
_quizEngineRepository .
.. /$
GetQuestionsForQuizAsync/ G
(G H
quizIdH N
)N O
;O P
}   	
public"" 
async"" 
Task"" 
<"" $
ViewQuizDetailsViewModel"" 2
>""2 3(
GetQuizDetailsByTopicIdAsync""4 P
(""P Q
Guid""Q U
topicId""V ]
)""] ^
{## 	
return$$ 
await$$ !
_quizEngineRepository$$ .
.$$. /(
GetQuizDetailsByTopicIdAsync$$/ K
($$K L
topicId$$L S
)$$S T
;$$T U
}%% 	
public)) 
async)) 
Task)) 
<)) 
Guid)) 
>)) !
StartQuizAttemptAsync))  5
())5 6
Guid))6 :
	learnerId)); D
,))D E
Guid))F J
quizId))K Q
)))Q R
{** 	
var++ 
quiz++ 
=++ 
await++ !
_quizEngineRepository++ 2
.++2 3
GetQuizByIdAsync++3 C
(++C D
quizId++D J
)++J K
;++K L
if,, 
(,, 
quiz,, 
==,, 
null,, 
),, 
throw-- 
new--  
KeyNotFoundException-- .
(--. /
$"--/ 1
$str--1 >
{--> ?
quizId--? E
}--E F
$str--F Q
"--Q R
)--R S
;--S T
var// 
isAllowedToAttempt// "
=//# $
await//% *!
_quizEngineRepository//+ @
.//@ A'
IsAllowedToAttemptQuizAsync//A \
(//\ ]
	learnerId//] f
,//f g
quizId//h n
)//n o
;//o p
if00 
(00 
!00 
isAllowedToAttempt00 #
)00# $
{11 
var22 
existingAttempts22 $
=22% &
await22' ,!
_quizEngineRepository22- B
.22B C*
GetLearnerAttemptsForQuizAsync22C a
(22a b
	learnerId22b k
,22k l
quizId22m s
)22s t
;22t u
var33 
passMark33 
=33 
quiz33 #
.33# $
PassMark33$ ,
;33, -
var44 
hasPassedQuiz44 !
=44" #
existingAttempts44$ 4
.444 5
Any445 8
(448 9
a449 :
=>44; =
a44> ?
.44? @
Score44@ E
>=44F H
passMark44I Q
)44Q R
;44R S
if66 
(66 
hasPassedQuiz66 !
)66! "
throw77 
new77 %
InvalidOperationException77 7
(777 8
$str778 r
)77r s
;77s t
else88 
throw99 
new99 %
InvalidOperationException99 7
(997 8
$str998 y
)99y z
;99z {
}:: 
var<< 
	startTime<< 
=<< 
DateTime<< $
.<<$ %
Now<<% (
;<<( )
var== 
attempt== 
=== 
await== !
_quizEngineRepository==  5
.==5 6%
CreateLearnerAttemptAsync==6 O
(==O P
	learnerId==P Y
,==Y Z
quizId==[ a
,==a b
	startTime==c l
)==l m
;==m n
if>> 
(>> 
attempt>> 
==>> 
null>> 
)>>  
throw?? 
new?? %
InvalidOperationException?? 3
(??3 4
$str??4 u
)??u v
;??v w
returnAA 
attemptAA 
.AA 
LearnerAttemptIdAA +
;AA+ ,
}BB 	
publicEE 
asyncEE 
TaskEE 
SubmitAnswerAsyncEE +
(EE+ ,!
AnswerSubmissionModelEE, A!
answerSubmissionModelEEB W
)EEW X
{FF 	
varGG 
attemptGG 
=GG 
awaitGG !
_quizEngineRepositoryGG  5
.GG5 6&
GetLearnerAttemptByIdAsyncGG6 P
(GGP Q!
answerSubmissionModelGGQ f
.GGf g
LearnerAttemptIdGGg w
)GGw x
;GGx y
ifHH 
(HH 
attemptHH 
==HH 
nullHH 
)HH  
throwII 
newII  
KeyNotFoundExceptionII .
(II. /
$"II/ 1
$strII1 I
{III J!
answerSubmissionModelIIJ _
.II_ `
LearnerAttemptIdII` p
}IIp q
$strIIq |
"II| }
)II} ~
;II~ 
ifJJ 
(JJ 
DateTimeJJ 
.JJ 
NowJJ 
>JJ 
attemptJJ &
.JJ& '
EndTimeJJ' .
)JJ. /
throwKK 
newKK %
InvalidOperationExceptionKK 3
(KK3 4
$strKK4 e
)KKe f
;KKf g
awaitMM !
_quizEngineRepositoryMM '
.MM' ($
ClearLearnerAnswersAsyncMM( @
(MM@ A!
answerSubmissionModelMMA V
.MMV W
LearnerAttemptIdMMW g
,MMg h!
answerSubmissionModelMMi ~
.MM~ 
QuizQuestionId	MM ç
)
MMç é
;
MMé è
varOO 
availableOptionsOO  
=OO! "
awaitOO# (!
_quizEngineRepositoryOO) >
.OO> ?#
GetQuestionOptionsAsyncOO? V
(OOV W!
answerSubmissionModelOOW l
.OOl m
QuizQuestionIdOOm {
)OO{ |
;OO| }
varPP &
availableOptionsIgnoreCasePP *
=PP+ ,
availableOptionsPP- =
.PP= >
SelectPP> D
(PPD E
oPPE F
=>PPG I
oPPJ K
.PPK L
ToLowerPPL S
(PPS T
)PPT U
)PPU V
.PPV W
ToListPPW ]
(PP] ^
)PP^ _
;PP_ `
varQQ 
questionTypeQQ 
=QQ 
awaitQQ $!
_quizEngineRepositoryQQ% :
.QQ: ;$
GetQuestionTypeByIdAsyncQQ; S
(QQS T!
answerSubmissionModelQQT i
.QQi j
QuizQuestionIdQQj x
)QQx y
;QQy z
switchSS 
(SS 
questionTypeSS  
)SS  !
{TT 
caseUU 
$strUU 
:UU 
caseVV 
$strVV 
:VV 
ifWW 
(WW !
answerSubmissionModelWW -
.WW- .
SelectedOptionsWW. =
.WW= >
CountWW> C
>WWD E
$numWWF G
)WWG H
throwXX 
newXX !%
InvalidOperationExceptionXX" ;
(XX; <
$strXX< p
)XXp q
;XXq r
breakYY 
;YY 
caseZZ 
$strZZ 
:ZZ 
if[[ 
([[ !
answerSubmissionModel[[ -
.[[- .
SelectedOptions[[. =
.[[= >
Count[[> C
<[[D E
$num[[F G
||[[H J!
answerSubmissionModel[[K `
.[[` a
SelectedOptions[[a p
.[[p q
Count[[q v
>[[w x
$num[[y z
)[[z {
throw\\ 
new\\ !%
InvalidOperationException\\" ;
(\\; <
$str\\< }
)\\} ~
;\\~ 
break]] 
;]] 
}^^ 
foreach`` 
(`` 
var`` 
selectedOption`` '
in``( *!
answerSubmissionModel``+ @
.``@ A
SelectedOptions``A P
)``P Q
{aa 
varbb 

optionTextbb 
=bb  
selectedOptionbb! /
.bb/ 0
ToStringbb0 8
(bb8 9
)bb9 :
;bb: ;
varcc 
optionTextLowercc #
=cc$ %

optionTextcc& 0
.cc0 1
ToLowercc1 8
(cc8 9
)cc9 :
;cc: ;
ifee 
(ee 
!ee &
availableOptionsIgnoreCaseee /
.ee/ 0
Containsee0 8
(ee8 9
optionTextLoweree9 H
)eeH I
)eeI J
{ff 
throwgg 
newgg %
InvalidOperationExceptiongg 7
(gg7 8
$"gg8 :
$strgg: O
{ggO P

optionTextggP Z
}ggZ [
$str	gg[ ä
"
ggä ã
)
ggã å
;
ggå ç
}hh 
varjj 
optionIdjj 
=jj 
awaitjj $!
_quizEngineRepositoryjj% :
.jj: ;"
GetOptionIdByTextAsyncjj; Q
(jjQ R!
answerSubmissionModeljjR g
.jjg h
QuizQuestionIdjjh v
,jjv w
optionTextLower	jjx á
)
jjá à
;
jjà â
awaitkk !
_quizEngineRepositorykk +
.kk+ ,$
CreateLearnerAnswerAsynckk, D
(kkD E!
answerSubmissionModelkkE Z
.kkZ [
LearnerAttemptIdkk[ k
,kkk l"
answerSubmissionModel	kkm Ç
.
kkÇ É
QuizQuestionId
kkÉ ë
,
kkë í
optionId
kkì õ
)
kkõ ú
;
kkú ù
}ll 
}mm 	
publicoo 
asyncoo 
Taskoo "
SubmitQuizAttemptAsyncoo 0
(oo0 1
Guidoo1 5
	attemptIdoo6 ?
)oo? @
{pp 	
varqq 
attemptqq 
=qq 
awaitqq !
_quizEngineRepositoryqq  5
.qq5 6&
GetLearnerAttemptByIdAsyncqq6 P
(qqP Q
	attemptIdqqQ Z
)qqZ [
;qq[ \
ifrr 
(rr 
attemptrr 
==rr 
nullrr 
)rr  
throwss 
newss  
KeyNotFoundExceptionss .
(ss. /
$"ss/ 1
$strss1 I
{ssI J
	attemptIdssJ S
}ssS T
$strssT _
"ss_ `
)ss` a
;ssa b
vartt 
quiztt 
=tt 
awaittt !
_quizEngineRepositorytt 2
.tt2 3
GetQuizByIdAsynctt3 C
(ttC D
attemptttD K
.ttK L
QuizIdttL R
)ttR S
;ttS T
ifuu 
(uu 
quizuu 
==uu 
nulluu 
)uu 
throwvv 
newvv  
KeyNotFoundExceptionvv .
(vv. /
$"vv/ 1
$strvv1 >
{vv> ?
attemptvv? F
.vvF G
QuizIdvvG M
}vvM N
$strvvN Y
"vvY Z
)vvZ [
;vv[ \
varww 
totalQuestionsww 
=ww  
(ww! "
awaitww" '!
_quizEngineRepositoryww( =
.ww= >$
GetQuestionsForQuizAsyncww> V
(wwV W
quizwwW [
.ww[ \
QuizIdww\ b
)wwb c
)wwc d
.wwd e
Countwwe j
(wwj k
)wwk l
;wwl m
varxx 
existingAnswersxx 
=xx  !
awaitxx" '!
_quizEngineRepositoryxx( =
.xx= >,
 GetLearnerAnswersForAttemptAsyncxx> ^
(xx^ _
	attemptIdxx_ h
)xxh i
;xxi j
ifyy 
(yy 
existingAnswersyy 
.yy  
Selectyy  &
(yy& '
ayy' (
=>yy) +
ayy, -
.yy- .
QuizQuestionIdyy. <
)yy< =
.yy= >
Distinctyy> F
(yyF G
)yyG H
.yyH I
CountyyI N
(yyN O
)yyO P
!=yyQ S
totalQuestionsyyT b
)yyb c
throwzz 
newzz %
InvalidOperationExceptionzz 3
(zz3 4
$str	zz4 ä
)
zzä ã
;
zzã å
var{{ #
individualQuestionMarks{{ '
={{( )
$num{{* -
/{{. /
totalQuestions{{0 >
;{{> ?
float|| 

finalScore|| 
=|| 
$num||  
;||  !
foreach}} 
(}} 
var}} 
answer}} 
in}}  "
existingAnswers}}# 2
)}}2 3
{~~ 
var 
isAnswerCorrect #
=$ %
await& +!
_quizEngineRepository, A
.A B(
IsQuestionOptionCorrectAsyncB ^
(^ _
answer_ e
.e f
QuizQuestionIdf t
,t u
answerv |
.| }
QuestionOptionId	} ç
)
ç é
;
é è
var
ÄÄ 
questionScore
ÄÄ !
=
ÄÄ" #
await
ÄÄ$ )$
CalculateQuestionScore
ÄÄ* @
(
ÄÄ@ A
answer
ÄÄA G
.
ÄÄG H
QuizQuestionId
ÄÄH V
,
ÄÄV W
isAnswerCorrect
ÄÄX g
,
ÄÄg h&
individualQuestionMarksÄÄi Ä
,ÄÄÄ Å
newÄÄÇ Ö%
AnswerSubmissionModelÄÄÜ õ
{
ÅÅ 
LearnerAttemptId
ÇÇ $
=
ÇÇ% &
	attemptId
ÇÇ' 0
,
ÇÇ0 1
QuizQuestionId
ÉÉ "
=
ÉÉ# $
answer
ÉÉ% +
.
ÉÉ+ ,
QuizQuestionId
ÉÉ, :
,
ÉÉ: ;
SelectedOptions
ÑÑ #
=
ÑÑ$ %
new
ÑÑ& )
List
ÑÑ* .
<
ÑÑ. /
string
ÑÑ/ 5
>
ÑÑ5 6
{
ÑÑ7 8
await
ÑÑ9 >#
_quizEngineRepository
ÑÑ? T
.
ÑÑT U$
GetOptionTextByIdAsync
ÑÑU k
(
ÑÑk l
answer
ÑÑl r
.
ÑÑr s
QuestionOptionIdÑÑs É
)ÑÑÉ Ñ
}ÑÑÖ Ü
}
ÖÖ 
)
ÖÖ 
;
ÖÖ 

finalScore
ÜÜ 
+=
ÜÜ 
questionScore
ÜÜ +
;
ÜÜ+ ,
}
áá 
attempt
àà 
.
àà 
Score
àà 
=
àà 
(
àà 
float
àà "
)
àà" #
Math
àà# '
.
àà' (
Round
àà( -
(
àà- .

finalScore
àà. 8
)
àà8 9
;
àà9 :
attempt
ââ 
.
ââ 
EndTime
ââ 
=
ââ 
DateTime
ââ &
.
ââ& '
Now
ââ' *
;
ââ* +
await
ää #
_quizEngineRepository
ää '
.
ää' ('
UpdateLearnerAttemptAsync
ää( A
(
ääA B
attempt
ääB I
)
ääI J
;
ääJ K
}
ãã 	
public
éé 
async
éé 
Task
éé 
<
éé 
Guid
éé 
>
éé 
RetakeQuizAsync
éé  /
(
éé/ 0
Guid
éé0 4
	learnerId
éé5 >
,
éé> ?
Guid
éé@ D
quizId
ééE K
)
ééK L
{
èè 	
var
êê 
quiz
êê 
=
êê 
await
êê #
_quizEngineRepository
êê 2
.
êê2 3
GetQuizByIdAsync
êê3 C
(
êêC D
quizId
êêD J
)
êêJ K
;
êêK L
if
ëë 
(
ëë 
quiz
ëë 
==
ëë 
null
ëë 
)
ëë 
throw
íí 
new
íí "
KeyNotFoundException
íí .
(
íí. /
$"
íí/ 1
$str
íí1 >
{
íí> ?
quizId
íí? E
}
ííE F
$str
ííF Q
"
ííQ R
)
ííR S
;
ííS T
var
îî  
isAllowedToAttempt
îî "
=
îî# $
await
îî% *#
_quizEngineRepository
îî+ @
.
îî@ A)
IsAllowedToAttemptQuizAsync
îîA \
(
îî\ ]
	learnerId
îî] f
,
îîf g
quizId
îîh n
)
îîn o
;
îîo p
if
ïï 
(
ïï 
!
ïï  
isAllowedToAttempt
ïï #
)
ïï# $
{
ññ 
var
óó 
existingAttempts
óó $
=
óó% &
await
óó' ,#
_quizEngineRepository
óó- B
.
óóB C,
GetLearnerAttemptsForQuizAsync
óóC a
(
óóa b
	learnerId
óób k
,
óók l
quizId
óóm s
)
óós t
;
óót u
var
òò 
passMark
òò 
=
òò 
quiz
òò #
.
òò# $
PassMark
òò$ ,
;
òò, -
var
ôô 
hasPassedQuiz
ôô !
=
ôô" #
existingAttempts
ôô$ 4
.
ôô4 5
Any
ôô5 8
(
ôô8 9
a
ôô9 :
=>
ôô; =
a
ôô> ?
.
ôô? @
Score
ôô@ E
>=
ôôF H
passMark
ôôI Q
)
ôôQ R
;
ôôR S
if
õõ 
(
õõ 
hasPassedQuiz
õõ !
)
õõ! "
throw
úú 
new
úú '
InvalidOperationException
úú 7
(
úú7 8
$strúú8 á
)úúá à
;úúà â
else
ùù 
throw
ûû 
new
ûû '
InvalidOperationException
ûû 7
(
ûû7 8
$str
ûû8 y
)
ûûy z
;
ûûz {
}
üü 
var
°° 
	startTime
°° 
=
°° 
DateTime
°° $
.
°°$ %
Now
°°% (
;
°°( )
var
¢¢ 
attempt
¢¢ 
=
¢¢ 
await
¢¢ #
_quizEngineRepository
¢¢  5
.
¢¢5 6'
CreateLearnerAttemptAsync
¢¢6 O
(
¢¢O P
	learnerId
¢¢P Y
,
¢¢Y Z
quizId
¢¢[ a
,
¢¢a b
	startTime
¢¢c l
)
¢¢l m
;
¢¢m n
return
££ 
attempt
££ 
.
££ 
LearnerAttemptId
££ +
;
££+ ,
}
§§ 	
private
ßß 
async
ßß 
Task
ßß 
<
ßß 
float
ßß  
>
ßß  !$
CalculateQuestionScore
ßß" 8
(
ßß8 9
Guid
ßß9 =
quizQuestionId
ßß> L
,
ßßL M
bool
ßßN R
isAnswerCorrect
ßßS b
,
ßßb c
float
ßßd i&
individualQuestionMarksßßj Å
,ßßÅ Ç%
AnswerSubmissionModelßßÉ ò%
answerSubmissionModelßßô Æ
)ßßÆ Ø
{
®® 	
var
©© 
questionType
©© 
=
©© 
await
©© $#
_quizEngineRepository
©©% :
.
©©: ;&
GetQuestionTypeByIdAsync
©©; S
(
©©S T
quizQuestionId
©©T b
)
©©b c
;
©©c d
switch
™™ 
(
™™ 
questionType
™™  
)
™™  !
{
´´ 
case
¨¨ 
$str
¨¨ 
:
¨¨ 
case
≠≠ 
$str
≠≠ 
:
≠≠ 
return
ÆÆ 
isAnswerCorrect
ÆÆ *
?
ÆÆ+ ,%
individualQuestionMarks
ÆÆ- D
:
ÆÆE F
$num
ÆÆG H
;
ÆÆH I
case
∞∞ 
$str
∞∞ 
:
∞∞ 
var
±± 
correctOptions
±± &
=
±±' (
await
±±) .#
_quizEngineRepository
±±/ D
.
±±D E/
!GetCorrectOptionsForQuestionAsync
±±E f
(
±±f g
quizQuestionId
±±g u
)
±±u v
;
±±v w
var
≤≤  
correctOptionCount
≤≤ *
=
≤≤+ ,
correctOptions
≤≤- ;
.
≤≤; <
Count
≤≤< A
(
≤≤A B
)
≤≤B C
;
≤≤C D
var
≥≥ 
selectedOptions
≥≥ '
=
≥≥( )#
answerSubmissionModel
≥≥* ?
.
≥≥? @
SelectedOptions
≥≥@ O
.
≥≥O P
Select
≥≥P V
(
≥≥V W
o
≥≥W X
=>
≥≥Y [
o
≥≥\ ]
.
≥≥] ^
ToString
≥≥^ f
(
≥≥f g
)
≥≥g h
)
≥≥h i
.
≥≥i j
ToList
≥≥j p
(
≥≥p q
)
≥≥q r
;
≥≥r s
var
¥¥ &
correctlySelectedOptions
¥¥ 0
=
¥¥1 2
selectedOptions
¥¥3 B
.
¥¥B C
	Intersect
¥¥C L
(
¥¥L M
correctOptions
¥¥M [
)
¥¥[ \
.
¥¥\ ]
Count
¥¥] b
(
¥¥b c
)
¥¥c d
;
¥¥d e
if
∂∂ 
(
∂∂ &
correctlySelectedOptions
∂∂ 0
==
∂∂1 3 
correctOptionCount
∂∂4 F
)
∂∂F G
{
∑∑ 
return
∏∏ %
individualQuestionMarks
∏∏ 6
;
∏∏6 7
}
ππ 
else
∫∫ 
if
∫∫ 
(
∫∫ &
correctlySelectedOptions
∫∫ 5
>
∫∫6 7
$num
∫∫8 9
)
∫∫9 :
{
ªª 
var
ºº 
partialMark
ºº '
=
ºº( )
(
ºº* +%
individualQuestionMarks
ºº+ B
/
ººC D 
correctOptionCount
ººE W
)
ººW X
*
ººY Z&
correctlySelectedOptions
ºº[ s
;
ººs t
return
ΩΩ 
partialMark
ΩΩ *
;
ΩΩ* +
}
ææ 
else
øø 
{
¿¿ 
return
¡¡ 
$num
¡¡  
;
¡¡  !
}
¬¬ 
default
ƒƒ 
:
ƒƒ 
return
≈≈ 
$num
≈≈ 
;
≈≈ 
}
∆∆ 
}
«« 	
public
   
async
   
Task
   
<
   )
LearnerQuizAttemptViewModel
   5
>
  5 6(
GetLearnerQuizAttemptAsync
  7 Q
(
  Q R
Guid
  R V
	attemptId
  W `
)
  ` a
{
ÀÀ 	
return
ÃÃ 
await
ÃÃ #
_quizEngineRepository
ÃÃ .
.
ÃÃ. /(
GetLearnerQuizAttemptAsync
ÃÃ/ I
(
ÃÃI J
	attemptId
ÃÃJ S
)
ÃÃS T
;
ÃÃT U
}
ÕÕ 	
public
ŒŒ 
async
ŒŒ 
Task
ŒŒ 
<
ŒŒ /
!LearnerQuizAttemptResultViewModel
ŒŒ ;
>
ŒŒ; <.
 GetLearnerQuizAttemptResultAsync
ŒŒ= ]
(
ŒŒ] ^
Guid
ŒŒ^ b
	attemptId
ŒŒc l
)
ŒŒl m
{
œœ 	
return
–– 
await
–– #
_quizEngineRepository
–– .
.
––. /.
 GetLearnerQuizAttemptResultAsync
––/ O
(
––O P
	attemptId
––P Y
)
––Y Z
;
––Z [
}
—— 	
public
◊◊ 
async
◊◊ 
Task
◊◊ $
SubmitAnswerBatchAsync
◊◊ 0
(
◊◊0 1(
AnswerSubmissionBatchModel
◊◊1 K
model
◊◊L Q
)
◊◊Q R
{
ÿÿ 	
var
ŸŸ 
validationErrors
ŸŸ  
=
ŸŸ! "
new
ŸŸ# &
List
ŸŸ' +
<
ŸŸ+ ,
string
ŸŸ, 2
>
ŸŸ2 3
(
ŸŸ3 4
)
ŸŸ4 5
;
ŸŸ5 6
foreach
€€ 
(
€€ 
var
€€ 

submission
€€ #
in
€€$ &
model
€€' ,
.
€€, -
AnswerSubmissions
€€- >
)
€€> ?
{
‹‹ 
var
ﬁﬁ 
errors
ﬁﬁ 
=
ﬁﬁ 
await
ﬁﬁ "%
ValidateSubmissionAsync
ﬁﬁ# :
(
ﬁﬁ: ;

submission
ﬁﬁ; E
)
ﬁﬁE F
;
ﬁﬁF G
if
ﬂﬂ 
(
ﬂﬂ 
errors
ﬂﬂ 
.
ﬂﬂ 
Count
ﬂﬂ  
>
ﬂﬂ! "
$num
ﬂﬂ# $
)
ﬂﬂ$ %
{
‡‡ 
validationErrors
·· $
.
··$ %
AddRange
··% -
(
··- .
errors
··. 4
)
··4 5
;
··5 6
continue
‚‚ 
;
‚‚ 
}
„„ 
foreach
ÂÂ 
(
ÂÂ 
var
ÂÂ 
option
ÂÂ #
in
ÂÂ$ &

submission
ÂÂ' 1
.
ÂÂ1 2
SelectedOptions
ÂÂ2 A
)
ÂÂA B
{
ÊÊ 
var
ÁÁ 
learnerAnswer
ÁÁ %
=
ÁÁ& '
new
ÁÁ( +$
LearnerAnswerViewModel
ÁÁ, B
{
ËË 
LearnerAnswerId
ÈÈ '
=
ÈÈ( )
Guid
ÈÈ* .
.
ÈÈ. /
NewGuid
ÈÈ/ 6
(
ÈÈ6 7
)
ÈÈ7 8
,
ÈÈ8 9
LearnerAttemptId
ÍÍ (
=
ÍÍ) *

submission
ÍÍ+ 5
.
ÍÍ5 6
LearnerAttemptId
ÍÍ6 F
,
ÍÍF G
QuizQuestionId
ÎÎ &
=
ÎÎ' (

submission
ÎÎ) 3
.
ÎÎ3 4
QuizQuestionId
ÎÎ4 B
,
ÎÎB C
QuestionOptionId
ÏÏ (
=
ÏÏ) *
new
ÏÏ+ .
Guid
ÏÏ/ 3
(
ÏÏ3 4
option
ÏÏ4 :
)
ÏÏ: ;
}
ÌÌ 
;
ÌÌ 
await
ÔÔ #
_quizEngineRepository
ÔÔ /
.
ÔÔ/ 0$
SaveLearnerAnswerAsync
ÔÔ0 F
(
ÔÔF G
learnerAnswer
ÔÔG T
)
ÔÔT U
;
ÔÔU V
}
 
}
ÒÒ 
if
ÛÛ 
(
ÛÛ 
validationErrors
ÛÛ  
.
ÛÛ  !
Count
ÛÛ! &
>
ÛÛ' (
$num
ÛÛ) *
)
ÛÛ* +
{
ÙÙ 
throw
ıı 
new
ıı 
	Exception
ıı #
(
ıı# $
string
ıı$ *
.
ıı* +
Join
ıı+ /
(
ıı/ 0
$str
ıı0 4
,
ıı4 5
validationErrors
ıı6 F
)
ııF G
)
ııG H
;
ııH I
}
ˆˆ 
}
˜˜ 	
private
˘˘ 
async
˘˘ 
Task
˘˘ 
<
˘˘ 
List
˘˘ 
<
˘˘  
string
˘˘  &
>
˘˘& '
>
˘˘' (%
ValidateSubmissionAsync
˘˘) @
(
˘˘@ A#
AnswerSubmissionModel
˘˘A V

submission
˘˘W a
)
˘˘a b
{
˙˙ 	
var
˚˚ 
errors
˚˚ 
=
˚˚ 
new
˚˚ 
List
˚˚ !
<
˚˚! "
string
˚˚" (
>
˚˚( )
(
˚˚) *
)
˚˚* +
;
˚˚+ ,
if
˛˛ 
(
˛˛ 

submission
˛˛ 
.
˛˛ 
LearnerAttemptId
˛˛ +
==
˛˛, .
Guid
˛˛/ 3
.
˛˛3 4
Empty
˛˛4 9
)
˛˛9 :
{
ˇˇ 
errors
ÄÄ 
.
ÄÄ 
Add
ÄÄ 
(
ÄÄ 
$str
ÄÄ 9
)
ÄÄ9 :
;
ÄÄ: ;
}
ÅÅ 
if
ÑÑ 
(
ÑÑ 

submission
ÑÑ 
.
ÑÑ 
QuizQuestionId
ÑÑ )
==
ÑÑ* ,
Guid
ÑÑ- 1
.
ÑÑ1 2
Empty
ÑÑ2 7
)
ÑÑ7 8
{
ÖÖ 
errors
ÜÜ 
.
ÜÜ 
Add
ÜÜ 
(
ÜÜ 
$str
ÜÜ 7
)
ÜÜ7 8
;
ÜÜ8 9
}
áá 
if
ää 
(
ää 

submission
ää 
.
ää 
SelectedOptions
ää *
==
ää+ -
null
ää. 2
||
ää3 5

submission
ää6 @
.
ää@ A
SelectedOptions
ääA P
.
ääP Q
Count
ääQ V
==
ääW Y
$num
ääZ [
)
ää[ \
{
ãã 
errors
åå 
.
åå 
Add
åå 
(
åå 
$str
åå 1
)
åå1 2
;
åå2 3
}
çç 
var
êê 
question
êê 
=
êê 
await
êê  #
_quizEngineRepository
êê! 6
.
êê6 7&
GetQuizQuestionByIdAsync
êê7 O
(
êêO P

submission
êêP Z
.
êêZ [
QuizQuestionId
êê[ i
)
êêi j
;
êêj k
if
ëë 
(
ëë 
question
ëë 
!=
ëë 
null
ëë  
)
ëë  !
{
íí 
if
ìì 
(
ìì 
question
ìì 
.
ìì 
QuestionType
ìì )
==
ìì* ,
$str
ìì- 2
&&
ìì3 5
(
ìì6 7

submission
ìì7 A
.
ììA B
SelectedOptions
ììB Q
.
ììQ R
Count
ììR W
<
ììX Y
$num
ììZ [
||
ìì\ ^

submission
ìì_ i
.
ììi j
SelectedOptions
ììj y
.
ììy z
Count
ììz 
>ììÄ Å
$numììÇ É
)ììÉ Ñ
)ììÑ Ö
{
îî 
errors
ïï 
.
ïï 
Add
ïï 
(
ïï 
$str
ïï U
)
ïïU V
;
ïïV W
}
ññ 
}
óó 
else
òò 
{
ôô 
errors
öö 
.
öö 
Add
öö 
(
öö 
$str
öö 5
)
öö5 6
;
öö6 7
}
õõ 
return
üü 
errors
üü 
;
üü 
}
†† 	
public
°° 
async
°° 
Task
°° 
CacheAnswersAsync
°° *
(
°°* +)
CachedAnswerSubmissionModel
°°+ F
model
°°G L
)
°°L M
{
¢¢ 	
var
§§ 
cacheEntryOptions
§§ !
=
§§" #
new
§§$ '%
MemoryCacheEntryOptions
§§( ?
(
§§? @
)
§§@ A
.
§§A B"
SetSlidingExpiration
§§B V
(
§§V W
TimeSpan
§§W _
.
§§_ `
FromMinutes
§§` k
(
§§k l
$num
§§l n
)
§§n o
)
§§o p
;
§§p q
_memoryCache
•• 
.
•• 
Set
•• 
(
•• 
$"
•• 
$str
•• -
{
••- .
model
••. 3
.
••3 4
LearnerAttemptId
••4 D
}
••D E
"
••E F
,
••F G
model
••H M
.
••M N
QuestionAnswers
••N ]
,
••] ^
cacheEntryOptions
••_ p
)
••p q
;
••q r
await
®® #
_quizEngineRepository
®® '
.
®®' ($
SaveCachedAnswersAsync
®®( >
(
®®> ?
model
®®? D
.
®®D E
LearnerAttemptId
®®E U
,
®®U V
model
®®W \
.
®®\ ]
QuestionAnswers
®®] l
)
®®l m
;
®®m n
}
´´ 	
public
¨¨ 
async
¨¨ 
Task
¨¨ &
SubmitCachedAnswersAsync
¨¨ 2
(
¨¨2 3
Guid
¨¨3 7
learnerAttemptId
¨¨8 H
)
¨¨H I
{
≠≠ 	
if
ØØ 
(
ØØ 
_memoryCache
ØØ 
.
ØØ 
TryGetValue
ØØ (
(
ØØ( )
$"
ØØ) +
$str
ØØ+ 9
{
ØØ9 :
learnerAttemptId
ØØ: J
}
ØØJ K
"
ØØK L
,
ØØL M
out
ØØN Q

Dictionary
ØØR \
<
ØØ\ ]
Guid
ØØ] a
,
ØØa b
List
ØØc g
<
ØØg h
string
ØØh n
>
ØØn o
>
ØØo p
questionAnswersØØq Ä
)ØØÄ Å
)ØØÅ Ç
{
∞∞ 
var
≤≤ $
answerSubmissionModels
≤≤ *
=
≤≤+ ,
questionAnswers
≤≤- <
.
≤≤< =
Select
≤≤= C
(
≤≤C D
kvp
≤≤D G
=>
≤≤H J
new
≤≤K N#
AnswerSubmissionModel
≤≤O d
{
≥≥ 
LearnerAttemptId
¥¥ $
=
¥¥% &
learnerAttemptId
¥¥' 7
,
¥¥7 8
QuizQuestionId
µµ "
=
µµ# $
kvp
µµ% (
.
µµ( )
Key
µµ) ,
,
µµ, -
SelectedOptions
∂∂ #
=
∂∂$ %
kvp
∂∂& )
.
∂∂) *
Value
∂∂* /
}
∑∑ 
)
∑∑ 
.
∑∑ 
ToList
∑∑ 
(
∑∑ 
)
∑∑ 
;
∑∑ 
foreach
∫∫ 
(
∫∫ 
var
∫∫ #
answerSubmissionModel
∫∫ 2
in
∫∫3 5$
answerSubmissionModels
∫∫6 L
)
∫∫L M
{
ªª 
await
ºº #
_quizEngineRepository
ºº /
.
ºº/ 0
SubmitAnswerAsync
ºº0 A
(
ººA B#
answerSubmissionModel
ººB W
)
ººW X
;
ººX Y
}
ΩΩ 
_memoryCache
¿¿ 
.
¿¿ 
Remove
¿¿ #
(
¿¿# $
$"
¿¿$ &
$str
¿¿& 4
{
¿¿4 5
learnerAttemptId
¿¿5 E
}
¿¿E F
"
¿¿F G
)
¿¿G H
;
¿¿H I
}
¡¡ 
else
¬¬ 
{
√√ 
throw
ƒƒ 
new
ƒƒ '
InvalidOperationException
ƒƒ 3
(
ƒƒ3 4
$str
ƒƒ4 p
)
ƒƒp q
;
ƒƒq r
}
≈≈ 
}
∆∆ 	
}
«« 
}»» ¢&
3D:\backend\LXP.Core\Services\QuizFeedbackService.cs
	namespace 	
LXP
 
. 
Core 
. 
Services 
{ 
public		 

class		 
QuizFeedbackService		 $
:		% & 
IQuizFeedbackService		' ;
{

 
private 
readonly #
IQuizFeedbackRepository 0#
_quizFeedbackRepository1 H
;H I
public 
QuizFeedbackService "
(" ##
IQuizFeedbackRepository# :"
quizFeedbackRepository; Q
)Q R
{ 	#
_quizFeedbackRepository #
=$ %"
quizFeedbackRepository& <
;< =
} 	
public 
Guid 
AddFeedbackQuestion '
(' ()
QuizfeedbackquestionViewModel( E#
quizfeedbackquestionDtoF ]
,] ^
List_ c
<c d1
$QuizFeedbackQuestionsOptionViewModel	d à
>
à â
options
ä ë
)
ë í
{ 	
return #
_quizFeedbackRepository *
.* +
AddFeedbackQuestion+ >
(> ?#
quizfeedbackquestionDto? V
,V W
optionsX _
)_ `
;` a
} 	
public 
List 
< +
QuizfeedbackquestionNoViewModel 3
>3 4#
GetAllFeedbackQuestions5 L
(L M
)M N
{ 	
return #
_quizFeedbackRepository *
.* +#
GetAllFeedbackQuestions+ B
(B C
)C D
;D E
} 	
public +
QuizfeedbackquestionNoViewModel .#
GetFeedbackQuestionById/ F
(F G
GuidG K"
quizFeedbackQuestionIdL b
)b c
{   	
return!! #
_quizFeedbackRepository!! *
.!!* +#
GetFeedbackQuestionById!!+ B
(!!B C"
quizFeedbackQuestionId!!C Y
)!!Y Z
;!!Z [
}"" 	
public$$ 
bool$$ "
UpdateFeedbackQuestion$$ *
($$* +
Guid$$+ /"
quizFeedbackQuestionId$$0 F
,$$F G)
QuizfeedbackquestionViewModel$$H e#
quizfeedbackquestionDto$$f }
,$$} ~
List	$$ É
<
$$É Ñ2
$QuizFeedbackQuestionsOptionViewModel
$$Ñ ®
>
$$® ©
options
$$™ ±
)
$$± ≤
{%% 	
return&& #
_quizFeedbackRepository&& *
.&&* +"
UpdateFeedbackQuestion&&+ A
(&&A B"
quizFeedbackQuestionId&&B X
,&&X Y#
quizfeedbackquestionDto&&Z q
,&&q r
options&&s z
)&&z {
;&&{ |
}'' 	
public)) 
bool)) "
DeleteFeedbackQuestion)) *
())* +
Guid))+ /"
quizFeedbackQuestionId))0 F
)))F G
{** 	
return++ #
_quizFeedbackRepository++ *
.++* +"
DeleteFeedbackQuestion+++ A
(++A B"
quizFeedbackQuestionId++B X
)++X Y
;++Y Z
},, 	
public-- 
List-- 
<-- +
QuizfeedbackquestionNoViewModel-- 3
>--3 4(
GetFeedbackQuestionsByQuizId--5 Q
(--Q R
Guid--R V
quizId--W ]
)--] ^
{.. 	
return// #
_quizFeedbackRepository// *
.//* +(
GetFeedbackQuestionsByQuizId//+ G
(//G H
quizId//H N
)//N O
;//O P
}00 	
public22 
bool22 +
DeleteFeedbackQuestionsByQuizId22 3
(223 4
Guid224 8
quizId229 ?
)22? @
{33 	
try44 
{55 
var66 
	questions66 
=66 #
_quizFeedbackRepository66  7
.667 8(
GetFeedbackQuestionsByQuizId668 T
(66T U
quizId66U [
)66[ \
;66\ ]
if77 
(77 
	questions77 
==77  
null77! %
||77& (
	questions77) 2
.772 3
Count773 8
==779 ;
$num77< =
)77= >
return88 
false88  
;88  !
foreach:: 
(:: 
var:: 
question:: %
in::& (
	questions::) 2
)::2 3
{;; #
_quizFeedbackRepository<< +
.<<+ ,"
DeleteFeedbackQuestion<<, B
(<<B C
question<<C K
.<<K L"
QuizFeedbackQuestionId<<L b
)<<b c
;<<c d
}== 
return>> 
true>> 
;>> 
}?? 
catch@@ 
(@@ 
	Exception@@ 
)@@ 
{AA 
returnBB 
falseBB 
;BB 
}CC 
}DD 	
}EE 
}FF Î
3D:\backend\LXP.Core\Services\QuizQuestionService.cs
	namespace 	
LXP
 
. 
Core 
. 
Services 
{ 
public 

class 
QuizQuestionService $
:% & 
IQuizQuestionService' ;
{ 
private		 
readonly		 #
IQuizQuestionRepository		 0#
_quizQuestionRepository		1 H
;		H I
public 
QuizQuestionService "
(" ##
IQuizQuestionRepository# :"
quizQuestionRepository; Q
)Q R
{ 	#
_quizQuestionRepository #
=$ %"
quizQuestionRepository& <
;< =
} 	
public 
async 
Task 
< 
Guid 
> 
AddQuestionAsync  0
(0 1!
QuizQuestionViewModel1 F
quizQuestionDtoG V
,V W
ListX \
<\ ]#
QuestionOptionViewModel] t
>t u
optionsv }
)} ~
{ 	
return 
await #
_quizQuestionRepository 0
.0 1
AddQuestionAsync1 A
(A B
quizQuestionDtoB Q
,Q R
optionsS Z
)Z [
;[ \
} 	
public 
async 
Task 
< 
bool 
> 
UpdateQuestionAsync  3
(3 4
Guid4 8
quizQuestionId9 G
,G H!
QuizQuestionViewModelI ^
quizQuestionDto_ n
,n o
Listp t
<t u$
QuestionOptionViewModel	u å
>
å ç
options
é ï
)
ï ñ
{ 	
return 
await #
_quizQuestionRepository 0
.0 1
UpdateQuestionAsync1 D
(D E
quizQuestionIdE S
,S T
quizQuestionDtoU d
,d e
optionsf m
)m n
;n o
} 	
public 
async 
Task 
< 
bool 
> 
DeleteQuestionAsync  3
(3 4
Guid4 8
quizQuestionId9 G
)G H
{ 	
return 
await #
_quizQuestionRepository 0
.0 1
DeleteQuestionAsync1 D
(D E
quizQuestionIdE S
)S T
;T U
} 	
public 
async 
Task 
< 
List 
< #
QuizQuestionNoViewModel 6
>6 7
>7 8 
GetAllQuestionsAsync9 M
(M N
)N O
{   	
return!! 
await!! #
_quizQuestionRepository!! 0
.!!0 1 
GetAllQuestionsAsync!!1 E
(!!E F
)!!F G
;!!G H
}"" 	
public$$ 
async$$ 
Task$$ 
<$$ 
List$$ 
<$$ #
QuizQuestionNoViewModel$$ 6
>$$6 7
>$$7 8(
GetAllQuestionsByQuizIdAsync$$9 U
($$U V
Guid$$V Z
quizId$$[ a
)$$a b
{%% 	
return&& 
await&& #
_quizQuestionRepository&& 0
.&&0 1(
GetAllQuestionsByQuizIdAsync&&1 M
(&&M N
quizId&&N T
)&&T U
;&&U V
}'' 	
public)) 
async)) 
Task)) 
<)) #
QuizQuestionNoViewModel)) 1
>))1 2 
GetQuestionByIdAsync))3 G
())G H
Guid))H L
quizQuestionId))M [
)))[ \
{** 	
return++ 
await++ #
_quizQuestionRepository++ 0
.++0 1 
GetQuestionByIdAsync++1 E
(++E F
quizQuestionId++F T
)++T U
;++U V
},, 	
}-- 
}// ∫
2D:\backend\LXP.Core\Services\QuizReportServices.cs
	namespace

 	
LXP


 
.

 
Core

 
.

 
Services

 
{ 
public 

class 
QuizReportServices #
:$ %
IQuizReportServices& 9
{ 
private 
readonly !
IQuizReportRepository .!
_quizReportRepository/ D
;D E
public 
QuizReportServices !
(! "!
IQuizReportRepository" 7 
quizReportRepository8 L
)L M
{ 	!
_quizReportRepository !
=" # 
quizReportRepository$ 8
;8 9
} 	
public 
IEnumerable 
< 
QuizReportViewModel .
>. /
GetQuizReports0 >
(> ?
)? @
{ 	
return !
_quizReportRepository (
.( )
GetQuizReports) 7
(7 8
)8 9
;9 :
} 	
} 
} ƒL
+D:\backend\LXP.Core\Services\QuizService.cs
	namespace 	
LXP
 
. 
Core 
. 
Services 
{ 
public 

class 
QuizService 
: 
IQuizService +
{		 
private

 
readonly

 
IQuizRepository

 (
_quizRepository

) 8
;

8 9
public 
QuizService 
( 
IQuizRepository *
quizRepository+ 9
)9 :
{ 	
_quizRepository 
= 
quizRepository ,
;, -
} 	
public 
void 

CreateQuiz 
( 
QuizViewModel ,
quiz- 1
,1 2
Guid3 7
topicId8 ?
)? @
{ 	
var 
topic 
= 
_quizRepository '
.' (
GetTopicById( 4
(4 5
topicId5 <
)< =
;= >
if 
( 
topic 
== 
null 
) 
throw 
new 
	Exception #
(# $
$"$ &
$str& 4
{4 5
topicId5 <
}< =
$str= H
"H I
)I J
;J K
var 
courseId 
= 
topic  
.  !
CourseId! )
;) *
var 
existingQuiz 
= 
_quizRepository .
.. /
GetQuizByTopicId/ ?
(? @
topicId@ G
)G H
;H I
if 
( 
existingQuiz 
!= 
null  $
)$ %
throw 
new 
	Exception #
(# $
$"$ &
$str& R
{R S
topicIdS Z
}Z [
$str[ \
"\ ]
)] ^
;^ _
ValidateQuiz 
( 
quiz 
) 
; 
var   

quizEntity   
=   
new    
Quiz  ! %
{!! 
QuizId"" 
="" 
quiz"" 
."" 
QuizId"" $
,""$ %
CourseId## 
=## 
courseId## #
,### $
TopicId$$ 
=$$ 
topicId$$ !
,$$! "

NameOfQuiz%% 
=%% 
quiz%% !
.%%! "

NameOfQuiz%%" ,
,%%, -
Duration&& 
=&& 
quiz&& 
.&&  
Duration&&  (
,&&( )
PassMark'' 
='' 
quiz'' 
.''  
PassMark''  (
,''( )
AttemptsAllowed(( 
=((  !
quiz((" &
.((& '
AttemptsAllowed((' 6
,((6 7
	CreatedBy)) 
=)) 
quiz))  
.))  !
	CreatedBy))! *
,))* +
	CreatedAt** 
=** 
quiz**  
.**  !
	CreatedAt**! *
}++ 
;++ 
_quizRepository-- 
.-- 
AddQuiz-- #
(--# $

quizEntity--$ .
)--. /
;--/ 0
}.. 	
public00 
void00 

UpdateQuiz00 
(00 
QuizViewModel00 ,
quiz00- 1
)001 2
{11 	
ValidateQuiz22 
(22 
quiz22 
)22 
;22 
var44 

quizEntity44 
=44 
_quizRepository44 ,
.44, -
GetQuizById44- 8
(448 9
quiz449 =
.44= >
QuizId44> D
)44D E
;44E F
if55 
(55 

quizEntity55 
!=55 
null55 "
)55" #
{66 

quizEntity77 
.77 

NameOfQuiz77 %
=77& '
quiz77( ,
.77, -

NameOfQuiz77- 7
;777 8

quizEntity88 
.88 
Duration88 #
=88$ %
quiz88& *
.88* +
Duration88+ 3
;883 4

quizEntity99 
.99 
PassMark99 #
=99$ %
quiz99& *
.99* +
PassMark99+ 3
;993 4

quizEntity:: 
.:: 
AttemptsAllowed:: *
=::+ ,
quiz::- 1
.::1 2
AttemptsAllowed::2 A
;::A B
_quizRepository<< 
.<<  

UpdateQuiz<<  *
(<<* +

quizEntity<<+ 5
)<<5 6
;<<6 7
}== 
}>> 	
public@@ 
void@@ 

DeleteQuiz@@ 
(@@ 
Guid@@ #
quizId@@$ *
)@@* +
{AA 	
varBB 

quizEntityBB 
=BB 
_quizRepositoryBB ,
.BB, -
GetQuizByIdBB- 8
(BB8 9
quizIdBB9 ?
)BB? @
;BB@ A
ifCC 
(CC 

quizEntityCC 
!=CC 
nullCC "
)CC" #
{DD 
_quizRepositoryEE 
.EE  

DeleteQuizEE  *
(EE* +

quizEntityEE+ 5
)EE5 6
;EE6 7
}FF 
}GG 	
publicII 
IEnumerableII 
<II 
QuizViewModelII (
>II( )
GetAllQuizzesII* 7
(II7 8
)II8 9
{JJ 	
returnKK 
_quizRepositoryKK "
.KK" #
GetAllQuizzesKK# 0
(KK0 1
)KK1 2
.LL 
SelectLL 
(LL 
qLL 
=>LL 
newLL  
QuizViewModelLL! .
{MM 
QuizIdNN 
=NN 
qNN 
.NN 
QuizIdNN %
,NN% &
CourseIdOO 
=OO 
qOO  !
.OO! "
CourseIdOO" *
,OO* +
TopicIdPP 
=PP 
qPP  !
.PP! "
TopicIdPP" )
,PP) *

NameOfQuizQQ 
=QQ  
qQQ! "
.QQ" #

NameOfQuizQQ# -
,QQ- .
DurationRR 
=RR 
qRR  
.RR  !
DurationRR! )
,RR) *
PassMarkSS 
=SS 
qSS  
.SS  !
PassMarkSS! )
,SS) *
AttemptsAllowedTT #
=TT$ %
qTT& '
.TT' (
AttemptsAllowedTT( 7
}UU 
)UU 
.VV 
ToListVV 
(VV 
)VV 
;VV 
}WW 	
publicYY 
QuizViewModelYY 
GetQuizByIdYY (
(YY( )
GuidYY) -
quizIdYY. 4
)YY4 5
{ZZ 	
var[[ 
quiz[[ 
=[[ 
_quizRepository[[ &
.[[& '
GetQuizById[[' 2
([[2 3
quizId[[3 9
)[[9 :
;[[: ;
if\\ 
(\\ 
quiz\\ 
==\\ 
null\\ 
)\\ 
return]] 
null]] 
;]] 
return__ 
new__ 
QuizViewModel__ $
{`` 
QuizIdaa 
=aa 
quizaa 
.aa 
QuizIdaa $
,aa$ %
CourseIdbb 
=bb 
quizbb 
.bb 
CourseIdbb '
,bb' (
TopicIdcc 
=cc 
quizcc 
.cc 
TopicIdcc %
,cc% &

NameOfQuizdd 
=dd 
quizdd !
.dd! "

NameOfQuizdd" ,
,dd, -
Durationee 
=ee 
quizee 
.ee  
Durationee  (
,ee( )
PassMarkff 
=ff 
quizff 
.ff  
PassMarkff  (
,ff( )
AttemptsAllowedgg 
=gg  !
quizgg" &
.gg& '
AttemptsAllowedgg' 6
}hh 
;hh 
}ii 	
publickk 
Guidkk 
?kk 
GetQuizIdByTopicIdkk '
(kk' (
Guidkk( ,
topicIdkk- 4
)kk4 5
{ll 	
varmm 
quizmm 
=mm 
_quizRepositorymm &
.mm& '
GetQuizByTopicIdmm' 7
(mm7 8
topicIdmm8 ?
)mm? @
;mm@ A
returnnn 
quiznn 
?nn 
.nn 
QuizIdnn 
;nn  
}oo 	
privateqq 
voidqq 
ValidateQuizqq !
(qq! "
QuizViewModelqq" /
quizqq0 4
)qq4 5
{rr 	
ifss 
(ss 
stringss 
.ss 
IsNullOrWhiteSpacess )
(ss) *
quizss* .
.ss. /

NameOfQuizss/ 9
)ss9 :
)ss: ;
throwtt 
newtt 
	Exceptiontt #
(tt# $
$strtt$ I
)ttI J
;ttJ K
ifuu 
(uu 
quizuu 
.uu 
Durationuu 
<=uu  
$numuu! "
)uu" #
throwvv 
newvv 
	Exceptionvv #
(vv# $
$strvv$ J
)vvJ K
;vvK L
ifww 
(ww 
quizww 
.ww 
PassMarkww 
<=ww  
$numww! "
)ww" #
throwxx 
newxx 
	Exceptionxx #
(xx# $
$strxx$ J
)xxJ K
;xxK L
ifyy 
(yy 
quizyy 
.yy 
AttemptsAllowedyy $
.yy$ %
HasValueyy% -
&&yy. 0
quizyy1 5
.yy5 6
AttemptsAllowedyy6 E
<=yyF H
$numyyI J
)yyJ K
throwzz 
newzz 
	Exceptionzz #
(zz# $
$strzz$ Y
)zzY Z
;zzZ [
}{{ 	
}|| 
}}} ∂N
(D:\backend\LXP.Core\Services\Services.cs
	namespace		 	
LXP		
 
.		 
Core		 
.		 
Services		 
{

 
public 

class 
Services 
: 
IService $
{ 
private 
readonly 
IRepository $
_repository% 0
;0 1
private 
Mapper 
_moviemapper #
;# $
public 
Services 
( 
IRepository #

repository$ .
). /
{ 	
_repository 
= 

repository $
;$ %
var 
_configlogin 
= 
new "
MapperConfiguration# 6
(6 7
cfg7 :
=>; =
cfg> A
.A B
	CreateMapB K
<K L
LearnerL S
,S T

LoginModelU _
>_ `
(` a
)a b
)b c
;c d
_moviemapper 
= 
new 
Mapper %
(% &
_configlogin& 2
)2 3
;3 4
} 	
public"" 
async"" 
Task"" 
<"" 
	LoginRole"" #
>""# $
CheckLearner""% 1
(""1 2

LoginModel""2 <

loginmodel""= G
)""G H
{$$ 	
	LoginRole%% 
	loginRole%% 
;%%  
	LoginRole'' 
message'' 
='' 
new''  #
	LoginRole''$ -
(''- .
)''. /
;''/ 0
var** 
getlearners** 
=** 
await** #
_repository**$ /
.**/ 0
GetLearnerByEmail**0 A
(**A B

loginmodel**B L
.**L M
Email**M R
)**R S
;**S T
var00 
user00 
=00 
await00 
_repository00 (
.00( )
AnyUserByEmail00) 7
(007 8

loginmodel008 B
.00B C
Email00C H
)00H I
;00I J
if33 
(33 
user33 
==33 
true33 
)33 
{44 
using77 
(77 
SHA25677 
sha25677 $
=77% &
SHA25677' -
.77- .
Create77. 4
(774 5
)775 6
)776 7
{88 
byte99 
[99 
]99 
inputHashPassword99 ,
=99- .
sha25699/ 5
.995 6
ComputeHash996 A
(99A B
Encoding99B J
.99J K
UTF899K O
.99O P
GetBytes99P X
(99X Y

loginmodel99Y c
.99c d
Password99d l
)99l m
)99m n
;99n o
StringBuilder;; !
stringBuilder;;" /
=;;0 1
new;;2 5
StringBuilder;;6 C
(;;C D
);;D E
;;;E F
for== 
(== 
int== 
i== 
===  
$num==! "
;==" #
i==$ %
<==& '
inputHashPassword==( 9
.==9 :
Length==: @
;==@ A
i==B C
++==C E
)==E F
{?? 
stringBuilderAA %
.AA% &
AppendAA& ,
(AA, -
inputHashPasswordAA- >
[AA> ?
iAA? @
]AA@ A
.AAA B
ToStringAAB J
(AAJ K
$strAAK O
)AAO P
)AAP Q
;AAQ R
}CC 
stringEE 
inputPasswordHashedEE .
=EE/ 0
stringBuilderEE1 >
.EE> ?
ToStringEE? G
(EEG H
)EEH I
;EEI J
boolHH 
checkpasswordHH &
=HH' (
awaitHH) .
_repositoryHH/ :
.HH: ;(
AnyLearnerByEmailAndPasswordHH; W
(HHW X

loginmodelHHX b
.HHb c
EmailHHc h
,HHh i
inputPasswordHashedHHj }
)HH} ~
;HH~ 
messageJJ 
.JJ 
RoleJJ  
=JJ! "
getlearnersJJ# .
.JJ. /
RoleJJ/ 3
;JJ3 4
messageLL 
.LL 
AccountStatusLL )
=LL* +
getlearnersLL, 7
.LL7 8
AccountStatusLL8 E
;LLE F
ifNN 
(NN 
checkpasswordNN %
)NN% &
{OO 
	loginRolePP !
=PP" #
newPP$ '
	LoginRolePP( 1
(PP1 2
)PP2 3
;PP3 4
{RR 
	loginRoleSS %
.SS% &
EmailSS& +
=SS, -
trueSS. 2
;SS2 3
	loginRoleUU %
.UU% &
PasswordUU& .
=UU/ 0
trueUU1 5
;UU5 6
	loginRoleWW %
.WW% &
RoleWW& *
=WW+ ,
messageWW- 4
.WW4 5
RoleWW5 9
;WW9 :
	loginRoleYY %
.YY% &
AccountStatusYY& 3
=YY4 5
messageYY6 =
.YY= >
AccountStatusYY> K
;YYK L
}[[ 
return]] 
	loginRole]] (
;]]( )
}^^ 
else`` 
{aa 
	loginRolebb !
=bb" #
newbb$ '
	LoginRolebb( 1
(bb1 2
)bb2 3
;bb3 4
{dd 
	loginRoleee %
.ee% &
Emailee& +
=ee, -
trueee. 2
;ee2 3
	loginRolegg %
.gg% &
Passwordgg& .
=gg/ 0
falsegg1 6
;gg6 7
}hh 
returnii 
	loginRoleii (
;ii( )
}jj 
}mm 
}oo 
elserr 
{ss 
	loginRolett 
=tt 
newtt 
	LoginRolett  )
(tt) *
)tt* +
;tt+ ,
{vv 
	loginRoleww 
.ww 
Emailww #
=ww$ %
falseww& +
;ww+ ,
	loginRoleyy 
.yy 
Passwordyy &
=yy' (
falseyy) .
;yy. /
}{{ 
return|| 
	loginRole||  
;||  !
} 
}
ÇÇ 	
public
ÖÖ 
async
ÖÖ 
Task
ÖÖ 
<
ÖÖ 
bool
ÖÖ 
>
ÖÖ 
ForgetPassword
ÖÖ  .
(
ÖÖ. /
string
ÖÖ/ 5
Email
ÖÖ6 ;
)
ÖÖ; <
{
áá 	
var
ää 
getleareremail
ää 
=
ää  
await
ää! &
_repository
ää' 2
.
ää2 3
AnyUserByEmail
ää3 A
(
ääA B
Email
ääB G
)
ääG H
;
ääH I
if
éé 
(
éé 
getleareremail
éé 
==
éé !
true
éé" &
)
éé& '
{
èè 
string
ëë 
password
ëë 
=
ëë  !
RandomPassword
ëë" 0
.
ëë0 1%
Randompasswordgenerator
ëë1 H
(
ëëH I
)
ëëI J
;
ëëJ K
string
íí 
encryptPassword
íí &
=
íí' (

Encryption
íí) 3
.
íí3 4)
ComputePasswordToSha256Hash
íí4 O
(
ííO P
password
ííP X
)
ííX Y
;
ííY Z
_repository
ìì 
.
ìì #
UpdateLearnerPassword
ìì 1
(
ìì1 2
Email
ìì2 7
,
ìì7 8
encryptPassword
ìì9 H
)
ììH I
;
ììI J
EmailGenerator
îî 
.
îî 
Sendpassword
îî +
(
îî+ ,
password
îî, 4
,
îî4 5
Email
îî6 ;
)
îî; <
;
îî< =
return
ïï 
true
ïï 
;
ïï 
}
ññ 
else
ôô 
{
öö 
return
õõ 
false
õõ 
;
õõ 
}
úú 
}
üü 	
public
§§ 
async
§§ 
Task
§§ 
<
§§ "
ResultUpdatePassword
§§ .
>
§§. /
UpdatePassword
§§0 >
(
§§> ?
UpdatePassword
§§? M
updatePassword
§§N \
)
§§\ ]
{
•• 	
var
¶¶ 
learner
¶¶ 
=
¶¶ 
await
¶¶ 
_repository
¶¶  +
.
¶¶+ ,'
LearnerByEmailAndPassword
¶¶, E
(
¶¶E F
updatePassword
¶¶F T
.
¶¶T U
Email
¶¶U Z
,
¶¶Z [

Encryption
¶¶\ f
.
¶¶f g*
ComputePasswordToSha256Hash¶¶g Ç
(¶¶Ç É
updatePassword¶¶É ë
.¶¶ë í
OldPassword¶¶í ù
)¶¶ù û
)¶¶û ü
;¶¶ü †
var
ßß 
result
ßß 
=
ßß 
new
ßß "
ResultUpdatePassword
ßß 1
(
ßß1 2
)
ßß2 3
;
ßß3 4
if
©© 
(
©© 
learner
©© 
.
©© 
Password
©©  
==
©©! #

Encryption
©©$ .
.
©©. /)
ComputePasswordToSha256Hash
©©/ J
(
©©J K
updatePassword
©©K Y
.
©©Y Z
OldPassword
©©Z e
)
©©e f
)
©©f g
{
™™ 
string
´´  
encryptNewPassword
´´ )
=
´´* +

Encryption
´´, 6
.
´´6 7)
ComputePasswordToSha256Hash
´´7 R
(
´´R S
updatePassword
´´S a
.
´´a b
NewPassword
´´b m
)
´´m n
;
´´n o
learner
¨¨ 
.
¨¨ 
Password
¨¨  
=
¨¨! " 
encryptNewPassword
¨¨# 5
;
¨¨5 6
await
≠≠ 
_repository
≠≠ !
.
≠≠! "
UpdatePassword
≠≠" 0
(
≠≠0 1
learner
≠≠1 8
)
≠≠8 9
;
≠≠9 :
result
ÆÆ 
.
ÆÆ 
success
ÆÆ 
=
ÆÆ  
true
ÆÆ! %
;
ÆÆ% &
return
ØØ 
result
ØØ 
;
ØØ 
}
∞∞ 
else
≤≤ 
{
≥≥ 
return
¥¥ 
result
¥¥ 
;
¥¥ 
}
∂∂ 
}
∏∏ 	
}
ºº 
}ææ ûw
4D:\backend\LXP.Core\Services\TopicFeedbackService.cs
	namespace		 	
LXP		
 
.		 
Core		 
.		 
Services		 
{

 
public 

class  
TopicFeedbackService %
:& '!
ITopicFeedbackService( =
{ 
private 
readonly $
ITopicFeedbackRepository 1$
_topicFeedbackRepository2 J
;J K
public  
TopicFeedbackService #
(# $$
ITopicFeedbackRepository$ <#
topicFeedbackRepository= T
)T U
{ 	$
_topicFeedbackRepository $
=% &#
topicFeedbackRepository' >
;> ?
} 	
public 
Guid 
AddFeedbackQuestion '
(' (*
TopicFeedbackQuestionViewModel( F!
topicFeedbackQuestionG \
,\ ]
List^ b
<b c2
%TopicFeedbackQuestionsOptionViewModel	c à
>
à â
options
ä ë
)
ë í
{ 	
var "
normalizedQuestionType &
=' (!
topicFeedbackQuestion) >
.> ?
QuestionType? K
.K L
ToUpperL S
(S T
)T U
;U V
if 
( "
normalizedQuestionType &
==' )&
TopicFeedbackQuestionTypes* D
.D E
DescriptiveQuestionE X
.X Y
ToUpperY `
(` a
)a b
)b c
{ 
options 
= 
null 
; 
} 
if 
( 
! 1
%ValidateOptionsByFeedbackQuestionType 6
(6 7!
topicFeedbackQuestion7 L
.L M
QuestionTypeM Y
,Y Z
options[ b
)b c
)c d
throw 
new 
ArgumentException +
(+ ,
$str, Z
,Z [
nameof\ b
(b c
optionsc j
)j k
)k l
;l m
var   
questionEntity   
=    
new  ! $!
Topicfeedbackquestion  % :
{!! 
TopicId"" 
="" !
topicFeedbackQuestion"" /
.""/ 0
TopicId""0 7
,""7 8

QuestionNo## 
=## $
_topicFeedbackRepository## 5
.##5 6%
GetNextFeedbackQuestionNo##6 O
(##O P!
topicFeedbackQuestion##P e
.##e f
TopicId##f m
)##m n
,##n o
Question$$ 
=$$ !
topicFeedbackQuestion$$ 0
.$$0 1
Question$$1 9
,$$9 :
QuestionType%% 
=%% "
normalizedQuestionType%% 5
,%%5 6
	CreatedBy&& 
=&& 
$str&& #
,&&# $
	CreatedAt'' 
='' 
DateTime'' $
.''$ %
Now''% (
}(( 
;(( $
_topicFeedbackRepository** $
.**$ %
AddFeedbackQuestion**% 8
(**8 9
questionEntity**9 G
)**G H
;**H I
if,, 
(,, "
normalizedQuestionType,, &
==,,' )&
TopicFeedbackQuestionTypes,,* D
.,,D E
MultiChoiceQuestion,,E X
.,,X Y
ToUpper,,Y `
(,,` a
),,a b
),,b c
{-- 
if.. 
(.. 
options.. 
!=.. 
null.. #
&&..$ &
options..' .
.... /
Count../ 4
>..5 6
$num..7 8
)..8 9
{// 
var00 
optionEntities00 &
=00' (
options00) 0
.000 1
Select001 7
(007 8
option008 >
=>00? A
new00B E#
Feedbackquestionsoption00F ]
{11 #
TopicFeedbackQuestionId22 /
=220 1
questionEntity222 @
.22@ A#
TopicFeedbackQuestionId22A X
,22X Y

OptionText33 "
=33# $
option33% +
.33+ ,

OptionText33, 6
,336 7
	CreatedAt44 !
=44" #
DateTime44$ ,
.44, -
Now44- 0
,440 1
	CreatedBy55 !
=55" #
$str55$ +
}66 
)66 
.66 
ToList66 
(66 
)66 
;66  $
_topicFeedbackRepository88 ,
.88, -&
AddFeedbackQuestionOptions88- G
(88G H
optionEntities88H V
)88V W
;88W X
}99 
}:: 
return<< 
questionEntity<< !
.<<! "#
TopicFeedbackQuestionId<<" 9
;<<9 :
}== 	
public?? 
List?? 
<?? ,
 TopicFeedbackQuestionNoViewModel?? 4
>??4 5#
GetAllFeedbackQuestions??6 M
(??M N
)??N O
{@@ 	
returnAA $
_topicFeedbackRepositoryAA +
.AA+ ,#
GetAllFeedbackQuestionsAA, C
(AAC D
)AAD E
;AAE F
}BB 	
publicDD ,
 TopicFeedbackQuestionNoViewModelDD /#
GetFeedbackQuestionByIdDD0 G
(DDG H
GuidDDH L#
topicFeedbackQuestionIdDDM d
)DDd e
{EE 	
returnFF $
_topicFeedbackRepositoryFF +
.FF+ ,#
GetFeedbackQuestionByIdFF, C
(FFC D#
topicFeedbackQuestionIdFFD [
)FF[ \
;FF\ ]
}GG 	
publicII 
boolII "
UpdateFeedbackQuestionII *
(II* +
GuidII+ /#
topicFeedbackQuestionIdII0 G
,IIG H*
TopicFeedbackQuestionViewModelIII g!
topicFeedbackQuestionIIh }
,II} ~
List	II É
<
IIÉ Ñ3
%TopicFeedbackQuestionsOptionViewModel
IIÑ ©
>
II© ™
options
II´ ≤
)
II≤ ≥
{JJ 	
varKK 
existingQuestionKK  
=KK! "$
_topicFeedbackRepositoryKK# ;
.KK; <.
"GetTopicFeedbackQuestionEntityByIdKK< ^
(KK^ _#
topicFeedbackQuestionIdKK_ v
)KKv w
;KKw x
ifLL 
(LL 
existingQuestionLL  
!=LL! #
nullLL$ (
)LL( )
{MM 
ifNN 
(NN 
!NN 
existingQuestionNN %
.NN% &
QuestionTypeNN& 2
.NN2 3
EqualsNN3 9
(NN9 :!
topicFeedbackQuestionNN: O
.NNO P
QuestionTypeNNP \
,NN\ ]
StringComparisonNN^ n
.NNn o
OrdinalIgnoreCase	NNo Ä
)
NNÄ Å
)
NNÅ Ç
{OO 
throwPP 
newPP %
InvalidOperationExceptionPP 7
(PP7 8
$strPP8 [
)PP[ \
;PP\ ]
}QQ 
existingQuestionSS  
.SS  !
QuestionSS! )
=SS* +!
topicFeedbackQuestionSS, A
.SSA B
QuestionSSB J
;SSJ K
existingQuestionTT  
.TT  !

ModifiedAtTT! +
=TT, -
DateTimeTT. 6
.TT6 7
NowTT7 :
;TT: ;
existingQuestionUU  
.UU  !

ModifiedByUU! +
=UU, -
$strUU. 5
;UU5 6$
_topicFeedbackRepositoryVV (
.VV( )"
UpdateFeedbackQuestionVV) ?
(VV? @
existingQuestionVV@ P
)VVP Q
;VVQ R
ifXX 
(XX 
existingQuestionXX $
.XX$ %
QuestionTypeXX% 1
==XX2 4&
TopicFeedbackQuestionTypesXX5 O
.XXO P
MultiChoiceQuestionXXP c
.XXc d
ToUpperXXd k
(XXk l
)XXl m
)XXm n
{YY 
ifZZ 
(ZZ 
!ZZ 1
%ValidateOptionsByFeedbackQuestionTypeZZ >
(ZZ> ?
existingQuestionZZ? O
.ZZO P
QuestionTypeZZP \
,ZZ\ ]
optionsZZ^ e
)ZZe f
)ZZf g
{[[ 
throw\\ 
new\\ !
ArgumentException\\" 3
(\\3 4
$str\\4 b
)\\b c
;\\c d
}]] 
var__ 
existingOptions__ '
=__( )$
_topicFeedbackRepository__* B
.__B C*
GetFeedbackQuestionOptionsById__C a
(__a b#
topicFeedbackQuestionId__b y
)__y z
;__z {$
_topicFeedbackRepository`` ,
.``, -)
RemoveFeedbackQuestionOptions``- J
(``J K
existingOptions``K Z
)``Z [
;``[ \
ifbb 
(bb 
optionsbb 
!=bb  "
nullbb# '
&&bb( *
optionsbb+ 2
.bb2 3
Countbb3 8
>bb9 :
$numbb; <
)bb< =
{cc 
vardd 
optionEntitiesdd *
=dd+ ,
optionsdd- 4
.dd4 5
Selectdd5 ;
(dd; <
optiondd< B
=>ddC E
newddF I#
FeedbackquestionsoptionddJ a
{ee #
TopicFeedbackQuestionIdff 3
=ff4 5#
topicFeedbackQuestionIdff6 M
,ffM N

OptionTextgg &
=gg' (
optiongg) /
.gg/ 0

OptionTextgg0 :
,gg: ;
	CreatedAthh %
=hh& '
DateTimehh( 0
.hh0 1
Nowhh1 4
,hh4 5
	CreatedByii %
=ii& '
$strii( /
}jj 
)jj 
.jj 
ToListjj !
(jj! "
)jj" #
;jj# $$
_topicFeedbackRepositoryll 0
.ll0 1&
AddFeedbackQuestionOptionsll1 K
(llK L
optionEntitiesllL Z
)llZ [
;ll[ \
}mm 
}nn 
returnpp 
truepp 
;pp 
}qq 
returnrr 
falserr 
;rr 
}ss 	
publicuu 
booluu "
DeleteFeedbackQuestionuu *
(uu* +
Guiduu+ /#
topicFeedbackQuestionIduu0 G
)uuG H
{vv 	
tryww 
{xx 
varyy 
existingQuestionyy $
=yy% &$
_topicFeedbackRepositoryyy' ?
.yy? @.
"GetTopicFeedbackQuestionEntityByIdyy@ b
(yyb c#
topicFeedbackQuestionIdyyc z
)yyz {
;yy{ |
ifzz 
(zz 
existingQuestionzz $
!=zz% '
nullzz( ,
)zz, -
{{{ 
var|| 
relatedOptions|| &
=||' ($
_topicFeedbackRepository||) A
.||A B*
GetFeedbackQuestionOptionsById||B `
(||` a#
topicFeedbackQuestionId||a x
)||x y
;||y z
if~~ 
(~~ 
relatedOptions~~ &
.~~& '
Any~~' *
(~~* +
)~~+ ,
)~~, -
{ &
_topicFeedbackRepository
ÄÄ 0
.
ÄÄ0 1+
RemoveFeedbackQuestionOptions
ÄÄ1 N
(
ÄÄN O
relatedOptions
ÄÄO ]
)
ÄÄ] ^
;
ÄÄ^ _
}
ÅÅ &
_topicFeedbackRepository
ÉÉ ,
.
ÉÉ, -$
RemoveFeedbackQuestion
ÉÉ- C
(
ÉÉC D
existingQuestion
ÉÉD T
)
ÉÉT U
;
ÉÉU V&
_topicFeedbackRepository
ÑÑ ,
.
ÑÑ, - 
ReorderQuestionNos
ÑÑ- ?
(
ÑÑ? @
existingQuestion
ÑÑ@ P
.
ÑÑP Q
TopicId
ÑÑQ X
,
ÑÑX Y
existingQuestion
ÑÑZ j
.
ÑÑj k

QuestionNo
ÑÑk u
)
ÑÑu v
;
ÑÑv w
return
ÜÜ 
true
ÜÜ 
;
ÜÜ  
}
áá 
}
àà 
catch
ââ 
(
ââ 
	Exception
ââ 
ex
ââ 
)
ââ  
{
ää 
throw
ãã 
new
ãã '
InvalidOperationException
ãã 3
(
ãã3 4
$str
ãã4 m
,
ããm n
ex
ãão q
)
ããq r
;
ããr s
}
åå 
return
çç 
false
çç 
;
çç 
}
éé 	
public
êê 
List
êê 
<
êê .
 TopicFeedbackQuestionNoViewModel
êê 4
>
êê4 5+
GetFeedbackQuestionsByTopicId
êê6 S
(
êêS T
Guid
êêT X
topicId
êêY `
)
êê` a
{
ëë 	
return
íí &
_topicFeedbackRepository
íí +
.
íí+ ,+
GetFeedbackQuestionsByTopicId
íí, I
(
ííI J
topicId
ííJ Q
)
ííQ R
;
ííR S
}
ìì 	
public
ïï 
bool
ïï .
 DeleteFeedbackQuestionsByTopicId
ïï 4
(
ïï4 5
Guid
ïï5 9
topicId
ïï: A
)
ïïA B
{
ññ 	
try
óó 
{
òò 
var
ôô 
	questions
ôô 
=
ôô &
_topicFeedbackRepository
ôô  8
.
ôô8 9+
GetFeedbackQuestionsByTopicId
ôô9 V
(
ôôV W
topicId
ôôW ^
)
ôô^ _
;
ôô_ `
if
öö 
(
öö 
	questions
öö 
==
öö  
null
öö! %
||
öö& (
	questions
öö) 2
.
öö2 3
Count
öö3 8
==
öö9 ;
$num
öö< =
)
öö= >
return
õõ 
false
õõ  
;
õõ  !
foreach
ùù 
(
ùù 
var
ùù 
question
ùù %
in
ùù& (
	questions
ùù) 2
)
ùù2 3
{
ûû $
DeleteFeedbackQuestion
üü *
(
üü* +
question
üü+ 3
.
üü3 4%
TopicFeedbackQuestionId
üü4 K
)
üüK L
;
üüL M
}
†† 
return
°° 
true
°° 
;
°° 
}
¢¢ 
catch
££ 
(
££ 
	Exception
££ 
)
££ 
{
§§ 
return
•• 
false
•• 
;
•• 
}
¶¶ 
}
ßß 	
private
©© 
bool
©© 3
%ValidateOptionsByFeedbackQuestionType
©© :
(
©©: ;
string
©©; A
questionType
©©B N
,
©©N O
List
©©P T
<
©©T U3
%TopicFeedbackQuestionsOptionViewModel
©©U z
>
©©z {
options©©| É
)©©É Ñ
{
™™ 	
questionType
´´ 
=
´´ 
questionType
´´ '
.
´´' (
ToUpper
´´( /
(
´´/ 0
)
´´0 1
;
´´1 2
if
≠≠ 
(
≠≠ 
questionType
≠≠ 
==
≠≠ (
TopicFeedbackQuestionTypes
≠≠  :
.
≠≠: ;!
MultiChoiceQuestion
≠≠; N
.
≠≠N O
ToUpper
≠≠O V
(
≠≠V W
)
≠≠W X
)
≠≠X Y
{
ÆÆ 
return
ØØ 
options
ØØ 
!=
ØØ !
null
ØØ" &
&&
ØØ' )
options
ØØ* 1
.
ØØ1 2
Count
ØØ2 7
>=
ØØ8 :
$num
ØØ; <
&&
ØØ= ?
options
ØØ@ G
.
ØØG H
Count
ØØH M
<=
ØØN P
$num
ØØQ R
;
ØØR S
}
∞∞ 
return
±± 
options
±± 
==
±± 
null
±± "
||
±±# %
options
±±& -
.
±±- .
Count
±±. 3
==
±±4 6
$num
±±7 8
;
±±8 9
}
≤≤ 	
}
≥≥ 
}¥¥ ñ
5D:\backend\LXP.Core\Services\UpdatePasswordService.cs
	namespace 	
LXP
 
. 
Core 
. 
Services 
{ 
public		 

class		 !
UpdatePasswordService		 &
:		' ("
IUpdatePasswordService		) ?
{

 
private 
readonly %
IUpdatePasswordRepository 2
_repository3 >
;> ?
public !
UpdatePasswordService $
($ %%
IUpdatePasswordRepository% >

repository? I
)I J
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
<  
ResultUpdatePassword .
>. /
UpdatePassword0 >
(> ?
UpdatePassword? M
updatePasswordN \
)\ ]
{ 	
Learner 
learner 
= 
await #
_repository$ /
./ 0%
LearnerByEmailAndPassword0 I
(I J
updatePasswordJ X
.X Y
EmailY ^
,^ _

Encryption` j
.j k(
ComputePasswordToSha256Hash	k Ü
(
Ü á
updatePassword
á ï
.
ï ñ
OldPassword
ñ °
)
° ¢
)
¢ £
;
£ §
var 
result 
= 
new  
ResultUpdatePassword 1
(1 2
)2 3
;3 4
if 
( 
learner 
. 
Password  
==! #

Encryption$ .
.. /'
ComputePasswordToSha256Hash/ J
(J K
updatePasswordK Y
.Y Z
OldPasswordZ e
)e f
)f g
{ 
string 
encryptNewPassword )
=* +

Encryption, 6
.6 7'
ComputePasswordToSha256Hash7 R
(R S
updatePasswordS a
.a b
NewPasswordb m
)m n
;n o
learner 
. 
Password  
=! "
encryptNewPassword# 5
;5 6
_repository 
. 
UpdatePassword *
(* +
learner+ 2
)2 3
;3 4
result   
.   
success   
=    
true  ! %
;  % &
return!! 
result!! 
;!! 
}"" 
else$$ 
{%% 
return&& 
result&& 
;&& 
}(( 
}** 	
}.. 
}// ∏
2D:\backend\LXP.Core\Services\UserReportServices.cs
	namespace

 	
LXP


 
.

 
Core

 
.

 
Services

 
{ 
public 

class 
UserReportServices #
:$ %
IUserReportServices& 9
{ 
private 
readonly !
IUserReportRepository .!
_userReportRepository/ D
;D E
public 
UserReportServices !
(! "!
IUserReportRepository" 7 
userReportRepository8 L
)L M
{ 	!
_userReportRepository !
=" # 
userReportRepository$ 8
;8 9
} 	
public 
IEnumerable 
< 
UserReportViewModel .
>. /
GetUserReport0 =
(= >
)> ?
{ 	
return !
_userReportRepository '
.' (
GetUserReport( 5
(5 6
)6 7
;7 8
} 	
} 
} 