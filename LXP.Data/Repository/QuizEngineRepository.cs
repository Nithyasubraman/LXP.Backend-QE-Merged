using LXP.Common.ViewModels.QuizEngineViewModel;
//using LXP.Data.DBContexts;
using Microsoft.EntityFrameworkCore;
using LXP.Common.Entities;
using LXP.Data.IRepository;


namespace LXP.Data.Repository
{
    public class QuizEngineRepository : IQuizEngineRepository
    {
        private readonly LXPDbContext _dbContext;

        public QuizEngineRepository(LXPDbContext dbContext)
        {
            _dbContext = dbContext;
        }



        public ViewQuizDetailsViewModel GetQuizById(Guid quizId)
        {
            return _dbContext.Quizzes
                .Where(q => q.QuizId == quizId)
                .Select(q => new ViewQuizDetailsViewModel
                {
                    QuizId = q.QuizId,
                    TopicId = q.TopicId,
                    CourseId = q.CourseId,
                    NameOfQuiz = q.NameOfQuiz,
                    Duration = q.Duration,
                    PassMark = q.PassMark,
                    AttemptsAllowed = q.AttemptsAllowed
                })
                .FirstOrDefault() ?? new ViewQuizDetailsViewModel();
        }
        public IEnumerable<LearnerAnswerDTO> GetLearnerAnswersForAttempt(Guid attemptId)
        {
            return _dbContext.LearnerAnswers
                .Where(a => a.LearnerAttemptId == attemptId)
                .Select(a => new LearnerAnswerDTO
                {
                    LearnerAnswerId = a.LearnerAnswerId,
                    LearnerAttemptId = a.LearnerAttemptId,
                    QuizQuestionId = a.QuizQuestionId,
                    QuestionOptionId = a.QuestionOptionId
                })
                .ToList();
        }
        public void UpdateLearnerAnswer(Guid learnerAnswerId, Guid questionOptionId)
        {
            var existingAnswer = _dbContext.LearnerAnswers.Find(learnerAnswerId);
            if (existingAnswer != null)
            {
                existingAnswer.QuestionOptionId = questionOptionId;
                _dbContext.SaveChanges();
            }
        }


        public IEnumerable<QEQuizQuestionViewModel> GetQuestionsForQuiz(Guid quizId)
        {
            return _dbContext.QuizQuestions
                .Where(q => q.QuizId == quizId)
                .Select(q => new QEQuizQuestionViewModel
                {
                    QuizQuestionId = q.QuizQuestionId,
                    Question = q.Question,
                    QuestionType = q.QuestionType,
                    QuestionNo = q.QuestionNo,
                    Options = _dbContext.QuestionOptions
                        .Where(o => o.QuizQuestionId == q.QuizQuestionId)
                        .Select(o => new QEQuestionOptionViewModel
                        {
                            Option = o.Option
                        })
                        .ToList()
                });
        }

        public bool IsQuestionOptionCorrect(Guid quizQuestionId, Guid questionOptionId)
        {
            return _dbContext.QuestionOptions
                .Any(o => o.QuizQuestionId == quizQuestionId && o.QuestionOptionId == questionOptionId && o.IsCorrect);
        }

        public string GetQuestionTypeById(Guid quizQuestionId)
        {
            return _dbContext.QuizQuestions
                .Where(q => q.QuizQuestionId == quizQuestionId)
                .Select(q => q.QuestionType)
                .FirstOrDefault() ?? string.Empty;
        }


        public IEnumerable<string> GetCorrectOptionsForQuestion(Guid quizQuestionId)
        {
            return _dbContext.QuestionOptions
                .Where(o => o.QuizQuestionId == quizQuestionId && o.IsCorrect)
                .Select(o => o.Option);
        }

        public string GetOptionTextById(Guid optionId)
        {
            return _dbContext.QuestionOptions
                .Where(o => o.QuestionOptionId == optionId)
                .Select(o => o.Option)
                .FirstOrDefault();
        }

        // Learner Attempt Methods
        public LearnerAttemptViewModel CreateLearnerAttempt(Guid learnerId, Guid quizId, DateTime startTime)
        {
            var quiz = _dbContext.Quizzes.Find(quizId);
            if (quiz == null)
                throw new Exception($"Quiz with ID {quizId} not found.");

            var existingAttempts = _dbContext.LearnerAttempts
                .Count(a => a.LearnerId == learnerId && a.QuizId == quizId);

            if (quiz.AttemptsAllowed.HasValue && existingAttempts >= quiz.AttemptsAllowed)
                throw new Exception("Maximum number of attempts reached for this quiz.");

            var attempt = new LearnerAttempt
            {
                LearnerId = learnerId,
                QuizId = quizId,
                AttemptCount = existingAttempts + 1,
                StartTime = startTime, // Start time is set here
                EndTime = startTime.AddMinutes(quiz.Duration), // End time is calculated based on start time and quiz duration
                Score = 0,
                CreatedBy = "System"
            };

            _dbContext.LearnerAttempts.Add(attempt);
            _dbContext.SaveChanges();

            return new LearnerAttemptViewModel
            {
                LearnerAttemptId = attempt.LearnerAttemptId,
                LearnerId = attempt.LearnerId,
                QuizId = attempt.QuizId,
                AttemptCount = attempt.AttemptCount,
                StartTime = attempt.StartTime,
                EndTime = attempt.EndTime,
                Score = attempt.Score
            };
        }
        public IEnumerable<LearnerAttemptViewModel> GetLearnerAttemptsForQuiz(Guid learnerId, Guid quizId)
        {
            return _dbContext.LearnerAttempts
                .Where(a => a.LearnerId == learnerId && a.QuizId == quizId)
                .Select(a => new LearnerAttemptViewModel
                {
                    LearnerAttemptId = a.LearnerAttemptId,
                    LearnerId = a.LearnerId,
                    QuizId = a.QuizId,
                    AttemptCount = a.AttemptCount,
                    StartTime = a.StartTime,
                    EndTime = a.EndTime,
                    Score = a.Score
                })
                .ToList();
        }
        public ViewQuizDetailsViewModel GetQuizDetailsByTopicId(Guid topicId)
        {
            return _dbContext.Quizzes
                .Where(q => q.TopicId == topicId)
                .Select(q => new ViewQuizDetailsViewModel
                {
                    QuizId = q.QuizId,
                    TopicId = q.TopicId,
                    CourseId = q.CourseId,
                    NameOfQuiz = q.NameOfQuiz,
                    Duration = q.Duration,
                    PassMark = q.PassMark,
                    AttemptsAllowed = q.AttemptsAllowed
                })
                .FirstOrDefault() ?? new ViewQuizDetailsViewModel();
        }


        public LearnerAttemptDetailsViewModel GetLearnerAttemptDetailsById(Guid attemptId)
        {
            var attempt = _dbContext.LearnerAttempts
                .Include(a => a.LearnerAnswers)
                    .ThenInclude(la => la.QuestionOption)
                        .ThenInclude(o => o.QuizQuestion)
                .Where(a => a.LearnerAttemptId == attemptId)
                .Select(a => new LearnerAttemptDetailsViewModel
                {
                    LearnerAttemptId = a.LearnerAttemptId,
                    LearnerId = a.LearnerId,
                    QuizId = a.QuizId,
                    Score = a.Score,
                    StartTime = a.StartTime,
                    EndTime = a.EndTime,
                    QuestionsAndAnswers = a.LearnerAnswers.Select(la => new QuestionAndAnswerDetails
                    {
                        QuizQuestionId = la.QuestionOption.QuizQuestion.QuizQuestionId,
                        Question = la.QuestionOption.QuizQuestion.Question,
                        SelectedOption = la.QuestionOption.Option
                    }).ToList()
                })
                .FirstOrDefault();

            if (attempt == null)
                return null;

            return attempt;
        }

        public LearnerAttemptViewModel GetLearnerAttemptById(Guid attemptId)
        {
            return _dbContext.LearnerAttempts
                .Where(a => a.LearnerAttemptId == attemptId)
                .Select(a => new LearnerAttemptViewModel
                {
                    LearnerAttemptId = a.LearnerAttemptId,
                    LearnerId = a.LearnerId,
                    QuizId = a.QuizId,
                    AttemptCount = a.AttemptCount,
                    StartTime = a.StartTime,
                    EndTime = a.EndTime,
                    Score = a.Score
                })
                .FirstOrDefault() ?? new LearnerAttemptViewModel();
        }


        public void UpdateLearnerAttempt(LearnerAttemptViewModel attempt)
        {
            var existingAttempt = _dbContext.LearnerAttempts.Find(attempt.LearnerAttemptId);
            if (existingAttempt != null)
            {
                existingAttempt.Score = attempt.Score;
                _dbContext.SaveChanges();
            }
        }

        public IEnumerable<QuestionAndUserAnswerViewModel> GetQuestionsAndUserAnswersForAttemptWithoutCorrectAnswers(Guid attemptId)
        {
            return _dbContext.LearnerAnswers
                .Where(a => a.LearnerAttemptId == attemptId)
                .Include(a => a.QuestionOption)
                .ThenInclude(o => o.QuizQuestion)
                .Select(a => new QuestionAndUserAnswerViewModel
                {
                    QuizQuestionId = a.QuizQuestionId,
                    Question = a.QuestionOption.QuizQuestion.Question,
                    SelectedOption = a.QuestionOption.Option
                    // Note: We're intentionally not including whether the answer is correct
                })
                .ToList();
        }



        public bool IsAllowedToAttemptQuiz(Guid learnerId, Guid quizId)
        {
            var quiz = _dbContext.Quizzes.Find(quizId);
            if (quiz == null)
                return false;

            var existingAttempts = _dbContext.LearnerAttempts
                .Where(a => a.LearnerId == learnerId && a.QuizId == quizId)
                .ToList();

            // Check if the learner has already passed the quiz in any previous attempt
            var passMark = quiz.PassMark;
            var hasPassedQuiz = existingAttempts.Any(a => a.Score >= passMark);
            if (hasPassedQuiz)
                return false; // Do not allow further attempts if the learner has already passed the quiz

            // Check if the learner has exceeded the maximum number of attempts
            var attemptsAllowed = quiz.AttemptsAllowed;
            if (attemptsAllowed.HasValue && existingAttempts.Count >= attemptsAllowed)
                return false;

            return true;
        }


        public LearnerAnswerDTO CreateLearnerAnswer(AnswerSubmissionModel answerSubmissionModel)
        {
            var learnerAnswerList = new List<LearnerAnswerDTO>();
            foreach (var selectedOption in answerSubmissionModel.SelectedOptions)
            {
                var optionId = GetOptionIdByText(answerSubmissionModel.QuizQuestionId, selectedOption);
                var learnerAnswer = new LearnerAnswer
                {
                    LearnerAttemptId = answerSubmissionModel.LearnerAttemptId,
                    QuizQuestionId = answerSubmissionModel.QuizQuestionId,
                    QuestionOptionId = optionId,
                    CreatedBy = "System"
                };

                _dbContext.LearnerAnswers.Add(learnerAnswer);
                _dbContext.SaveChanges();

                learnerAnswerList.Add(new LearnerAnswerDTO
                {
                    LearnerAnswerId = learnerAnswer.LearnerAnswerId,
                    LearnerAttemptId = learnerAnswer.LearnerAttemptId,
                    QuizQuestionId = learnerAnswer.QuizQuestionId,
                    QuestionOptionId = learnerAnswer.QuestionOptionId
                });
            }

            return learnerAnswerList.FirstOrDefault(); // Return the first answer for simplicity
        }

        public Guid GetOptionIdByText(Guid quizQuestionId, string optionText)
        {
            return _dbContext.QuestionOptions
                .Where(o => o.QuizQuestionId == quizQuestionId && o.Option == optionText)
                .Select(o => o.QuestionOptionId)
                .FirstOrDefault();
        }

        public LearnerAttemptViewModel GetAttemptById(Guid attemptId)
        {
            return _dbContext.LearnerAttempts
                .Where(a => a.LearnerAttemptId == attemptId)
                .Select(a => new LearnerAttemptViewModel
                {
                    LearnerAttemptId = a.LearnerAttemptId,
                    LearnerId = a.LearnerId,
                    QuizId = a.QuizId,
                    AttemptCount = a.AttemptCount,
                    StartTime = a.StartTime,
                    EndTime = a.EndTime,
                    Score = a.Score
                })
                .FirstOrDefault() ?? new LearnerAttemptViewModel();
        }

    }
}




























//using LXP.Common.ViewModels.QuizEngineViewModel;
//using Microsoft.EntityFrameworkCore;
//using System;
//using System.Collections.Generic;
//using System.Linq;
//using LXP.Data;
//using LXP.Common.Entities;

//public class QuizEngineRepository : IQuizEngineRepository
//{
//    private readonly LXPDbContext _dbContext;

//    public QuizEngineRepository(LXPDbContext dbContext)
//    {
//        _dbContext = dbContext;
//    }



//    public ViewQuizDetailsViewModel GetQuizById(Guid quizId)
//    {
//        return _dbContext.Quizzes
//            .Where(q => q.QuizId == quizId)
//            .Select(q => new ViewQuizDetailsViewModel
//            {
//                QuizId = q.QuizId,
//                TopicId = q.TopicId,
//                CourseId = q.CourseId,
//                NameOfQuiz = q.NameOfQuiz,
//                Duration = q.Duration,
//                PassMark = q.PassMark,
//                AttemptsAllowed = q.AttemptsAllowed
//            })
//            .FirstOrDefault();
//    }

//    public IEnumerable<QEQuizQuestionViewModel> GetQuestionsForQuiz(Guid quizId)
//    {
//        return _dbContext.QuizQuestions
//            .Where(q => q.QuizId == quizId)
//            .Select(q => new QEQuizQuestionViewModel
//            {
//                QuizQuestionId = q.QuizQuestionId,
//                Question = q.Question,
//                QuestionType = q.QuestionType,
//                QuestionNo = q.QuestionNo,
//                Options = _dbContext.QuestionOptions
//                    .Where(o => o.QuizQuestionId == q.QuizQuestionId)
//                    .Select(o => new QEQuestionOptionViewModel
//                    {
//                        Option = o.Option
//                    })
//                    .ToList()
//            });
//    }

//    public bool IsQuestionOptionCorrect(Guid quizQuestionId, Guid questionOptionId)
//    {
//        return _dbContext.QuestionOptions
//            .Any(o => o.QuizQuestionId == quizQuestionId && o.QuestionOptionId == questionOptionId && o.IsCorrect);
//    }

//    public string GetQuestionTypeById(Guid quizQuestionId)
//    {
//        return _dbContext.QuizQuestions
//            .Where(q => q.QuizQuestionId == quizQuestionId)
//            .Select(q => q.QuestionType)
//            .FirstOrDefault();
//    }

//    public IEnumerable<string> GetCorrectOptionsForQuestion(Guid quizQuestionId)
//    {
//        return _dbContext.QuestionOptions
//            .Where(o => o.QuizQuestionId == quizQuestionId && o.IsCorrect)
//            .Select(o => o.Option);
//    }

//    // Learner Attempt Methods
//    public LearnerAttemptViewModel CreateLearnerAttempt(Guid learnerId, Guid quizId)
//    {
//        var quiz = _dbContext.Quizzes.Find(quizId);
//        if (quiz == null)
//            throw new Exception($"Quiz with ID {quizId} not found.");

//        var existingAttempts = _dbContext.LearnerAttempts
//            .Count(a => a.LearnerId == learnerId && a.QuizId == quizId);

//        if (quiz.AttemptsAllowed.HasValue && existingAttempts >= quiz.AttemptsAllowed)
//            throw new Exception("Maximum number of attempts reached for this quiz.");

//        var attempt = new LearnerAttempt
//        {
//            LearnerId = learnerId,
//            QuizId = quizId,
//            AttemptCount = existingAttempts + 1,
//            StartTime = DateTime.UtcNow,
//            EndTime = DateTime.UtcNow.AddMinutes(quiz.Duration),
//            Score = 0,
//            CreatedBy = "System"
//        };

//        _dbContext.LearnerAttempts.Add(attempt);
//        _dbContext.SaveChanges();

//        return new LearnerAttemptViewModel
//        {
//            LearnerAttemptId = attempt.LearnerAttemptId,
//            LearnerId = attempt.LearnerId,
//            QuizId = attempt.QuizId,
//            AttemptCount = attempt.AttemptCount,
//            StartTime = attempt.StartTime,
//            EndTime = attempt.EndTime,
//            Score = attempt.Score
//        };
//    }
//    public ViewQuizDetailsViewModel GetQuizDetailsByTopicId(Guid topicId)
//    {
//        return _dbContext.Quizzes
//            .Where(q => q.TopicId == topicId)
//            .Select(q => new ViewQuizDetailsViewModel
//            {
//                QuizId = q.QuizId,
//                TopicId = q.TopicId,
//                CourseId = q.CourseId,
//                NameOfQuiz = q.NameOfQuiz,
//                Duration = q.Duration,
//                PassMark = q.PassMark,
//                AttemptsAllowed = q.AttemptsAllowed
//            })
//            .FirstOrDefault();
//    }

//    public LearnerAttemptDetailsViewModel GetLearnerAttemptDetailsById(Guid attemptId)
//    {
//        var attempt = _dbContext.LearnerAttempts
//            .Include(a => a.LearnerAnswers)
//                .ThenInclude(la => la.QuestionOption)
//                    .ThenInclude(o => o.QuizQuestion)
//            .Where(a => a.LearnerAttemptId == attemptId)
//            .Select(a => new LearnerAttemptDetailsViewModel
//            {
//                LearnerAttemptId = a.LearnerAttemptId,
//                LearnerId = a.LearnerId,
//                QuizId = a.QuizId,
//                Score = a.Score,
//                StartTime = a.StartTime,
//                EndTime = a.EndTime,
//                QuestionsAndAnswers = a.LearnerAnswers.Select(la => new QuestionAndAnswerDetails
//                {
//                    QuizQuestionId = la.QuestionOption.QuizQuestion.QuizQuestionId,
//                    Question = la.QuestionOption.QuizQuestion.Question,
//                    SelectedOption = la.QuestionOption.Option
//                }).ToList()
//            })
//            .FirstOrDefault();

//        if (attempt == null)
//            return null;

//        return attempt;
//    }

//    public LearnerAttemptViewModel GetLearnerAttemptById(Guid attemptId)
//    {
//        return _dbContext.LearnerAttempts
//            .Where(a => a.LearnerAttemptId == attemptId)
//            .Select(a => new LearnerAttemptViewModel
//            {
//                LearnerAttemptId = a.LearnerAttemptId,
//                LearnerId = a.LearnerId,
//                QuizId = a.QuizId,
//                AttemptCount = a.AttemptCount,
//                StartTime = a.StartTime,
//                EndTime = a.EndTime,
//                Score = a.Score
//            })
//            .FirstOrDefault();
//    }

//    public void UpdateLearnerAttempt(LearnerAttemptViewModel attempt)
//    {
//        var existingAttempt = _dbContext.LearnerAttempts.Find(attempt.LearnerAttemptId);
//        if (existingAttempt != null)
//        {
//            existingAttempt.Score = attempt.Score;
//            _dbContext.SaveChanges();
//        }
//    }


//    public bool IsAllowedToAttemptQuiz(Guid learnerId, Guid quizId)
//    {
//        var quiz = _dbContext.Quizzes.Find(quizId);
//        if (quiz == null)
//            return false;

//        var existingAttempts = _dbContext.LearnerAttempts
//            .Count(a => a.LearnerId == learnerId && a.QuizId == quizId);

//        return !quiz.AttemptsAllowed.HasValue || existingAttempts < quiz.AttemptsAllowed;
//    }


//    public LearnerAnswerDTO CreateLearnerAnswer(AnswerSubmissionModel answerSubmissionModel)
//    {
//        var learnerAnswerList = new List<LearnerAnswerDTO>();
//        foreach (var selectedOption in answerSubmissionModel.SelectedOptions)
//        {
//            var optionId = GetOptionIdByText(answerSubmissionModel.QuizQuestionId, selectedOption);
//            var learnerAnswer = new LearnerAnswer
//            {
//                LearnerAttemptId = answerSubmissionModel.LearnerAttemptId,
//                QuizQuestionId = answerSubmissionModel.QuizQuestionId,
//                QuestionOptionId = optionId,
//                CreatedBy = "System"
//            };

//            _dbContext.LearnerAnswers.Add(learnerAnswer);
//            _dbContext.SaveChanges();

//            learnerAnswerList.Add(new LearnerAnswerDTO
//            {
//                LearnerAnswerId = learnerAnswer.LearnerAnswerId,
//                LearnerAttemptId = learnerAnswer.LearnerAttemptId,
//                QuizQuestionId = learnerAnswer.QuizQuestionId,
//                QuestionOptionId = learnerAnswer.QuestionOptionId
//            });
//        }

//        return learnerAnswerList.FirstOrDefault(); // Return the first answer for simplicity
//    }

//    public Guid GetOptionIdByText(Guid quizQuestionId, string optionText)
//    {
//        return _dbContext.QuestionOptions
//            .Where(o => o.QuizQuestionId == quizQuestionId && o.Option == optionText)
//            .Select(o => o.QuestionOptionId)
//            .FirstOrDefault();
//    }

//}


//// Learner Answer Methods
////public LearnerAnswerDTO CreateLearnerAnswer(AnswerSubmissionModel answerSubmissionModel)
////{
////    var learnerAnswer = new LearnerAnswer
////    {
////        LearnerAttemptId = answerSubmissionModel.LearnerAttemptId,
////        QuizQuestionId = answerSubmissionModel.QuizQuestionId,
////        QuestionOptionId = answerSubmissionModel.QuestionOptionId,
////        CreatedBy = "System"
////    };

////    _dbContext.LearnerAnswers.Add(learnerAnswer);
////    _dbContext.SaveChanges();

////    return new LearnerAnswerDTO
////    {
////        LearnerAnswerId = learnerAnswer.LearnerAnswerId,
////        LearnerAttemptId = learnerAnswer.LearnerAttemptId,
////        QuizQuestionId = learnerAnswer.QuizQuestionId,
////        QuestionOptionId = learnerAnswer.QuestionOptionId
////    };
////}

////public Guid GetQuestionOptionIdByOption(Guid quizQuestionId, string option)
////{
////    return _dbContext.QuestionOptions
////        .Where(o => o.QuizQuestionId == quizQuestionId && o.Option == option)
////        .Select(o => o.QuestionOptionId)
////        .FirstOrDefault();
////}
////public void CreateLearnerAnswers(List<LearnerAnswer> learnerAnswers)
////{
////    _dbContext.LearnerAnswers.AddRange(learnerAnswers);
////    _dbContext.SaveChanges();
////}